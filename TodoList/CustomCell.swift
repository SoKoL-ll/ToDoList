import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var name: UILabel = {
        let res = UILabel()
        
        res.numberOfLines = 0
        res.lineBreakMode = .byWordWrapping
        
        res.textAlignment = .left
        res.font = UIFont(name: "Rockwell-Bold", size: 15)
        
        res.translatesAutoresizingMaskIntoConstraints = false
        
        return res
    }()
    
    var descriptions: UILabel = {
        let res = UILabel()
        
        res.numberOfLines = 1
        
        res.textAlignment = .left
        res.font = UIFont(name: "Rockwell", size: 10)
        
        res.translatesAutoresizingMaskIntoConstraints = false
        
        return res
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(name)
        addSubview(descriptions)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        let lrCnst: CGFloat = 10
        let topCnst: CGFloat = 10
        
        name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lrCnst).isActive = true
        name.topAnchor.constraint(equalTo: self.topAnchor, constant: topCnst).isActive = true
        name.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lrCnst).isActive = true
        
        descriptions.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lrCnst).isActive = true
        descriptions.topAnchor.constraint(equalTo: name.bottomAnchor, constant: topCnst).isActive = true
        descriptions.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lrCnst).isActive = true
        descriptions.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -topCnst).isActive = true
    }
    
}
