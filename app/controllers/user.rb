get '/user/:id' do
  @user = User.find_by_id(session[:user_id])
  @name = @user.username
  @posts = Post.where(:user_id => session[:user_id])
  @comments = Comment.where(:user_id => session[:user_id])
  erb :user
end

post '/user/logout' do
  session[:user_id] = nil
  redirect '/'
end
