import UIKit

class NavigationController:UINavigationController
{
    init()
    {
        super.init(nibName:nil, bundle:nil)
        
        let list:ControllerList = ControllerList()
        addChildViewController(list)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
