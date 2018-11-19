# NRDatePicker

## Description
This library is a very simple date picker.

It is a library for easily implementing a list of dates that can not be realized with UIDatePicker.  
  
However, I created this library thinking that the date selection UI of one column actually has demand. Also, there is an implication of swift practice.
  
From now on, I'd like to add functions little by little.

## Demo
<img width="237" alt="2018-11-20 1 48 08" src="https://user-images.githubusercontent.com/4780752/48722913-98da5700-ec68-11e8-8df0-1db80a4e69b3.png">

## Example
```
import UIKit
import NRDatePicker

class ViewController: UIViewController, NRDatePickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize
        let picker = NRDatePicker(frame: CGRect(x: 20, y: 50, width: view.frame.width-20*2, height: 50))
        picker.pickerDelegate = self

        // Set Custom Format. Default Format is yyyy-MM-dd
        // picker.format = "yyyy/MM/dd

        // Set Custom Locale(Default Locale.current)
        // picker.locale = Locale(identifier: "ja_JP")
        
        // Set Start And End Date For String Format(yyyy-MM-dd)
        let _ = picker.setData(string: "2018-01-01", "2018-12-31")

        // It is also possible to specify it by Date type
        // let _ = picker.setData(date: startDate, endDate)
        
        // Custom UI
        picker.borderStyle = UITextField.BorderStyle.line
        picker.layer.borderColor = UIColor.lightGray.cgColor
        picker.layer.borderWidth = 0.1
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

```

## Installation

### CocoaPods
```
pod 'NRDatePicker', '~> 0.1'
```

### Carthage
```
github "nrikiji/NRDatePicker" ~> 0.1
```
