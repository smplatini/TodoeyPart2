import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggs",
                     "Destroy Demogoron"]
    
    
    //Data persistance

    let defaults = UserDefaults.standard
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //load data from memory
        if let items = UserDefaults.standard.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
            
        }
        
        
    }
    
    
    //Important functions that must be implemented for table views(Protocols)
    // ***************************************************************************************//
    
    //MARK: - Returns number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    //MARK: - display items in table rows
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        return cell
        
    }
    
    //************************************************************************************************//
    
    //MARK: - function to select table view items
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //print(itemArray[indexPath.row])
        
        //To put checkmark behind every item
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }
        else{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
     
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    
    }
  
    
   
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
      
        var textField = UITextField()
        
        //UI alert window
        let alert = UIAlertController(title: "Add New Todoey Item ", message: "", preferredStyle: .alert)
        
       
        //UI alert action closure
         /* ***** what will happen once the user clicks the Add Item button on our UIAlert *********  */
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
           // print(textField.text)
            self.itemArray.append(textField.text!)
            
            //Saving data for reuse
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
           //Item array is modified but will not show until we reload data
            self.tableView.reloadData()
            
        }
        
        //Adding text field to alert UI
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
           
        }
        
        
        //Present alert
        alert.addAction(action)
        
        present(alert, animated : true, completion: nil)
        
        
        
        
    }
    
   
    
    
}

