import UIKit

class ControllerList:UIViewController
{
    let model:ModelList
    let kEmptyString:String = ""
    private(set) weak var viewListBar:ViewListBar!
    
    init()
    {
        model = ModelList()
        
        super.init(nibName:nil, bundle:nil)
        title = NSLocalizedString("ControllerList_title", comment:"")
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
        {   
            DispatchQueue.main.async
            { [weak self] in
                
                self?.itemsLoaded()
                self?.refreshDisplayItems()
            }
        }
    }
    
    //MARK: private
    
    private func itemsLoaded()
    {
        factorySearchBar()
        
        guard
        
            let view:ViewList = self.view as? ViewList
        
        else
        {
            return
        }
        
        view.itemsLoaded()
    }
    
    private func factorySearchBar()
    {
        title = nil
        
        let viewListBar:ViewListBar = ViewListBar()
        viewListBar.text = kEmptyString
        viewListBar.delegate = self
        self.viewListBar = viewListBar
        navigationItem.titleView = viewListBar
    }
}
