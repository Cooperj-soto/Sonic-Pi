use_bpm 63

jake = "C:/Users/coope/Downloads/jake_quote.wav"


define :play_melody do |notes, times, amp_level|
  i = 0
  notes.length.times do
    play notes[i], amp: amp_level
    sleep times[i]
    i += 1
  end
end

define :play_progression do |chords, dur|
  chords.each do |ch|
    play_chord ch
    sleep dur
  end
end


extra_melody = [:cs5,:b4,:a4,:e5,:cs5,:b4]
timing = [1,1,2,1,1,2]

chords = [
  [:a3, :cs4, :e4],
  [:d3, :fs3, :a3],
  [:a3, :cs4, :e4],
  [:fs3, :a3, :cs4],
  [:b3, :d4, :fs4],
  [:e3, :gs3, :b3],
  [:a3, :cs4, :e4],
  [:e3, :gs3, :b3]
]

live_loop :jake_sample do
  stop if get(:stop_all)
  sample jake
end

sleep 12

live_loop :kick do
  stop if get(:stop_all)
  
  sample :drum_bass_soft
  sleep 2
end

live_loop :hat do
  stop if get(:stop_all)
  
  sample :drum_cymbal_closed, amp: 0.3
  sleep 0.5
end


live_loop :chords_loop do
  stop if get(:stop_all)
  
  use_synth :hollow
  play_progression chords, 2
end

live_loop :bass do
  stop if get(:stop_all)
  
  sleep 8
  use_synth :fm
  
  play :a2, amp: 0.3
  sleep 1
  play :e2, amp: 0.2
  sleep 1
  play :g2, amp: 0.2
  sleep 1
  play :a2, amp: 0.2
  sleep 1
end


live_loop :strings do
  stop if get(:stop_all)
  
  sleep 16
  
  with_fx :reverb, mix: 0.7 do
    play_progression [
      [:a4, :cs5, :e5],
      [:e4, :gs4, :b4],
      [:fs4, :a4, :cs5],
      [:d4, :fs4, :a4]
    ], 2
  end
end


live_loop :melody do
  stop if get(:stop_all)
  
  sleep 16
  use_synth :pretty_bell
  
  play_melody extra_melody, timing, 0.4
  play_melody extra_melody.reverse, timing, 0.3
end


live_loop :fade_pad do
  stop if get(:stop_all)
  
  sleep 8
  
  amp_val = 0
  8.times do
    sample :ambi_choir, amp: amp_val, sustain: 2
    amp_val = amp_val + 0.1
    sleep 2
  end
  stop
end


live_loop :stopper do
  sleep 72
  set :stop_all, true
  stop
end
