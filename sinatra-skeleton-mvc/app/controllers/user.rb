get '/users/new' do
  erb :signup
end

post '/users' do
  User.create params
  redirect '/decks'
end


get '/users/login' do
  erb :login
end

get '/users/stats/' do
  p params
  @user = session[:id]
  @deck = Deck.find(params[:deck_id].to_i)
  erb :show_stats
end

post '/login' do
  if auth_user(params)
    @urls = Url.all
    redirect '/decks'
  else
    redirect to '/'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/delete_account' do
  User.delete(session[:id])
end
