use_bpm 135
use_synth :fm
define :measure_one_three do
  play :e3
  sleep 0.5
  play :e3
  sleep 0.5
  play :r
  sleep 0.5
  play :b2
  sleep 0.5
  play :e3
  sleep 0.5
  play :e3
  sleep 0.5
  play :r
  sleep 0.5
  play :gs2
  sleep 0.5
end

define :measure_two_four do
  play :cs3
  sleep 0.5
  play :cs3
  sleep 0.5
  play :r
  sleep 0.5
  play :gs2
  sleep 0.5
  play :cs3
  sleep 0.5
  play :cs3
  sleep 0.5
  play :b2
  sleep 0.5
  play :gs2
  sleep 0.5
end
2.times do
  measure_one_three
end
sample :vinyl_backspin

sleep 4

live_loop :melody do
  #measure one
  measure_one_three
  #measure two
  measure_two_four
  #measure three
  measure_one_three
  #measure four
  measure_two_four
end
=begin
live_loop :drum_kick do
  sample :drum_heavy_kick
  sleep 2
end
=end

live_loop :more_drums do
  sample :elec_symbol
  sleep 1
end
