//
//  ViewController.swift
//  TweetSearch
//
//  Created by 内山和輝 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var atmarkSwitch: UISwitch!
    @IBOutlet weak var atmarkTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var sinceTextField: UITextField!
    @IBOutlet weak var untilTextField: UITextField!
    
    let sinceDatePicker = UIDatePicker()
    let untilDatePicker = UIDatePicker()
    
    let url1 = "https://twitter.com/search?q="
    let url2 = "&src=typed_query&f=top"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        atmarkTextField.delegate = self
        lbl.text = "初期"
        
        createSinceDatePicker()
        createUntilDatePicker()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func act(_ sender: Any) {
        if atmarkSwitch.isOn == true {            lbl.text = "ONです"
            atmarkTextField.isEnabled = true
        } else {
            lbl.text = "OFFです"
            atmarkTextField.isEnabled = false
        }
    }
    
    @IBAction func Goaction(_ sender: Any) {
        var urlArray: [String] = [url1]
        
//        let atmarkURL = "%40\(atmarkTextField.text!)"
        
        let fromURL = "from%3A\(fromTextField.text!)"
        
//        let sinceText = sinceTextField.text
//        let sinceArray = sinceText?.split(separator: "/")
//        let sinceURL = "since%3A\(sinceArray![0])-\(sinceArray![1])-\(sinceArray![2])"
//
//        let untilText = untilTextField.text
//        let untilArray = untilText?.split(separator: "/")
//        let untilURL = "until%3A\(untilArray![0])-\(untilArray![1])-\(untilArray![2])"
        
        urlArray.append(fromURL)
//        urlArray.append(atmarkURL)
//        urlArray.append(sinceURL)
//        urlArray.append(untilURL)
        urlArray.append(url2)
        print(urlArray)
        
        let joinURL: String = urlArray.joined(separator: "%20")
        print(joinURL)
        
        
        let url = URL(string: joinURL)
        
        print(url!)
        
        UIApplication.shared.open(url!)
    }
    
    func createSinceDatePicker(){

          // DatePickerModeをDate(日付)に設定
          sinceDatePicker.datePickerMode = .date
        

          // DatePickerを日本語化
          sinceDatePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        
         
         sinceDatePicker.preferredDatePickerStyle = .wheels
        

          // textFieldのinputViewにdatepickerを設定
          sinceTextField.inputView = sinceDatePicker
        

          // UIToolbarを設定
          let toolbar = UIToolbar()
          toolbar.sizeToFit()

          // Doneボタンを設定(押下時doneClickedが起動)
         let doneButton = UIBarButtonItem(title: "OK", style: .done, target: nil, action: #selector(sinceDoneClicked))

          // Doneボタンを追加
         toolbar.setItems([doneButton], animated: true)

          // FieldにToolbarを追加
          sinceTextField.inputAccessoryView = toolbar
        
      }

      @objc func sinceDoneClicked(){
          let sinceDateFormatter = DateFormatter()
        

          // 持ってくるデータのフォーマットを設定
          sinceDateFormatter.dateStyle = .medium
          sinceDateFormatter.timeStyle = .none
         sinceDateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
          sinceDateFormatter.dateStyle = DateFormatter.Style.medium
        
          // textFieldに選択した日付を代入
          sinceTextField.text = sinceDateFormatter.string(from: sinceDatePicker.date)

          // キーボードを閉じる
          self.view.endEditing(true)
      }

    
    
    
    func createUntilDatePicker(){

          // DatePickerModeをDate(日付)に設定
          
        untilDatePicker.datePickerMode = .date

          // DatePickerを日本語化
          
        untilDatePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
         
         
        untilDatePicker.preferredDatePickerStyle = .wheels

          // textFieldのinputViewにdatepickerを設定
         
        untilTextField.inputView = untilDatePicker

          // UIToolbarを設定
          let toolbar = UIToolbar()
          toolbar.sizeToFit()

          // Doneボタンを設定(押下時doneClickedが起動)
         let doneButton = UIBarButtonItem(title: "OK", style: .done, target: nil, action: #selector(untilDoneClicked))

          // Doneボタンを追加
         toolbar.setItems([doneButton], animated: true)

          // FieldにToolbarを追加
        untilTextField.inputAccessoryView = toolbar
      }

      @objc func untilDoneClicked(){
          
        let untilDateFormatter = DateFormatter()

          // 持ってくるデータのフォーマットを設定
          
        untilDateFormatter.dateStyle = .medium
        untilDateFormatter.timeStyle = .none
       untilDateFormatter.locale    = NSLocale(localeIdentifier: "ja_JP") as Locale?
        untilDateFormatter.dateStyle = DateFormatter.Style.medium

          // textFieldに選択した日付を代入
          
        untilTextField.text = untilDateFormatter.string(from: untilDatePicker.date)

          // キーボードを閉じる
          self.view.endEditing(true)
      }

    
    
}

