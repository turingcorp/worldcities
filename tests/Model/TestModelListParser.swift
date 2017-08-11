import XCTest
@testable import worldcities

class TestModelListParser:XCTestCase
{
    var modelList:ModelList?
    private let kWaitExpectation:TimeInterval = 90
    
    override func setUp()
    {
        super.setUp()
        modelList = ModelList()
    }
    
    func testFactoryResourceUrl()
    {
        let url:URL? = ModelList.factoryResourceUrl()
        XCTAssertNotNil(url, "failed creating resource url")
    }
    
    func testLoadData()
    {
        guard
            
            let url:URL = ModelList.factoryResourceUrl()
        
        else
        {
            return
        }
        
        let data:Data? = modelList?.loadData(url:url)
        XCTAssertNotNil(data, "failed loading data from url")
    }
    
    func testLoadJson()
    {
        guard
            
            let url:URL = ModelList.factoryResourceUrl(),
            let data:Data = modelList?.loadData(url:url)
            
        else
        {
            return
        }
        
        let json:Any? = modelList?.loadJson(data:data)
        XCTAssertNotNil(json, "failed loading json from data")
    }
    
    func testLoadJsonList()
    {
        guard
            
            let url:URL = ModelList.factoryResourceUrl(),
            let data:Data = modelList?.loadData(url:url),
            let json:Any = modelList?.loadJson(data:data)
            
        else
        {
            return
        }
        
        let jsonList:[AnyObject]? = modelList?.loadJsonList(
            json:json)
        XCTAssertNotNil(jsonList, "failed loading json list from json")
        
        if let jsonList:[AnyObject] = jsonList
        {
            let countItems:Int = jsonList.count
            
            XCTAssertGreaterThan(countItems, 0, "list is empty")
        }
    }
    
    func testFactoryItem()
    {
        guard
            
            let url:URL = ModelList.factoryResourceUrl(),
            let data:Data = modelList?.loadData(url:url),
            let json:Any = modelList?.loadJson(data:data),
            let jsonList:[AnyObject] = modelList?.loadJsonList(
                json:json),
            let firstJsonItem:AnyObject = jsonList.first
            
        else
        {
            return
        }
        
        let item:ModelListItem? = ModelList.factoryItem(
            jsonItem:firstJsonItem)
        XCTAssertNotNil(item, "failed parsing json item")
    }
    
    func testLoadItems()
    {
        let itemsExpectation:XCTestExpectation = expectation(
            description:"items loaded")
        
        modelList?.loadItems
        {
            itemsExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            let countItems:Int? = self?.modelList?.items.count
            
            XCTAssertNotNil(countItems, "failed loading items")
            
            if let countItems:Int = countItems
            {
                XCTAssertGreaterThan(
                    countItems,
                    0,
                    "item array is empty")
            }
        }
    }
    
    func testItemsSorted()
    {
        let itemsExpectation:XCTestExpectation = expectation(
            description:"items loaded")
        
        modelList?.loadItems
        {
            itemsExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            guard
                
                let items:[ModelListItem] = self?.modelList?.items
                
            else
            {
                return
            }
            
            var previousItem:ModelListItem?
            
            for item:ModelListItem in items
            {
                if let previousItem:ModelListItem = previousItem
                {
                    let previousString:String = previousItem.compareString
                    let compareString:String = item.compareString
                    
                    let comparison:ComparisonResult = previousString.compare(
                        compareString,
                        options:String.CompareOptions.literal)
                    
                    XCTAssertNotEqual(
                        comparison,
                        ComparisonResult.orderedDescending,
                        "failed sorting items")
                    
                    if comparison == ComparisonResult.orderedDescending
                    {
                        break
                    }
                }
                
                previousItem = item
            }
        }
    }
    
    func testPerformanceLoadItems()
    {
        guard
            
            let url:URL = ModelList.factoryResourceUrl(),
            let data:Data = modelList?.loadData(url:url),
            let json:Any = modelList?.loadJson(data:data),
            let jsonList:[AnyObject] = modelList?.loadJsonList(
                json:json)
            
        else
        {
            return
        }
        
        measure
        { [weak self] in
            
            let _:[ModelListItem]? = self?.modelList?.loadItems(jsonList:jsonList)
        }
    }
}
