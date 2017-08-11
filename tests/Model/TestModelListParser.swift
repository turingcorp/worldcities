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
}
