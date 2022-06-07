//
//  SearchTableView.swift
//  
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit
import SnapKit

final class SearchTableViewController: UIViewController {
    
    private let searchTableView = UITableView(frame: .zero, style: .plain)
    private let dataSource = SearchTableViewDataSource()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.text = Title.searchBarTableViewTitle
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        layout()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        searchTableView.dataSource = dataSource
        searchTableView.separatorStyle = .none
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(searchTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(16)
        }
        
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(40)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
