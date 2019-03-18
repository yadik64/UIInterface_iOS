//
//  NewsController.swift
//  AuthorizationVK
//
//  Created by Дмитрий Яровой on 17/03/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class NewsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Новости"
        
        tableView.sectionHeaderHeight = 70.0
        tableView.sectionFooterHeight = 25.0
        tableView.register(UINib(nibName: "NewsTableHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "NewsTableHeader")
        tableView.register(UINib(nibName: "NewsTableFooter", bundle: nibBundle), forHeaderFooterViewReuseIdentifier: "NewsTableFooter")
    }
    

}

extension NewsController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Friends.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.textPostLabel.text = Friends.newsArray[indexPath.section].text
        cell.imagePostView.image = UIImage(named: Friends.newsArray[indexPath.section].newsPhotoName?[0] ?? "newsPhoto2")

        return cell
    }
    
    
}

extension NewsController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableHeader") as! NewsTableHeader
        
        header.contentView.backgroundColor = UIColor.white
        
        let icon = UIImage(named: Friends.newsArray[section].fotoFriend)
        let userName = Friends.newsArray[section].nameFriend
        header.iconAvatarView.image = icon
        header.nameUserLabel.text = userName
        header.creationTimeLabel.text = Friends.newsArray[section].creationTime

        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableFooter") as! NewsTableFooter
        
        footer.likeLabel.text = String(Friends.newsArray[section].likeCount)
        footer.viewedCount.text = String(Friends.newsArray[section].viewedCount)
        return footer
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}

