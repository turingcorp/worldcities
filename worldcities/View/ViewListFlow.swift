import UIKit

class ViewListFlow:UICollectionViewFlowLayout
{
    private let kCellSeparation:CGFloat = 1
    
    override init()
    {
        super.init()
        headerReferenceSize = CGSize.zero
        footerReferenceSize = CGSize.zero
        minimumLineSpacing = kCellSeparation
        minimumInteritemSpacing = kCellSeparation
        scrollDirection = UICollectionViewScrollDirection.vertical
        sectionInset = UIEdgeInsets(
            top:kCellSeparation,
            left:0,
            bottom:kCellSeparation,
            right:0)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func shouldInvalidateLayout(
        forBoundsChange newBounds:CGRect) -> Bool
    {
        return false
    }
}
