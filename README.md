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
I used jupiter notebook 5.0.0 installed via Anaconda Navigator 1.6.9 on an Ubuntu Studio installation.

The exported model files can then be transferred into a frozen mode with the original freeze_graph function provided by TF or with
https://gist.github.com/morgangiraud/249505f540a5e53a48b0c1a869d370bf#file-medium-tffreeze-1-py. 

The frozen model will be used in an application like this one: https://github.com/asoehlke/ai-piano-accompanist-app. 
A step by step guide on how to do this can be found here:
https://medium.com/joytunes/deploying-a-tensorflow-model-to-android-69d04d1b0cba


Credits:
Danijar Hafner for great hints on how to structure the network (https://danijar.com/structuring-your-tensorflow-models)





