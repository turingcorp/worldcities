import Foundation

extension ModelList
{
    private static let kJsonName:String = "cities"
    private static let kJsonExtension:String = "json"
    
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
        
            let jsonList:[Any] = json as? [Any]
        
        else
        {
            return
        }
        
        var items:[ModelListItem] = []
        
        for jsonItem:Any in jsonList
        {
            
        }
    }
}
