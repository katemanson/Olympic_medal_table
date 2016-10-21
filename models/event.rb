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

end