import Foundation

class ModelListItem
{
    let identifier:String
    let name:String
    let country:String
    let latitude:Double
    let longitude:Double
    
    init(
        identifier:String,
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
    }
}
