class Lyric < ApplicationRecord
belongs_to :song
def mytime
f=read_attribute(:mytime)
f ? (f.strftime("%M:%S")+"."+f.strftime("%L")[0]) : nil
end
def mytime=(x)
write_attribute(:mytime,"00:"+x)
end
end
