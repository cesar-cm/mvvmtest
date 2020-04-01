
import Foundation

class TableViewModel {
    public var rows: Obcerver<[PersonModel]>?
    public var numberOfSections = 1
    
    init() {
        self.rows = Obcerver([PersonModel]())
        self.rows?.value = self.getPersons()
    }
    
    @objc func addElement() {
        rows?.value.append(PersonModel(name: "New one",
                                       address: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquam porta interdum. Nunc aliquet massa sed vehicula venenatis. Pellentesque id nulla"))
    }
    
    @objc func removeElement() {
        if rows?.value.isEmpty == false {
            rows?.value.remove(at: 0)
        }
    }
    
    private func getPersons() -> [PersonModel] {
        var persons = [PersonModel]()
        persons.append(PersonModel(name: "Cesar", address: "Address 1"))
        persons.append(PersonModel(name: "Jessy", address: "Address 2"))
        persons.append(PersonModel(name: "Lilian"))
        return persons
    }
    
    func getCellModel(section: Int, row: Int) -> CellViewModel? {
    
        if let model = rows?.value[row], model.address == nil {
            return OneLabelCellViewModel(model: model)
        }
        
        if let model = rows?.value[row], let _ = model.address {
            return TwoLabelCellViewModel(model: model)
        }
        
        return nil
    }
}

