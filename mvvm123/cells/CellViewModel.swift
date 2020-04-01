
import Foundation

class CellViewModel {
    var associatedType: type?
    
    enum type {
        case CellViewModel,
        OneLabelCellViewModel,
        TwoLabelCellViewModel
    }
}

