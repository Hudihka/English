//
//  SearchTableView.swift
//  English
//
//  Created by Константин Ирошников on 12.08.2021.
//
import Foundation
import UIKit

class SearchTableView: UITableView {

    private var presenter: SearchPresenterProtocol?

    var rusEngWay: Bool = true
    var countTrue: Int = 0
    var countFalse: Int = 0

    var words: [Word] = []{
        didSet {
            reloadData()
        }
    }

    init(presenter: SearchPresenterProtocol?) {
        super.init(frame: CGRect(), style: .plain)

        delegate = self
        dataSource = self

        separatorStyle = .none
        backgroundColor = .white

        estimatedRowHeight = 51
        rowHeight = UITableView.automaticDimension

        register(SearchCell.self, forCellReuseIdentifier: "SearchCell")

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

extension SearchTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        cell.presenter = presenter
        cell.word = words[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    //MARK: Контекстное меню
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {


        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
            let action1 = UIAction(title: MenuEndpointsEnum.TableContextMenu.rename.rawValue,
                                   image: UIImage(systemName: "square.and.pencil")) {[weak self] _ in
                guard let self = self else {return}

//                let oldName = self.lists[indexPath.row].name
//                self.tapedRename(oldName)
            }

            return UIMenu(title: "", children: [action1])
        }

        return configuration
    }

}

