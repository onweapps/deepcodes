get '/register' do
  erb :register
end

get '/login' do
  redirect '/' if session[:user_id]
  erb :login
end

post '/user_verification' do
  @user = User.where(email: params[:email]).first
  if @user
    if @user.password = params[:password]
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect '/profile/' + @user.id.to_s
    else
      @errors = ["that does not match our records!"]
      erb :login
    end
  else
    @errors = ["that does not match out records!"]
    erb :login
  end
end

post '/create' do
  @user = User.new(email: params[:email], name: params[:name])
  @user.password = params[:password]
  if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
    redirect '/profile/' + @user.id.to_s
  else
    @errors = @user.errors.full_messages
    erb :login
  end
end

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
  if @user.id == session[:user_id]
    # @surveys = Survey.where(user_id: params[:user_id])
    erb :profile
  else
    erb :fail
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
