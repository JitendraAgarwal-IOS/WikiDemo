//
//  ViewController.swift
//  WikipediaDemo

//  Created by Agarwal, JitendraKumar on 6/24/18.
//  Copyright © 2018 Agarwal, JitendraKumar. All rights reserved.
//


import UIKit

class WikiSearchlistVC: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblNoRecord: UILabel!
    @IBOutlet weak var tblSearch: UITableView!
    fileprivate var modelObj: SearchModel!
    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        self.intinalSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
}


// MARK:- User Defile Function
extension WikiSearchlistVC {
    
    fileprivate func intinalSetup() {
        self.tblSearch.estimatedRowHeight = 90
        self.tblSearch.rowHeight = UITableViewAutomaticDimension
        self.tableHide()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "Welcome Wikipedia"
        searchController = UISearchController(searchResultsController: nil) // Search Controller
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        //  searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = false
    }
    fileprivate func tableShow() {
        self.lblNoRecord.isHidden = true
        self.tblSearch.isHidden = false
        searchController.searchBar.endEditing(true)
        DispatchQueue.main.async(execute: {
            self.searchController.searchBar.endEditing(true)
            self.searchController.isActive = false
            self.searchController.dismiss(animated: true)
            self.tblSearch.reloadData()
        })
        
    }
    fileprivate func tableHide() {
        self.lblNoRecord.isHidden = false
        self.tblSearch.isHidden = true
    }
    
    
}
// MARK:- TableView Delagte
extension WikiSearchlistVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.modelObj == nil) ? 0 : (self.modelObj.pages?.count)!
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WikiSearchCell.self), for: indexPath) as! WikiSearchCell
        cell.datasource = self.modelObj.pages?[indexPath.row]
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat{
        return  UITableViewAutomaticDimension
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let sKey =  self.modelObj.pages![indexPath.row].title!.removingWhitespaces()
        let url =    String("https://en.wikipedia.org/wiki/\(String(describing:sKey))")
        UIApplication.shared.openURL(NSURL(string:url) as! URL)
        
        
    }
}

// MARK:- Search Delagte

extension WikiSearchlistVC {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    func searchDisplayControllerDidBeginSearch(_ searchBar: UISearchBar) {
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.fetchSearchResult(searchKey: searchBar.text)
        
        
    }
}
// API Call
extension WikiSearchlistVC
{
    fileprivate func fetchSearchResult(searchKey: String?) {
        APIHandler.handler.getWikiSearchResult(searchKey: searchKey, success: { (response) in
            
            let dict = (response?.dictionary)!
            if let _ = (dict["query"]?.dictionaryObject) {
                self.modelObj = SearchModel(JSON:(dict["query"]?.dictionaryObject)!)
                
                if let _ = self.modelObj {
                    if (self.modelObj.pages?.count)! > 0 {
                        self.tableShow()
                    }else{
                        self.tableHide()
                    }
                    
                }
            }
            else{
                self.tableHide()
            }
            
        }, failure: { (error) in
            self.tableHide()
        })
        
    }
    
}



