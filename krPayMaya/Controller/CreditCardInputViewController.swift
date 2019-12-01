//
//  CreditCardInputViewController.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 10/10/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import UIKit

class CreditCardInputViewController: UIViewController {
    
    let monthValue : [String] = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var yearValue : [String] = []
    
    var _selectedMonthValue : String?
    var _selectedYearValue : String?

    var closeButton : UIButton = {
        let image = UIImage(named: "close-button", in: Bundle(for: CreditCardInputViewController.self), compatibleWith: nil)
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(image, for: .normal)
        b.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    lazy var purchaseButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(hexString: "2b3748")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(continueAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    
    
   lazy var creditcardView : UIView = {
         let view = UIView()
        view.backgroundColor = UIColor(hexString: "F7F7F7")
        view.translatesAutoresizingMaskIntoConstraints = false

        
        return view
     }()
    
    lazy var paymayaIcon : UIImageView = {
        let image = UIImage(named: "paymayaicon", in: Bundle(for: CreditCardInputViewController.self), compatibleWith: nil)
        
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    lazy var paymentDetailLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 17)
        l.textColor = .lightGray
        l.text = "PAYMENT DETAILS"
        l.backgroundColor = .clear
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var nameLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .lightGray
        l.text = "Name (as it appears in your card)"
        l.backgroundColor = .clear
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var nameTF : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Exp:Kristopher Amiel Reyes"
        tf.borderStyle = .roundedRect
        tf.delegate = self

        return tf
    }()
    
    
    lazy var cardnumberLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .lightGray
        l.text = "Card number (no spaces or dashes)"
        l.backgroundColor = .clear
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var cardnumberTF : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "4100 3451 4508 8763"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.delegate = self
        return tf
    }()
     
    
    lazy var expiryLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .lightGray
        l.text = "Expiration date"
        l.backgroundColor = .clear
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var expiryTF : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "MM / YY"
        tf.borderStyle = .roundedRect
        tf.delegate = self

