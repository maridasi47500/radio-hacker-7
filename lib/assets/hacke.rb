require 'open-uri'

require 'timeout'
class Hacke
  def initialize
    @all = []
    Time.zone = "Europe/Paris"

#raises an exception if timeout is met
    
begin
  @time_start=Time.new.localtime
Timeout::timeout(1000) {    
  system("rm file.mp3; wget http://broadcast.infomaniak.ch/mistralfm-high.mp3 -O file1.mp3;")
}

rescue Timeout::Error => e
  puts 'It timed out!'+e.message
  @time_end = Time.new.localtime
  system("echo 'klyhgkjhg';mv file1.mp3 filemusic.mp3;")
    @doc = Nokogiri::XML(URI.open("https://www.mistralfm.com/rss-feed-30"))
    @songs = @doc.children[0].children[1].children
    n = 13 
    10.times do 
      song = @songs[n].children[1].text
      artist = song.split(' - ')[0]
      title = song.split(' - ')[1]
      time = @songs[n].children[11].text.to_datetime.localtime
      n+=2
      @all.push({
          song:song,
          artist:artist,
          title:title,
          time:time
      })

    end
    listemusiques = @all.select {|x| x[:time] > @time_start && x[:time] < @time_end}
    #p @dl
    #listemusiques=[{"song"=>"The Weeknd - In your Eyes", "artist"=>"The Weeknd", "title"=>"In your Eyes", "time"=>"2020-10-12 14:54:01 +0200"}, {"song"=>"Lewis Capaldi - Before you go", "artist"=>"Lewis Capaldi", "title"=>"Before you go", "time"=>"2020-10-12 14:44:01 +0200"}, {"song"=>"P DIDDY - LAST NIGHT", "artist"=>"P DIDDY", "title"=>"LAST NIGHT", "time"=>"2020-10-12 14:40:01 +0200"}]
    temps = listemusiques.sort {|x,y| x[:time].to_datetime <=> y[:time].to_datetime} #.pluck('time')
    0.upto(temps.length - 2) do |nmusiques|
      t1 = (temps[nmusiques][:time].to_datetime.localtime - @time_start).strftime("%l:%M") 
      t2 = (temps[nmusiques+1][:time].to_datetime.localtime - @time_start).strftime("%l:%M") 
      nom = temps[nmusiques][:song].parametize+".mp3"
                  system("cp filemusic.mp3 #{nom}; cutmp3 -i #{nom} -a #{t1} -b #{t2};")
                         
    end

end 


@doc
  end
  def getall
    @all
  end
  def getsongs

  end
  def hackerradio



  end
end
