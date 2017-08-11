import UIKit

extension ControllerList:UISearchBarDelegate
{
    private func asyncUpdateDisplayItems()
    {
        guard
        
            let searchString:String = viewListBar.text
        
        else
        {
            return
        }
        
        model.updateDisplayItems(searchString:searchString)
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.updatedDisplayItems()
        }
    }
    
    private func updatedDisplayItems()
    {
        guard
            
            let view:ViewList = self.view as? ViewList
            
        else
        {
            return
        }
        
        view.collectionView.reloadData()
    }
    
    //MARK: internal
    
    func refreshDisplayItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncUpdateDisplayItems()
        }
    }
    
    //MARK: searchBar delegate
    
    func searchBar(
        _ searchBar:UISearchBar,
        textDidChange searchText:String)
    {
        refreshDisplayItems()
    }
}
