import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "Buy Eggs",
                     "Destroy Demogoron"]
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        
        print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
  
    
   
    
   
    
    
}

