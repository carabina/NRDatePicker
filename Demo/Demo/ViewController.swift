import UIKit

class ViewController: UIViewController, NRDatePickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize
        let picker = NRDatePicker(frame: CGRect(x: 20, y: 50, width: view.frame.width-20*2, height: 50))
        picker.pickerDelegate = self
        
        // Set Locale
        picker.locale = Locale(identifier: "ja_JP")
        
        // Set Start And End Date For String Format(yyyy-MM-dd)
        let _ = picker.setData(string: "2018-01-01", "2018-12-31")
        
        // Set Default Value
        picker.setDefault(string: "2018-01-31")
        
        // It is also possible to specify it by Date type
        // let _ = picker.setData(date: startDate, endDate)
        // picker.setDefault(date: Date)

        // Custome UI
        //picker.borderStyle = UITextField.BorderStyle.line
        //picker.layer.borderColor = UIColor.lightGray.cgColor
        //picker.layer.borderWidth = 0.1
        picker.textAlignment = NSTextAlignment.center
        view.addSubview(picker)
    }
    
    func done(date: Date?) {
        // result with date
        // Optional(2018-01-11 15:00:00 +0000)
    }
    
    func done(string: String?) {
        // result with string
        // Optional("2018-01-12")
    }
    
}

