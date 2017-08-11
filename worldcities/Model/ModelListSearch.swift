import Foundation

extension ModelList
{
    private static let kStringEmpty:String = ""
    private static let kStringSpace:String = " "
    private static let kStringNewLine:String = "\n"
    private static let kStringTab:String = "\t"
    private static let kStringReturn:String = "\r"
    
    private class func cleanInput(input:String) -> String
    {
        var cleaned:String = input.lowercased()
        cleaned = cleaned.replacingOccurrences(
            of:kStringSpace,
            with:kStringEmpty)
        cleaned = cleaned.replacingOccurrences(
            of:kStringNewLine,
            with:kStringEmpty)
        cleaned = cleaned.replacingOccurrences(
            of:kStringTab,
            with:kStringEmpty)
        cleaned = cleaned.replacingOccurrences(
            of:kStringReturn,
            with:kStringEmpty)
        
        return cleaned
    }
    
    //MARK: internal
    
    func searchItems(forInput:String) -> [ModelListItem]
    {
        let cleanedInput:String = ModelList.cleanInput(
            input:forInput)
        let countCharacters:Int = cleanedInput.characters.count
        let items:[ModelListItem]
        
        if countCharacters > 0
        {
            items = mappedItems(withString:cleanedInput)
        }
        else
        {
            items = self.items
        }
        
        return items
    }
    
    //MARK: private
    
    private func mappedItems(withString:String) -> [ModelListItem]
    {
        guard
        
            let items:[ModelListItem] = itemsMap[withString]
        
        else
        {
            return []
        }
        
        return items
    }
}
