require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test_validates_presence_of :name, :code
  context "Country" do
    setup do
      @country = FactoryGirl.create(:country)
    end

    should "get records by search" do
      # @country.stubs(:name).returns("India")

      @country.stub :name, "India" do
        assert Country.search("ind")
        assert_equal "India",@country.name
      end
    end
  end
end
