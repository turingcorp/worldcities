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
    
    func loadItems(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchLoadItems(completion:completion)
        }
    }
    
    //MARK: private
    
    private func dispatchLoadItems(completion:@escaping(() -> ()))
    {
        guard
            
            let resourceUrl:URL = Bundle.main.url(
                forResource:ModelList.kJsonName,
                withExtension:ModelList.kJsonExtension)
            
        else
        {
            return
        }
        
        let data:Data
        
        do
        {
            try data = Data(contentsOf:resourceUrl)
        }
        catch
        {
            return
        }
        
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
            return
        }
        
        loadItems(json:json, completion:completion)
    }
    
    private func loadItems(
        json:Any,
        completion:@escaping(() -> ()))
    {
        guard
        
            let jsonList:[AnyObject] = json as? [AnyObject]
        
        else
        {
            return
        }
        
        var items:[ModelListItem] = []
        
        for jsonItem:AnyObject in jsonList
        {
            guard
            
                let item:ModelListItem = loadItem(
                    json:jsonItem)
            
            else
            {
                continue
            }
            
            items.append(item)
        }
        
        itemsLoaded(items:items)
        completion()
    }
    
    private func loadItem(json:AnyObject) -> ModelListItem?
    {
        guard
        
            let jsonMap:[String:AnyObject] = json as? [String:AnyObject],
            let identifier:String = jsonMap[ModelList.kKeyId] as? String,
            let name:String = json[ModelList.kKeyName] as? String,
            let country:String = json[ModelList.kKeyCountry] as? String,
            let coord:[String:AnyObject] = json[ModelList.kKeyCoord] as? [String:AnyObject],
            let latitude:Double = coord[ModelList.kKeyLat] as? Double,
            let longitude:Double = coord[ModelList.kKeyLon] as? Double
        
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
}
