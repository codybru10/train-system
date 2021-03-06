require('pry')

class City

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    list_cities = DB.exec('SELECT * FROM cities;')
    cities = []
    list_cities.each() do |city|
      id = city.fetch('id').to_i
      name = city.fetch('name')
      cities.push(City.new({:id => id, :name => name}))
    end
    cities
  end

  define_method(:==) do |another_city|
    self.name == another_city.name && self.id == another_city.id

  end

  define_method(:save) do
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_city = nil
    City.all().each() do |city|
      if city.id() == id
        found_city = city
      end
    end
    found_city
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{self.id};")

    attributes.fetch(:train_ids, []).each do |train_id|
      DB.exec("INSERT INTO stops (city_id, train_id) VALUES (#{self.id}, #{train_id});")
    end
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stops WHERE city_id = #{self.id};")
    DB.exec("DELETE FROM cities WHERE id = #{self.id};")
  end


  define_method(:trains) do
    stops = []
    results = DB.exec("SELECT train_id FROM stops WHERE city_id = #{self.id};")

    results.each() do |result|
      train_id = result.fetch("train_id").to_i
      train = DB.exec("SELECT * FROM trains WHERE id = #{train_id};")
      name = train.first.fetch("name")
      stops.push(Train.new({:name => name, :id => train_id}))
    end
    stops
  end

end
