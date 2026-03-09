# Welcome to Sonic Pi
use_bpm 160
use_synth :saw

main = [:c2,:e2,:g2,:b2,:c3,:b2,:g2,:e2]
note = 0


# Seven Nation Army by The White Stripes
nation = [:e3 ,:e3,:g3,:e3,:r,:d3,:c3,:b2]
timing = [1.5,0.5,0.75,0.25,0.5,0.5,2,2]
n = 0
t = 0
use_bpm 120
use_synth :fm
use_synth_defaults sustain: 0.25

live_loop :white_stripes do
  8.times do
    play (nation [n])
    sleep (timing [t])
    t = t + 1
    n = n + 1
  end
  n = 0
  t = 0
end


live_loop :main_theme do
  with_fx :distortion do
    8.times do
      play (main [note])
      sleep 0.5
      note = note + 1
    end
    note = 0
  end
end

live_loop :main_theme do
  with_fx :distortion do
    play (main [note])
    sleep 0.5
    note = note + 1
  end
  if note > 7
    note = 0
  end
end
