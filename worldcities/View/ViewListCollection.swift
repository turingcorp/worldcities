import UIKit

extension ViewList
{
    //MARK: private
    
    private func modelAtIndex(indexPath:IndexPath) -> ModelListItem
    {
        let item:ModelListItem = controller.model.items[indexPath.item]
        
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
}
