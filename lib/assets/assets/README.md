# hack a radio
 

- lancer script.sh 

* pour scriptmetisfm.sh
- lancer 
```
ruby metisfm.rb
```
- lancer scriptmetisfm.sh  dans 1 autre fenetr terminal
```
ruby metisfm.rb
sh scriptmetisfm.sh 
```
- tu dois avoir 2 script pour 1 radio (json donne current, previous et next song)
: 
* first argum=flux json des titre precedent suivant

 -        hack METIS 1 lancer en meme temps le script 2' && bash -l -c 'sh ./jsonradio1.sh'"`
* first argument : radio numero (id)
* 2nd argument : +/-
* 3nd argument : +/- hours gmt
* 4eme argument : +/- minute gmt

  -       hack METIS script numero 2' && bash -l -c 'sh ./scriptjsonradio.sh'"`

- tu dois avoir 1 script pour 1 radio (le rss donne les 10 derniere chansons) (6 arguments)
:  
        hack Mstral fm script numero 1' && bash -l -c 'sh ./rssscript.sh'"`
