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
        
        tableView.sectionHeaderHeight = 70.0
        tableView.sectionFooterHeight = 25.0
        tableView.register(UINib(nibName: "NewsTableHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "NewsTableHeader")
        tableView.register(UINib(nibName: "NewsTableFooter", bundle: nibBundle), forHeaderFooterViewReuseIdentifier: "NewsTableFooter")
        
        
        
    }
    
    @objc func test() {
        print("YES")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        
        return cell
    }
    
    
}

extension NewsController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableHeader") as! NewsTableHeader
        
        let icon = UIImage(named: Friends.userFriendsArray[section].fotoFriend)
        let userName = Friends.userFriendsArray[section].nameFriend
        header.iconAvatarView.image = icon
        header.nameUserLabel.text = userName
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsTableFooter") as! NewsTableFooter
        
        return footer
    }
    
}
