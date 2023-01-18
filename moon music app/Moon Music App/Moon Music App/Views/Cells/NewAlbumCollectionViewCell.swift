//
//  NewAlbumCollectionViewCell.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 18.01.2023.
//

import UIKit
import SDWebImage

class NewAlbumCollectionViewCell: UICollectionViewCell {
    var nameOfAlbum: UILabel!
    var imageOfAlbum: UIImageView!
    static let identifier = "NewAlbumCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.addSubview(nameOfAlbum)
        contentView.addSubview(imageOfAlbum)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with album: Item) {
        
        nameOfAlbum.text = album.name
        let url = URL(string: "\(album.images[0])")
        imageOfAlbum.sd_setImage(with: url, completed: nil)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameOfAlbum.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
        imageOfAlbum.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width-10, height: contentView.frame.size.height-50)

    }
    
    
}
