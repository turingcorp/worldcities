import XCTest
@testable import worldcities

class TestModelListParser:XCTestCase
{
    var modelList:ModelList?
    
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
}
