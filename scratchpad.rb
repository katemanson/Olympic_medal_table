# Where points are equal, decide country ranking by
# comparing number of golds; the country with more golds gets the higher ranking (lower number)
# then (if number of golds equal) comparing silvers
# then (if number of silvers equal) comparing bronzes
# else (if number of bronzes equal) 
  # give all countries the same rank (with '=')
  # count on to assign rank to countries with next-lowest points total(s)

def self.rank_all()
  
  countries = Country.all()
  # array of Country objects

  # create an array of arrays, with Country objects, points totals, medal numbers
  countries_medals_array = countries.map { |country| [country, country.total_ranking_points, country.number_of_golds, country.number_of_silvers, country.number_of_bronzes, country.name] }

  # order according to points totals, then where these are equal by logic: compare by number golds, silvers, bronzes in succession, then alphabetically by name
  countries_rank_order__raw = countries_medals_array.sort_by { |country, points, golds, silvers, bronzes, name| [-points, -golds, -silvers, -bronzes, name] }

  

  # hash replacing points totals with rank numbers; to include = symbols and 'skips' for equal rankings



  
  countries_reverse_order__array = countries.sort_by! { |country| country.total_ranking_points }
  
  countries_rank_order__array = countries_reverse_order__array.reverse
  
  countries_with_rank_order__hash = countries_rank_order__array.map.with_index.to_h
  # kind of based on: http://stackoverflow.com/questions/6242311/get-index-of-array-element-faster-than-on
  
  countries_with_ranking = Hash[countries_with_rank_order__hash.map { |key, value| [key, value + 1] }]
  
  return countries_with_ranking

end

