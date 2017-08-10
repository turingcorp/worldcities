import UIKit

class ViewListBar:UISearchBar
{
    init()
    {
        super.init(frame:CGRect.zero)
        isHidden = true
        backgroundColor = UIColor.clear
        searchBarStyle = UISearchBarStyle.minimal
        placeholder = NSLocalizedString("ViewListBar_placeholder", comment:"")
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
