import XCTest
@testable import worldcities

class TestModelListSearch:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 90
    
    func testSearchItems()
    {
        let itemsExpectation:XCTestExpectation = expectation(
            description:"items loaded")
        
        let modelList:ModelList = ModelList()
        modelList.loadItems
        {
            itemsExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
        }
    }
}
