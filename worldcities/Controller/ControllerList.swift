import UIKit

class ControllerList:UIViewController
{
    let model:ModelList
    private weak var viewListBar:ViewListBar!
    
    init()
    {
        model = ModelList()
        
        super.init(nibName:nil, bundle:nil)
        
        let viewListBar:ViewListBar = ViewListBar()
        self.viewListBar = viewListBar
        navigationItem.titleView = viewListBar
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        model.loadItems()
    }
}
