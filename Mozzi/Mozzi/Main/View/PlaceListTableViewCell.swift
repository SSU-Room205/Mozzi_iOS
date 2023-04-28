//
//  PlaceListTableViewCell.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/04/05.
//

import UIKit

class PlaceListTableViewCell: UITableViewCell {
    
    static let identifier = "placeListTableViewCell"
    
    private lazy var placeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.makeCornerRound(radius: 10)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium(ofSize: 16)
        return label
    }()
    
    private let placeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardBold(ofSize: 14)
        return label
    }()
    
    private let placeSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardThin(ofSize: 12)
        label.tintColor = .lightGray
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardThin(ofSize: 16)
        return label
    }()
    
    private lazy var infomationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.addArrangeSubViews(itemLabel,placeTitleLabel,placeSubTitleLabel,priceLabel)
        return stackView
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
        setLayout()
    }
    
    private func setLayout(){
        contentView.addSubviews(placeImageView,infomationStackView)
        
        placeImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(180)
            $0.height.equalTo(100)
        }
        infomationStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(placeImageView.snp.trailing).offset(20)
        }
    }
    
    func configureCell(_ Consum: Consum1) {
        placeImageView.image = Consum.image
        itemLabel.text = Consum.itemName
        placeTitleLabel.text = Consum.name
        placeSubTitleLabel.text = Consum.address
        priceLabel.text = Consum.price
           
        }
}
