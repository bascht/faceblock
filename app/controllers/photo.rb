Faceblock.controllers :photo do
  layout "application.html"
  get :photo, :map => "/photo.php" do
    fburl = URI.parse request.url
    fburl.host = "www.facebook.com" 
    fbsource = Nokogiri::HTML.parse(open fburl)

    @photo = fbsource.css("#fbPhotoImage").attr("src").value
    @next  = URI.parse fbsource.css(".photoPagePrevNav").attr("href").value
    @prev  = URI.parse fbsource.css(".photoPageNextNav").attr("href").value

    [@next, @prev].each{|u| u.host = request.host}

    
    render 'photo.html'
  end 

  get :mediaset, :map => "/media/set" do
    #http://www.facebook.com/media/set/?set=a.390450867680079.88921.109689632422872&type=3
  end
end
