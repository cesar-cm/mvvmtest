
import UIKit

//view
class TwoLabelCellView: UITableViewCell {
    var cellViewModel: TwoLabelCellViewModel?
    static let identifier = "twoLabel"
    var nameLabel: UILabel?
    var addressLabel: UILabel?
    
    func configure(viewModel: TwoLabelCellViewModel) {
        cellViewModel = viewModel
        style()
        
        nameLabel?.text = cellViewModel?.name
        addressLabel?.text = cellViewModel?.address
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel(frame: contentView.bounds)
        addressLabel = UILabel(frame: contentView.bounds)
        
        if let nameLabel = nameLabel, let addressLabel = addressLabel {
            contentView.addSubview(nameLabel)
            contentView.addSubview(addressLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func style() {
        nameLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameLabel?.numberOfLines = 0
        
        addressLabel?.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addressLabel?.numberOfLines = 0
    }
}


//view model
class TwoLabelCellViewModel: CellViewModel {
    typealias SelfType = TwoLabelCellViewModel.Type
    
    private var model: PersonModel?
    
    var name: String {
        if let model = self.model {
            return model.name
        } else {
            return "UnKnown"
        }
    }
    
    var address: String {
        if let model = self.model,
            let address = model.address {
            return address
        } else {
            return "   -   "
        }
    }
    
    init(model: PersonModel) {
        super.init()
        
        self.model = model
        self.associatedType = .TwoLabelCellViewModel
    }
}
