import UIKit

class ViewList:UIView
{
    private weak var controller:ControllerList!
    
    init(controller:ControllerList)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
