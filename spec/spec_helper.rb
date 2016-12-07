require('train')
require('city')
require('stop_names')
require('rspec')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM trains *;')
    DB.exec('DELETE FROM cities *;')
    DB.exec('DELETE FROM stop_names *;')
    DB.exec('DELETE FROM stops *;')
  end
end
