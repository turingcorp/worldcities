import UIKit

class ControllerMap:UIViewController
{
    private(set) var model:ModelListItem!
    
    init(model:ModelListItem)
    {
        self.model = model
        
        super.init(nibName:nil, bundle:nil)
        title = model.displayString
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let view:ViewMap = ViewMap(controller:self)
        self.view = view
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        guard
        
            let view:ViewMap = self.view as? ViewMap
        
        else
        {
            return
        }
        
        view.viewDidAppear()
    }
}
