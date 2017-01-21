# INDEX
get '/competitors' do
  @competitors = Competitor.all()
  erb(:'competitors/index')
end

# NEW FROM COUNTRY RECORD
get '/competitors/country/:id/new' do
  @countries = Country.all()
  @country = Country.find(params['id'])
  @sports = Sport.all()
  erb(:'competitors/country_new')
end

# CREATE
post '/competitors' do
  @competitor = Competitor.new(params)
  @competitor.save
  country = @competitor.country_id
  redirect to("/countries/#{country}/competitors")
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
  competitor = Competitor.find(params['id'])
  country = competitor.country_id
  redirect to("/countries/#{country}/competitors")
end

# DELETE
delete '/competitors/:id' do
  competitor = Competitor.find(params['id'])
  country = competitor.country_id
  Competitor.destroy(params['id'])
  redirect to("/countries/#{country}/competitors")
end