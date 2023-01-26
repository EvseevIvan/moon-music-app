//
//  NewAlbumCollectionViewCell.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 18.01.2023.
//

import UIKit
import SDWebImage

class NewAlbumCollectionViewCell: UICollectionViewCell {
    var nameOfAlbum: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    var imageOfAlbum: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    static let identifier = "NewAlbumCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(with track: Track) {
//
//        nameOfAlbum.text = track.name
////        let image = track.album.images[0].url
////        guard let url = URL(string: image) else { return }
////        imageOfAlbum.sd_setImage(with: url, completed: nil)
//        imageOfAlbum.image = UIImage(systemName: "play.fill")
//        imageOfAlbum.layer.cornerRadius = 10
//
//    }
//
    func configure(with album: Album, indexPath: IndexPath) {
        self.nameOfAlbum.text = album.tracks.items[indexPath.row].name
//        self.nameOfArist.text = album.tracks.items[indexPath.row].artists[0].name
        let url = URL(string: album.images[0].url)
        self.imageOfAlbum.sd_setImage(with: url)
        self.imageOfAlbum.sd_imageIndicator = SDWebImageActivityIndicator.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameOfAlbum.frame = CGRect(x: 5, y: contentView.frame.size.height-50, width: contentView.frame.size.width-10, height: 50)
        imageOfAlbum.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width-10, height: contentView.frame.size.height-50)
        contentView.addSubview(nameOfAlbum)
        contentView.addSubview(imageOfAlbum)

    }
    
    
}
