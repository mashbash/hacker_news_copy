get '/' do
  if session[:user_id] 
    @user = User.find_by_id(session[:user_id])
    if @user.nil?
      erb :index
    end
  else
    erb :postall           
  end
end


