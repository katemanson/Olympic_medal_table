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
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

end