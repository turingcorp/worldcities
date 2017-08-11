import UIKit

class ViewList:
    UIView,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    var cellSize:CGSize?
    let kCellHeight:CGFloat = 50
    private weak var activityIndicator:UIActivityIndicatorView?
    private(set) weak var collectionView:UICollectionView!
    private(set) weak var controller:ControllerList!
    private let kCellSeparation:CGFloat = 1
    
    init(controller:ControllerList)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        self.controller = controller
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        cellSize = nil
        collectionView.collectionViewLayout.invalidateLayout()
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(
            activityIndicatorStyle:UIActivityIndicatorViewStyle.gray)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        self.activityIndicator = activityIndicator
        
        let flow:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flow.scrollDirection = UICollectionViewScrollDirection.vertical
        flow.headerReferenceSize = CGSize.zero
        flow.footerReferenceSize = CGSize.zero
        flow.minimumLineSpacing = kCellSeparation
        flow.minimumInteritemSpacing = kCellSeparation
        flow.sectionInset = UIEdgeInsets(
            top:kCellSeparation,
            left:0,
            bottom:kCellSeparation,
            right:0)
        
        let collectionView:UICollectionView = UICollectionView(
            frame:CGRect.zero,
            collectionViewLayout:flow)
        collectionView.isHidden = true
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            ViewListCollectionCell.self,
            forCellWithReuseIdentifier:
            ViewListCollectionCell.reusableIdentifier)
        self.collectionView = collectionView
        
        addSubview(activityIndicator)
        addSubview(collectionView)
        
        NSLayoutConstraint(
            item:activityIndicator,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.top,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:activityIndicator,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.bottom,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:activityIndicator,
            attribute:NSLayoutAttribute.left,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.left,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:activityIndicator,
            attribute:NSLayoutAttribute.right,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.right,
            multiplier:1,
            constant:0).isActive = true
        
        NSLayoutConstraint(
            item:collectionView,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.top,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:collectionView,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.bottom,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:collectionView,
            attribute:NSLayoutAttribute.left,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.left,
            multiplier:1,
            constant:0).isActive = true
        NSLayoutConstraint(
            item:collectionView,
            attribute:NSLayoutAttribute.right,
            relatedBy:NSLayoutRelation.equal,
            toItem:self,
            attribute:NSLayoutAttribute.right,
            multiplier:1,
            constant:0).isActive = true
    }
    
    //MARK: internal
    
    func itemsLoaded()
    {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        collectionView.isHidden = false
    }
}
