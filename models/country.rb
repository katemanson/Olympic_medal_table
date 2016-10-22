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

  def self.all()
    sql = "SELECT * FROM countries"
    result = Country.map_items(sql)
    return result
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

end