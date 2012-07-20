Faceblock.controllers :permalink do
  layout "application.html"
  get :permalink, :map => "/permalink.php" do
    fburl = URI.parse request.url
    fburl.host = "m.facebook.com" 

    fbsource = Nokogiri::HTML.parse(open fburl)

    @title   = fbsource.title
    @message = fbsource.css("#root .story .msg").text
    render 'permalink.html'
  end 
end

