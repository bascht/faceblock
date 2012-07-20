Faceblock.controllers :home do
  layout "application.html"
  get :home, :map => "/" do
    @latest = Like.all.limit(10)
    @stats = Like.view(:by_action).count
    render 'home.html'
  end 
end

