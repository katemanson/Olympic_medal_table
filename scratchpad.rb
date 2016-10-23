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

for country in countries_order
  rank = countries_order
end


# ?deal with equal points (medal colour, then equality)


# @rank?
# @ranking_points?




