//
//  DetailSplitTableView.swift
//  English
//
//  Created by Константин Ирошников on 07.08.2021.
//

import Foundation
import UIKit

class DetailSplitTableView: UITableView {

    private var presenter: DetailSplitPresenterProtocol?

    var rusEngWay: Bool = true
    var countTrue: Int = 0
    var countFalse: Int = 0

    var wordsText: [String] = []{
        didSet {
            reloadData()
        }
    }

    init(presenter: DetailSplitPresenterProtocol?) {
        super.init(frame: CGRect(), style: .plain)

        delegate = self
        dataSource = self

        separatorStyle = .none
        backgroundColor = .white

        estimatedRowHeight = 51
        rowHeight = UITableView.automaticDimension

        register(ChekWordCell.self, forCellReuseIdentifier: "ChekWordCell")

        self.presenter = presenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DetailSplitTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsText.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ChekWordCell") as! ChekWordCell
        cell.text = wordsText[indexPath.row]

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
        presenter?.tapedIndex(index: indexPath.row)
    }

}

