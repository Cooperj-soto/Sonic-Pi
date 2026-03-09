use_synth :piano

note = 21
87.times do
  play(note)
  sleep 0.1
  note = note + 1
end
