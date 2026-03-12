use_synth :piano
use_bpm 120

define :adventure_notes do |changing_note|
  play :c5
  sleep 0.5
  play :d5
  sleep 0.5
  play :e5
  sleep 0.5
  play :d5
  sleep 1
  play :c5
  sleep 1
  play :d5
  sleep 1
  play changing_note # Only this note is different!
  sleep 1
  play :c5
  sleep 1.5
  play :r
  sleep 1
end


#-------------------------music starts here-------------------------#

#INTRO
play :e4
sleep 0.5
play :f4
sleep 0.5
play :g4, sustain: 3
sleep 2
play :c5, sustain: 3
sleep 2
play :a4, sustain: 3
sleep 2
play :r
sleep 1

#FUNCTION CALLS
adventure_notes :d5
adventure_notes :a4

#OUTRO
play :a4
sleep 1
play :g4
sleep 0.5
play :c5
sleep 1
play :c5
sleep 1
play :e4
sleep 1
play :d4, sustain: 2
sleep 1.5

=begin
song = ["come along","with","me","to a town","beside the sea","we can wander","thru the forest","and do so","as we please!"]
count = 0
8.times do
  print(song [count])
  sleep 1
end
=end
