import UIKit
import MapKit

class ViewMap:MKMapView
{
    private(set) weak var controller:ControllerMap!
    
    init(controller:ControllerMap)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isRotateEnabled = false
        isScrollEnabled = true
        isZoomEnabled = true
        isPitchEnabled = false
        mapType = MKMapType.standard
        showsBuildings = true
        showsPointsOfInterest = true
        showsCompass = true
        showsScale = false
        showsTraffic = false
        showsUserLocation = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
