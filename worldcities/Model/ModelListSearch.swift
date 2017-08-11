import Foundation

extension ModelList
{
    func searchItems(forInput:String) -> [ModelListItem]
    {
        let cleanedInput:String = cleanInput(input:forInput)
        let countCharacters:Int = cleanedInput.characters.count
        let items:[ModelListItem]
        
        if countCharacters > 0
        {
            items = []
        }
        else
        {
            items = self.items
        }
        
        return items
    }
    
    //MARK: private
    
    private func cleanInput(input:String) -> String
    {
        let cleaned:String = input
        
        return cleaned
    }
}
