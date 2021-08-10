//
//  MenuTableView.swift
//  English
//
//  Created by Константин Ирошников on 15.07.2021.
//

import UIKit

class MenuTableView: UITableView {
    
    var tapedCell: (List?, String?) -> Void = {_,_ in }
    var tapedRename: (String) -> Void = {_ in }
	
	private var presenter: MenuPresenterProtocol?
    
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

    init(presenter: MenuPresenterProtocol?) {
        super.init(frame: CGRect(), style: .grouped)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
        self.estimatedRowHeight = 100.0
        self.rowHeight = UITableView.automaticDimension

        self.register(FavoriteWords.self, forCellReuseIdentifier: "FavoriteWords")
        self.register(ListCell.self, forCellReuseIdentifier: "ListCell")

        self.register(HederCells.self, forHeaderFooterViewReuseIdentifier: "HederCells")
		
		self.presenter = presenter
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
            return lists.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isTwoSection, indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteWords") as! FavoriteWords
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
            cell.list = lists[indexPath.row]
            
            return cell
        }
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    //MARK: - ХЕДЕР

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HederCells") as! HederCells
        if isTwoSection, section == 0 {
			cell.text = MenuEndpointsEnum.CellText.header(favoritCount).text
        } else {
            let count = profile?.countWords ?? 0
			cell.text = MenuEndpointsEnum.CellText.cell(countThem: lists.count,
				countWord: count).text
        }

        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - тап

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)
    {
        tableView.didHighlightRowAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)
    {
        tableView.didUnhighlightRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isTwoSection, indexPath.section == 0 {
            tapedCell(nil, FAVORIT_NAME)
        } else {
            let list = lists[indexPath.row]
            tapedCell(list, nil)
        }
    }

    //MARK: Контекстное меню
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        if isTwoSection, indexPath.section == 0 {
            return nil
        }

        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
			let action1 = UIAction(title: MenuEndpointsEnum.TableContextMenu.rename.rawValue,
								   image: UIImage(systemName: "square.and.pencil")) {[weak self] _ in
                guard let self = self else {return}

                let oldName = self.lists[indexPath.row].name
                self.tapedRename(oldName)
            }

			let action2 = UIAction(title: MenuEndpointsEnum.TableContextMenu.addWord.rawValue,
								   image: UIImage(systemName: "plus")) {[weak self] _ in
                guard let self = self else {return}

                let list = self.lists[indexPath.row]
				self.presenter?.newWordInTheme(list: list)
            }

            return UIMenu(title: "", children: [action1, action2])
        }

        return configuration
    }
    
}
