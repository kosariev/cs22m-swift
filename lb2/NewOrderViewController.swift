import UIKit

class NewOrderViewController: UIViewController {
    @IBOutlet weak var Sugar1: UIStackView!
    @IBOutlet weak var Sugar2: UIStackView!
    @IBOutlet weak var Sugar3: UIStackView!
    @IBOutlet weak var SpoonsLayer: UIStackView!

    @IBOutlet weak var SugarSwitch1: UISwitch!
    @IBOutlet weak var SugarSwitch2: UISwitch!
    @IBOutlet weak var SugarSwitch3: UISwitch!
    @IBOutlet weak var CoffeeType: UISegmentedControl!
    
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var DeliveryTime: UIDatePicker!
    @IBOutlet weak var SpoonsNo: UIStepper!
    @IBOutlet weak var SpoonsNoLabel: UILabel!

    @IBOutlet weak var NonWorkFeeLabel: UILabel!
    @IBAction func SpoonsNo(_ sender: UIStepper) {
        SpoonsNoLabel.text = Int(sender.value).description
        calc()
    }

    @IBAction func CoffeeTypeSwitch(_ sender: UISegmentedControl) {
        calc()
    }

    @IBAction func deliveryTimeChanged(_ sender: Any) {
        calc()
    }

    @IBAction func Sugar1Switch(_ sender: Any) {
        if SugarSwitch1.isOn {
            SpoonsLayer.isHidden = false
        } else {
            SpoonsLayer.isHidden = true
        }
        calc()
    }
    
    func calc() {
        var price: Double
        var isSugar: Int

        price = 8.00
        NonWorkFeeLabel.isHidden = true
        
        if CoffeeType.selectedSegmentIndex > 0 {
            price = 12.00
        }

        if SugarSwitch1.isOn {
            isSugar = 1
        } else {
            isSugar = 0
        }
        
        if (isSugar == 1) {
            price = price + (0.5 * Double(SpoonsNo.value))
        }
        
        let date = DeliveryTime.date
        let components = Calendar.current.dateComponents([.hour], from: date)
        let hour = components.hour!
        
        if hour < 5 {
            price = price + 25
            NonWorkFeeLabel.isHidden = false
        }
        else if hour >= 7 && hour < 11 {
            price = price - 2
        }
        else if hour > 22 {
            price = price + 25
            NonWorkFeeLabel.isHidden = false
        }
        
        Price.text = String(format: "$%.2f", price)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeliveryTime.locale = Locale(identifier: "en_GB")
    }
}
