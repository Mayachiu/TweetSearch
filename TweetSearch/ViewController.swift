//
//  ViewController.swift
//  TweetSearch
//
//  Created by 内山和輝 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var swich: UISwitch!
    @IBOutlet weak var atmark: UITextField!
    @IBOutlet weak var sinceTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    let url1 = "https://twitter.com/search?q="
    let url2 = "&src=typed_query&f=top"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "初期"
        
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    @IBAction func atmarkACT(_ sender: Any) {
    }
    
    @IBAction func btn(_ sender: Any) {
        print(sinceTextField.text!)
    }
    

    @IBAction func act(_ sender: Any) {
        if swich.isOn == true {
            lbl.text = "ONです"
            atmark.isEnabled = true
        } else {
            lbl.text = "OFFです"
            atmark.isEnabled = false
        }
    }
    @IBAction func Goaction(_ sender: Any) {
        let at = "%40\(atmark.text!)"
       
     
        
        
//        print(at)
//        print(url!)
        let sinceText = sinceTextField.text
        let sinceArray = sinceText?.split(separator: "/")
        print(sinceArray)
        let sinceURL = "since%3A\(sinceArray![0])-\(sinceArray![1])-\(sinceArray![2])"
        print(sinceURL)
        
        let url = URL(string: "\(url1)\(at)%20\(sinceURL)\(url2)")
        
        UIApplication.shared.open(url!)
    }
    
    func createDatePicker(){

          // DatePickerModeをDate(日付)に設定
          datePicker.datePickerMode = .date

          // DatePickerを日本語化
          datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
         
         datePicker.preferredDatePickerStyle = .wheels

          // textFieldのinputViewにdatepickerを設定
          sinceTextField.inputView = datePicker

          // UIToolbarを設定
          let toolbar = UIToolbar()
          toolbar.sizeToFit()

          // Doneボタンを設定(押下時doneClickedが起動)
         let doneButton = UIBarButtonItem(title: "OK", style: .done, target: nil, action: #selector(doneClicked))

          // Doneボタンを追加
         toolbar.setItems([doneButton], animated: true)

          // FieldにToolbarを追加
          sinceTextField.inputAccessoryView = toolbar
      }

      @objc func doneClicked(){
          let dateFormatter = DateFormatter()

          // 持ってくるデータのフォーマットを設定
          dateFormatter.dateStyle = .medium
          dateFormatter.timeStyle = .none
         dateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
          dateFormatter.dateStyle = DateFormatter.Style.medium

          // textFieldに選択した日付を代入
          sinceTextField.text = dateFormatter.string(from: datePicker.date)

          // キーボードを閉じる
          self.view.endEditing(true)
      }

    
    
}

