import UIKit
import MapKit

class ViewMap:MKMapView
{
    private(set) weak var controller:ControllerMap!
    
    init(controller:ControllerMap)
    {
        super.init(frame:CGRect.zero)
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
