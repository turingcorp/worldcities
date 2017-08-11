import Foundation

class ModelListItem
{
    let identifier:Int
    let compareString:String
    let name:String
    let country:String
    let latitude:Double
    let longitude:Double
    
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
        
        let nameLowercase:String = name.lowercased()
        let countryLowercase:String = country.lowercased()
        
        var compareString = nameLowercase
        compareString.append(countryLowercase)
        self.compareString = compareString
    }
}
