require 'open-uri'

class GooglePhotosService
  def initialize(params)
    @key = params[:key]
    @photo_reference = params[:photo_reference]
  end

  def photos_api_attach_photo(bar)
    url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{@photo_reference}&key=#{@key}"
    bar.photo.attach(io: URI.open(url), filename: 'bar-image.jpg', content_type: 'image/jpg')
    bar.save
  end
end
