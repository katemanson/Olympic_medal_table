class Event

  attr_reader :id
  attr_accessor :name, :sport

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @sport = options['sport']
  end

  def save()
    sql = "INSERT INTO events (name, sport) VALUES ('#{@name}', '#{@sport}') RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id'].to_i
  end

  def results
    sql = "SELECT r.* FROM results r
          INNER JOIN events e 
          ON e.id = r.event_id
          WHERE id = #{options['id']}"
    result = Result.map_items(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM events"
    result = Event.map_items(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE events SET
          name = '#{options['name']}',
          sport = '#{options['sport']}'
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