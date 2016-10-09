//
//  ViewController.swift
//  MIKMIDI-iOS-Example
//  
//  www.madebysasha.com
//  Created by Sasha Ivanov on 2016-10-09.
//  Copyright © 2016 madebysasha. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a
//	copy of this software and associated documentation files (the
//	"Software"), to deal in the Software without restriction, including
//	without limitation the rights to use, copy, modify, merge, publish,
//	distribute, sublicense, and/or sell copies of the Software, and to
//	permit persons to whom the Software is furnished to do so, subject to
//	the following conditions:
//
//	The above copyright notice and this permission notice shall be included
//	in all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputFileTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertButtonPressed(_ sender: AnyObject) {
        convertMiditoCaf()
    }
    
    
    func convertMiditoCaf(){
        
        // Get the URL of the Midi file we want to convert
        let midiURL = Bundle.main.url(forResource: "original", withExtension: ".mid")
        
        // Initialize the Audio Exporter, pass in the URL for the MIDI file.
        let audioExporter = MIKMIDIToAudioExporter(midiFileAt: midiURL as URL!)
        
        // Add a soundfont to the Audio Exporter.
        let synthURL = Bundle.main.url(forResource: "Stereo Piano", withExtension: ".sf2")
        audioExporter?.addSoundfont(synthURL)
        
        // Actually convert the midi file to a CAF file
        audioExporter?.exportWithSoundfontToAudioFile(completionHandler: { (audioOutputUrl, error) in
            
            if (audioOutputUrl == nil){
                if((error) != nil){
                    NSLog(error as! String)
                    print("Audio Convert Failed")
                }
            }
            else{
                NSLog((audioOutputUrl?.absoluteString)!)
                self.outputFileTextView.text = audioOutputUrl?.absoluteString
            }
            
        })
    }

}

