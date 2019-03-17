import UIKit
import AVFoundation

class Speech: UIViewController {
        
    let synth = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func stringToSpeech(speech:String) {
        utterance = AVSpeechUtterance(string: speech)
        utterance.rate = 0.5
        synth.speak(utterance)
    }
    
    
    
}
