class Likerfire
  print "Loading Authentication routes..."
  
  #this is the route OmniAuth calls after authenticating with Facebook
  get '/auth/facebook/callback' do
    @auth_hash = request.env['omniauth.auth']
    
    @user = User.new @auth_hash
    
    session["current_user"] = @user
    
    redirect '/welcome'
  end
  
  puts "done"
end