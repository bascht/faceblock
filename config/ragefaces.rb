if(Faceblock.enable_ragefaces)
  rages = JSON.parse(RestClient.get Faceblock.enable_ragefaces)
  Faceblock.set :ragefaces, rages["items"].shuffle
end
