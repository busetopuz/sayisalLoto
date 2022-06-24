//
//  ViewController.swift
//  sayisalLoto
//
//  Created by Buse Topuz on 21.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bankoTextField: UITextField!
    @IBOutlet weak var bankoTextField2: UITextField!
    
    var kolonSayisi = 0
    var sayilar: [Int] = []
    var bos: [String] = []
    var uretilen = 0
    var kupon: [kolon]=[]
    var numbers: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        self.tableView.reloadData()
    }
    

    @IBAction func kolonSayisi(_ sender: Any) {
            kolonSayisi = Int((textField.text)!)!
    }
    
    func kolonYarat(){
        let kolon = kolon()
        sayilar=[]
        let bankoSayi1 = Int(bankoTextField.text!)
        let bankoSayi2 = Int(bankoTextField2.text!)
        
        uretilen = 1 + Int(arc4random_uniform(49))
        

        if bankoSayi1 != nil && bankoSayi2 != nil{
        for _ in 1...4{
            
            while sayilar.contains(uretilen) || sayilar.contains(bankoSayi1!) || sayilar.contains(bankoSayi2!){
            uretilen = 1 + Int(arc4random_uniform(49))
        }
        
        sayilar.append(uretilen)

        }
            sayilar.append(bankoSayi2!)
            sayilar.append(bankoSayi1!)
            sayilar.shuffle()
        
        kolon.sayilar=sayilar
        
        kupon.append(kolon)
        print(sayilar)
    
    }
        else if bankoSayi2 == nil && bankoSayi1 != nil{
            for _ in 1...5{
                
                while sayilar.contains(uretilen) || sayilar.contains(bankoSayi1!) {
                uretilen = 1 + Int(arc4random_uniform(49))
            }
            sayilar.append(uretilen)

            }
      
                sayilar.append(bankoSayi1!)
                sayilar.shuffle()
            
            kolon.sayilar=sayilar
            kupon.append(kolon)
                
            print(sayilar)

        }  else if bankoSayi2 != nil && bankoSayi1 == nil{
            for _ in 1...5{
                
                while sayilar.contains(uretilen) || sayilar.contains(bankoSayi2!) {
                uretilen = 1 + Int(arc4random_uniform(49))
            }
            
            sayilar.append(uretilen)
            }
                
            sayilar.append(bankoSayi2!)
            sayilar.shuffle()
            
            kolon.sayilar=sayilar
            kupon.append(kolon)
                
            print(sayilar)

        } else if bankoSayi2 == nil && bankoSayi1 == nil{
            for _ in 1...6{
                
            while sayilar.contains(uretilen) {
                uretilen = 1 + Int(arc4random_uniform(49))
            }
            
            sayilar.append(uretilen)
                sayilar.shuffle()
            }
                
            kolon.sayilar=sayilar
            kupon.append(kolon)
                
            print(sayilar)

        }
    }
    
    @IBAction func createButtonClicked(){
        let bankoSayi1 = Int(bankoTextField.text!)
        let bankoSayi2 = Int(bankoTextField2.text!)
        
        
        if let text = textField.text, text.isEmpty {
            let message = "Lütfen Kolon Sayısı Giriniz"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
           
        }
        else if (bankoSayi1 == bankoSayi2 ) && bankoSayi2 != nil && bankoSayi1 != nil{
            let message = "Banko Sayılar Aynı Olamaz"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)

        }else {
            for _ in 1...Int((textField.text)!)!{
                kolonYarat()
              }
             self.tableView.reloadData()
        }
        
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kupon.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "kolonCell", for: indexPath)
            cell.textLabel?.text = kupon[indexPath.row].asText()
            return cell
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            kupon.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}


