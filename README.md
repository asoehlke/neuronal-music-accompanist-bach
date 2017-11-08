# neuronal-music-accompanist-bach
Create TensorFlow LSTM neuronal network to add Bach choral style accompanying voices to a melody

The idea is not that the model should predict the next note of the music, but to find good chords for a melody while the melody is played.

This jupyter notebook contains the code to
- extract the Bach choral data from the music21 package (http://web.mit.edu/music21/)
- create and learn a recurrent neuronal network (LSTM)
- create musical scores from the predictions, visualize via MuseScore and output via MIDI


Files:

- MusicAccompanistLearning.ipynb: the jupyter notebook to learn the Bach music

- MusicAccompanistApplication.ipynb: the creation of the application network

- .music21rc : configuration for music21 external programs, important are musicxmlPath and musescoreDirectPNGPath for the visualization of the scores and midiPath for MIDI output

Environment:
I used jupiter notebook 5.0.0 installed via Anaconda Navigator 1.6.9 on an Ubuntu Studio installation

Credits:
Danijar Hafner for great hints on how to structure the network (https://danijar.com/structuring-your-tensorflow-models)





