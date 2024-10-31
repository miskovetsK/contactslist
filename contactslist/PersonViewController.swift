//
//  PersonViewController.swift
//  contactslist
//
//  Created by Yekaterina Proskuryakova on 01.11.2024.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var surnamelabel: UILabel!
    
    @IBOutlet weak var phonelabel: UILabel!
    
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var surnametextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    
    var person = Person(name: "", surname: "", phone: "")
    
    var index = 0
    
    var arrayPerson: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nametextfield.text = person.name
        surnametextfield.text = person.surname
        phonetextfield.text = person.phone

        // Do any additional setup after loading the view.
    }
    
    @IBAction func editContact(_ sender: Any) {
        
        let newPerson = Person(name: nametextfield.text!, surname: surnametextfield.text!, phone: phonetextfield.text!)
        
        arrayPerson[index] = newPerson
        
        do {
            
            let encodedata = try JSONEncoder().encode(arrayPerson)
            
            UserDefaults.standard.set(encodedata, forKey: "Person")
            
        } catch {
            
            print("unable to encode \(error)")
        }
        
        nametextfield.text = ""
        surnametextfield.text = ""
        phonetextfield.text = ""
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
