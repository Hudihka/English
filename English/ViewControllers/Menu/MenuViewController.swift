//
//  MenuViewController.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import UIKit

protocol MenuViewControllerIn: AnyObject {
    func showErrorNewList()
    func reloadData()
}

class MenuViewController: BaseViewController {
    
    private var tableView: MenuTableView!
    
    var presenter: MenuPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var titleText: String?{
        return "ТЕМЫ"
    }
    
    override var rightTextBBItem: String?{
        return "+"
    }
    
    @objc override func rightBBItem(){
        showAlertTextField(title: "Введите название новой темы",
                           message: nil,
                           actionTitle: "Ok",
                           cancelTitle: "Отмена", inputPlaceholder: "Тема") {[weak self] str in
            guard let self = self, let str = str else {
                return
            }

            self.presenter?.createList(name: str)
        }
    }
    
    override func desingUI() {
        tableView = MenuTableView()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }

        tableView.tapedCell = {[weak self] theme in
            guard let self = self else {
                return
            }

            self.showAlertThreeButton(title: "Выберите направление",
                                      message: nil,
                                      buttonText1: MenuEndpointsEnum.ActionButtonsAlert.rusEngl.rawValue,
                                      action1: { _ in
                                        self.presenter?.tapedAlert(MenuEndpointsEnum.ActionButtonsAlert.rusEngl, theme: theme)
                                      },
                                      buttonText2: MenuEndpointsEnum.ActionButtonsAlert.englRus.rawValue,
                                      action2: { _ in
                                        self.presenter?.tapedAlert(MenuEndpointsEnum.ActionButtonsAlert.englRus, theme: theme)
                                      },
                                      buttonText3: MenuEndpointsEnum.ActionButtonsAlert.cramming.rawValue) { _ in
                                        self.presenter?.tapedAlert(MenuEndpointsEnum.ActionButtonsAlert.cramming, theme: theme)
            }
        }

        tableView.tapedRename = {[weak self] theme in
            guard let self = self else {
                return
            }

            self.showAlertTextField(title: "Введите новое название",
                               message: nil,
                               actionTitle: "Ok",
                               cancelTitle: "Отмена",
                               inputPlaceholder: "Тема",
                               inputStartText: theme) {[weak self] str in
                guard let self = self, let str = str else {
                    return
                }

                self.presenter?.createList(name: str)
            }
        }

        tableView.tapedAdd = {[weak self] theme in
            guard let self = self else {
                return
            }

            self.presenter?.newWordInTheme(listName: theme)
        }
    }

}


extension MenuViewController: MenuViewControllerIn {

    func showErrorNewList() {
        showAlert(title: "Ошибка", message: "Нельзя тиспользовать такое имя")
    }

    func reloadData(){
        self.tableView.reloadData()
    }

}
