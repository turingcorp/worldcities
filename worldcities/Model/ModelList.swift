import Foundation

class ModelList
{
    private(set) var itemsMap:[String:ModelListItem]
    private(set) var items:[ModelListItem]
    private(set) var displayItems:[ModelListItem]
    
    init()
    {
        itemsMap = [:]
        items = []
        displayItems = []
    }
    
    //MARK: internal
    
    func itemsLoaded(
        items:[ModelListItem],
        itemsMap:[String:ModelListItem])
    {
        self.items = items
        self.itemsMap = itemsMap
    }
    
    func updateDisplayItems(searchString:String)
    {
        displayItems = searchItems(forInput:searchString)
    }
}
