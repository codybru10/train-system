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
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end

end
