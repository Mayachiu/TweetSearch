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
    @IBOutlet weak var fromSwitch: UISwitch!
    @IBOutlet weak var sinceSwitch: UISwitch!
    @IBOutlet weak var untilSwitch: UISwitch!
    @IBOutlet weak var hashtagSwitch: UISwitch!
    @IBOutlet weak var exclusionSwitch: UISwitch!
    @IBOutlet weak var word1Switch: UISwitch!
    
    @IBOutlet weak var atmarkTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var sinceTextField: UITextField!
    @IBOutlet weak var untilTextField: UITextField!
    @IBOutlet weak var hashtagTextField: UITextField!
    @IBOutlet weak var exclusionTextField: UITextField!
    @IBOutlet weak var word1TextField: UITextField!
    
    let sinceDatePicker = UIDatePicker()
    let untilDatePicker = UIDatePicker()
    
    let url1 = "https://twitter.com/search?q="
    let url2 = "&src=typed_query&f=top"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        atmarkTextField.delegate = self
        fromTextField.delegate = self
//        sinceTextField.delegate = self
//        untilTextField.delegate = self
        hashtagTextField.delegate = self
        exclusionTextField.delegate = self
        word1TextField.delegate = self
        
        createSinceDatePicker()
        createUntilDatePicker()
        // Do any additional setup after loading the view.
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
          if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
              if self.view.frame.origin.y == 0 {
                  self.view.frame.origin.y -= keyboardSize.height
              } else {
                  let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
                  self.view.frame.origin.y -= suggestionHeight
              }
          }
        
    }
    
    @objc func keyboardWillHide() {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           // キーボードを閉じる
           textField.resignFirstResponder()
           
           return true
       }
    
    @IBAction func atmarkSwitchAction(_ sender: Any) {
        if atmarkSwitch.isOn == true {
            atmarkTextField.isEnabled = true
        } else {
            atmarkTextField.isEnabled = false
            atmarkTextField.text = ""
        }
    }
    
    @IBAction func fromSwitchAction(_ sender: Any) {
        if fromSwitch.isOn == true {
            fromTextField.isEnabled = true
        } else {
            fromTextField.isEnabled = false
            fromTextField.text = ""
        }
    }
    
    @IBAction func sinceSwitchAction(_ sender: Any) {
        if sinceSwitch.isOn == true {
            sinceTextField.isEnabled = true
        } else {
            sinceTextField.isEnabled = false
            sinceTextField.text = ""
        }
    }
    
    @IBAction func untilSwitchAction(_ sender: Any) {
        if untilSwitch.isOn == true {
            untilTextField.isEnabled = true
        } else {
            untilTextField.isEnabled = false
            untilTextField.text = ""
        }
    }
    
    @IBAction func hashtagSwitchAction(_ sender: Any) {
        if hashtagSwitch.isOn == true {
            hashtagTextField.isEnabled = true
        } else {
            hashtagTextField.isEnabled = false
            hashtagTextField.text = ""
        }
    }
    
    @IBAction func exclusionSwitchAction(_ sender: Any) {
        if exclusionSwitch.isOn == true {
            exclusionTextField.isEnabled = true
        } else {
            exclusionTextField.isEnabled = false
            exclusionTextField.text = ""
        }
    }
    
    @IBAction func word1SwitchAction(_ sender: Any) {
        if word1Switch.isOn == true {
            word1TextField.isEnabled = true
        } else {
            word1TextField.isEnabled = false
            word1TextField.text = ""
        }
    }
    
    
    
    
    @IBAction func searchActionButton(_ sender: Any) {
        var urlArray: [String] = [url1]
        
        if atmarkSwitch.isOn == true {
            //onでも0文字にできるからこの一行必要
            if atmarkTextField.text?.count != 0 {
                let atmarkURL = "%40\(atmarkTextField.text!)"
                urlArray.append(atmarkURL)
                
            }
        }
        
        if fromSwitch.isOn == true {
            //onでも0文字にできるからこの一行必要
            if fromTextField.text?.count != 0 {
                let fromURL = "from%3A\(fromTextField.text!)"
                urlArray.append(fromURL)
            }
        }
        
        if sinceSwitch.isOn == true {
            if sinceTextField.text?.count != 0 {
                let sinceText = sinceTextField.text
                let sinceArray = sinceText?.split(separator: "/")
                let sinceURL = "since%3A\(sinceArray![0])-\(sinceArray![1])-\(sinceArray![2])"
                urlArray.append(sinceURL)
            }
        }
        
        if untilSwitch.isOn == true {
            if untilTextField.text?.count != 0 {
                let untilText = untilTextField.text
                let untilArray = untilText?.split(separator: "/")
                let untilURL = "until%3A\(untilArray![0])-\(untilArray![1])-\(untilArray![2])"
                urlArray.append(untilURL)
            }
        }
        
        if hashtagSwitch.isOn == true {
            if hashtagTextField.text?.count != 0 {
                let hashtagURL = "%23\(hashtagTextField.text!)"
                urlArray.append(hashtagURL)
            }
        }
        
        if exclusionSwitch.isOn == true {
            if exclusionTextField.text?.count != 0 {
                let exclusionURL = "-\(exclusionTextField.text!)"
                urlArray.append(exclusionURL)
            }
        }
        
        if word1Switch.isOn == true {
            if word1TextField.text?.count != 0 {
                let word1URL = "\(word1TextField.text!)"
                urlArray.append(word1URL)
            }
        }

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

