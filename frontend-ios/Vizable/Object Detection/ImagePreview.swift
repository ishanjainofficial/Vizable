import Foundation
import UIKit
import Vision
import CoreML
import FirebaseDatabase

class ImagePreview: UIViewController {
    
    let resnet = Resnet50()
    var imagePicker = UIImagePickerController()
    var detect = Speech()
    var ref:DatabaseReference!
    var observations:[String] = []
    
    public var capturedImage: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var informationView: UIView!
    
    var detectedObject: String = ""
    var databaseHandle:DatabaseHandle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = capturedImage
        if let image = capturedImage{
            processPic(image: image)
        }
         
        informationView.layer.cornerRadius = 10.0
        
        ref = Database.database().reference()
    }
    
    func processPic(image: UIImage){
        if let model = try? VNCoreMLModel(for: resnet.model){
            let request = VNCoreMLRequest(model: model) { (request, error) in
                if let results = request.results as? [VNClassificationObservation]{
                    self.detectedObject = results[0].identifier
                    self.informationLabel.text = "This object is a \(self.detectedObject)"
                    self.detect.stringToSpeech(speech: "This object is a \(self.detectedObject)")
                    
                }
            }
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
            
        }
        
    }
    
    @IBAction func saveString(_ sender: Any) {
        let deviceName = UIDevice.current.name
        
        //Getting current date
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        
        let dateString = dateFormatter.string(from: date)
        
        self.ref.child("iOS").child(deviceName).child("Objects").child(dateString).setValue(detectedObject)
        
    }
    
}

extension UIView {
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
