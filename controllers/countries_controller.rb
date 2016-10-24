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
  @country = Country.find(params['id'])
  erb(:'countries/show')
end

#SHOW JSON RESULTS
get '/countries/:id/results' do
  content_type(:json)
  country = Country.find(params['id'])
  results = country.show_results
  return results.to_json
end

#EDIT
get '/countries/:id/edit' do
  @country = Country.find(params['id'])
  erb(:'countries/edit')
end

#UPDATE
put '/countries/:id' do
  @country = Country.update(params)
  redirect to("/countries/#{params['id']}")
end

#DELETE
delete '/countries/:id' do
  Country.destroy(params['id'])
  redirect to('/countries')
end