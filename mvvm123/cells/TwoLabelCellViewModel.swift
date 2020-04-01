import Foundation

class TwoLabelCellViewModel: CellViewModel {
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

extension TwoLabelCellViewModel: Equatable {
    static func == (lhs: TwoLabelCellViewModel, rhs: TwoLabelCellViewModel) -> Bool {
        return lhs.model?.address != nil && rhs.model?.address != nil
    }
}


