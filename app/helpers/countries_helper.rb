module CountriesHelper

  def not_visited(user_countries_count)
    Country.count - user_countries_count
  end
end
