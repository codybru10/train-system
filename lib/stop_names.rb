class StopName

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    list_stop_names = DB.exec('SELECT * FROM stop_names;')
    stop_names = []
    list_stop_names.each() do |stop_name|
      id = stop_name.fetch('id').to_i
      name = stop_name.fetch('name')
      stop_names.push(StopName.new({:id => id, :name => name}))
    end
    stop_names
  end

  define_method(:==) do |another_stop_name|
    self.name == another_stop_name.name && self.id == another_stop_name.id

  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stop_names (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:find) do |id|
    found_stop_name = nil
    StopName.all().each() do |stop_name|
      if stop_name.id() == id
        found_stop_name = stop_name
      end
    end
    found_stop_name
  end

end
