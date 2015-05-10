require 'test_helper'

class CurrenciesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  should_not_respond_to_actions :new => :get,
                                :destroy => :get,
                                :create => :post,
                                :edit => :get,
                                :update => :put

  context "CurrenciesController" do
    setup do
      @controller = CurrenciesController.new
      @country = FactoryGirl.create(:country)
      @currency = FactoryGirl.create(:currency, country_id: @country.id)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:currencies)
    end

    should "show currency" do
      get :show, :id => @currency.to_param
      assert_response :success
    end
  end
end
