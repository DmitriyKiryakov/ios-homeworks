

import UIKit

protocol CustomCellDeligate: AnyObject{
    func didTapImageInCell(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}


final class CustomCollectionViewCell2: UICollectionViewCell
{
    weak var delegate: CustomCellDeligate?
    
    private var indexPathCell = IndexPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        addGesture()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupCell(img: Images) {
        imageView.image = UIImage(named: img.image)
    }
    
    func setIndexPath(_ indexPath: IndexPath){
        indexPathCell = indexPath
    }
    
    
    private func addGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        imageView.addGestureRecognizer(tapGesture)
        print("Gesture added")
    }
    
    @objc func imageTap(){
        print("Image taped")
        delegate?.didTapImageInCell(imageView.image, imageRect: imageView.frame, indexPath: indexPathCell)

    }
  
    private func layout(){
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
}
