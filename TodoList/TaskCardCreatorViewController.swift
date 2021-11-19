import UIKit

class TaskCardCreatorViewController: UIViewController {


    @IBOutlet weak var nameField: UITextView!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.clipsToBounds = true
            addButton.layer.cornerRadius = 15
            
            if flag {
                addButton.setTitle("UPDATE", for: .normal)
                DispatchQueue.main.async {
                    self.addButton.titleLabel?.font = UIFont(name: "Rockwell-Bold", size: 30)
                    self.addButton.setNeedsLayout()
                }
                
            }
        }
    }
    var flag: Bool = false
    var index: IndexPath!
    
    weak var delegate: ViewController?

    @IBAction func addButton(_ sender: Any) {
        
        if flag {
            delegate?.updateTask(task: Task(name: nameField.text ?? "", descriptions: descriptionField.text ?? ""),
                                 indexPath: index)
        } else {
            delegate?.addTask(task: Task(name: nameField.text ?? "", descriptions: descriptionField.text ?? ""))
        }
        
        dismiss(animated: true)
    }
}
