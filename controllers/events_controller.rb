# INDEX
get '/events' do
  @events = Event.all()
  erb(:'events/index')
end

# NEW
get '/events/new' do
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
end

# EDIT
get '/events/:id/edit' do
end

# UPDATE
put '/events/:id' do
end

# DELETE
delete '/events' do
end