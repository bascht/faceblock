Faceblock.controllers :home do
  layout "application.html"
  get :home, :map => "/" do
    @latest = Like.view(:by_created_at)
    @stats = Like.view(:by_action).count
    render 'home.html'
  end 
end

