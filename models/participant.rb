class Participant

  attr_reader :id
  attr_accessor :country_id, :name

  def initialize(options)
    @id = nil || options['id'].to_i
    @country_id = options['country_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO participants (country_id, name) VALUES (#{@country_id}, '#{@name}') RETURNING *"
    participant = SqlRunner.run(sql).first
    @id = participant['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM participants"
    result = Participant.map_items(sql)
    return result
  end

  def self.map_items(sql)
    participants = SqlRunner.run(sql)
    result = participants.map { |participant| Participant.new(participant) }
    return result
  end

  def self.map_item(sql)
    result = Participant.map_items(sql).first
    return result
  end
end