class Train

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    list_trains = DB.exec('SELECT * FROM trains;')
    trains = []
    list_trains.each() do |train|
      id = train.fetch('id').to_i
      name = train.fetch('name')
      trains.push(Train.new({:id => id, :name => name}))
    end
    trains
  end

  define_method(:==) do |another_train|
    self.name == another_train.name && self.id == another_train.id

  end

  define_method(:save) do
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_train = nil
    Train.all().each() do |train|
      if train.id() == id
        found_train = train
      end
    end
    found_train
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{self.id};")

    attributes.fetch(:city_ids, []).each() do |city_id|
      DB.exec("INSERT INTO stops (city_id, train_id) VALUES (#{city_id}, #{self.id()});")
    end
  end

  define_method(:delete) do
    DB.exec("DELETE FROM trains WHERE id = #{self.id};")
  end

  define_method(:cities) do
    stops = []
    results = DB.exec("SELECT city_id FROM stops WHERE train_id = #{self.id};")
    results.each() do |result|
      city_id = result.fetch("city_id").to_i
      city = DB.exec("SELECT * FROM cities WHERE id = #{city_id};")
      name = city.first().fetch("name")
      stops.push(City.new({:name => name, :id => city_id}))
    end
    stops
  end

end
