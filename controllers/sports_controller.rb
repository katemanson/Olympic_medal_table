#INDEX
get '/sports' do
  @sports = Sport.all()
  erb(:'sports/index')
end

#NEW
get '/sports/new' do
  erb(:'sports/new')
end

#CREATE
post '/sports' do
  @sport = Sport.new(params)
  @sport.save()
  redirect to('/sports')
end

#SHOW
get 'sports/:id' do
  @sport = Sport.find(params['id'])
  erb(:'sports/show')
end

#EDIT
get 'sports/:id/edit' do
  @sport = Sport.find(params['id'])
  erb(:'sports/edit')
end

#UPDATE
put 'sports/:id' do
  @sport = Sport.update(params)
  redirect to("/sports/#{params['id']}")
end

#DELETE
delete 'sports/:id' do
  Sport.destroy(params['id'])
  redirect to('/sports')
end