
import Foundation

class TableViewModel {
    public var rows: Obcerver<[PersonModel]>?
    public var numberOfSections = 1
    
    init() {
        self.rows = Obcerver([PersonModel]())
        self.rows?.value = self.createNPersons(nil)
    }
    
    @objc func addElement() {
        rows?.value.insert(createPerson(n: rows?.value.count ?? 0), at: 0)
    }
    
    @objc func removeElement() {
        if rows?.value.isEmpty == false {
            rows?.value.remove(at: 0)
        }
    }
    
    // cretes a random number of person
    
    func createNPersons(_ quantity: Int?) -> [PersonModel] {
        
        var persons = [PersonModel]()
        let end: Int = quantity ?? Int.random(in: 1 ... 100)
        
        for i in 1 ... end {
            persons.append(createPerson(n: i))
        }
        return persons
    }
    
    func getCellViewModel(section: Int, row: Int) -> CellViewModel? {
    
        if let model = rows?.value[row], model.address == nil {
            return OneLabelCellViewModel(model: model)
        }
        
        if let model = rows?.value[row], let _ = model.address {
            return TwoLabelCellViewModel(model: model)
        }
        
        return nil
    }
    
    func getDetailViewModel(section: Int, row: Int) -> DetailViewModel? {
        if let model = rows?.value[row] {
            return DetailViewModel(model: model)
        }
        return nil
    }
    
    private func createPerson(n: Int) -> PersonModel {
        if Bool.random() {
            return PersonModel(name: "New one \(n)",
                address: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquam porta interdum. Nunc aliquet massa sed vehicula venenatis. Pellentesque id nulla")
            
        } else {
            return PersonModel(name: "New one \(n)")
        }
    }
}

