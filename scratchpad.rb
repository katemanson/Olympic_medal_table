# get all countries
countries = Country.all()
#-- array of Country objects

# get points totals for each
# for country in countries
#   country.total_ranking_points
# end

countries_in_rank_order__array = countries.sort_by! { |country| country.total_ranking_points }
# array of Country objects sorted by ranking points, ? ascending

countries_with_rank_order__hash = countries_in_rank_order.map.with_index.to_h
# kind of based on: http://stackoverflow.com/questions/6242311/get-index-of-array-element-faster-than-on

countries_with_ranking = Hash[countries_with_rank_order__hash.map { |key, value| [key, value + 1] }]

# 'deal' in order into table
# OR
# assign ranking as variable?

# in table body
ranking = Country.rank_all
ranking.each do |key, value|
  <tr>
    <td>value</td>
    <td>key.name</td>
    <td>key.number_of_golds</td>
    <td>key.number_of_silvers</td>
    <td>key.number_of_bronzes</td>
    <td>key.total_number_of_medals</td>
  </tr>
end

# in table footer
  <tr>
    <td></td>
    <td>Totals</td>





  </tr>



