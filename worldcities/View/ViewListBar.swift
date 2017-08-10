import UIKit

class ViewListBar:UISearchBar
{
    init()
    {
        super.init(frame:CGRect.zero)
        backgroundColor = UIColor.clear
        searchBarStyle = UISearchBarStyle.minimal
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
