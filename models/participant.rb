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

  def country()
    sql = "SELECT c.* FROM countries c 
          INNER JOIN participants p 
          ON p.country_id = c.id
          WHERE p.id = #{@id}"
    country = Country.map_item(sql)
    return country
  end

  def results()
    sql = "SELECT r.* FROM results r
          WHERE r.participant_id = #{@id}"
    result = Result.map_items(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM participants"
    result = Participant.map_items(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE participants SET
          country_id = #{options['country_id']},
          name = '#{options['name']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM participants WHERE id = #{id}"
    result = Participant.map_item(sql)
    return result
  end

  def self.gold_medallists()
    sql = "SELECT p.* FROM participants p 
          INNER JOIN results r 
          ON r.participant_id = p.id
          WHERE r.result = 1"
    result = Participant.map_items(sql)
    return result
  end

  def self.silver_medallists()
    sql = "SELECT p.* FROM participants p
          INNER JOIN results r
          ON r.participant_id = p.id
          WHERE r.result = 2"
    result = Participant.map_items(sql)
    binding.pry
    return result
  end

  def self.bronze_medallists()
    sql = "SELECT p.* FROM participants p
          INNER JOIN results r
          ON r.participant_id = p.id
          WHERE r.result = 3"
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

  def self.destroy(id)
    sql = "DELETE FROM participants WHERE id = #{id}"
    SqlRunner.run(sql)
  end
  
end