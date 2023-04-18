//
//  PlaceListTableViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/05.
//

import UIKit

class PlaceListTableViewCell: UITableViewCell {
    
    private lazy var placeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let placeTitleLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(20)
        return label
    }()
    
    private let placeSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(15)
        return label
    }()
    
    private let placeLocationLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(15)
        return label
    }()
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    private func setLayout(){
        
    }
}
