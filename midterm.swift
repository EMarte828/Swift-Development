import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    
    var timer: Timer?
    var isStarted = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateTimerLabel() {
        counter += 0.1
        timerLabel.text = String(round(counter*10)/10)
    }

    @IBAction func startStopDidTouch(_ sender: UIButton) {
      
        
        if isStarted {
            timer?.invalidate()
            isStarted = false
            startStop.setTitle("Start", for: .normal)
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
            isStarted = true
            startStop.setTitle("Stop", for: .normal)
        }
        
        
    }
    @IBAction func resetDidTouch(_ sender: UIButton) {
        counter = 0.0
        timerLabel.text = "0.0"
        
        if isStarted {
            timer?.invalidate()
            startStop.setTitle("Start", for: .normal)
            isStarted = false
            
        }
        
    }
    
}

