import XCTest
@testable import worldcities

class TestModelListSearch:XCTestCase
{
    private let kStringEmpty:String = ""
    private let kStringWithSpaces:String = "   "
    private let kStringWithNewLine:String = "\n"
    private let kStringWithTab:String = "\t"
    private let kStringWithReturn:String = "\r"
    private let kStringUpperCaseA:String = "A"
    private let kStringLowerCaseA:String = "a"
    private let kStringPercent:String = "%"
    private let kStringAAndPercent:String = "a%"
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
            self?.inputSpaces(modelList:modelList)
            self?.inputTab(modelList:modelList)
            self?.inputReturn(modelList:modelList)
            self?.inputUpperCase(modelList:modelList)
            self?.inputLowerCase(modelList:modelList)
            self?.inputEqualsLowerUpper(modelList:modelList)
            self?.inputInvalidString(modelList:modelList)
            self?.inputValidAndInvalid(modelList:modelList)
            self?.resultsSorted(modelList:modelList)
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
    
    private func inputSpaces(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringWithSpaces)
        let foundCount:Int = foundItems.count
        let totalCount:Int = modelList.items.count
        
        XCTAssertEqual(
            foundCount,
            totalCount,
            "failed searching with spaces on input")
    }
    
    private func inputTab(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringWithTab)
        let foundCount:Int = foundItems.count
        let totalCount:Int = modelList.items.count
        
        XCTAssertEqual(
            foundCount,
            totalCount,
            "failed searching with tab on input")
    }
    
    private func inputReturn(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringWithReturn)
        let foundCount:Int = foundItems.count
        let totalCount:Int = modelList.items.count
        
        XCTAssertEqual(
            foundCount,
            totalCount,
            "failed searching with carriage return on input")
    }
    
    private func inputUpperCase(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringUpperCaseA)
        let foundCount:Int = foundItems.count
        
        XCTAssertGreaterThan(
            foundCount,
            0,
            "failed searching with upper case strings")
    }
    
    private func inputLowerCase(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringLowerCaseA)
        let foundCount:Int = foundItems.count
        
        XCTAssertGreaterThan(
            foundCount,
            0,
            "failed searching with lower case strings")
    }
    
    private func inputEqualsLowerUpper(modelList:ModelList)
    {
        let foundLower:[ModelListItem] = modelList.searchItems(
            forInput:kStringLowerCaseA)
        let foundUpper:[ModelListItem] = modelList.searchItems(
            forInput:kStringUpperCaseA)
        let countLower:Int = foundLower.count
        let countUpper:Int = foundUpper.count
        
        XCTAssertEqual(
            countLower,
            countUpper,
            "lower case search should be similar as upper case search")
    }
    
    private func inputInvalidString(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringPercent)
        let foundCount:Int = foundItems.count
        
        XCTAssertLessThan(
            foundCount,
            1,
            "search should be empty when looking for special characters")
    }
    
    private func inputValidAndInvalid(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringAAndPercent)
        let foundCount:Int = foundItems.count
        
        XCTAssertLessThan(
            foundCount,
            1,
            "search should be empty when looking for special characters")
    }
    
    private func resultsSorted(modelList:ModelList)
    {
        let foundItems:[ModelListItem] = modelList.searchItems(
            forInput:kStringLowerCaseA)
        let foundCount:Int = foundItems.count
        
        if foundCount > 1
        {
            let foundA:String = foundItems[0].compareString
            let foundB:String = foundItems[1].compareString
            
            let comparison:ComparisonResult = foundA.compare(foundB)
            
            XCTAssertNotEqual(
                comparison,
                ComparisonResult.orderedDescending,
                "results are not sorted")
        }
    }
}
