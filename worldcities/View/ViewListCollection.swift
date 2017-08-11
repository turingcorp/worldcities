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
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let width:CGFloat = collectionView.bounds.width
            let cellSize:CGSize = CGSize(
                width:width,
                height:kCellHeight)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
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
