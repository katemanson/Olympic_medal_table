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
  @result = Result.find(params['id'])
  erb(:'results/show')
end

# EDIT
get '/results/:id/edit' do
  @result = Result.find(params['id'])
  @events = Event.all()
  @participants = Participant.all()
  erb(:'results/edit')
end

# UPDATE
put '/results/:id' do
  @result = Result.update(params)
  redirect to("/results/#{params['id']}")
end

# DELETE
delete '/results/:id' do
  Result.destroy(params['id'])
  redirect to('/results')
end