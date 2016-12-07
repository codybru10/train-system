require('spec_helper')

describe(City) do
  describe('#name') do
    it('will return the name of a city')do
      city = City.new({:id => nil, :name => 'Portland'})
      expect(city.name()).to(eq('Portland'))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('test for equivilance without instance ID') do
      test_city1 = City.new({:id => nil, :name => 'Portland'})
      test_city2 = City.new({:id => nil, :name => 'Portland'})
      expect(test_city1==test_city2).to(eq(true))
    end
  end

  describe('#save') do
    it('saves user input to table') do
      test_city = City.new({:id => nil, :name => 'Portland'})
      test_city.save()
      expect(City.all()).to(eq([test_city]))
    end
  end

  describe('.find') do
    it('finds instance of citys class by id') do
      test_city1 = City.new({:id => nil, :name => 'Portland'})
      test_city1.save()
      test_city2 = City.new({:id => nil, :name => 'Chicago'})
      test_city2.save()
      expect(City.find(test_city1.id)).to(eq(test_city1))
    end
  end

  describe('#update') do
    it('lets you update cities in the database') do
      city = City.new({:id => nil, :name => 'Portland'})
      city.save()
      city.update({:name => 'Chicago'})
      expect(city.name()).to(eq('Chicago'))
    end


    it('lets you add train to city') do
      city = City.new({:id => nil, :name => 'Portland'})
      city.save
      train = Train.new({:id => nil, :name => 'West Coast Rail'})
      train.save()
      city.update({:train_ids => [train.id]})
      expect(city.trains()).to(eq([train]))

    end
  end

  describe("#trains") do
     it("returns all of the actors in a particular movie") do
       city = City.new({:id => nil, :name => 'Portland'})
       city.save
       train = Train.new({:id => nil, :name => 'West Coast Rail'})
       train.save()
       city.update({:train_ids => [train.id]})
       expect(city.trains()).to(eq([train]))
     end
   end

  describe('#delete') do
    it('deletes record from the database') do
      city = City.new({:id => nil, :name => 'Portland'})
      city.save()
      test_city2 = City.new({:id => nil, :name => 'Chicago'})
      test_city2.save()
      city.delete()
      expect(City.all).to(eq([test_city2]))
    end
  end

end
