import UIKit

class NavigationController:UINavigationController
{
    init()
    {
        super.init(nibName:nil, bundle:nil)
        
        let controllerList:ControllerList = ControllerList()
        addChildViewController(controllerList)
        
        navigationBar.barTintColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
