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

  def self.all()
    sql = "SELECT * FROM events"
    result = Event.map_items(sql)
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

end