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

  def participants()
    sql = "SELECT p.* FROM participants p
          INNER JOIN countries c ON c.id = p.country_id
          WHERE c.id = #{@id}"
    participants = Participant.map_items(sql)
    return participants
  end

  def results()
    sql = "SELECT r.* FROM results r
          INNER JOIN participants p ON p.id = r.participant_id
          INNER JOIN countries c ON c.id = p.country_id
          WHERE c.id = #{@id}"
    results = Result.map_items(sql)
    return results
  end

  def show_results()
    all_results = results.map do |result|
      {
        sport: result.event.sport, 
        event: result.event.name,
        participant: result.participant.name, 
        final_position: result.result,
        medal: case result.result
        when 1
          "Gold"
        when 2
          "Silver"
        when 3
          "Bronze"
        else
          "no"
        end
      }
    end
    return all_results
  end

  def golds()
      gold_results = results.select { |result| result.result == 1 }
      return gold_results
  end

  def number_of_golds()
    return golds.count
  end

  def silvers()
    silver_results = results.select { |result| result.result == 2 }
    return silver_results
  end

  def number_of_silvers()
    return silvers.count
  end

  def bronzes()
    bronze_results = results.select { |result| result.result == 3 }
    return bronze_results
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
      if (previous[0].total_ranking_points + previous[0].total_number_of_medals) == (current[0].total_ranking_points + current[0].total_number_of_medals)
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