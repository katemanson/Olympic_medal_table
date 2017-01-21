require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./controllers/countries_controller.rb')
require_relative('./controllers/sports_controller.rb')
require_relative('./controllers/events_controller.rb')
require_relative('./controllers/competitors_controller.rb')
require_relative('./controllers/entries_controller.rb')
require_relative('./models/country.rb')
require_relative('./models/sport.rb')
require_relative('./models/event.rb')
require_relative('./models/competitor.rb')
require_relative('./models/entry.rb')
require_relative('./db/sql_runner.rb')

get '/' do
  erb(:home)
end
