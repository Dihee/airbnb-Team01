//
//  CityViewCell.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit
import SnapKit

final class CityViewCell: UITableViewCell {
    
    static let identifier = "CityViewCell"
    
    private let cityImageView = UIImageView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray3
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.layer.backgroundColor = selected ? UIColor.gray5.cgColor : UIColor.white.cgColor
    }
    
    private func layout() {
        contentView.addSubview(cityImageView)
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(distanceLabel)

        cityImageView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.width.height.equalTo(65)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(cityImageView)
            $0.leading.equalTo(cityImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-16)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
    }
}

// MARK: - functions

extension CityViewCell {
    func setData(image: String, city: String, distance: String) {
        cityImageView.image = UIImage(named: "\(image)")
        cityLabel.text = city
        distanceLabel.text = distance
    }
}
