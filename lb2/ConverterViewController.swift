import UIKit

class ConverterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var fromType: String?
    var toType: String?

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Unit.allCases().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Unit.allCases()[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            fromType = Unit.allCases()[row]
        } else {
            toType = Unit.allCases()[row]
        }
        InChange(In)
    }

    @IBOutlet weak var UnitType: UIPickerView!
    @IBOutlet weak var In: UITextField!
    @IBOutlet weak var Out: UITextField!

    @IBAction func InChange(_ sender: UITextField) {
        var outputNum = 0.00

        inputValidate(sender)

        if fromType != nil && toType != nil {
            let fromUnit = Unit.fromString(fromType!)
            let toUnit = Unit.fromString(toType!)
            let inputNum = Double(In.text ?? "0")
            if inputNum != nil {
                let baseNum = fromUnit!.convertTo(unit: .mm, value: inputNum!)
                outputNum = Unit.mm.convertTo(unit: toUnit!, value: baseNum)
            }
        }

        Out.text = String(outputNum)
    }

    @IBAction func OutChange(_ sender: UITextField) {
        var outputNum = 0.00

        inputValidate(sender)

        if fromType != nil && toType != nil {
            let fromUnit = Unit.fromString(toType!)
            let toUnit = Unit.fromString(fromType!)
            let inputNum = Double(Out.text ?? "0")
            if inputNum != nil {
                let baseNum = fromUnit!.convertTo(unit: .mm, value: inputNum!)
                outputNum = Unit.mm.convertTo(unit: toUnit!, value: baseNum)
            }
        }

        In.text = String(outputNum)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func inputValidate(_ sender: UITextField) {
        if sender.text != sender.text?.filter("0123456789.,".contains) {
            sender.text?.removeLast()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)

        UnitType.delegate = self
        UnitType.dataSource = self

        fromType = "mm"
        toType = "mm"
    }
}
