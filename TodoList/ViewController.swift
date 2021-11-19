import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton! {
        didSet {
            plusButton.imageView?.frame.size = CGSize(width: 40, height: 40)
        }
    }
    @IBOutlet weak var taskTable: UITableView!
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTable.delegate = self
        taskTable.dataSource = self
        
        taskTable.register(CustomCell.classForCoder(), forCellReuseIdentifier: "TaskCell")
    }
    
    @IBAction func plusButton(_ sender: Any) {
        let vc = TaskCardCreatorViewController()
        vc.modalPresentationStyle = .pageSheet
        
        vc.delegate = self
        
        present(vc, animated: true)
    }
    
    func addTask(task: Task) {
        
        tasks.append(task)
        
        taskTable.beginUpdates()
        taskTable.insertRows(at: [IndexPath(row: tasks.count - 1, section: 0)], with: .left)
        taskTable.endUpdates()
    }
    
    func updateTask(task: Task, indexPath: IndexPath) {
        tasks[indexPath.row].name = task.name
        tasks[indexPath.row].descriptions = task.descriptions
        
        taskTable.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? CustomCell else {
            return UITableViewCell()
        }
        
        cell.name.text = tasks[indexPath.row].name
        cell.descriptions.text = tasks[indexPath.row].descriptions
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskCardCreatorViewController()
        vc.flag = true
        vc.index = indexPath
        vc.delegate = self
        
        vc.modalPresentationStyle = .pageSheet
        
        present(vc, animated: true) {
            vc.nameField.text = self.tasks[indexPath.row].name
            vc.descriptionField.text = self.tasks[indexPath.row].descriptions
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            tasks.remove(at: indexPath.row)
            
            taskTable.beginUpdates()
            taskTable.deleteRows(at: [indexPath], with: .left)
            taskTable.endUpdates()
        }
    }
}

