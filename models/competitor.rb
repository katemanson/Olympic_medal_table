class Competitor

  attr_reader :id
  attr_accessor :country_id, :sport_id, :name

  def initialize(options)
    @id = nil || options['id'].to_i
    @country_id = options['country_id'].to_i
    @sport_id = options['sport_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO competitors (country_id, sport_id, name) VALUES (#{@country_id}, #{@sport_id}, '#{@name}') RETURNING *"
    competitor = SqlRunner.run(sql).first
    @id = competitor['id'].to_i
  end

  def country()
    sql = "SELECT c.* FROM countries c 
          INNER JOIN competitors 
          ON competitors.country_id = c.id
          WHERE competitors.id = #{@id}"
    country = Country.map_item(sql)
    return country
  end

  def sport()
    sql = "SELECT sports.* FROM sports 
          INNER JOIN competitors
          ON sports.id = competitors.sport_id 
          WHERE competitors.id = #{@id}"
    sport = Sport.map_item(sql)
    return sport
  end

  def entries()
    sql = "SELECT e.* FROM entries e
          WHERE e.competitor_id = #{@id}"
    result = Entry.map_items(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM competitors"
    result = Competitor.map_items(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE competitors SET
          country_id = #{options['country_id']},
          sport_id = #{options['sport_id']},
          name = '#{options['name']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM competitors WHERE id = #{id}"
    result = Competitor.map_item(sql)
    return result
  end

  def self.gold_medallists()
    sql = "SELECT c.* FROM competitors c 
          INNER JOIN entries e 
          ON e.competitor_id = c.id
          WHERE e.result = 1"
    result = Competitor.map_items(sql)
    return result
  end

  def self.silver_medallists()
    sql = "SELECT c.* FROM competitors c
          INNER JOIN entries e
          ON e.competitor_id = c.id
          WHERE e.result = 2"
    result = Competitor.map_items(sql)
    binding.pry
    return result
  end

  def self.bronze_medallists()
    sql = "SELECT c.* FROM competitors c
          INNER JOIN entries e
          ON e.competitor_id = c.id
          WHERE e.result = 3"
    result = Competitor.map_items(sql)
    return result
  end

  def self.map_items(sql)
    competitors = SqlRunner.run(sql)
    result = competitors.map { |competitor| Competitor.new(competitor) }
    return result
  end

  def self.map_item(sql)
    result = Competitor.map_items(sql).first
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM competitors WHERE id = #{id}"
    SqlRunner.run(sql)
  end
  
end