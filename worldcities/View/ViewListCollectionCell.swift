import UIKit

class ViewListCollectionCell:UICollectionViewCell
{
    static let reusableIdentifier:String = "listCell"
    
    override init(frame:CGRect)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
