//
//  SearchTableViewDataSource.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/06/06.
//

import UIKit
import MapKit

final class SearchTableViewDataSource: NSObject, UITableViewDataSource {

    private let cityData = CityData.dataList
    private var isSearching = false
    private var searchResult = [MKLocalSearchCompletion]() // 자동완성한 결과를 담는 객체

    func numberOfSections(in tableView: UITableView) -> Int {
        isSearching ? 1 : cityData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearching ? searchResult.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching {
            tableView.separatorColor = .line
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else {
                return UITableViewCell()
            }
            return makeLocationCell(cell: cell, indexPath: indexPath)
        } else {
            tableView.separatorColor = .clear
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CityViewCell.identifier, for: indexPath) as? CityViewCell else {
                return UITableViewCell()
            }
            return makeCityCell(cell: cell, indexPath: indexPath)
        }
    }
    
    private func makeLocationCell(cell: LocationTableViewCell, indexPath: IndexPath) -> LocationTableViewCell {
        let target = searchResult[indexPath.row]

        cell.setData(title: target.title)
        return cell
    }
    
    private func makeCityCell(cell: CityViewCell, indexPath: IndexPath) -> CityViewCell {
        let target = cityData[indexPath.section]
        
        cell.setData(image: target.image, city: target.city, distance: target.distance)
        return cell
    }
}

extension SearchTableViewDataSource {
    func didStartSearch(isSearching: Bool) {
        self.isSearching = isSearching
    }
    
    func didGetTheResults(result: [MKLocalSearchCompletion]) {
        searchResult = result
    }
}
