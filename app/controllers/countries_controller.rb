class CountriesController < ApplicationController
  # GET /countries
  # GET /countries.xml
  before_filter :authenticate_user!
  after_filter :update_country_visited , only: :update
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

#    selected_countries = Country.where(code: params[:country_visited])
#    current_user_countries = current_user.countries
#    Country.all.each do |country|
#      if current_user_countries .include?(country)
#        current_user_countries .delete(country) if !selected_countries.include?(country)
#      else
#        if selected_countries.include?(country)
#          current_user_countries  << country
#        end
#      end
#    end



    #if params.include?(:country_visited)
#      checked_countries = Country.select(:code).where(code: params[:country_visited])
#      current_user.countries.clear
#        current_user_countries = current_user.countries
#        existing_user_countries = current_user_countries.collect(&:code)
#        checked_countries = Country.where(code: params[:country_visited]).collect(&:code)
#        second_one = (existing_user_countries.size  > checked_countries.size)?  checked_countries : existing_user_countries
#        need_to_create = (existing_user_countries + checked_countries).uniq - second_one
##debugger
#        current_user.countries.clear
#        current_user_countries << Country.where(code: need_to_create)
#      ##      current_user.countries.delete_all
#      #      checked_countries.each do |country|
#      #        current_user.countries << country unless current_user.countries.include?(country)
#      #      end
#    #else
#      #current_user.countries.clear
#    #$end
#    #@countries = Country.search(params[:search])
#    #@user_countries = current_user.countries.collect(&:code)
    counry_data
    #    render nothing: true
    #
    respond_to do |format|
      format.js
    end
  end

  protected

  def update_country_visited
    if params.include?(:country_visited)
      current_user.countries << @country unless current_user.countries.include?(@country)
    else
      current_user.countries.delete(@country) if current_user.countries.include?(@country)
    end
  end

  def counry_data
    @countries = Country.search(params[:search])
    @user_countries = current_user.countries.collect(&:code)
  end


end