require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test_validates_presence_of :name, :code

  context "#methods"  do
    setup do
      @country1 = FactoryGirl.create(:country, visited: true)
      @country2 = FactoryGirl.create(:country, visited: false)

      @currency1 = FactoryGirl.create(:currency, country_id: @country1.id)
      @currency2 = FactoryGirl.create(:currency, country_id: @country2.id)
    end

    should "check for collected" do
      assert Currency.collected
      assert_equal 1,Currency.collected.count
    end

    should "check for non collected" do
      assert Currency.not_collected
      assert_equal 1,Currency.collected.count
    end

    should "get records by search" do
      assert Currency.search("rup")
    end
  end
end
