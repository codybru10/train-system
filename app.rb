require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/train')
require('./lib/city')
require('pg')

DB = PG.connect({:dbname => 'train_system_test'})

get('/') do
  erb(:index)
end

get('/trains') do
  @trains = Train.all()
  erb(:trains)
end

post('/trains') do
  name = params.fetch("name")
  train = Train.new({:id => nil, :name => name})
  train.save()
  @trains = Train.all()
  erb(:trains)
end
