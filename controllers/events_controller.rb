# INDEX
get '/events' do
  @events = Event.all()
  erb(:'events/index')
end

# NEW
get '/events/new' do
  @sports = Sport.all()
  erb(:'events/new')
end

# CREATE
post '/events' do
  @event = Event.new(params)
  @event.save
  redirect to('/events') # or erb(:'events/create')?
end

# SHOW
get '/events/:id' do
  @event = Event.find(params['id'])
  erb(:'events/show')
end

# EDIT
get '/events/:id/edit' do
  @event = Event.find(params['id'])
  @sports = Sport.all()
  erb(:'events/edit')
end

# UPDATE
put '/events/:id' do
  @event = Event.update(params)
  redirect to("/events/#{params['id']}")
end

# DELETE
delete '/events/:id' do
  Event.destroy(params['id'])
  redirect to('/events')
end