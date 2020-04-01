
import Foundation

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
