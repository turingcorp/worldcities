import Foundation

extension ModelList
{
    func mapItems(items:[ModelListItem])
    {
        var itemsMap:[String:ModelListItem] = [:]
        
        for item:ModelListItem in items
        {
            mapItem(
                itemsMap:itemsMap,
                item:item)
        }
        
        itemsLoaded(
            items:items,
            itemsMap:itemsMap)
    }
    
    //MARK: private
    
    private func mapItem(
        itemsMap:[String:ModelListItem],
        item:ModelListItem)
    {
        
    }
}
