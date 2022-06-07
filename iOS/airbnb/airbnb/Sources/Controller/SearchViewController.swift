//
//  SearchViewController.swift
//  
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit
import SnapKit
import MapKit

final class SearchViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private var searchCompleter = MKLocalSearchCompleter() // 자동완성 도와주는 객체
    private var dataSource = SearchTableViewDataSource()
    
    private lazy var rightButton = UIBarButtonItem(title: "지우기", style: .plain, target: self, action: #selector(didTabRemoveButton))

    private let navigationBarUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.text = Title.searchBarTableViewTitle
        return label
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = Title.searchBarPlaceholder
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        layout()
    }
    
    private func configureView() {
        title = "숙소 찾기"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.becomeFirstResponder() // First Responder 로 지정
        
        rightButton.tintColor = .gray3
        
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false // 네비게이션 타이틀 유지
        searchController.automaticallyShowsCancelButton = false
        // cancle 버튼 삭제
        
        tableView.register(CityViewCell.self, forCellReuseIdentifier: CityViewCell.identifier)
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        tableView.dataSource = dataSource
        
        searchCompleter.delegate = self
    }
    
    private func layout() {
        view.addSubview(navigationBarUnderLineView)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        navigationBarUnderLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(40)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - extension

extension SearchViewController {
    @objc func didTabRemoveButton(_ sender: Any) {
        searchController.searchBar.text = ""
        dataSource.didStartSearch(isSearching: false)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataSource.didStartSearch(isSearching: false)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } else {
            dataSource.didStartSearch(isSearching: true)
            searchCompleter.queryFragment = searchText
        }
    }
}

extension SearchViewController: MKLocalSearchCompleterDelegate {
    // 자동완성 시 결과를 받는 함수
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        let result = completer.results
        dataSource.didGetTheResults(result: result)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
