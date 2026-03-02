use_bpm 165
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

sample "C:/Users/cooper_soto/Downloads/Grito.mp3", amp: 5


sleep 8

live_loop :intro_chords do
  use_synth :prophet
  with_fx :reverb, mix: 0.5 do
    8.times do
      play_chord chord(:e4, :major7), sustain: 4
      sleep 4
      play_chord chord(:cs4, :minor7), sustain: 4
      sleep 4
    end
    stop
  end
end

live_loop :melody do
  with_fx :compressor do
    with_fx :distortion do
      4.times do
        #measure one
        measure_one_three
        #measure two
        measure_two_four
        #measure three
        measure_one_three
        #measure four
        measure_two_four
      end
      stop
    end
  end
end
sleep 8

live_loop :sn do
  9.times do
    sample :sn_generic, amp: 0.5
    sleep 4
  end
  stop
end
live_loop :cymbol do
  112.times do
    sample :drum_cymbal_closed, amp: 0.5
    sleep 0.5
  end
  stop
end

live_loop :crash do
  28.times do
    sample :bd_haus, amp: 1.5
    sleep 1
    sample :sn_dolf, amp: 1.2
    sleep 1
  end
  stop
end
sleep 56

sample "C:/Users/cooper_soto/Downloads/Ahora te puedes sample.wav"
