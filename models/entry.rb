class Entry

  attr_reader :id
  attr_accessor :competitor_id, :event_id, :result

  def initialize(options)
    @id = nil || options['id'].to_i
    @competitor_id = options['competitor_id'].to_i
    @event_id = options['event_id'].to_i
    @result = nil || options['result'].to_i
  end

  def save()
    sql = "INSERT INTO entries (competitor_id, event_id, result) VALUES (#{@competitor_id}, #{@event_id}, #{@result}) RETURNING *"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def event()
    sql = "SELECT events.* FROM events  
          INNER JOIN entries
          ON entries.event_id = events.id
          WHERE entries.id = #{@id}"
    result = Event.map_item(sql)
    return result
  end

  def sport()
    sql = "SELECT sports.* FROM sports 
          INNER JOIN events 
          ON events.sport_id = sports.id 
          INNER JOIN entries 
          ON entries.event_id = events.id 
          WHERE entries.id = #{@id}"
    result = Sport.map_item(sql)
    return result
  end

  def competitor()
    sql = "SELECT competitors.* FROM competitors 
          INNER JOIN entries 
          ON entries.competitor_id = competitors.id
          WHERE entries.id = #{@id}"
    result = Competitor.map_item(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM entries"
    result = Entry.map_items(sql)
    return result
  end

  def self.all_golds()
    entries = Entry.all()
    gold_results = entries.select { |entry| entry.result == 1 }
    return gold_results
  end

  def self.number_of_golds()
    return all_golds.count
  end

  def self.all_silvers()
    entries = Entry.all()
    silver_results = entries.select { |entry| entry.result == 2 }
    return silver_results
  end

  def self.number_of_silvers()
    return all_silvers.count
  end

  def self.all_bronzes()
    entries = Entry.all()
    bronze_results = entries.select { |entry| entry.result == 3 }
    return bronze_results
  end

  def self.number_of_bronzes()
    return all_bronzes.count
  end

  def self.total_number_of_medals
    total_number_of_medals = Entry.number_of_golds + Entry.number_of_silvers + Entry.number_of_bronzes
    return total_number_of_medals
  end

  def self.update(options)
    sql = "UPDATE entries SET
          competitor_id = #{options['competitor_id']},
          event_id = #{options['event_id']},
          result = #{options['result']}
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM entries WHERE id = #{id}"
    result = Entry.map_item(sql)
    return result
  end

  def self.map_items(sql)
    entries = SqlRunner.run(sql)
    result = entries.map { |entry| Entry.new(entry) }
    return result
  end

  def self.map_item(sql)
    result = Entry.map_items(sql).first
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM entries WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end