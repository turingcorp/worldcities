import Foundation

class ModelList
{
    private(set) var items:[ModelListItem]
    private(set) var displayItems:[ModelListItem]
    
    init()
    {
        items = []
        displayItems = []
    }
    
    //MARK: internal
    
    func itemsLoaded(items:[ModelListItem])
    {
        self.items = items
    }
}
