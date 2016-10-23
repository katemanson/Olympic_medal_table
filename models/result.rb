class Result

  attr_reader :id
  attr_accessor :participant_id, :event_id, :result

  def initialize(options)
    @id = nil || options['id'].to_i
    @participant_id = options['participant_id'].to_i
    @event_id = options['event_id'].to_i
    @result = options['result'].to_i
  end

  def save()
    sql = "INSERT INTO results (participant_id, event_id, result) VALUES (#{@participant_id}, #{@event_id}, #{@result}) RETURNING *"
    outcome = SqlRunner.run(sql).first
    @id = outcome['id'].to_i
  end

  def event()
    sql = "SELECT e.* FROM events e 
          INNER JOIN results r
          ON r.event_id = e.id
          WHERE r.id = #{@id}"
    outcome = Event.map_item(sql)
    return outcome
  end

  def participant()
    sql = "SELECT p.* FROM participants p
          INNER JOIN results r
          ON r.participant_id = p.id
          WHERE r.id = #{@id}"
    outcome = Participant.map_item(sql)
    return outcome
  end

  def self.all()
    sql = "SELECT * FROM results"
    outcome = Result.map_items(sql)
    return outcome
  end

  def self.update(options)
    sql = "UPDATE results SET
          participant_id = #{options['participant_id']},
          event_id = #{options['event_id']},
          result = #{options['result']}
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM results WHERE id = #{id}"
    outcome = Result.map_item(sql)
    return outcome
  end

  def self.map_items(sql)
    results = SqlRunner.run(sql)
    outcome = results.map { |result| Result.new(result) }
    return outcome
  end

  def self.map_item(sql)
    outcome = Result.map_items(sql).first
    return outcome
  end

  def self.destroy(id)
    sql = "DELETE FROM results WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end