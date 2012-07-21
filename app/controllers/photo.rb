Faceblock.controllers :photo do
  layout "application.html"
  get :photo, :map => "/photo.php" do
    fburl = URI.parse request.url
    fburl.host = "www.facebook.com" 
    begin 
      fbsource = Nokogiri::HTML.parse(open fburl)
    rescue 
      return 404
    end

    @photo = fbsource.css("#fbPhotoImage").attr("src").value
    @next  = URI.parse fbsource.css(".photoPagePrevNav").attr("href").value
    @prev  = URI.parse fbsource.css(".photoPageNextNav").attr("href").value

    [@next, @prev].each{|u| u.host = request.host}

    render 'photo.html'
  end 
end
