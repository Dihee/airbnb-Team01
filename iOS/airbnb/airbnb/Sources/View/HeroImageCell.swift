//
//  HeroImageCell.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/25.
//

import UIKit
import SnapKit

final class HeroImageCell: UICollectionViewCell {
    
    static let identifier = "HeroImageCell"
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "heroImageBackground")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.numberOfLines = 0
        label.text = "슬기로운\n자연생활"
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.text = "에어비앤비가 엄선한\n위시리스트를 만나보세요."
        return label
    }()
    
    private let badgeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "여행 아이디어 얻기"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .gray1
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
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
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(contentsLabel)
        addSubview(badgeLabel)
        
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalTo(contentsLabel.snp.top).offset(-16)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalTo(badgeLabel.snp.top).offset(-16)
        }
        
        badgeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(200)
            $0.height.equalTo(45)
        }
    }
}
