import UIKit

public class NRDatePicker: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    weak var pickerDelegate: NRDatePickerDelegate?
    
    var items = [String]()
    var picker = UIPickerView()
    var format = "yyyy-MM-dd"
    var locale = Locale.current
    var inputFormatter = DateFormatter()
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup() {
        
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        picker.delegate = self
        picker.dataSource = self
        
        let toolbar = UIToolbar(frame: CGRect(x:0, y:0, width:0, height:35))
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(sender:)))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done(sender:)))
        toolbar.setItems([cancel, flexible, done], animated: true)
        
        inputView = picker
        inputAccessoryView = toolbar
    }
    
    public func setDefault(string date: String) {
        if let i = items.firstIndex(of: date) {
            // picker.selectedRow(inComponent: i)
            picker.selectRow(i, inComponent: 0, animated: false)
        }
    }
    
    public func setDefault(date: Date) {
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = locale
        outputFormatter.dateFormat = format
        
        let target = outputFormatter.string(from: date)
        setDefault(string: target)
    }
    
    public func setData(string start: String, _ end: String) -> Bool {
        
        items = [String]()
        
        guard let startDate = inputFormatter.date(from: start), let endDate = inputFormatter.date(from: end) else {
            return false
        }
        
        return setData(date: startDate, endDate)
    }
    
    public func setData(date start: Date, _ end: Date) -> Bool {
        
        items = [String]()
        var target: Date!
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = locale
        outputFormatter.dateFormat = format
        
        target = start
        while target <= end {
            items.append(outputFormatter.string(from: target))
            target = Date(timeInterval: 86400, since: target)
        }
        return true
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = items[row]
        resultVal()
    }
    
    @objc func done(sender: UIBarButtonItem) {
        resultVal()
        endEditing(true)
    }
    
    func resultVal() {
        if let text = text {
            pickerDelegate?.done?(string: text)
            pickerDelegate?.done?(date: inputFormatter.date(from: text))
        }
    }
    
    @objc func cancel(sender: UIBarButtonItem) {
        endEditing(true)
    }
}

@objc protocol NRDatePickerDelegate: class {
    @objc optional func done(date: Date?) -> Void
    @objc optional func done(string: String?) -> Void
}


