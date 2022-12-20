//
//  WordsTableView.swift
//  English
//
//  Created by Константин Ирошников on 02.08.2021.
//

import Foundation
import UIKit

class WordsTableView: UITableView {
    var tapWord: (Word) -> Void = {_ in }

    var isFavoritList: Bool = false

    private var lists: [List] = []

    init() {
        super.init(frame: CGRect(), style: .plain)

        self.delegate = self
        self.dataSource = self

        self.separatorStyle = .none
		self.backgroundColor = .clear

        self.register(WordCell.self, forCellReuseIdentifier: WordCell.className)
        self.register(
            ListHeder.self,
            forHeaderFooterViewReuseIdentifier: ListHeder.className
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func wordsTable(
        listArray: [List],
        duration: TimeInterval?
    ) {//если нил, использум те что уже есть
        
        self.lists = listArray
        guard let duration = duration else {
            self.reloadData()
            return
        }
        
        
        UIView.transition(
            with: self,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: {
                
                self.reloadData()
            })
    }

}

extension WordsTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        lists.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists[section].words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let word = lists[indexPath.section].words[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as? WordCell else {
            fatalError()
        }
        
		cell.word = word
        cell.tapedWord = { [weak self] word in
            self?.tapWord(word)
        }

		return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }

    //MARK: - тап

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = cellForRow(at: indexPath) as? WordCell {
            cell.showAnimate()
        }
    }

    // MARK: - HEDER
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListHeder.className),
            let heder = cell as? ListHeder
        else {
            return nil
        }
        
        heder.list = lists[section]
        
        return heder
    }

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        UIView()
    }

    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        0
    }

}
