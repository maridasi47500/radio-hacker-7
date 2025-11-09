json.extract! rssradio, :id, :name, :pic, :stream, :mysong, :mytime, :created_at, :updated_at
json.url rssradio_url(rssradio, format: :json)
