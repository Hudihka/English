//
//  MasterSlitTableView.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import UIKit

class MasterSlitTableView: UITableView {
    
    var tapedCell: (List?, String?) -> Void = {_,_ in }
	
	private var presenter: MenuPresenterProtocol?
    
    var countTrue: Int = 0
    var countFalse: Int = 0
	
	var wordsAnswer: [WordAnswer]{
		didSet {
			self.reloadData()
		}
    }

    init(presenter: MenuPresenterProtocol?) {
		super.init(frame: CGRect(), style: .grouped)
        
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
        self.estimatedRowHeight = 100.0
        self.rowHeight = UITableView.automaticDimension

        self.register(FavoriteWords.self, forCellReuseIdentifier: "FavoriteWords")
        self.register(MasterHeder.self, forHeaderFooterViewReuseIdentifier: "MasterHeder")
		
		self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MasterSlitTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return wordsAnswer.count
    }
    
    func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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

        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MasterHeder") as! MasterHeder
		cell.countFalse = countFalse
		cell.countTrue = countTrue
		cell.count = wordsAnswer.count

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
        
        
    }

}

