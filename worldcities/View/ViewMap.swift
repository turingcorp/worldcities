import UIKit
import MapKit

class ViewMap:MKMapView
{
    private weak var controller:ControllerMap!
    private weak var annotation:ModelMapAnnotation?
    
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
    
    private func centerOnAnnotation()
    {
        
    }
    
    //MARK: internal
    
    func viewDidAppear()
    {
        guard
            
            let annotation:ModelMapAnnotation = self.annotation
        
        else
        {
            let model:ModelListItem = controller.model
            let annotation:ModelMapAnnotation = ModelMapAnnotation(
                modelListItem:model)
            self.annotation = annotation
            
            addAnnotation(annotation)
            centerOnAnnotation()
            
            return
        }
        
        centerOnAnnotation()
    }
}
