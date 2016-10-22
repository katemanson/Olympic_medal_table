#INDEX
get '/countries' do
  @countries = Country.all()
  erb(:'countries/index')
end

#NEW
get '/countries/new' do
  erb(:'countries/new')
end

#CREATE
post '/countries' do
  @country = Country.new(params)
  @country.save()
  redirect to('/countries') # or erb(:'countries/create')?
end

#SHOW
get '/countries/:id' do
end

#EDIT
get '/countries/:id/edit' do
end

#UPDATE
put '/countries/:id' do
end

#DELETE
delete '/countries' do
end