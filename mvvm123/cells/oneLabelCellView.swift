
import UIKit

class OneLabelCellView: UITableViewCell {
    var cellViewModel: OneLabelCellViewModel?
    static let identifier = "oneLabel"
    var nameLabel: UILabel
    
    func configure(viewModel: OneLabelCellViewModel) {
        cellViewModel = viewModel
        style()
        
        nameLabel.text = cellViewModel?.name
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        self.nameLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        
        addCOnstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    func style() {
        nameLabel.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        nameLabel.numberOfLines = 0
        selectionStyle = .blue
        accessoryType = .disclosureIndicator
    }
    
    func addCOnstrains() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  16.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  16.0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  -16.0).isActive = true
    }
}
