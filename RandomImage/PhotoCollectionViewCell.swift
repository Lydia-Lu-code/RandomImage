//
//  PhotoCollectionViewCell.swift
//  RandomImage
//
//  Created by 維衣 on 2020/11/5.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    enum Keep {
        case photo
    }
    struct Photo: Hashable {
        var name: String
    }
}
