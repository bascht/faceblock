Faceblock.controllers :plugins do
  layout "application.html"

  get :like, :map => "/plugins/like.php" do
    self.track_like

    @likes = Like.by_referrer(:key => request.referrer)
    
    layout = params["layout"] || ""

    render case layout
      when "button_count"  then 'plugins/like.button.html'
      when "button"        then 'plugins/like.button.html'
      when "box"           then 'plugins/like.box.html'
      else                      'plugins/like.html'
    end
  end 

  get :activity, :map => "/plugins/activity.php" do
    track_like
    render_faces
    @likes = Like.by_referrer(:key => request.referrer)
    render 'plugins/likebox.html'
  end 

  get :fan, :map => "/plugins/fan.php" do
    track_like
    render_ragefaces 
    @likes = Like.by_referrer(:key => request.referrer)
    render 'plugins/likebox.html'
  end 

  get :likebox, :map => "/plugins/likebox.php" do
    track_like
    render_ragefaces 
    @likes = Like.by_referrer(:key => request.referrer)
    render 'plugins/likebox.html'
  end 
end
