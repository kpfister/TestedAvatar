//    ______
//   /  __  \
//  |  /  \  |
//  |  \  /  |
//  |  /__\  |
//   \______/
//

import XCTest
@testable import TestedAvatar

class PersonServiceSpec: XCTestCase {
    
    var service: PersonService!
    
    override func setUp() {
        super.setUp()
        service = PersonService()
    }
    
    /// test that current person is nil when initialized
    func testThatCurrentPersonIsNilWhenInitialized() {
        XCTAssertNil(service.currentPerson)
    }
    
    /// test that current person is not nil after first name is saved
    func testThatCurrentPersonIsNotNilAfterFirstNameIsSaved() {
        XCTAssertNil(service.currentPerson)
        service.saveFirstName("Sir")
        XCTAssertNotNil(service.currentPerson)
    }
    
    /// test that current person is not nil after last name is saved
    func testThatCurrentPersonIsNotNilAfterLastNameIsSaved() {
        XCTAssertNil(service.currentPerson)
        service.saveLastName("Lancelot")
        XCTAssertNotNil(service.currentPerson)
    }
    
    /// test that current person is updated properly when saving first name
    func testThatCurrentPersonIsUpdatedProperlyWhenSavingFirstName() {
        service.saveFirstName("Sir")
        XCTAssertEqual(service.currentPerson?.firstName, "Sir")
    }

    /// test that current person is updated properly when saving last name
    func testThatCurrentPersonIsUpdatedProperlyWhenSavingLastName() {
        service.saveLastName("Lancelot")
        XCTAssertEqual(service.currentPerson?.lastName, "Lancelot")
    }

    /// test that current person is updated properly with nil for a name
    func testThatCurrentPersonIsUpdatedProperlyWithNilForAName() {
        service.saveFirstName("Sir")
        service.saveLastName("Lancelot")
        XCTAssertEqual(service.currentPerson?.name, "Sir Lancelot")
        
        service.saveFirstName(nil)
        XCTAssertNil(service.currentPerson?.firstName)
        
        service.saveLastName(nil)
        XCTAssertNil(service.currentPerson?.lastName)
    }
    
}
