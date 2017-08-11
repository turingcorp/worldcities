import XCTest
@testable import worldcities

class TestModelListParser:XCTestCase
{
    func testFactoryResourceUrl()
    {
        let url:URL? = ModelList.factoryResourceUrl()
        XCTAssertNotNil(url, "failed creating resource url")
    }
}
