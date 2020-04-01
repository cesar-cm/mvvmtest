
import UIKit

//view
class OneLabelCellView: UITableViewCell {
    var cellViewModel: OneLabelCellViewModel?
    static let identifier = "oneLabel"
    var nameLabel: UILabel?
    
    func configure(viewModel: OneLabelCellViewModel) {
        cellViewModel = viewModel
        style()
        
        nameLabel?.text = cellViewModel?.name
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel(frame: contentView.bounds)
        if let nameLabel = nameLabel {
            contentView.addSubview(nameLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func style() {
        nameLabel?.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        nameLabel?.numberOfLines = 0
    }
}

//view model
class OneLabelCellViewModel: CellViewModel {
    private var model: PersonModel?
    
    var name: String {
        if let model = self.model {
            return model.name
        } else {
            return "UnKnown"
        }
    }
    
    init(model: PersonModel) {
        super.init()
        
        self.model = model
        self.associatedType = .OneLabelCellViewModel
    }
}

class CellViewModel {
    var associatedType: type?
    
    enum type {
        case CellViewModel,
        OneLabelCellViewModel,
        TwoLabelCellViewModel
    }
}

//protocol CellViewModelable {
//    associatedtype SelfType
//    func getType() -> SelfType
//}
