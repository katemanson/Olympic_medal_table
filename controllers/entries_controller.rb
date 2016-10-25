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

# CREATE
post '/entries' do
  @entry = Entry.new(params)
  @entry.save
  redirect to('/entries') # or erb(:'participants/create')?
end

# SHOW
get '/entries/:id' do
  @entry = Entry.find(params['id'])
  erb(:'entries/show')
end

# EDIT
get '/entries/:id/edit' do
  @entry = Entry.find(params['id'])
  @events = Event.all()
  @participants = Participant.all()
  erb(:'entries/edit')
end

# UPDATE
put '/entries/:id' do
  @entry = Entry.update(params)
  redirect to("/entries/#{params['id']}")
end

# DELETE
delete '/entries/:id' do
  Result.destroy(params['id'])
  redirect to('/entries')
end