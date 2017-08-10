import UIKit

class ControllerList:UIViewController
{
    init()
    {
        super.init(nibName:nil, bundle:nil)
        navigationItem.titleView = ViewListBar()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let view:ViewList = ViewList(controller:self)
        self.view = view
    }
}
