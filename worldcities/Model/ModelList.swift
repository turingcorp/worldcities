import Foundation

class ModelList
{
    private(set) var items:[ModelListItem]
    
    init()
    {
        items = []
    }
    
    //MARK: internal
    
    func itemsLoaded(items:[ModelListItem])
    {
        self.items = items
    }
}
