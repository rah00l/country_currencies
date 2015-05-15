require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  should_not_respond_to_actions :new => :get, :destroy => :get

  include Devise::TestHelpers
  # context "CountriesController" do

  setup do
    # @country = countries(:one)
    @controller = CountriesController.new
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @country = FactoryGirl.create(:country)
    sign_in @user
  end

  should "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  should "create country" do
    assert_difference('Country.count') do
      post :create, :country => @country.attributes.merge({ :code => Time.now.to_s })
    end

    assert_redirected_to country_path(assigns(:country))
  end

  should "Not create duplicate currency" do
    assert_no_difference('Currency.count') do
      post :create, :country => @country.attributes
    end

    assert !assigns[:country].errors[:code].empty?
  end

  should "show country" do
    get :show, :id => @country.to_param
    assert_response :success
  end

  should "get edit" do
    get :edit, :id => @country.to_param
    assert_response :success
  end

  should "able to update country" do
    put :update, :id => @country.to_param, :country => @country.attributes
    assert_redirected_to country_path(assigns(:country))
  end

  should "Not able to update country as id not provided" do
    put :update, :id => "", :country => @country.attributes
    assert_template :edit 
  end
end
