import UIKit

class ViewListCollectionCell:UICollectionViewCell
{
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
