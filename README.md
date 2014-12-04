BasicVoiceRecognition
=====================
The beginings of a final project for a Signals and Systems class (BME271) at Duke University. 
Current goal is to first use Foruier Analysis to identify the different types of vowels in words, and to then potentially use frequency data to train a machine learning model to do basic voice recognition. 

To get prediction results from recorded voice input, use BasicMachineLearningRunner.m (looks for 'a' or 'i' vowels in input words). Depending on your computer, you may have to modify line 6 of this file to account for your microphone hardware (rSignal=audiorecorder(fs,16,1,0); % Recorder to hold signal) Changing the last 0 to a 1 may be necessary. 

More documentation to come. 
