//
//  WordsTableView.swift
//  English
//
//  Created by Константин Ирошников on 02.08.2021.
//

import Foundation
import UIKit

class WordsTableView: UITableView {
    var deleteWord: (Word) -> Void = {_ in }

    var isFavoritList: Bool = false

	private var presenter: WordsPresenterProtocol?

    fileprivate var words: [Word] = [] 

    init(presenter: WordsPresenterProtocol?) {
        super.init(frame: CGRect(), style: .plain)

        self.delegate = self
        self.dataSource = self

        self.separatorStyle = .none
		self.backgroundColor = .clear

        self.estimatedRowHeight = 100.0
        self.rowHeight = UITableView.automaticDimension

        self.register(WordCell.self, forCellReuseIdentifier: "WordCell")
        self.register(WordCellDescription.self, forCellReuseIdentifier: "WordCellDescription")
		self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func wordsTable(wordsArray: [Word]?,
                    duration: TimeInterval = 0,
                    scroll: Bool = false) {//если нил, использум те что уже есть

        let newWords: [Word] = wordsArray == nil ? self.words : wordsArray!

        self.words = DefaultUtils.shared.translateWay == 0 ?
            newWords.sorted { $0.rusValue.lowercased() < $1.rusValue.lowercased() } :
            newWords.sorted { $0.engValue.lowercased() < $1.engValue.lowercased() }

        UIView.transition(with: self,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {

            self.reloadData()
        })

        if scroll {
            self.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }
    }

}

extension WordsTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let word = words[indexPath.row]

        if word.descript != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WordCellDescription") as! WordCellDescription
            cell.word = word
            cell.presenter = presenter

            return cell
        }

		let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as! WordCell
		cell.word = word
		cell.presenter = presenter

		return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
        if let cell = cellForRow(at: indexPath) as? WordCell {
            cell.showAnimate()
        }
    }

//    //MARK: Контекстное меню

    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) {[weak self] actions -> UIMenu? in

            let action1 = UIAction(title: WordsEndpoint.TableContextMenu.rename.rawValue,
								   image: UIImage(systemName: "square.and.pencil")) {[weak self] _ in
                guard let self = self else {return}

                let word = self.words[indexPath.row]
                self.presenter?.changeWord(word: word)
            }

			let action2 = UIAction(title: WordsEndpoint.TableContextMenu.delete.rawValue,
								   image: UIImage(systemName: "trash"),
								   attributes: .destructive) {[weak self] _ in
                guard let self = self else {return}

                let word = self.words[indexPath.row]
                self.deleteWord(word)
            }

            let menu1 = UIMenu(title: "", options: .displayInline, children: [action1])
            let menu2 = UIMenu(title: "", options: .displayInline, children: [action2])
            let children = self?.isFavoritList ?? false ? [menu2] : [menu1, menu2]

            return UIMenu(title: "", children: children)
        }

        return configuration
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

}
