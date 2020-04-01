
import UIKit

class TwoLabelCellView: UITableViewCell {
    var cellViewModel: TwoLabelCellViewModel?
    
    static let identifier = "twoLabel"
    
    let nameLabel: UILabel
    let addressLabel: UILabel
    
    //MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        self.nameLabel = UILabel()
        self.addressLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(addressLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    
    func configure(viewModel: TwoLabelCellViewModel) {
        cellViewModel = viewModel
        style()
        
        nameLabel.text = cellViewModel?.name
        addressLabel.text = cellViewModel?.address
        
        addCOnstrains()
    }
    
    func style() {
        nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel.numberOfLines = 0
        nameLabel.font = .boldSystemFont(ofSize: 17.0)
        
        addressLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addressLabel.numberOfLines = 0
        addressLabel.font = .italicSystemFont(ofSize: 14.0)
        
        accessoryType = .disclosureIndicator
    }
    
    func addCOnstrains() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  16.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  16.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  -16.0).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant:  8.0).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  16.0).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  -16.0).isActive = true
    }
}
