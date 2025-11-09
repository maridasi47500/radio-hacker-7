json.extract! song, :id, :myradio, :title, :artist, :file, :created_at, :updated_at
json.url song_url(song, format: :json)
