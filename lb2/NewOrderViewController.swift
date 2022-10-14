import UIKit

class NewOrderViewController: UIViewController {
    @IBOutlet weak var Sugar1: UIStackView!
    @IBOutlet weak var Sugar2: UIStackView!
    @IBOutlet weak var Sugar3: UIStackView!
    
    @IBOutlet weak var SugarSwitch1: UISwitch!
    @IBOutlet weak var SugarSwitch2: UISwitch!
    @IBOutlet weak var SugarSwitch3: UISwitch!

    @IBAction func Sugar1Switch(_ sender: Any) {
        SugarSwitch2.isOn = false
        SugarSwitch3.isOn = false
        if SugarSwitch1.isOn {
            Sugar2.isHidden = false
        } else {
            Sugar2.isHidden = true
            Sugar3.isHidden = true
        }
    }
    @IBAction func Sugar2Switch(_ sender: Any) {
        SugarSwitch3.isOn = false
        if SugarSwitch2.isOn {
            Sugar3.isHidden = false
        } else {
            Sugar3.isHidden = true
        }
    }
    @IBAction func Sugar3Switch(_ sender: Any) {
        print("STATE3", SugarSwitch3.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
