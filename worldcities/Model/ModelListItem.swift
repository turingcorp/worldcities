import Foundation

class ModelListItem
{
    private static let kDisplayConcatenate:String = ", "
    let identifier:Int
    let compareString:String
    let filterString:String
    let displayString:String
    let name:String
    let country:String
    let latitude:Double
    let longitude:Double
    
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
        identifier:Int,
        name:String,
        country:String,
        latitude:Double,
        longitude:Double)
    {
        self.identifier = identifier
        self.name = name
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        
        filterString = ModelListItem.factoryFilterString(
            name:name)
        compareString = ModelListItem.factoryCompareString(
            filterString:filterString,
            country:country)
        displayString = ModelListItem.factoryDisplayString(
            name:name,
            country:country)
    }
}
