class CountriesController < ApplicationController
  # GET /countries
  # GET /countries.xml
  before_filter :authenticate_user!
  after_filter :update_country_visited , only: :update
#  after_filter :random_visited_at,  only: :update_status
  before_filter :counry_data, only: [:index]

  def index

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
    @visit_date = (@country.country_users & current_user.country_users).first
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to(@country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end




  def update_status
    current_user.countries.clear
    current_user.countries << Country.where(code:params[:country_visited])
    random_visited_at
    counry_data
    respond_to do |format|
      format.js
    end
  end

  #  def preview_progress
  #
  #    puts "at prtfjkfdhjksd"
  #    y_years = current_user.country_users.select("visited_at").collect {|a| a.visited_at.strftime("%Y") unless a.nil? }.uniq.sort
  #    x_visited = []
  #    unless y_years.blank?
  #      y_years.each {|d| x_visited << CountryUser.where("strftime('%Y',visited_at)=?",d).count }
  #      line_chart = y_years.zip(x_visited)
  #      hd = ["Years", "Visited"]
  #      @final_line_chart = [hd] + line_chart
  #      puts @final_line_chart
  #    end
  #
  #    respond_to do |format|
  #      format.js
  #    end
  #  end

  protected

  def update_country_visited
    if params.include?(:country_visited)
      current_user.countries << @country unless current_user.countries.include?(@country)
  
      @visit_date = (@country.country_users & current_user.country_users).first
      if params[:visited_at][:year].present? && params[:visited_at][:month].present? && params[:visited_at][:day].present?
        my_date = Date::civil(params[:visited_at][:year].to_i, params[:visited_at][:month].to_i,params[:visited_at][:day].to_i)
        @visit_date.visited_at = my_date
      else
        @visit_date.visited_at = Date.today
      end
      @visit_date.save!
    else
      current_user.countries.delete(@country) if current_user.countries.include?(@country)
    end
  end

  def counry_data
    @countries = Country.search(params[:search])
    @user_countries = current_user.countries.collect(&:code)
      
    if current_user.country_users.select("visited_at").collect(&:visited_at).compact.present?
      y_years = current_user.country_users.select("visited_at").collect {|a| a.visited_at.strftime("%Y") unless a.nil? }.uniq.sort
      x_visited = []
      
      y_years.each {|d| x_visited << CountryUser.where("strftime('%Y',visited_at)=?",d).count }
      line_chart = y_years.zip(x_visited)
      hd = ["Years", "Visited"]
      @final_line_chart = [hd] + line_chart
      puts "~"*12
      puts "~"*12
      puts "~"*12
      puts "~"*12
      puts @final_line_chart
      puts "~"*12
      puts "~"*12
    end
      
#    debugger
#      puts "8988989"
  end




  def random_visited_at
    @countries = Country.where(code:params[:country_visited])
    @countries.each do |country|
      country.country_users.first.update_attribute("visited_at", Array(Date.new(2005,1,1)..Date.today).sample )
    end
  end


end
