require "open-uri"
require "json"
require "time"
def every_so_many_seconds(seconds)
  last_tick = Time.now
  loop do
    sleep 0.1
    if Time.now - last_tick >= seconds
      last_tick += seconds
      yield
    end
  end
end
@time=Time.now.to_i.to_s
data_hash={"songs":[]}
@file='./sample-data'+@time+'.json'
@file1='./sample-data-'+ARGV[1]+'.json'
File.write(@file, JSON.dump(data_hash))


def myfunc
  p Time.now
  file = File.read(@file)
  data_hash = JSON.parse(file)



#first argum=flux json des titre precedent suivant
  radio_json=JSON.load(URI.open(ARGV[0]))
  #p radio_json
  currentsong=radio_json["7"]["current_song"]
  data_hash["songs"] << currentsong if !data_hash["songs"].any?{|h| h["hash"] == currentsong["hash"]}
  File.write(@file, JSON.dump(data_hash))
  File.write(@file1, JSON.dump(data_hash))
end
myfunc()
every_so_many_seconds(90) do
  myfunc()

end

