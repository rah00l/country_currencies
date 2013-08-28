class CurrenciesController < ApplicationController
  # GET /currencies
  # GET /currencies.xml
    before_filter :authenticate_user!
  def index
#    raise params.inspect
    @currencies = Currency.search(params[:search])

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end
end