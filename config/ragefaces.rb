if(Faceblock.enable_ragefaces)
  begin
    rages = JSON.parse(RestClient.get Faceblock.enable_ragefaces)
    Faceblock.set :ragefaces, rages["items"].shuffle
  rescue Exception => e
    logger.warn "Ragefaces disabled, as something went wrong here: #{e}."
  end
end