        return tf
    }()
    
    lazy var ccvLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .lightGray
        l.text = "CCV (last 3 digits on the back)"
        l.backgroundColor = .clear
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    lazy var ccvTF : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "123"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.delegate = self

        return tf
    }()
    
    lazy var expiryPicker : UIPickerView = {
       let d = UIPickerView()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.dataSource = self
        d.delegate = self
        d.tag = 1
        d.backgroundColor = .clear
        
        return d
    }()
        
    lazy var datePickerView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(hexString: "F7F7F7")
        v.isHidden = true
        return v
    }()
    
    lazy var doneButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor(hexString: "2b3748"), for: .normal)
        button.addTarget(self, action: #selector(doneAction(sender:)), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     init() {
            super.init(nibName: nil, bundle: nil)
            self.view.frame = UIScreen.main.bounds
            self.modalPresentationStyle = .overFullScreen
            self.view.backgroundColor = .clear
        self.setup()
        self.setupConstraint()
        self.viewCornerRadius()
    }
    
    func setup(){
        yearValue = self.getYearValue()
        addBlurEffect()
        self.view.addSubview(creditcardView)
        self.view.addSubview(closeButton)
        self.creditcardView.addSubview(paymayaIcon)
        self.creditcardView.addSubview(paymentDetailLabel)
        //name
        self.creditcardView.addSubview(nameLabel)
        self.creditcardView.addSubview(nameTF)
        //card number
        self.creditcardView.addSubview(cardnumberLabel)
        self.creditcardView.addSubview(cardnumberTF)
        //expiry
        self.creditcardView.addSubview(expiryLabel)
        self.creditcardView.addSubview(expiryTF)
        //ccv
        self.creditcardView.addSubview(ccvLabel)
        self.creditcardView.addSubview(ccvTF)
        
        self.creditcardView.addSubview(purchaseButton)
        
        self.view.addSubview(datePickerView)
        self.datePickerView.addSubview(expiryPicker)
        self.datePickerView.addSubview(doneButton)
    }
    
    func addBlurEffect(){
            let blurEffect = UIBlurEffect(style: .regular)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.view.frame
            self.view.addSubview(blurEffectView)
    }
    
    func setupConstraint(){
        self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        self.closeButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        self.closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.creditcardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.creditcardView.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -20).isActive = true
        self.creditcardView.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 20).isActive = true
        self.creditcardView.heightAnchor.constraint(equalToConstant: 360).isActive = true
        self.creditcardView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.paymayaIcon.rightAnchor.constraint(equalTo: self.creditcardView.rightAnchor,constant: -20).isActive = true
        self.paymayaIcon.topAnchor.constraint(equalTo: self.creditcardView.topAnchor,constant: 10).isActive = true
        self.paymayaIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.paymayaIcon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.paymentDetailLabel.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.paymentDetailLabel.topAnchor.constraint(equalTo: self.creditcardView.topAnchor,constant: 10).isActive = true
        self.paymentDetailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.paymentDetailLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        //name
        self.nameLabel.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.paymentDetailLabel.bottomAnchor,constant: 20).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.nameTF.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.nameTF.rightAnchor.constraint(equalTo: self.creditcardView.rightAnchor,constant: -20).isActive = true
        self.nameTF.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        self.nameTF.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        //card number
        self.cardnumberLabel.topAnchor.constraint(equalTo: self.nameTF.bottomAnchor,constant: 10).isActive = true
        self.cardnumberLabel.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.cardnumberLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.cardnumberLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.cardnumberTF.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.cardnumberTF.rightAnchor.constraint(equalTo: self.creditcardView.rightAnchor,constant: -20).isActive = true
        self.cardnumberTF.topAnchor.constraint(equalTo: self.cardnumberLabel.bottomAnchor).isActive = true
        self.cardnumberTF.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        
        
        //card number
        self.expiryLabel.topAnchor.constraint(equalTo: self.cardnumberTF.bottomAnchor,constant: 10).isActive = true
        self.expiryLabel.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.expiryLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.expiryLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        self.expiryTF.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.expiryTF.topAnchor.constraint(equalTo: self.expiryLabel.bottomAnchor).isActive = true
        self.expiryTF.heightAnchor.constraint(equalToConstant: 31).isActive = true
        self.expiryTF.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        //ccv
        //card number
        self.ccvLabel.topAnchor.constraint(equalTo: self.cardnumberTF.bottomAnchor,constant: 10).isActive = true
        self.ccvLabel.rightAnchor.constraint(equalTo: self.creditcardView.rightAnchor,constant: -20).isActive = true
        self.ccvLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.ccvLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
        
        self.ccvTF.leftAnchor.constraint(equalTo: self.ccvLabel.leftAnchor,constant: 0).isActive = true
        self.ccvTF.topAnchor.constraint(equalTo: self.ccvLabel.bottomAnchor).isActive = true
        self.ccvTF.heightAnchor.constraint(equalToConstant: 31).isActive = true
        self.ccvTF.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        self.purchaseButton.bottomAnchor.constraint(equalTo: self.creditcardView.bottomAnchor,constant: -20).isActive = true
        self.purchaseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.purchaseButton.leftAnchor.constraint(equalTo: self.creditcardView.leftAnchor,constant: 20).isActive = true
        self.purchaseButton.rightAnchor.constraint(equalTo: self.creditcardView.rightAnchor,constant: -20).isActive = true
        
        
        self.datePickerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -10).isActive = true
        self.datePickerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.datePickerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.datePickerView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        self.expiryPicker.bottomAnchor.constraint(equalTo: self.datePickerView.bottomAnchor).isActive = true
        self.expiryPicker.leftAnchor.constraint(equalTo: self.datePickerView.leftAnchor).isActive = true
        self.expiryPicker.rightAnchor.constraint(equalTo: self.datePickerView.rightAnchor).isActive = true
        self.expiryPicker.topAnchor.constraint(equalTo: self.datePickerView.topAnchor,constant: 30).isActive = true

        self.doneButton.topAnchor.constraint(equalTo: self.datePickerView.topAnchor,constant: 10).isActive = true
        self.doneButton.rightAnchor.constraint(equalTo: self.datePickerView.rightAnchor,constant: -5).isActive = true
        self.doneButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

    
    }
    func getYearValue() -> [String] {
        let calendar = Calendar.current
        let componet = calendar.component(.year, from: Date())
        var years : [String] = []
        for year in componet...(componet + 20){
            years.append(String(year))
        }
        return years
    }
    
    func viewCornerRadius(){
        self.creditcardView.layer.cornerRadius = 10
        self.creditcardView.layer.masksToBounds = true
        self.purchaseButton.layer.cornerRadius = 5
        self.purchaseButton.layer.masksToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func continueAction(sender : UIButton){
        print("Continue")
        self.createPayment()
    }
    @objc func doneAction(sender : UIButton){
        if checkExpiryDate() {
            hideDatePicker()
            self.expiryTF.text = String(format: "%02d / %@", Int(_selectedMonthValue!)!,_selectedYearValue!)
        }else{
            print("error")

        }

        
        
    }
    
    func checkExpiryDate() -> Bool{
        guard let year = _selectedYearValue,
            let month = _selectedMonthValue else{
                return false
        }
        let calendar = Calendar.current
        let yearCalendar = calendar.component(.year, from: Date())
        let monthCalendar = calendar.component(.month, from: Date())
        if Int(year)! == yearCalendar {
            if Int(year)! >= yearCalendar && Int(month)! >= monthCalendar{
                return true
            }else{
                return false
            }
        }
        
        return true
        
        
    }
    
    func createPayment(){
        guard let name = nameTF.text,
            let number = cardnumberTF.text,
            let ccv = ccvTF.text,
            let month = _selectedMonthValue,
            let year = _selectedYearValue else{
                fatalError("Invalid credit Card information")
        }
        
        let card = PayMayaCard.init(name: name, number: number, expMonth: month, expYear: year, cvc: ccv)
        APIManager.shared.createPaymentTokenFromCard(card: card) { (token, errorString) in
            if let token = token {
                PayMayaSDK.shared.token = token
                print(token)
                print(token.paymentTokenId)
                DispatchQueue.main.async {
                  self.dismiss(animated: true, completion: nil)
                }
            }else{
                print(errorString)
            }
        }
    }
    
    
    func showDatePicker(){
        if _selectedMonthValue == nil && _selectedYearValue == nil {
            _selectedMonthValue = monthValue.first
            _selectedYearValue = yearValue.first
        }
        datePickerView.isHidden = false
    }
    func hideDatePicker(){
        datePickerView.isHidden = true
    }
    
    func formatCreditCardNumber() -> Bool {
       // self.cardnumberTF.text = self.cardnumberTF.text?.group(by: 5, separator: " ")
        return true
    }
    func formatCCVNumber() -> Bool {
         
         
         return true
     }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CreditCardInputViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1{
            return yearValue.count

        }else{
            return monthValue.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 1 {
            return yearValue[row]
        }else{
            return monthValue[row]

        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 1 {
            _selectedYearValue = yearValue[row]
        }else{
            _selectedMonthValue = monthValue[row]
        }
    }
}


extension CreditCardInputViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField ==  self.expiryTF {
            self.showDatePicker()
            self.creditcardView.endEditing(true)
            return false
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField == self.ccvTF{
            return formatCCVNumber()
        }else if textField == self.cardnumberTF{
            return formatCreditCardNumber()

        }
        return true
    }
    
}


extension UIColor {
 convenience init(hexString: String, alpha: CGFloat = 1.0) {
    let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let scanner = Scanner(string: hexString)
    if (hexString.hasPrefix("#")) {
      scanner.scanLocation = 1
    }
    var color: UInt32 = 0
    scanner.scanHexInt32(&color)
    let mask = 0x000000FF
    let r = Int(color >> 16) & mask
    let g = Int(color >> 8) & mask
    let b = Int(color) & mask
    let red = CGFloat(r) / 255.0
    let green = CGFloat(g) / 255.0
    let blue = CGFloat(b) / 255.0
    self.init(red:red, green:green, blue:blue, alpha:alpha)
 }
}
extension String
{
   func group(by groupSize:Int=3, separator:String="-") -> String {
    let characters = self.trimmingCharacters(in: .whitespaces)
      if characters.count <= groupSize   { return self }

      let splitSize  = min(max(2,characters.count-2) , groupSize)
      let splitIndex = index(startIndex, offsetBy:splitSize)

      return substring(to:splitIndex)
           + separator
           + substring(from:splitIndex).group(by:groupSize, separator:separator)
   }
}
