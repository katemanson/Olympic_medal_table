require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./controllers/countries_controller.rb')
require_relative('./controllers/events_controller.rb')
require_relative('./controllers/participants_controller.rb')
require_relative('./controllers/results_controller.rb')
require_relative('./models/country.rb')
require_relative('./models/event.rb')
require_relative('./models/participant.rb')
require_relative('./models/result.rb')
require_relative('./db/sql_runner.rb')

get '/' do
  erb(:home)
end
