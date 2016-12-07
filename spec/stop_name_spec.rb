require('spec_helper')

describe(StopName) do
  describe('#name') do
    it('will return the name of a stop_name')do
      stop_name = StopName.new({:id => nil, :name => 'Stark st'})
      expect(stop_name.name()).to(eq('Stark st'))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(StopName.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('test for equivilance without instance ID') do
      test_stop_name1 = StopName.new({:id => nil, :name => 'Stark st'})
      test_stop_name2 = StopName.new({:id => nil, :name => 'Stark st'})
      expect(test_stop_name1==test_stop_name2).to(eq(true))
    end
  end

  describe('#save') do
    it('saves user input to table') do
      test_stop_name = StopName.new({:id => nil, :name => 'Stark st'})
      test_stop_name.save()
      expect(StopName.all()).to(eq([test_stop_name]))
    end
  end

  describe('.find') do
    it('finds instance of stop_names class by id') do
      test_stop_name1 = StopName.new({:id => nil, :name => 'Stark st'})
      test_stop_name1.save()
      test_stop_name2 = StopName.new({:id => nil, :name => 'Alder st'})
      test_stop_name2.save()
      expect(StopName.find(test_stop_name1.id)).to(eq(test_stop_name1))
    end
  end

end
