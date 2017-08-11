import UIKit

class ViewList:
    UIView,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    private(set) weak var collectionView:UICollectionView!
    private(set) weak var controller:ControllerList!
    private weak var viewListFlow:ViewListFlow!
    private weak var activityIndicator:UIActivityIndicatorView?
    private let kCellHeight:CGFloat = 50
    
    init(controller:ControllerList)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor(white:0.95, alpha:1)
        self.controller = controller
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let cellSize:CGSize = CGSize(
            width:width,
            height:kCellHeight)
        
        viewListFlow.itemSize = cellSize
        viewListFlow.invalidateLayout()
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
        
        let viewListFlow:ViewListFlow = ViewListFlow()
        self.viewListFlow = viewListFlow
        
        let collectionView:UICollectionView = UICollectionView(
            frame:CGRect.zero,
            collectionViewLayout:viewListFlow)
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
