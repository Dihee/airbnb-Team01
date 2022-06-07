//
//  RecommendedTravelDestinationCell.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/27.
//

import UIKit

final class RecommendedTravelDestinationCell: UICollectionViewCell {
    
    static let identifier = "RecommendedTravelDestinationCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .gray5
        imageView.image = Image.placeImage // 임시 이미지
        return imageView
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "자연생활을 만끽할 수\n있는 숙소" // 임시 텍스트
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func layout() {
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(contentsLabel)
        
        stackView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
        }
    }
}
    
