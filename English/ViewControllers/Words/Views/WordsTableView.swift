//
//  WordsTableView.swift
//  English
//
//  Created by Константин Ирошников on 02.08.2021.
//

import Foundation
import UIKit

class WordsTableView: UITableView {
	private var presenter: WordsPresenterProtocol?

    var words: [Word] = [] {
        didSet{
            self.reloadData()
        }
    }

    init(presenter: WordsPresenterProtocol?) {
        super.init(frame: CGRect(), style: .grouped)

        self.delegate = self
        self.dataSource = self

        self.separatorStyle = .none
		self.backgroundColor = .clear

        self.estimatedRowHeight = 100.0
        self.rowHeight = UITableView.automaticDimension

        self.register(WordCell.self, forCellReuseIdentifier: "WordCell")
		self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension WordsTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as! WordCell
		cell.word = words[indexPath.row]

		return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    //MARK: - тап
//
//    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)
//    {
//        guard let cell = tableView.cellForRow(at: indexPath) else {
//            return
//        }
//
//        UIView.animate(withDuration: 0.25) {
//
//            cell.transform = CGAffineTransform(scaleX: 0.97, y: 0.85)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)
//    {
//        guard let cell = tableView.cellForRow(at: indexPath) else {
//            return
//        }
//
//        UIView.animate(withDuration: 0.25) {
//            cell.transform = .identity
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        if isTwoSection, indexPath.section == 0 {
//            tapedCell(nil, FAVORIT_NAME)
//        } else {
//            let list = lists[indexPath.row]
//            tapedCell(list, nil)
//        }
//    }
//
//    //MARK: Контекстное меню
//    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
//        if isTwoSection, indexPath.section == 0 {
//            return nil
//        }
//
//        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
//            let action1 = UIAction(title: "Переименовать", image: UIImage(systemName: "square.and.pencil")) {[weak self] _ in
//                guard let self = self else {return}
//
//                let oldName = self.lists[indexPath.row].name
//                self.tapedRename(oldName)
//            }
//
//            let action2 = UIAction(title: "Добавить слово", image: UIImage(systemName: "plus")) {[weak self] _ in
//                guard let self = self else {return}
//
//                let list = self.lists[indexPath.row]
//                self.tapedAdd(list)
//            }
//
//            let menu1 = UIMenu(title: "", options: .displayInline, children: [action1])
//            let menu2 = UIMenu(title: "", options: .displayInline, children: [action2])
//
//            return UIMenu(title: "", children: [menu1, menu2])
//        }
//
//        return configuration
//    }

}
