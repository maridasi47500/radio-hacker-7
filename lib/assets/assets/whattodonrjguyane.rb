require 'open-uri'
require 'active_record'
require 'json'
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
@date="history/"+Time.new.to_s.scan(/\d+/).join[0..13]
    p "my name".titleize
@time_end = Time.new.localtime
system("echo 'Vous avez stoppé le script';mv file4.mp3 filemusic4.mp3;")
@doc = JSON.load(File.read("./sample-data-nrjguyane.json"))
@songs = @doc["songs"]
p @songs.length
n = 0
@all=[]
@songs.length.times do 

  artist = @songs[n]["artist"]
  title = @songs[n]["title"]
  song = artist + ' - ' + title
  time = DateTime.parse(@songs[n]["start_time"]).to_time
  begin
  image = @songs[n]["img"]
  rescue
  image=""
  end
  n+=1
  p song
  @all.push({
      "song"=>song,
      "artist"=>artist,
      "myradio"=>"Nrjguyane",
      "title"=>title,
      "image"=>image,
      "time"=>time + 3.hour
  })
end
  return @all

  end
  def getallsongs
    @all
  end
  def hacker(timecut)





p @all.length
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
    cut="echo '-#{t1} -#{t2}'>timetable;cutmp3 -i filemusic4.mp3 -f timetable -o #{nom};mid3v2 -a #{temps[nmusiques]["artist"].dump} -t #{temps[nmusiques]["title"].dump} #{nom}0001.mp3;"
    p cut
    system(cut)
    puts("echo '-#{t1} -#{t2}'>timetable;cutmp3 -i filemusic4.mp3 -f timetable -o #{nom};")
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
\nrequire 'active_support/core_ext'

\nrequire 'time'\nrequire 'open-uri'\nrequire 'active_record'\nrequire 'timeout'\nrequire 'nokogiri'\n"
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
\n
\nelsif plus == "-"
\n  @time_end += heure.hour
\nend


\n@all=#{@all.to_s}\n
temps = @all.reverse #.sort {|x,y| y['time'] <=> x['time']} #.pluck('time')
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
\n    if nom.strip.length > 0
\n      #nom2 = temps[nmusiques][:song].parameterize
\n      cut = "rm \#{nom}**.mp3; echo '-\#{t1} -\#{t2}'>timetable;cutmp3 -i filemusic4.mp3 -f timetable -o \#{nom};mv \#{nom}**.mp3 \#{nom}.mp3;mid3v2 -a \#{temps[nmusiques]['artist'].dump} -t \#{temps[nmusiques]['title'].dump} \#{nom}.mp3;"
\n      system(cut)
\n    end
\nend
\nend
\nhack(0)
EOF`);

system(`mkdir -p #{@date}; mv cut.rb #{@date}; mv filemusic4.mp3 #{@date};(cd #{@date} && ruby cut.rb);`);
  end
end
@rad=Radio.new
@rad.ecritfichiers
