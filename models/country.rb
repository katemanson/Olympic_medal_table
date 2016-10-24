class Country

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO countries (name) VALUES ('#{@name}') RETURNING *"
    country = SqlRunner.run(sql).first
    @id = country['id'].to_i
  end

  def competitors()
    sql = "SELECT c.* FROM competitors c
          INNER JOIN countries ON countries.id = c.country_id
          WHERE countries.id = #{@id}"
    competitors = Competitor.map_items(sql)
    return competitors
  end

  def entries()
    sql = "SELECT entries.* FROM entries 
          INNER JOIN competitors ON competitors.id = entries.competitor_id
          INNER JOIN countries ON countries.id = competitors.country_id
          WHERE countries.id = #{@id}"
    entries = Entry.map_items(sql)
    return entries
  end

  def entries_data()
    all_entries_data = entries.map do |entry|
      {
        sport: entry.event.sport, 
        event: entry.event.name,
        competitor: entry.competitor.name, 
        final_position: 
          if entry.result == nil
            "Not determined"
          else
            entry.result
          end,
        medal:  case entry.result
                when 1
                  "Gold"
                when 2
                  "Silver"
                when 3
                  "Bronze"
                else
                  "None"
                end
      }
    end
    return all_entries_data
  end

  def results_data()
    all_results = entries.select { |entry| entry.result != nil }
    all_results_data = all_results.map do |entry|
      {
        sport: entry.sport.name, 
        event: entry.event.name,
        competitor: entry.competitor.name, 
        final_position: entry.result,
        medal:  case entry.result
                when 1
                  "Gold"
                when 2
                  "Silver"
                when 3
                  "Bronze"
                else
                  "None"
                end
      }
    end
    return all_results_data
  end

  def golds()
      entries_with_gold_result = entries.select { |entry| entry.result == 1 }
      return entries_with_gold_result
  end

  def number_of_golds()
    return golds.count
  end

  def silvers()
    entries_with_silver_result = entries.select { |entry| entry.result == 2 }
    return entries_with_silver_result
  end

  def number_of_silvers()
    return silvers.count
  end

  def bronzes()
    entries_with_bronze_result = entries.select { |entry| entry.result == 3 }
    return entries_with_bronze_result
  end

  def number_of_bronzes()
    return bronzes.count
  end

  def total_number_of_medals()
    total_number_of_medals = number_of_golds + number_of_silvers + number_of_bronzes
  end

  def total_ranking_points()
    ranking_points__golds = number_of_golds * 5
    ranking_points__silvers = number_of_silvers * 3
    ranking_points__bronzes = number_of_bronzes * 1
    total_ranking_points = ranking_points__golds + ranking_points__silvers + ranking_points__bronzes
    return total_ranking_points
  end

  def self.all()
    sql = "SELECT * FROM countries"
    result = Country.map_items(sql)
    return result
  end

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

    final_ranking = [raw_ranking[0]]

    raw_ranking.each_cons(2) do |previous, current| 
      if (previous[0].total_ranking_points == current[0].total_ranking_points) && (previous[0].total_number_of_medals == current[0].total_number_of_medals)
        final_ranking.delete_at(-1)
        final_ranking << [previous[0], previous[1].to_s + '=']
        final_ranking << [current[0], previous[1].to_s + '=']
      else
        final_ranking << [current[0],current[1].to_s]
      end
    end

    return final_ranking
  end

  def self.find(id)
    sql = "SELECT * FROM countries where id = #{id}"
    result = Country.map_item(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE countries SET 
          name = '#{options['name']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)    
  end

  def self.map_items(sql)
    countries = SqlRunner.run(sql)
    result = countries.map { |country| Country.new(country) }
    return result
  end

  def self.map_item(sql)
    result = Country.map_items(sql).first
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM countries WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end