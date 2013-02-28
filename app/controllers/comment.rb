post '/comment/create' do
  @newcomment = Comment.new(:content => params[:content], 
                            :post_id => params[:post_id],
                            :user_id => session[:user_id])
  @newcomment.save 
  redirect "/posts/#{params[:post_id]}"

end

