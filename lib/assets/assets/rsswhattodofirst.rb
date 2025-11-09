require 'open-uri'

require 'time'
    @all = []


#raises an exception if timeout is met
#first argument = radio mp3 stream
#2nd argument = radio numero
    system("rm file#{ARGV[1]}.mp3; wget #{ARGV[0]} -O file#{ARGV[1]}.mp3;")
