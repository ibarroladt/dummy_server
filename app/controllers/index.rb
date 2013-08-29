enable :sessions

get '/' do
  if session[:id]
    @user = User.find(session[:id])
    erb :index
  else
    erb :index
  end
end

get '/user' do
  erb :user
end

get '/logout' do
  session.clear
  redirect ('/')
  erb :index
end

get '/user/:id' do
  id = params[:id]
  @user = User.find(id)
  session[:id] = params[:id]
  erb :user
end

post '/user_new' do
user_form = params[:user]
User.create(user_name: user_form[:user_name], password: user_form[:password])
erb :user
end

post '/user_login' do
  user = params[:user][:user_name]
  a = User.where(user_name: user)
  b = a.first
   if b[:password] == params[:user][:password]
    # unless a.authenticate(user_form[:user_name], user_form[:password])
    #   @errors = a.errors.full_messages.join(", ")
    # end
    redirect ("/user/#{b[:id]}")
  else
    @error = "YOU FUCKED UP BAD "
    erb :index
  end
end

# post 'user/:id' do
# end
