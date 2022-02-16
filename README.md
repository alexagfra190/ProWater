# ProWaternosirva

//
//  MAPSAPIViewController.swift
//  ProWater
//
//  Created by Andre Alexander Aguirre Franco on 15/02/22.
//

import UIKit
import GooglePlaces

class MAPSAPIViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var searchbarContainer: UIView!
    
    private var tableView: UITableView!
    private var tableDataSource: GMSAutocompleteTableDataSource!
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?

    @IBOutlet weak var tableResults: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSPlacesClient.provideAPIKey(Strings.API_KEY)
           //let searchBar = UISearchBar(frame: CGRect(x: 0, y: 110, width: self.view.frame.size.width-70, height: 44.0))
           searchbar.delegate = self
        //searchbar.isTranslucent = true
        searchbar.backgroundColor = .black
           //view.addSubview(searchbar)

           tableDataSource = GMSAutocompleteTableDataSource()
           tableDataSource.delegate = self

           //tableView = UITableView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 100))
        tableResults.delegate = tableDataSource
        tableResults.dataSource = tableDataSource
        tableResults.isHidden = true
           //view.addSubview(tableResults)
    }
    
    
}

extension MAPSAPIViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    // Update the GMSAutocompleteTableDataSource with the search text.
      tableResults.isHidden = false
    tableDataSource.sourceTextHasChanged(searchText)
  }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension MAPSAPIViewController: GMSAutocompleteTableDataSourceDelegate {
  func didUpdateAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
    // Turn the network activity indicator off.
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
    // Reload table data.
      tableResults.reloadData()
  }

  func didRequestAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
    // Turn the network activity indicator on.
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    // Reload table data.
      tableResults.reloadData()
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
    // Do something with the selected place.
    print("Place name: \(place.name)")
    print("Place address: \(place.formattedAddress)")
    print("Place attributions: \(place.attributions)")
      searchbar.resignFirstResponder()
      tableResults.isHidden = true
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
    // Handle the error.
    print("Error: \(error.localizedDescription)")
  }

  func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didSelect prediction: GMSAutocompletePrediction) -> Bool {
    return true
  }
}

