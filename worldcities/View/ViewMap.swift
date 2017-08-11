import UIKit
import MapKit

class ViewMap:MKMapView
{
    private weak var controller:ControllerMap!
    private weak var annotation:ModelMapAnnotation?
    private let kSpanSize:CLLocationDegrees = 0.5
    
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
    
    //MARK: private
    
    private func factoryAnnotation()
    {
        let model:ModelListItem = controller.model
        let annotation:ModelMapAnnotation = ModelMapAnnotation(
            modelListItem:model)
        self.annotation = annotation
        
        addAnnotation(annotation)
    }
    
    private func centerOnAnnotation()
    {
        guard
            
            let coordinate:CLLocationCoordinate2D = annotation?.coordinate
            
        else
        {
            return
        }
        
        let span:MKCoordinateSpan = MKCoordinateSpan(
            latitudeDelta:kSpanSize,
            longitudeDelta:kSpanSize)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(
            coordinate,
            span)
        setRegion(region, animated:true)
    }
    
    //MARK: internal
    
    func viewDidAppear()
    {
        if annotation == nil
        {
            factoryAnnotation()
        }
        
        centerOnAnnotation()
    }
}
