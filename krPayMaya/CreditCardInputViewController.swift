//
//  CreditCardInputViewController.swift
//  krPayMaya
//
//  Created by Amiel Reyes on 10/10/19.
//  Copyright © 2019 AmielReyes. All rights reserved.
//

import UIKit

class CreditCardInputViewController: UIViewController {
    
    var closeButton : UIButton = {
        let image = UIImage(named: "close-button", in: Bundle(for: CreditCardInputViewController.self), compatibleWith: nil)
        let b = UIButton()
        b.backgroundColor = .clear
        b.setImage(image, for: .normal)
        b.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
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
        tf.placeholder = "Exp:Kristopher Am Reyes"
        tf.borderStyle = .roundedRect
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
        return tf
    }()
    
    lazy var purchaseButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor(hexString: "2b3748")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.textColor = .white
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
