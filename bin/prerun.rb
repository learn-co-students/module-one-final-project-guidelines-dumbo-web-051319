require_relative '../config/environment'
# system 'afplay assets/music/tp.mp3 & ruby bin/run.rb'
x = Thread.new { system 'afplay assets/music/tp.mp3'}
a = Thread.new { system 'ruby bin/run.rb' }
x.join
a.join
Thread.kill(x)
Thread.kill(a)
Thread.exit
