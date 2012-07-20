# Helper methods defined here can be accessed in any controller or view in the application

Faceblock.helpers do
  def track_like 
    @like = Like.new params
    @like.referrer = request.referrer
    @like.save
  end

  def render_ragefaces
    if(defined? Faceblock.ragefaces && params["show_faces"]) 
      @faces = Faceblock.ragefaces.shuffle 
    end
  end
end

