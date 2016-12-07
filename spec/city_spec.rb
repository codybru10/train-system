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

end
