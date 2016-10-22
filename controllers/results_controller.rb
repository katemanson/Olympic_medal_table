# INDEX
get '/results' do
  @results = Result.all()
  erb(:'results/index')
end

# NEW
get '/results/new' do
  @events = Event.all()
  @participants = Participant.all()
  erb(:'results/new')
end

# CREATE
post '/results' do
  @result = Result.new(params)
  @result.save
  redirect to('/results') # or erb(:'participants/create')?
end

# SHOW
get '/results/:id' do
end

# EDIT
get '/results/:id/edit' do
end

# UPDATE
put '/results/:id' do
end

# DELETE
delete '/results' do
end