enable :sessions

post "/login" do
    @user = User.authenticate(params["name"], params["password"])

  if @user
    session[:id] = @user.id
    redirect to ("/table")
  else
    redirect to("/")
  end
end

post "/signup" do
  @user = User.new(name: params[:name], password: params[:password])
  @user.save
  session[:id] = @user.id
  redirect to("/table")
end






















