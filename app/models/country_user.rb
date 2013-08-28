class CountryUser < ActiveRecord::Base
  belongs_to :country ,:foreign_key => :country_code
  belongs_to :user 
end
