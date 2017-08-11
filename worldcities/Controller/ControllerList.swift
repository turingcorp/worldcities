import UIKit

class ControllerList:UIViewController
{
    let model:ModelList
    private(set) weak var viewListBar:ViewListBar!
    
    init()
    {
        model = ModelList()
        
        super.init(nibName:nil, bundle:nil)
        
        let viewListBar:ViewListBar = ViewListBar()
        viewListBar.delegate = self
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
        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        
        model.loadItems
        { [weak self] in
            
            self?.refreshDisplayItems()
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.itemsLoaded()
            }
        }
    }
    
    //MARK: private
    
    private func itemsLoaded()
    {
        viewListBar.isHidden = false
        
        guard
        
            let view:ViewList = self.view as? ViewList
        
        else
        {
            return
        }
        
        view.itemsLoaded()
    }
}
