# Olympic medal table

#How it works
A table that updates as results are recorded: 
* The database includes tables for countries, competitors, sports, events and entries. 
* As events are completed, the entries table can be updated to include a result for each entry. 
* When the medal table is displayed, the results data are used to calculate a ranking for each country, based first on a points system (5 for gold, 3 for silver, 1 for bronze), then on overall number of medals. 
* If two or more countries are equal on both measures, they are given the same ranking, and the relevant number of subsequent rankings skipped. 

In this example, Austria and Germany are equal on points, but Austria has more medals overall and is therefore ranked higher. Australia and Norway, on the other hand, are equal on both points and number of medals. They are ranked equal seventh, and eighth is skipped: 

![medal table](https://github.com/katemanson/Olympic_medal_table/raw/master/img/medal_table.png)

##Technical stuff
* Follows OO principles
* RESTful design pattern
* PostgreSQL database
* Ruby models, views and controllers; also runners/utilities
* Views use embedded Ruby (ERB)
* Sinatra web framework
* Debugged with [pry-byebug](https://rubygems.org/gems/pry-byebug/)
* Stylesheet includes an adapted [Normalize.css](https://necolas.github.io/normalize.css/) reset, and implements a flexbox layout

![countries](https://github.com/katemanson/Olympic_medal_table/raw/master/img/countries.png)

##Highlight
The logic used to update the table, contained in the Country.rank_all() method: 
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

##Learning points
* The table is slow to load; this is because the functions called in the Country.rank_all() method in turn prompt a series of database queries. These could be reduced by refactoring to include relevant data in the program state; that is, by using Ruby before SQL. 
* Need to `git commit` more often. 

##Next steps would be...
* Include non-results such as DNS, DNF, DQ (perhaps by encoding them as negative ranking numbers)
* Include athletes (as individuals) in a separate class
* In general, work towards [this kind](http://www.bbc.co.uk/sport/olympics/rio-2016/medals/countries) of functionality. 

##To run
* If you need to, check you have Ruby installed by typing `ruby -v` into your terminal. If this returns the version information, you're fine. If not, you can use the [installation page in the Ruby documentation](https://www.ruby-lang.org/en/documentation/installation/) to get it  
* Download or clone this repository
* Install Sinatra (assuming you don't have it already) with `gem install sinatra`
* Run with `ruby main_controller.rb`
* In your browser, visit http://localhost:4567

