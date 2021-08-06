//
//  MasterSlitTableView.swift
//  English
//
//  Created by Hudihka on 06/08/2021.
//

import UIKit

class MasterSlitTableView: UITableView {
	
	private var presenter: MenuPresenterProtocol?
	private var rusEngWay: Bool = true
    
    var countTrue: Int = 0
    var countFalse: Int = 0
	
	var wordsAnswer: [WordAnswer]{
		didSet {
			reloadData()
		}
    }

	init(presenter: MenuPresenterProtocol?, rusEngWay: Bool) {
		super.init(frame: CGRect(), style: .grouped)
        
        delegate = self
        dataSource = self
        
        separatorStyle = .none
		backgroundColor = .white
        
        estimatedRowHeight = 100.0
        rowHeight = UITableView.automaticDimension

        register(CellMaster.self, forCellReuseIdentifier: "CellMaster")
        register(MasterHeder.self, forHeaderFooterViewReuseIdentifier: "MasterHeder")
		
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMaster") as! CellMaster
		cell.rusEngl = rusEngWay
		cell.wordAnswer = wordsAnswer[indexPath.row]
        
		return cell
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

