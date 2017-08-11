import Foundation
import MapKit

class ModelMapAnnotation:NSObject, MKAnnotation
{
    private(set) var coordinate:CLLocationCoordinate2D
    private(set) var title:String?
    
    init(modelListItem:ModelListItem)
    {
        let latitude:Double = modelListItem.latitude
        let longitude:Double = modelListItem.longitude
        title = modelListItem.displayString
        coordinate = CLLocationCoordinate2D(
            latitude:latitude,
            longitude:longitude)
    }
}
