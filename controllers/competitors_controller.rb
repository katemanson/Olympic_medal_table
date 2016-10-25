# INDEX
get '/competitors' do
  @competitors = Competitor.all()
  erb(:'competitors/index')
end

# NEW
get '/competitors/new' do
  @countries = Country.all()
  @sports = Sport.all()
  erb(:'competitors/new')
end

# CREATE
post '/competitors' do
  @competitor = Competitor.new(params)
  @competitor.save
  redirect to('/competitors')
end

# SHOW
get '/competitors/:id' do
  @competitor = Competitor.find(params['id'])
  erb(:'competitors/show')
end

# EDIT
get '/competitors/:id/edit' do
  @competitor = Competitor.find(params['id'])
  @countries = Country.all()
  @sports = Sport.all()
  erb(:'competitors/edit')
end

# UPDATE
put '/competitors/:id' do
  @competitor = Competitor.update(params)
  redirect to("/competitors/#{params['id']}")
end

# DELETE
delete '/competitors/:id' do
  Competitor.destroy(params['id'])
  redirect to('/competitors')
end