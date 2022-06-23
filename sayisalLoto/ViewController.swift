//
//  ViewController.swift
//  sayisalLoto
//
//  Created by Buse Topuz on 21.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textLabel: UILabel!
    var sayilar: [Int] = []
    var bos: [String] = []
    var uretilen = 0
    var kupon: [kolon]=[]

    @IBOutlet weak var textField: UITextField!
    var kolonSayisi = 0
    
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
        var kolon = kolon()
        sayilar=[]
        uretilen = 1 + Int(arc4random_uniform(49))
        for _ in 1...6{
            
        while sayilar.contains(uretilen){
            uretilen = 1 + Int(arc4random_uniform(49))
        }
        
        sayilar.append(uretilen)
        
            
            
            
        }
        
        kolon.sayilar=sayilar
        
        kupon.append(kolon)
        
        print(sayilar)
        
        
    }
    
    @IBAction func createButtonClicked(){

       for _ in 1...Int((textField.text)!)!{
           kolonYarat()
         }
        
        self.tableView.reloadData()
        //sayilar.removeAll()
        //tableView.beginUpdates()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
   /*
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kupon.count
        }
    
    
  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "kolonCell", for: indexPath)
            print("cellForRowAt metodu --- section = \(indexPath.section), row = \(indexPath.row)")
        cell.textLabel?.text = kupon[indexPath.row].asText()
            return cell
        }
    
    
}


