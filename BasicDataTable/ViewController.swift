//
//  ViewController.swift
//  BasicDataTable
//
//  Created by Cuneyt on 20.05.2023.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableview: UITableView!
    var country:[String]=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        // Do any additional setup after loading the view.
        country=["Türkiye","Almanya","Fransa","İtalya","Amerika","İngiltere","Holldanda","Belçika","Ukrayna","İşveç","Çin","Japonya"]
    }

    
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableview.dequeueReusableCell(withIdentifier: "countryName",for: indexPath)
        
        cell.textLabel?.text=country[indexPath.row]
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seçilen Ülke \(country[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      let deleteItem = UIContextualAction(style: .destructive, title: "SİL") {  (contextualAction, view, boolValue) in
          //Code I want to do here
          print(" \(self.country[indexPath.row]) yi sil")
      }
        let editItem = UIContextualAction(style: .normal, title: "Düzenle") {  (contextualAction, view, boolValue) in
            //Code I want to do here
            print(" \(self.country[indexPath.row]) yi düzenle")
        }
      let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem,editItem])

      return swipeActions
  }
}

