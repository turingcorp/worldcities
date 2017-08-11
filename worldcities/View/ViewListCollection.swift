import UIKit

extension ViewList
{
    private static let kDeselectTime:TimeInterval = 0.3
    
    //MARK: private
    
    private func modelAtIndex(indexPath:IndexPath) -> ModelListItem
    {
        let item:ModelListItem = controller.model.displayItems[indexPath.item]
        
        return item
    }
    
    //MARK: internal
    
    func numberOfSections(
        in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.displayItems.count
        
        return count
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:ModelListItem = modelAtIndex(indexPath:indexPath)
        
        let cell:ViewListCollectionCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            ViewListCollectionCell.reusableIdentifier,
            for:indexPath) as! ViewListCollectionCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:ModelListItem = modelAtIndex(indexPath:indexPath)
        controller.openMap(item:item)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + ViewList.kDeselectTime)
        { [weak collectionView] in
            
            collectionView?.selectItem(
                at:nil,
                animated:false,
                scrollPosition:UICollectionViewScrollPosition())
            collectionView?.isUserInteractionEnabled = true
        }
    }
}
