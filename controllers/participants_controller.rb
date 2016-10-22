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
end

# EDIT
get '/participants/:id/edit' do
end

# UPDATE
put '/participants/:id' do
end

# DELETE
delete '/participants' do
end