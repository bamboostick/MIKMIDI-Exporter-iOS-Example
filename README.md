# MIKMIDI-Exporter-iOS-Example
Render MIDI files to CAF files with Soundfonts on iOS using MIKMIDI. Response to https://github.com/mixedinkey-opensource/MIKMIDI/issues/164

1. Build and Run the project in the iOS simulator.
2. Click the CONVERT button in the iOS app. 
3. The converted CAF file can be found in the Finder at the directory on the screen. The directory is also printed in the Xcode console so it is possible to copy and past the directory.
    .. The address will look something like this:
      file:///Users/MyUser/Library/Developer/CoreSimulator/Devices/3E45FA9F-C5EF-4E9C-8E62-5ADFD3F6CF34/data/Containers/Data/Application/B554472E-A885-4735-8FB6-498FF4B3B3BF/Documents/38523D0D-2D18-4BF2-87D1-87BE08DBE624-17432-0000A5DFDB3CE4B4.caf
      
      A quick way to go to the folder is to open the Finder and select the "Go" menubar option. Then select the "Go to Folder" option and paste in the address.
      NOTE: remove the "file://" from the begining of the address so it starts with /Users.
      
      
KNOWN ISSUES:
     Only one MIDI note will export at a time. For example, if the midi file has chord C E G, only C will be rendered in the exported file.
