class Song < ApplicationRecord
has_many :lyrics
attr_accessor :lyric
before_validation :azr
def azr
if self.lyric && self.lyric.length > 0
self.lyric.split("\n").each do |k|
self.lyrics.find_or_initialize_by(content: k)
end
end
end
accepts_nested_attributes_for :lyrics, allow_destroy:true
def lyrichash
{"/uploads/#{self.file}.mp3":self.lyrics.map{|j|[j.mytime, j.content]}.to_h}.to_h.to_json
end
def self.lyrichash
select("songs.*").where("lower(songs.title) not like '%barbie%' and lower(songs.title) not like '%wild thought%' and lower(songs.title) not like '' and (select count(idontlikes.id) from idontlikes where idontlikes.song_id = songs.id) = 0").to_a.map {|h|["/uploads/#{h.file}.#{h.someradio.include?("json") ? "wav" : "mp3"}",h.lyrics.map{|j|[j.mytime, j.content]}.to_h]}.to_h.to_json
end
def track_list
x=[
  {
    id: self.id,
    name: self.title,
    artist: self.artist,
    myradio: self.myradio,
    image: (self.image or "https://source.unsplash.com/Qrspubmx6kE/640x360"),
    path: "/uploads/"+self.file+(self.someradio.include?("json") ? ".wav" : ".mp3")
  }
]
x.to_json
end
def self.track_list
xx=select("songs.*").where("lower(songs.title) not like '%barbie%' and (select count(idontlikes.id) from idontlikes where idontlikes.song_id = songs.id) = 0").to_a.shuffle.map do |x|
  {
    id: x.id,
    name: x.title,
    artist: x.artist,
      myradio: x.myradio,
    image: (x.image or "https://source.unsplash.com/Qrspubmx6kE/640x360"),
    path: "/uploads/"+x.file+".#{x.someradio=="json" ? "wav" : "mp3"}"
  }
end
xx.to_json
end
end
