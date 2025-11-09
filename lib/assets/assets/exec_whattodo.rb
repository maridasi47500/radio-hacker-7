require './whattodo'
@new=Radio.new

@new.hacker(60)
@new.ecritfichiers
p 'Entrez un nombre de secondes pour augmenter ou diminuer le décalage ou entrez 0 ou quit pour quitter'
p = gets.chomp
case p 
when "0"
  p "merci"
when "quit"
  p "merci"
else 
  nbsec=p.to_i 
  case nbsec
  when 0
    p "merci"
  else
    if nbsec < -60 && nbsec > 60
      p "désolée mais le nombre doit être petit que 60 et plus grand que -60 merci à bientôt"
    else
     @new.hacker(nbsec)
    end
  end 
end

