import XCTest
@testable import worldcities

class TestModelListSearch:XCTestCase
{
    private let kStringEmpty:String = ""
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
            
            self?.inputEmpty(modelList:modelList)
        }
    }
    
    //MARK: private
    
    private func inputEmpty(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringEmpty)
        let foundCount:Int = foundItems.count
        let totalCount:Int = modelList.items.count
        
        XCTAssertEqual(
            foundCount,
            totalCount,
            "failed searching with empty string")
    }
}
