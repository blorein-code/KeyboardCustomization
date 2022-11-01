//
//  KeyboardViewController.swift
//  Hodor
//
//  Created by Berke Topcu on 2.11.2022.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hodor
        //Bir buton oluşturduk görüntüsünü sistem görüntüsü olarak belirttik
        let hodorButton = UIButton(type: UIButton.ButtonType.system)
        //Butona bir genişlik yükseklik ve konum değeri belirledik
        hodorButton.frame = CGRect(x: 75, y: 50, width: 100, height: 120)
        //ardından butona bir arkaplan resmi ekledik
        hodorButton.setBackgroundImage(UIImage(named: "hodor.jpg"), for: UIControl.State.normal)
        //daha sonrasında butona tıkladığında çalışacak fonksiyonu belirttik. ve butona tıklandığında nasıl bir görüntü olacağını seçtik.
        hodorButton.addTarget(self, action: #selector(hodorTapped), for: UIControl.Event.touchUpInside)
        //oluşturduğumuz butonu view'a ekledik
        view.addSubview(hodorButton)
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

    @objc func hodorTapped() {
        //yazı yazabilmek için bir text document proxy oluşturduk ve bunun UITextDocumentProxy olarak casting işlemini gerçekleştirdik
        var textProxy = textDocumentProxy as UITextDocumentProxy
        //Daha sonra oluşturduğumuz textproxy'e, tıklandığında ne yazılmasını istediğimizi söyledik.
        textProxy.insertText("HODOR")
    }
}
