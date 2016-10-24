class Event

  attr_reader :id
  attr_accessor :name, :sport_id

  def initialize(options)
    @id = nil || options['id'].to_i
    @sport_id = options['sport_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO events (name, sport_id) VALUES ('#{@name}', '#{@sport_id}') RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id'].to_i
  end

  def sport()
    sql = "SELECT sports.* FROM sports 
          WHERE sports.id = #{options['sport_id']}"
    result = Sport.map_item(sql)
    return result
  end

  def competitors()
    sql = "SELECT competitors.* FROM competitors 
          INNER JOIN entries 
          ON competitors.id = entries.competitor_id 
          INNER JOIN events 
          ON entries.event_id = events.id 
          WHERE events.id = #{@id}"
    result = Event.map_items(sql)
    return result
  end

  def entries
    sql = "SELECT entries.* FROM entries 
          INNER JOIN events 
          ON events.id = entries.event_id
          WHERE events.id = #{@id}"
    result = Entry.map_items(sql)
    return result
  end

  def gold_medallist
    gold_entry = entries.find { |entry| entry.result == 1 }
    gold_medallist = Competitor.find(gold_entry.competitor_id)
    return gold_medallist
  end

  def silver_medallist
    silver_entry = entries.find { |entry| entry.result == 2 }
    silver_medallist = Competitor.find(silver_entry.competitor_id)
    return silver_medallist
  end

  def bronze_medallist
    bronze_entry = entries.find { |entry| entry.result == 3 }
    bronze_medallist = Competitor.find(bronze_entry.competitor_id)
    return bronze_medallist
  end

  def self.all()
    sql = "SELECT * FROM events"
    result = Event.map_items(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE events SET
          name = '#{options['name']}',
          sport_id = '#{options['sport_id']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id = #{id}"
    result = Event.map_item(sql)
    return result
  end

  def self.map_items(sql)
    events = SqlRunner.run(sql)
    result = events.map { |event| Event.new(event) }
    return result
  end

  def self.map_item(sql)
    result = Event.map_items(sql).first
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM events WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end