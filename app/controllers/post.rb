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

post '/posts/signup' do
  user_id = User.find_by_username(params[:username])
  if user_id.nil?
    new_user = User.new(username: params[:username], password: params[:password])
    new_user.save
    @require_signin = "You've registered! Now sign in!"
    erb :index
  else
    @require_signin = "You already have an account. Please sign in."
    erb :index
  end
end

get '/posts/all' do
  @posts = Post.order('postvote_count desc')
  erb :postall
end

post '/posts/create' do
  @newpost = Post.new(title: params[:title], content: params[:content], user_id: session[:user_id])
  @newpost.save
  redirect 'posts/all'
end

get '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  @comments = Comment.where(:post_id => @post.id).order('commentvote_count desc')
  erb :postpage
end

post '/posts/vote' do
  @post_id = params[:post_id]
  @post = Post.find_by_id(@post_id)
  @postvote_new = Postvote.new(user_id: session[:user_id], post_id: @post_id) 
  if @postvote_new.save
    @post.postvote_count += 1
    @post.save
  end
  redirect '/posts/all'
end

post '/posts/comments/vote' do
  @comment_id = params[:comment_id]
  @comment = Comment.find_by_id(@comment_id)
  @commentvote_new = Commentvote.new(user_id: session[:user_id], comment_id: @comment_id) 
  if @commentvote_new.save
    @comment.commentvote_count += 1
    @comment.save
  end
  redirect "/posts/#{@comment.post_id}"

end

