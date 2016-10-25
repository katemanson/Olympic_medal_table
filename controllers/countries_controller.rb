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
  redirect to('/countries')
end

#SHOW
get '/countries/:id' do
  @country = Country.find(params['id'])
  erb(:'countries/show')
end

#SHOW (JSON RESULTS DATA)
get '/countries/:id/results_data' do
  content_type(:json)
  country = Country.find(params['id'])
  results = country.results_data
  return results.to_json
end

#SHOW (COMPETITORS BY COUNTRY)
get '/countries/:id/competitors' do
  @country = Country.find(params['id'])
  erb(:'countries/show_competitors')
end

#SHOW (RESULTS BY COUNTRY)
get '/countries/:id/results' do
  @country = Country.find(params['id'])
  erb(:'countries/show_results')
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