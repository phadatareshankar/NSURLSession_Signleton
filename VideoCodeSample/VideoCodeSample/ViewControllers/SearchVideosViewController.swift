//
//  SearchVideosViewController.swift
//  VideoCodeSample
//
//  Created by Shankar Phadatare on 10/4/17.
//  Copyright © 2017 Shankar Phadatare. All rights reserved.
//

import UIKit


class SearchVideosViewController: UIViewController, UISearchBarDelegate{

    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var videoTableView: UITableView!
    var videoIdArray = [itemVideo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSearchVidoes(searchStr: "Apple news");
        
    }
    
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        
        searchBar.resignFirstResponder()
        
    }
    
    // MARK: SearchBar Delegates 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        videoIdArray.removeAll();
        getSearchVidoes(searchStr: searchBar.text!);
        searchBar.resignFirstResponder()
    }
    
    
    // MARK: Search Video Youtube API Request
    func getSearchVidoes(searchStr:String)
    {
        let videoSearchHelper = VideoSearchHelper.sharedInstance;
        videoSearchHelper.delegate = self as VideoSearchDelegate
        videoSearchHelper.getVideoSearchResult(searchStr: searchStr as NSString);
        
    }
    
    // MARK: Show Error Messages
    func showErrorAlert(errorStr:String) {
        
        let alert = UIAlertController(title: TECHNICAL_ERROR_TITLE, message: errorStr, preferredStyle: .alert);
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil);
        
        alert.addAction(action);
        
        self.present(alert, animated: true) {
            print("presented alert");
        }
    }
    
    // MARK: Reload Table Data
    func reloadVideoTableView()  {
        
        DispatchQueue.main.async {
            self.videoTableView.reloadData()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK:  TableView and Delegates

extension SearchVideosViewController:UITableViewDelegate,UITableViewDataSource,VideoSearchDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
        
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if let count = self.videoTableView.indexPathsForVisibleRows?.count, count>0 {
            
//            let middleVisibleIndexPath = self.videoTableView.indexPathsForVisibleRows![(count/2)]
//            print(middleVisibleIndexPath.row);
//            let cell = self.videoTableView.cellForRow(at: middleVisibleIndexPath) as! VideoTableViewCell
//
//            cell.playerView.playVideo()
            
        }
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
    
    // MARK: TableView Delegates and Data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoIdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let identifier = "videoCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! VideoTableViewCell
        let videoItem = videoIdArray[indexPath.row];
        
        DispatchQueue.main.async {
            
            cell.videoNameLable.text = videoItem.snippet.title;
            cell.playerView.load(withVideoId: videoItem.id.videoId)
            
            //let playerVars = ["playsinline":"1"];
            //cell.playerView.load(withVideoId: videoItem.id.videoId, playerVars: playerVars);
            
        }
        
        return cell
        
    }
    
    func didRecievedError(errorMsg:String){
        
        self.showErrorAlert(errorStr: errorMsg);
    }
    
    func didReceiveResponseObject(videoData:VideoData){
        
        for item in  videoData.items
        {
            self.videoIdArray.append(item)
        }
        
        self.reloadVideoTableView()
    }

}
