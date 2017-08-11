import Foundation

class ModelListItem
{
    private static let kDisplayConcatenate:String = ", "
    let displayString:String
    let latitude:Double
    let longitude:Double
    private var compareString:String?
    private var filterString:String?
    
    private class func factoryFilterString(name:String) -> String
    {
        var nameLowercase:String = name.lowercased()
        nameLowercase = nameLowercase.replacingOccurrences(
            of:" ",
            with:"")
        
        return nameLowercase
    }
    
    private class func factoryCompareString(
        filterString:String,
        country:String) -> String
    {
        let countryLowercase:String = country.lowercased()
        var compareString = filterString
        compareString.append(countryLowercase)
        
        return compareString
    }
    
    private class func factoryDisplayString(
        name:String,
        country:String) -> String
    {
        var displayString:String = name
        displayString.append(kDisplayConcatenate)
        displayString.append(country)
        
        return displayString
    }
    
    init(
        name:String,
        country:String,
        latitude:Double,
        longitude:Double)
    {
        let filterString:String = ModelListItem.factoryFilterString(
            name:name)
        compareString = ModelListItem.factoryCompareString(
            filterString:filterString,
            country:country)
        displayString = ModelListItem.factoryDisplayString(
            name:name,
            country:country)
        
        self.latitude = latitude
        self.longitude = longitude
        self.filterString = filterString
    }
    
    //MARK: internal
    
    func filteringString() -> String?
    {
        guard
        
            let filterString:String = self.filterString
        
        else
        {
            return nil
        }
        
        self.filterString = nil
        self.compareString = nil
        
        return filterString
    }
    
    func comparingString() -> String
    {
        guard
        
            let compareString:String = self.compareString
        
        else
        {
            return ModelListItem.kDisplayConcatenate
        }
        
        return compareString
    }
}
