import Foundation

extension ModelList
{
    private static let kJsonName:String = "cities"
    private static let kJsonExtension:String = "json"
    private static let kKeyId:String = "_id"
    private static let kKeyName:String = "name"
    private static let kKeyCountry:String = "country"
    private static let kKeyCoord:String = "coord"
    private static let kKeyLat:String = "lat"
    private static let kKeyLon:String = "lon"
    
    class func factoryResourceUrl() -> URL?
    {
        let resourceUrl:URL? = Bundle.main.url(
            forResource:kJsonName,
            withExtension:kJsonExtension)
        
        return resourceUrl
    }
    
    class func factoryItem(jsonItem:AnyObject) -> ModelListItem?
    {
        guard
            
            let jsonMap:[String:AnyObject] = jsonItem as? [String:AnyObject],
            let identifier:Int = jsonMap[kKeyId] as? Int,
            let name:String = jsonMap[kKeyName] as? String,
            let country:String = jsonMap[kKeyCountry] as? String,
            let coord:[String:AnyObject] = jsonMap[kKeyCoord] as? [String:AnyObject],
            let latitude:Double = coord[kKeyLat] as? Double,
            let longitude:Double = coord[kKeyLon] as? Double
            
        else
        {
            return nil
        }
        
        let item:ModelListItem = ModelListItem(
            identifier:identifier,
            name:name,
            country:country,
            latitude:latitude,
            longitude:longitude)
        
        return item
    }
    
    //MARK: private
    
    private func asyncLoadItems(completion:@escaping(() -> ()))
    {
        guard
            
            let url:URL = ModelList.factoryResourceUrl(),
            let data:Data = loadData(url:url),
            let json:Any = loadJson(data:data),
            let jsonList:[AnyObject] = loadJsonList(json:json)
            
        else
        {
            return
        }
        
        let items:[ModelListItem] = loadItems(jsonList:jsonList)
        let sortedItems:[ModelListItem] = sortItems(items:items)
        itemsLoaded(items:sortedItems)
        
        completion()
    }
    
    private func sortItems(items:[ModelListItem]) -> [ModelListItem]
    {
        let sorted:[ModelListItem] = items.sorted
        { (itemA:ModelListItem, itemB:ModelListItem) -> Bool in
            
            let itemAString:String = itemA.compareString
            let itemBString:String = itemB.compareString
            let comparison:ComparisonResult = itemAString.compare(
                itemBString,
                options:String.CompareOptions.literal)
            
            if comparison == ComparisonResult.orderedDescending
            {
                return false
            }
            
            return true
        }
        
        return sorted
    }
    
    //MARK: internal
    
    func loadItems(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadItems(completion:completion)
        }
    }
    
    func loadData(url:URL) -> Data?
    {
        let data:Data
        
        do
        {
            try data = Data(contentsOf:url)
        }
        catch
        {
            return nil
        }
        
        return data
    }
    
    func loadJson(data:Data) -> Any?
    {
        let json:Any
        
        do
        {
            try json = JSONSerialization.jsonObject(
                with:data,
                options:
                JSONSerialization.ReadingOptions.allowFragments)
        }
        catch
        {
            return nil
        }
        
        return json
    }
    
    func loadJsonList(json:Any) -> [AnyObject]?
    {
        guard
            
            let jsonList:[AnyObject] = json as? [AnyObject]
            
        else
        {
            return nil
        }
        
        return jsonList
    }
    
    func loadItems(jsonList:[AnyObject]) -> [ModelListItem]
    {
        var items:[ModelListItem] = []
        
        for jsonItem:AnyObject in jsonList
        {
            guard
                
                let item:ModelListItem = ModelList.factoryItem(
                    jsonItem:jsonItem)
                
            else
            {
                continue
            }
            
            items.append(item)
        }
        
        return items
    }
}
