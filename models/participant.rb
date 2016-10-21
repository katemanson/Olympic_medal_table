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

end