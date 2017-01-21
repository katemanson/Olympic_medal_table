# Olympic medal table

A dynamically updating medal table (not quite like [this one](http://www.bbc.co.uk/sport/olympics/rio-2016/medals/countries "BBC medal table"), but that'd be the eventual aim).

![medal table](https://github.com/katemanson/Olympic_medal_table/raw/master/img/medal_table.png)
![countries](https://github.com/katemanson/Olympic_medal_table/raw/master/img/countries.png)
![sports](https://github.com/katemanson/Olympic_medal_table/raw/master/img/sports.png)

##Technical
* PostgreSQL database
* Ruby models, views and controllers; also runners/utilities
* Views use embedded Ruby (ERB)
* Sinatra web framework
* Stylesheet includes an adapted Normalize.css reset, and implements a flexbox layout
* Follows OO principles
* RESTful design pattern

##Highlight
The logic used to update the table appears in the Country.rank_all() method: 
```
def self.rank_all()
  countries = Country.all()

  ranking_criteria = countries.map do |country|
    [country, 
    country.total_ranking_points, 
    country.total_number_of_medals, 
    country.name]
  end

  rank_order = ranking_criteria.sort_by do
    |country, points, medals, name| 
    [-points, -medals, name]
  end

  raw_ranking = rank_order.map.with_index do |country_data, index|
    [country_data[0], index + 1]
  end

  final_ranking = [[raw_ranking[0][0], raw_ranking[0][1].to_s]]

  raw_ranking.each_cons(2) do |previous, current|
    # are points and medals equal, and does last entry in final_ranking already have an = sign? If so, use same final ranking again
    #does last entry in final_ranking have an = sign?
    if (previous[0].total_ranking_points == current[0].total_ranking_points) && (previous[0].total_number_of_medals == current[0].total_number_of_medals) && final_ranking[-1][1].include?('=') 
        final_ranking << [current[0], final_ranking[-1][1]]
    # are points and medals equal (without last entry in final_ranking already being equal to the one before)? If so, use same ranking as previous. 
    elsif (previous[0].total_ranking_points == current[0].total_ranking_points) && (previous[0].total_number_of_medals == current[0].total_number_of_medals)
        final_ranking.delete_at(-1)
        final_ranking << [previous[0], previous[1].to_s + '=']
        final_ranking << [current[0], previous[1].to_s + '=']
    # otherwise, stick with current ranking
    else
      final_ranking << [current[0],current[1].to_s]
    end
  end

  return final_ranking
end
```