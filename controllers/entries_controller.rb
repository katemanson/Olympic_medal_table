# INDEX
get '/entries' do
  @events = Event.all()
  erb(:'entries/index')
end

# NEW
get '/entries/new' do
  @events = Event.all()
  @competitors = Competitor.all()
  erb(:'entries/new')
end

# NEW FROM COMPETITOR RECORD
get '/entries/competitor/:id/new_entry' do
  @competitors = Competitor.all()
  @competitor = Competitor.find(params['id'])
  @sport = @competitor.sport
  @events = @sport.events
  erb(:'entries/competitor_new')
end

# CREATE
post '/entries' do
  @entry = Entry.new(params)
  @entry.save
  competitor = @entry.competitor
  country = competitor.country_id
  redirect to("/countries/#{country}/competitors")
end

# SHOW
get '/entries/:id' do
  @entry = Entry.find(params['id'])
  erb(:'entries/show')
end

# EDIT / RECORD RESULT
get '/entries/:id/edit' do
  @entry = Entry.find(params['id'])
  @events = Event.all()
  @competitors = Competitor.all()
  erb(:'entries/edit')
end

# EDIT AS RESULT
get '/entries/:id/edit_result' do
  @entry = Entry.find(params['id'])
  @events = Event.all()
  @competitors = Competitor.all()
  erb(:'entries/edit_result')
end

# UPDATE
put '/entries/:id' do
  entry = Entry.find(params['id'])
  event = entry.event_id
  @entry = Entry.update(params)
  redirect to("/events/#{event}")
end

# DELETE
delete '/entries/:id' do
  entry = Entry.find(params['id'])
  competitor = entry.competitor
  country = competitor.country_id
  Entry.destroy(params['id'])
  redirect to("/countries/#{country}/competitors")
end