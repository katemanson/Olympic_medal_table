# Comparing values with <=>
# 'Australia' <=> 'Austria' => -1
# so 'Australia' 'is less than' 'Austria', i.e. comes before it in ordered list

# For non-equally ranked countries, rank number:
(index + 1).to_s
# index + 1, as string

# For an equally ranked country alphabetically first in group:
(index + 1).to_s + '='
# index + 1, as string, followed by =

# For = country alphabetically second in group:
  index.to_s + '='
# index, as string, followed by =

# For = country third in group:
  (index - 1).to_s + '='
# and so on...

# So rank number for = countries is 
  i + 2 - p, where i = index, p = position in group of equal countries (starts with p = 1)

# ? Ways to show equal ranking?
# - identify countries with same points and medals; compare on name; set ranking order/rank number accordingly, taking into account that there may be > 2 countries involved; then find these countries in overall order and apply the rank number settings established; 
# - set 'base' ranking numbers as variables, use simliar approach to above, plug into table
# - nested comparison of countries in hash, if statement to deal with each case (loop for equal countries)

# From http://stackoverflow.com/questions/25042260/convert-sorted-ruby-array-to-ranks-with-possible-repeats, answer from Iceman:
# a = [89, 52, 52, 36, 18, 18, 5]
# a.map{ |e| a.index(e) + 1 }
# # => [1, 2, 2, 4, 5, 5, 7]
could use this approach, by changing criteria to rank by points, then by overall number of medals (get Korea and Norway then also equal)

rank = index + 1
unless current country matches points and medals of previous country
  in which case, rank = rank of previous country

# rank_order_indexed is a(n ordered) hash with key being an array of [Country object, points, golds, silvers, bronzes, name] and value being the index of the key-value pair
ranking = (rank_order_indexed.map do |country_ranking_criteria, index| 
  [
    country = country_ranking_criteria[0], 

    rank_order_indexed.inject(0) do |previous, current| 
      if previous.key[1] == current.key[1] && previous.key[2] == current.key[2] && previous.key[3] == current.key[3] && previous.key[4] == current.key[4]
        rank = previous.value
      else
        rank = index + 1
      end
    end
  ]
end).to_h

# {[#<Country:0x007fb380e6a100 @id=8, @name="France">, 29, 5, 0, 4, "France"]=>0,
#  [#<Country:0x007fb380e6a060 @id=9, @name="Sweden">, 21, 3, 2, 0, "Sweden"]=>1,
#  [#<Country:0x007fb380e69f20 @id=11, @name="China">, 21, 1, 4, 4, "China"]=>2,
#  [#<Country:0x007fb380e6a240 @id=6, @name="Germany">, 11, 1, 2, 0, "Germany"]=>3,
#  [#<Country:0x007fb380e6a4c0 @id=2, @name="United States">, 11, 1, 1, 3, "United States"]=>4,
#  [#<Country:0x007fb380e6a380 @id=4, @name="Australia">, 9, 1, 1, 1, "Australia"]=>5,
#  [#<Country:0x007fb380e6a1a0 @id=7, @name="Austria">, 9, 1, 1, 1, "Austria"]=>6,
#  [#<Country:0x007fb380e6a2e0 @id=5, @name="Netherlands">, 8, 1, 1, 0, "Netherlands"]=>7,
#  [#<Country:0x007fb380e69e80 @id=12, @name="Korea">, 6, 1, 0, 1, "Korea"]=>8,
#  [#<Country:0x007fb380e6a420 @id=3, @name="Norway">, 6, 0, 2, 0, "Norway"]=>9,
#  [#<Country:0x007fb380e69fc0 @id=10, @name="Switzerland">, 3, 0, 1, 0, "Switzerland"]=>10,
#  [#<Country:0x007fb380e6a560 @id=1, @name="Russia">, 1, 0, 0, 1, "Russia"]=>11}

raw_ranking = rank_order.map.with_index { |country_data, index| [country_data[0], index + 1] }

final_ranking = [raw_ranking[0]]

raw_ranking.each_cons(2) { |previous, current| 
    if (previous[0].total_ranking_points + previous[0].total_number_of_medals) == (current[0].total_ranking_points + current[0].total_number_of_medals)
      final_ranking << [current[0], previous[1]]
    else
      final_ranking << current
    end

return final_ranking



}