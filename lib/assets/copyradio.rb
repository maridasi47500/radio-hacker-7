radio1="cheriefm"
radio2="radiopeyi"
x= %(cheriefm1.sh  scriptcheriefm.sh    whattodofirstcheriefm.rb cheriefm.rb   whattodocheriefm.rb).split(" ")
p x

x.each do |wow|
  hey=`cp "#{wow}" "#{wow.gsub(radio1,radio2)}"`
end
