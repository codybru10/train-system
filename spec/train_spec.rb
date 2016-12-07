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

  describe('#update') do
    it('lets you update trains in the database') do
      train = Train.new({:id => nil, :name => 'Max'})
      train.save()
      train.update({:name => 'L'})
      expect(train.name()).to(eq('L'))
    end

    it('lets you add city to train') do
      train = Train.new({:id => nil, :name => 'West Coast Rail'})
      train.save()
      portland = City.new({:id => nil, :name => 'Portland'})
      portland.save
      seattle = City.new({:id => nil, :name => 'Seattle'})
      seattle.save
      train.update({:city_ids => [portland.id, seattle.id]})
      expect(train.cities()).to(eq([portland, seattle]))
    end
  end

  describe("#cities") do
     it("returns all of the cities visited by a particular train") do
       train = Train.new({:id => nil, :name => 'West Coast Rail'})
       train.save()
       portland = City.new({:id => nil, :name => 'Portland'})
       portland.save
       seattle = City.new({:id => nil, :name => 'Seattle'})
       seattle.save
       train.update({:city_ids => [portland.id, seattle.id]})
       expect(train.cities()).to(eq([portland, seattle]))
     end
   end

  describe('#delete') do
    it('deletes record from the database') do
      train = Train.new({:id => nil, :name => 'Max'})
      train.save()
      test_train2 = Train.new({:id => nil, :name => 'L'})
      test_train2.save()
      train.delete()
      expect(Train.all).to(eq([test_train2]))
    end
  end

end
