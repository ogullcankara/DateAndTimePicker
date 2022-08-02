//
//  ViewController.swift
//  DateAndTimePicker
//
//  Created by Ogulcan Kara on 30.07.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldDate: UITextField!
    
    @IBOutlet weak var textFieldTime: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        textFieldTime.inputView = timePicker
        
        //saat eski görünüm için
        /*if #available(iOS 13.4, *) {
            timePicker?.preferredDatePickerStyle = .wheels
        } */
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilama))
        
        view.addGestureRecognizer(dokunmaAlgilama)
        
        //tarih eski görünüm için
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        textFieldDate.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datePicker:)), for: .valueChanged)
        
        timePicker?.addTarget(self, action: #selector(self.saatGoster(timePicker:)), for: .valueChanged)
        
    }
    
    @objc func tarihGoster(datePicker:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFormatter.string(from: datePicker.date)
        
        print(alinanTarih)
        textFieldDate.text = alinanTarih
        
    }
    
    @objc func saatGoster(timePicker:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        
        let alinanSaat = dateFormatter.string(from: timePicker.date)
        textFieldTime.text = alinanSaat
        
    }
    
    @objc func dokunmaAlgilama(){
        view.endEditing(true)
    }

    
    
}

