require('spec_helper')

describe(Train) do
  describe('#name') do
    it('will return the name of a train')do
      train = Train.new({:id => nil, :name => 'Max'})
      expect(train.name()).to(eq('Max'))
    end
  end

  describe('.all') do
    it('return an empty array at first') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('test for equivilance without instance ID') do
      test_train1 = Train.new({:id => nil, :name => 'Max'})
      test_train2 = Train.new({:id => nil, :name => 'Max'})
      expect(test_train1==test_train2).to(eq(true))
    end
  end

  describe('#save') do
    it('saves user input to table') do
      test_train = Train.new({:id => nil, :name => 'Max'})
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

  describe('.find') do
    it('finds instance of trains class by id') do
      test_train1 = Train.new({:id => nil, :name => 'Max'})
      test_train1.save()
      test_train2 = Train.new({:id => nil, :name => 'L'})
      test_train2.save()
      expect(Train.find(test_train1.id)).to(eq(test_train1))
    end
  end

end
