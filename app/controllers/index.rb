 enable :sessions

 get '/' do
   # Look in app/views/index.erb
   erb :index
 end

 get '/table' do
  @user = User.find(session[:id])
  @game = @user.games.new
  @games = Game.where(ended: false)

  erb :table
end




post '/game/:id/join' do
  @user = User.find(session[:id])
  @game = Game.find(params[:id])
  @game.update(active: false)
  if @game.player1_id == @user.id
    redirect to('/table')
  else
    @game.update(player2_id: @user.id)
    redirect to("/game/#{@game.id}")
  end
end

post '/games' do
  @user = User.find(session[:id])
  @game = @user.games.create(player1_id: @user.id, active:true)
  session[:game_id] = @game.id
  redirect to("/game/#{@game.id}")
end


post '/game/:id' do
  @user = User.find(session[:id])
  @game = @user.games.create(player1_id: @user.id, active: true)
  session[:game_id] = @game.id
  # @game.to_json
  redirect to("/game/#{@game.id}")
end

get '/game/:id' do
  # @player1 = @user.games.find(player1_id: @user.id, active: true)
  # @player2 = @user.games.find(player2_id: @user.id, active: true)
  @game = Game.find(params[:id])
  erb :game
end

