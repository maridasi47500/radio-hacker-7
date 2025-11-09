class HackController < ApplicationController
  def radio
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'entrez le mot de passe et entrez rails s' && bash -l -c 'sh ./script.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def metis1
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack METIS 1 lancer en meme temps le script 2' && bash -l -c 'sh ./metis1.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def metis2
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack METIS script numero 2' && bash -l -c 'sh ./scriptmetisfm.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def cherie1
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack CHERIE FM 1 lancer en meme temps le script 2' && bash -l -c 'sh ./cheriefm1.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def cherie2
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack CHERIE FM script numero 2' && bash -l -c 'sh ./scriptcheriefm.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def bblack1
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack bblack 1 lancer en meme temps le script 2' && bash -l -c 'sh ./blackradio1.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def bblack2
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack bblack FM script numero 2' && bash -l -c 'sh ./scriptblackradio.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def nrjguyane1
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack nrjguyane 1 lancer en meme temps le script 2' && bash -l -c 'sh ./nrjguyane1.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def nrjguyane2
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack nrjguyane FM script numero 2' && bash -l -c 'sh ./scriptnrjguyane.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def radiopeyi1
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack radio peyi 1 lancer en meme temps le script 2' && bash -l -c 'sh ./radiopeyi1.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
  def radiopeyi2
    threads=[]
    thread=Thread.new do
      1.times do
        `xterm -l -hold -e "cd #{Rails.root.to_s}/lib/assets && echo 'hack radio peyi FM script numero 2' && bash -l -c 'sh ./scriptradiopeyi.sh'"`
      end
    end
    threads << thread
    @res=threads.join
  end
end
