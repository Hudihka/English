//
//  MenuTableView.swift
//  English
//
//  Created by Константин Ирошников on 15.07.2021.
//

import UIKit

class MenuTableView: UITableView {
    
    var tapedCell: (String) -> Void = {_ in }
    
    fileprivate var profile: Profile?{
        return FirebaseData.shared.profile
    }
    
    fileprivate var favoritCount: Int {
        if let profile = profile {
            return profile.countFavorit
        }
        
        return 0
    }
    
    fileprivate var isTwoSection: Bool {
        return favoritCount >= FAVORIT_COUNT
    }
    
    fileprivate var lists: [List]{
        return profile?.lists ?? []
    }

    init() {
        super.init(frame: CGRect(), style: .grouped)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
        self.estimatedRowHeight = 100.0
        self.rowHeight = UITableView.automaticDimension

        self.register(FavoriteWords.self, forCellReuseIdentifier: "FavoriteWords")
        self.register(ListCell.self, forCellReuseIdentifier: "ListCell")

        self.register(HederCells.self, forHeaderFooterViewReuseIdentifier: "HederCells")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isTwoSection ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
        if isTwoSection, section == 0 {
            return 1
        } else {
            return 1//lists.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isTwoSection, indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteWords") as! FavoriteWords
            cell.count = favoritCount
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
            cell.list = lists[indexPath.row]
            
            return cell
        }
        
    }

    //MARK: - ХЕДЕР
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isTwoSection, section == 0 {
            return nil
        }
        
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HederCells") as! HederCells
        let count = profile?.countWords ?? 0
        cell.text = "Всего \(lists.count) тем, \(count) слов"
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //MARK: - тап
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isTwoSection, indexPath.section == 0 {
            tapedCell(FAVORIT_NAME)
        } else {
            let name = lists[indexPath.row].name
            tapedCell(name)
        }
    }
    
}
