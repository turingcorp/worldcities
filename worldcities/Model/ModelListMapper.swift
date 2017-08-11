import Foundation

extension ModelList
{
    func mapItems(items:[ModelListItem])
    {
        var itemsMap:[String:[ModelListItem]] = [:]
        
        for item:ModelListItem in items
        {
            mapItem(
                itemsMap:&itemsMap,
                item:item)
        }
        
        itemsLoaded(
            items:items,
            itemsMap:itemsMap)
    }
    
    //MARK: private
    
    private func mapItem(
        itemsMap:inout[String:[ModelListItem]],
        item:ModelListItem)
    {
        let filterString:String = item.filterString
        let characters:String.CharacterView = filterString.characters
        let countCharacters:Int = characters.count
        
        var mappingString:String = ""
        
        for indexCharacter:Int in 0 ..< countCharacters
        {
            let index:String.CharacterView.Index = characters.index(
                characters.startIndex,
                offsetBy:indexCharacter)
            let character:Character = characters[index]
            mappingString.append(character)
            
            mapItem(
                itemsMap:&itemsMap,
                item:item,
                mappingString:mappingString)
        }
    }
    
    private func mapItem(
        itemsMap:inout[String:[ModelListItem]],
        item:ModelListItem,
        mappingString:String)
    {
        var mappedItems:[ModelListItem]
        
        if let previousMapped:[ModelListItem] = itemsMap[mappingString]
        {
            mappedItems = previousMapped
        }
        else
        {
            mappedItems = []
        }
        
        mappedItems.append(item)
        itemsMap[mappingString] = mappedItems
    }
}
