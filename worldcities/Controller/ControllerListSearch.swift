import UIKit

extension ControllerList:UISearchBarDelegate
{
    private func asyncRefreshDisplayItems()
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
        
        view.refreshItems()
    }
    
    //MARK: internal
    
    func refreshDisplayItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncRefreshDisplayItems()
        }
    }
    
    //MARK: searchBar delegate
    
    func searchBar(
        _ searchBar:UISearchBar,
        textDidChange searchText:String)
    {
        refreshDisplayItems()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar:UISearchBar)
    {
        searchBar.setShowsCancelButton(true, animated:true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar:UISearchBar)
    {
        searchBar.setShowsCancelButton(false, animated:true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar:UISearchBar)
    {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar:UISearchBar)
    {
        searchBar.resignFirstResponder()
        searchBar.text = kEmptyString
        refreshDisplayItems()
    }
}
