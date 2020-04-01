
import XCTest
@testable import mvvm123

class mvvm123Tests: XCTestCase {

    var tableViewModel = TableViewModel()
        
    override func setUpWithError() throws {
        // Put setup code here. This method is called BEFORE the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called AFTER the invocation of each test method in the class.
        tableViewModel = TableViewModel()
    }
    
    func testAddElement() {
        tableViewModel.rows?.value = tableViewModel.createNPersons(100)
        tableViewModel.addElement()
        tableViewModel.addElement()
        tableViewModel.addElement()
        XCTAssertEqual(103, tableViewModel.rows?.value.count)
    }
    
    func testRemoveElement() {
        tableViewModel.rows?.value = tableViewModel.createNPersons(100)
        tableViewModel.removeElement()
        XCTAssertEqual(99, tableViewModel.rows?.value.count)
    }

    func testGenerateNPerson() {
        let expectedNumber = 100
        tableViewModel.rows?.value = tableViewModel.createNPersons(expectedNumber)
        XCTAssertEqual(expectedNumber, tableViewModel.rows?.value.count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            _ = tableViewModel.createNPersons(100)
        }
    }
    
    func testReturnTwoLabelViewModel() {
        let person = PersonModel(name: "Me", address: "My address")
        tableViewModel.rows?.value = [person]
        let modelResult = tableViewModel.getCellViewModel(section: 1, row: 0) as? TwoLabelCellViewModel
        
        XCTAssertEqual(modelResult?.associatedType, CellViewModel.type.TwoLabelCellViewModel)
    }
    
    func testReturnOneLabelViewModel() {
        let person = PersonModel(name: "Me")
        tableViewModel.rows?.value = [person]
        let modelResult = tableViewModel.getCellViewModel(section: 1, row: 0) as? OneLabelCellViewModel
        
        XCTAssertEqual(modelResult?.associatedType, CellViewModel.type.OneLabelCellViewModel)
    }

}
