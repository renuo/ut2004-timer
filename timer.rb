require 'time'

sound_files = [
    [0.5, 'Play.wav'],
    [1.9, 'one.wav'],
    [2.8, 'two.wav'],
    [3.8, 'three.wav'],
    [4.8, 'four.wav'],
    [5.9, 'five.wav'],
    [7, 'six.wav'],
    [8.1, 'seven.wav'],
    [9, 'eight.wav'],
    [10.1, 'nine.wav'],
    [11, 'ten.wav'],
    [13.2, 'next_wave_in.wav'],
    [20, '20_seconds.wav'],
    [30, '30_seconds_remain.wav'],
    [60, '1_minute_remains.wav'],
    [120, '2_minutes_remains.wav'],
    [180, '3_minutes_remains.wav'],
    [300, '5_minute_warning.wav'],
]

print "Enter a time (e.g. #{Time.now.strftime('%T')}): "
end_time = Time.parse(gets.chomp)
seconds_to_end = end_time - Time.now

raise 'Date in the past' if Time.now >= end_time

sound_files.each do |sound_file|
  fork do
    diff_sec = seconds_to_end - sound_file[0]
    next if diff_sec <= 0
    puts "Alarm in #{diff_sec}"
    sleep diff_sec
    exec 'afplay', "./sounds/announcermale2k4/#{sound_file[1]}"
  end
end

sleep(5)

while Time.now < end_time
  system 'clear'
  p Time.now

  sleep(1)
end

