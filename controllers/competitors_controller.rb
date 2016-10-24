# INDEX
get '/participants' do
  @participants = Participant.all()
  erb(:'participants/index')
end

# NEW
get '/participants/new' do
  @countries = Country.all()
  erb(:'participants/new')
end

# CREATE
post '/participants' do
  @participant = Participant.new(params)
  @participant.save
  redirect to('/participants') # or erb(:'participants/create')?
end

# SHOW
get '/participants/:id' do
  @participant = Participant.find(params['id'])
  erb(:'participants/show')
end

# EDIT
get '/participants/:id/edit' do
  @participant = Participant.find(params['id'])
  @countries = Country.all()
  erb(:'participants/edit')
end

# UPDATE
put '/participants/:id' do
  @participant = Participant.update(params)
  redirect to("/participants/#{params['id']}")
end

# DELETE
delete '/participants/:id' do
  Participant.destroy(params['id'])
  redirect to('/participants')
end