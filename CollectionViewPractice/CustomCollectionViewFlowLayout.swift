//
//  CustomCollectionViewFlowLayout.swift
//  CollectionViewPractice
//
//  Created by 岩本康孝 on 2021/05/14.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        register(CustomCollectionReusableView.self, forDecorationViewOfKind: "CustomCollectionReusableView")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // layoutAttributesArray: 各セクションの各セルのAttributeが全て入っている
        guard let layoutAttributesArray = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        let decorationViewAttributes = layoutAttributesArray.compactMap {
            return self.layoutAttributesForDecorationView(ofKind: "CustomCollectionReusableView", at: $0.indexPath)
        }
        return layoutAttributesArray + decorationViewAttributes
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let item = layoutAttributesForItem(at: indexPath) else { return nil }
        let layoutAttirbutes = UICollectionViewLayoutAttributes(forDecorationViewOfKind: elementKind, with: indexPath)
        
        layoutAttirbutes.frame = CGRect(
            x: item.frame.origin.x,
            y: item.frame.origin.y,
            width: item.frame.width,
            height: item.frame.height
        )
        layoutAttirbutes.zIndex = -1
        
        return layoutAttirbutes
    }
}
