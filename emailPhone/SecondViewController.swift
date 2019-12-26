//
//  SecondViewController.swift
//  emailPhone
//
//  Created by Valeriia Zakharova on 23.12.2019.
//  Copyright © 2019 Valeriia Zakharova. All rights reserved.
//

import UIKit
import MessageUI

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstUserView: UIView!
    @IBOutlet weak var secondUserView: UIView!
    @IBOutlet weak var thirdUserView: UIView!
    
    @IBOutlet weak var firstUserNameLabel: UILabel!
    @IBOutlet weak var secondUserNameLabel: UILabel!
    @IBOutlet weak var thirdUserNameLabel: UILabel!
    
    @IBOutlet weak var firstUserInfoLabel: UILabel!
    @IBOutlet weak var secondUserInfoLabel: UILabel!
    @IBOutlet weak var thirdUserInfoLabel: UILabel!
    
    @IBOutlet weak var firstUserPhoto: UIImageView!
    @IBOutlet weak var secondUserPhoto: UIImageView!
    @IBOutlet weak var thirdUserPhoto: UIImageView!
    
    var user: Storage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = Storage()
        
        if let name = user?.makeUser1().name {
            firstUserNameLabel.text = name
        }
        
        if let info = user?.makeUser1().information {
            firstUserInfoLabel.text = info
        }
        if let photo = user?.makeUser1().profileImage {
            firstUserPhoto.image = photo
        }
        if let name = user?.makeUser2().name {
            secondUserNameLabel.text = name
        }
        
        if let info = user?.makeUser2().information {
            secondUserInfoLabel.text = info
        }
        if let photo = user?.makeUser2().profileImage {
            secondUserPhoto.image = photo
        }
        if let name = user?.makeUser3().name {
            thirdUserNameLabel.text = name
        }
        
        if let info = user?.makeUser3().information {
            thirdUserInfoLabel.text = info
        }
        if let photo = user?.makeUser3().profileImage {
            thirdUserPhoto.image = photo
        }
    }
    
    @IBAction func makeCallUser1(_ sender: Any) {
        callPhone()
    }
    
    @IBAction func sendSMSUser1(_ sender: Any) {
        sendSMSMessage()
    }
    
    @IBAction func sendEmailUser1(_ sender: Any) {
        sendEmail()
    }
    
    @IBAction func makeCallUser2(_ sender: Any) {
        callPhone()
    }
    
    @IBAction func sendSMSUser2(_ sender: Any) {
        sendSMSMessage()
    }
    
    @IBAction func sendEmailUser2(_ sender: Any) {
        sendEmail()
    }
    
    @IBAction func makeCallUser3(_ sender: Any) {
        callPhone()
    }
    
    @IBAction func sendSMSUser3(_ sender: Any) {
        sendSMSMessage()
    }
    
    @IBAction func sendEmailUser3(_ sender: Any) {
        sendEmail()
    }
}

extension SecondViewController {
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let email = MFMailComposeViewController()
            email.mailComposeDelegate = self
            email.setToRecipients(["zakh.valeriia@gmail.com"])
            email.setSubject("Just for Fun")
            email.setMessageBody("Hello there!", isHTML: true)
            present(email, animated: true)
        } else {
            
        }
    }
    
    func sendSMSMessage() {
        if MFMessageComposeViewController.canSendText() {
            let sms = MFMessageComposeViewController()
            sms.messageComposeDelegate = self
            sms.recipients = ["+380996849017"]
            sms.body = "Hello there. Where've you been?"
            present(sms, animated: true, completion: nil)
        }
    }
    func callPhone() {
        
        guard let number = URL(string: "tel://" + "+380996849017") else {
            return
        }
        
        UIApplication.shared.open(number)
    }
    
}
extension SecondViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .sent:
            print("Email sent")
        case .saved:
            print("Draft saved")
        case .cancelled:
            print("Email cancelled")
        case  .failed:
            print("Email failed")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension SecondViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            debugPrint("SMS CANCELD")
        case .failed:
            debugPrint("SMS FAILED")
        case .sent:
            debugPrint("SMS SENT")
        @unknown default:
            fatalError()
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
}


extension SecondViewController {
    
    func makeUI() {
    
        
    }
}
