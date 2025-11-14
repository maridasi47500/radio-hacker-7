require 'open-uri'
require 'active_record'
require 'rubygems'
require 'active_support'
require 'active_support/core_ext'



##
#
# utiliser cutmp3
# utiliser mid3v2, l'installer avec sudo apt-get install python3-mutagen

require 'timeout'
require 'nokogiri'
##
# ligne pour tester
# à mettre en commentaire plus tard
class Radio
  def initialize
    p "my name".titleize
@time_end = Time.new.localtime
system(`echo 'klyhgkjhg';mv file#{ARGV[1]}.mp3 filemusic#{ARGV[1]}.mp3;`)
# first argument : rss radio feed
# 2nd argument : radio numero
#3nd argument : +/- 
#4nd argument : +/- hours gmt
#5eme argument : +/- minute gmt

@doc = Nokogiri::XML(URI.open(ARGV[0]))
p @doc
@songs = @doc.children[0].children[1].children
p @songs.length
n = 13 
@all=[]
15.times do 
  song = @songs[n].children[1].text
  artist = song.split(' - ')[0]
  title = song.split(' - ')[1].titleize
  time = DateTime.parse(@songs[n].children[11].text).to_time.localtime
  begin
  image = @songs[n].children[13].attributes["url"].value
  rescue
  image=""
  end
  n+=2
  p song
  mytime=ARGV[2] == "+" ? time + ARGV[3].to_i.hour + ARGV[4].to_i.minute : time - ARGV[3].to_i.hour - ARGV[4].to_i.minute #decalage horaire radio

  @all.push({
      "song"=>song,
      "artist"=>artist,
      "title"=>title,
      "someradio"=>"rss",
      "radio_id"=>"#{ARGV[0]}",
      "image"=>image,
      "time"=>mytime

  })
end
  return @all

  end
  def getallsongs
    @all
  end 
  def hacker(timecut)

    #puts 'It timed out!'
    
    
    
    p @all.length
    #p @dl
    #listemusiques=[{"song"=>"The Weeknd - In your Eyes", "artist"=>"The Weeknd", "title"=>"In your Eyes", "time"=>"2020-10-12 14:54:01 +0200"}, {"song"=>"Lewis Capaldi - Before you go", "artist"=>"Lewis Capaldi", "title"=>"Before you go", "time"=>"2020-10-12 14:44:01 +0200"}, {"song"=>"P DIDDY - LAST NIGHT", "artist"=>"P DIDDY", "title"=>"LAST NIGHT", "time"=>"2020-10-12 14:40:01 +0200"}]
    #
    temps = @all.sort {|x,y| y["time"] <=> x["time"]} #.pluck('time')
    0.upto(temps.length - 2) do |nmusiques|
      if nmusiques == 0
        t2="00:00"
      else
        tinsec = (@time_end - temps[nmusiques-1]["time"]) + 60.to_f + timecut.to_f
        t=tinsec.to_s
        t2 = DateTime.strptime(t, '%s').strftime('%M:%S')
      end
      tinsec = (@time_end - temps[nmusiques]["time"]) + 60.to_f + timecut.to_f
        t=tinsec.to_s
        t1 = DateTime.strptime(t, '%s').strftime('%M:%S')
        #p @time_end
        #p temps[nmusiques]
        nom = temps[nmusiques]["song"].parameterize
        #nom2 = temps[nmusiques][:song].parameterize+""
        cut="echo '-#{t1} -#{t2}'>timetable;cutmp3 -i filemusic#{ARGV[1]}.mp3 -f timetable -o #{nom};mid3v2 -a #{temps[nmusiques]["artist"].dump} -t #{temps[nmusiques]["title"].dump} #{nom}0001.mp3;"
        p cut
        system(cut)
        puts("echo '-#{t1} -#{t2}'>timetable;cutmp3 -i filemusic#{ARGV[1]}.mp3 -f timetable -o #{nom};")
    end
  end 
  def ecritfichiers
    @y=@all.map do |i|
    j=i.to_a.map do |k,v|
      [k,v.to_s]
    end
    j.to_h
    end
    @all=@y
    req = "require 'rubygems'
\nrequire 'active_support'
\nrequire 'time'\nrequire 'open-uri'\nrequire 'active_record'\nrequire 'timeout'\nrequire 'nokogiri'\nrequire 'rubygems'
\nrequire 'active_support/core_ext'
"
system(`cat <<EOF >cut.rb 
#{req}\n
def hack(nombresecondes)
\n@time_end=Time.parse('#{@time_end}')
\nstr1='#{@time_end}'

\nminute=str1[-2..-1]
\nheure=str1[-4..-3].to_f
\nplus=str1[-5]
\nif minute == "30"
\n  heure += 0.5
\nend
\nif plus == "+"
\n  @time_end -= heure.hour
\n  @time_end -= minute.minute
\n
\nelsif plus == "-"
\n  @time_end += heure.hour 
\n  @time_end += minute.minute
\nend



\n@all=#{@all.to_s}\n
temps = @all #.sort {|x,y| y['time'] <=> x['time']} #.pluck('time')
\n0.upto(temps.length - 2) do |nmusiques|
\n  if nmusiques == 0
\n    t2='00:00'
\n  else
\n    tinsec = (@time_end - Time.parse(temps[nmusiques-1]['time'])) + 60.to_f + (nombresecondes.to_f)
\n    t=tinsec.to_s
\n    t2 = DateTime.strptime(t, '%s').strftime('%M:%S')
\n  end

\n    tinsec = (@time_end - Time.parse(temps[nmusiques]['time'])) + 60.to_f + (nombresecondes.to_f)
\n    t=tinsec.to_s
\n    t1 = DateTime.strptime(t, '%s').strftime('%M:%S')
\n    #p @time_end
\n    #p temps[nmusiques]
\n    nom = temps[nmusiques]['song'].parameterize
\n    #nom2 = temps[nmusiques][:song].parameterize
\n    cut = "rm \#{nom}**.mp3; echo '-\#{t1} -\#{t2}'>timetable;cutmp3 -i filemusic#{ARGV[1]}.mp3 -f timetable -o \#{nom};mv \#{nom}**.mp3 \#{nom}.mp3;mid3v2 -a \#{temps[nmusiques]['artist'].dump} -t \#{temps[nmusiques]['title'].dump} \#{nom}.mp3;"
\n    system(cut)
\nend
\nend
\nhack(0)
EOF`);
date="history/"+Time.new.to_s.scan(/\d+/).join[0..13]
system(`mkdir -p #{date}; mv cut.rb #{date}; mv filemusic#{ARGV[1]}.mp3 #{date};(cd #{date} && ruby cut.rb);`);
  end
end
@rad=Radio.new
@rad.ecritfichiers
