
import Foundation

class DetailViewModel {
    private var model: PersonModel
    
    init(model: PersonModel) {
        self.model = model
    }
    
    func getPerson() -> PersonModel {
        return model
    }
    
}
