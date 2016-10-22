class Country

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO countries (name) VALUES ('#{@name}') RETURNING *"
    country = SqlRunner.run(sql).first
    @id = country['id'].to_i
  end

  def participants()
    sql = "SELECT p.* FROM participants p
          INNER JOIN countries c ON c.id = p.country_id
          WHERE c.id = #{@id}"
    result = Participant.map_items(sql)
    return result
  end

  def results()
    sql = "SELECT r.* FROM results r
          INNER JOIN participants p ON p.id = r.participant_id
          INNER JOIN countries c ON c.id = p.country_id
          WHERE c.id = #{@id}"
    result = Result.map_items(sql)
    return result
  end

  def self.all()
    sql = "SELECT * FROM countries"
    result = Country.map_items(sql)
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM countries where id = #{id}"
    result = Country.map_item(sql)
    return result
  end

  def self.update(options)
    sql = "UPDATE countries SET 
          name = '#{options['name']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)    
  end

  def self.map_items(sql)
    countries = SqlRunner.run(sql)
    result = countries.map { |country| Country.new(country) }
    return result
  end

  def self.map_item(sql)
    result = Country.map_items(sql).first
    return result
  end

  def self.destroy(id)
    sql = "DELETE FROM countries WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end