enable 'sessions'
post '/posts' do
  @user = User.find_by_username(params[:username])
  if @user.nil?
    @require_reg = "No matching credentials found.  Please register for a new account"
    erb :index
  else 
    session[:user_id] = @user.id
    # @posts = Post.all
    # erb :postall
    redirect 'posts/all'
  end   
end

get '/posts/all' do
  @posts = Post.all
  erb :postall
end

post '/posts/signup' do
  user_id = User.find_by_username(params[:username])
  if user_id.nil?
    new_user = User.new(username: params[:username], password: params[:password])
    new_user.save
    redirect 'posts/all'
  else
    @require_signin = "You already have an account. Please sign in."
    erb :index
  end

end

post '/posts/create' do
  @newpost = Post.new(title: params[:title], content: params[:content], user_id: session[:user_id])
  @newpost.save
  redirect 'posts/all'
end

get '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  @comments = Comment.where(:post_id => @post.id)
  erb :postpage
end

post '/posts/vote' do
  puts params
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  @post = params[:post]
  @postvote_new = Postvote.new(user_id: session[:user_id], post_id: @post.id) 
  @postvote_new.save
  @post.postvote += 1
  redirect '/posts/all'
end

