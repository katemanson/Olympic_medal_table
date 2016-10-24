class Sport

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO sports (name) VALUES ('#{@name}') RETURNING *"
    sport = SqlRunner.run(sql).first
    @id = sport['id'].to_i
  end

  def competitors()
    sql = "SELECT competitors.* FROM competitors 
          WHERE competitors.sport_id = #{@id}"
    result = Competitor.map_items(sql)
    return result
  end

  def entries
    sql = "SELECT entries.* FROM entries 
          INNER JOIN events  
          ON events.id = entries.event_id
          INNER JOIN sports 
          ON sports.id = events.sport_id 
          WHERE sports.id = #{@id}"
    result = Entry.map_items(sql)
    return result
  end

  def gold_medallists
    gold_entries = entries.find_all { |entry| entry.result == 1 }
    gold_medallists = gold_entries.map { |gold_entry| Competitor.find(gold_entry.competitor_id) }
    return gold_medallists
  end

  def silver_medallists
    silver_entries = entries.find_all { |entry| entry.result == 2 }
    silver_medallists = silver_entries.map { |silver_entry| Competitor.find(silver_entry.competitor_id) }
    return silver_medallists
  end

  def bronze_medallists
    bronze_entries = entries.find_all { |entry| entry.result == 3 }
    bronze_medallists = bronze_entries.map { |bronze_entry| Competitor.find(bronze_entry.competitor_id) }
    return bronze_medallists
  end

  def self.all()
    sql = "SELECT * FROM sports"
    result = Sport.map_items(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE sports SET
          name = '#{options['name']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM sports WHERE id = #{id}"
    result = Sport.map_item(sql)
    return result
  end

  def self.map_items(sql)
    sports = SqlRunner.run(sql)
    result = sports.map { |sport| Sport.new(sport) }
    return result
  end

  def self.map_item(sql)
    result = Sport.map_items(sql).first
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM sports WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end