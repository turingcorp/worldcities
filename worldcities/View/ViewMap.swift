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
    
    //MARK: internal
    
    func viewDidAppear()
    {
        let model:ModelListItem = controller.model
        let latitude:Double = model.latitude
        let longitude:Double = model.longitude
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(
            latitude:latitude,
            longitude:longitude)
        
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.title = model.displayString
        annotation.coordinate = coordinate
        
        addAnnotation(annotation)
    }
}
