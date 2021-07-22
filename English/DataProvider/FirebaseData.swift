//
//  FirebaseData.swift
//  English
//
//  Created by Константин Ирошников on 05.07.2021.
//

import Foundation
import Firebase


class FirebaseData {
    
    static let shared = FirebaseData()
    
    private let db = Firestore.firestore()
    
    private let batch = Firestore.firestore().batch()
    
    var profile: Profile?
    
//    var idUser: String?{
//        return FirebaseAutorization.shared.idUser
//    }
    
    //MARK: PROFILE
    
    
    func getUser(compl: @escaping((Error?) -> ())){
        
        guard let id = profile?.id else {
            return
        }
        
        db.collection("Profile").document(id).getDocument {[weak self] (snaphot, error) in
            if let data = snaphot?.data() {
                self?.profile = Profile(json: data)
                compl(nil)
            } else {
                compl(error)
            }
        }
    }

    func lisenProfile(compl: @escaping(() -> Void)) {

        guard let id = profile?.id else {
            return
        }

        db.collection("users").document(id).addSnapshotListener {[weak self] (snaphot, _) in
            if let selF = self, let data = snaphot?.data() {
                selF.profile = Profile(json: data)
                compl()
            }
        }
    }

    //MARK: LISTS

    func createList(listName: String){
        guard let profile = profile else {
            return
        }

        let newList = List(name: listName)
        profile.lists.insert(newList, at: 0)

        db.collection("users").document(profile.id).setData(profile.json)
    }

    func renameLists(oldName: String, newName: String){
        guard let profile = profile,
            let index = profile.lists.firstIndex(where: {$0.name == oldName}) else {
            return
        }

        let oldList = profile.lists[index]
        oldList.name = newName
        profile.lists[index] = oldList

        db.collection("users").document(profile.id).setData(profile.json)

        db.collection("Words")
            .whereField("listName", isEqualTo: oldName)
            .getDocuments {[weak self] (snaphot, _) in

            if let data = snaphot?.documents {
                data.forEach({self?.batch.updateData(["listName" : newName], forDocument: $0.reference)})
            }

            self?.batch.commit()
        }
    }



    
//    func createUser(userId: String, name: String?, provided: String?){
//        db.collection("users").document(userId).getDocument {[weak self] (snaphot, _) in
//            if let data = snaphot?.data() {
//                self?.profile = Profile(json: data)
//            } else {
//                self?.addUser(userId: userId, name: name, provided: provided)
//            }
//        }
//    }
//
//    private func addUser(userId: String, name: String?, provided: String?){
//        let newProfile = Profile(id: userId)
//        self.profile = newProfile
//
//        db.collection("users").document(userId).setData(newProfile.json)
//    }
    
    //MARK: LISTS

//
//
//    func countWordIn(listName: String?, compl: @escaping((Int) -> ()) ) {
//
//        guard let listName = listName, let profile = self.profile else {
//            compl(0)
//            return
//        }
//
//        iUpdate = true
//
//        let collection = db.collection("Words").whereField("ownerId", isEqualTo: profile.id).whereField("completed", isEqualTo: false).whereField("listId", isEqualTo: listName)
//
//        collection.getDocuments(source: .default) {[weak self] (snaphot, _) in
//
//            var Words = [Word]()
//
//            if let data = snaphot?.documents {
//                Words = data.map({Word(json: $0.data(), id: $0.documentID)})
//            }
//
//            self?.iUpdate = false
//            compl(Words.count)
//        }
//    }
//
//
//    func renameLists(listName: String?, newName: String?){
//        guard let listName = listName,
//              let newName = newName,
//              let profile = profile,
//              conteinsProfileList(name: newName) == false,
//              let index = profile.lists.firstIndex(where: {$0 == listName}) else {
//            return
//        }
//
//        iUpdate = true
//
//        profile.lists[index] = newName
//
//        db.collection("users").document(profile.id).setData(profile.json)
//
//
//        db.collection("Words").whereField("ownerId", isEqualTo: profile.id).whereField("completed", isEqualTo: false).whereField("listId", isEqualTo: listName).getDocuments {[weak self] (snaphot, _) in
//
//            if let data = snaphot?.documents {
//                data.forEach({self?.batch.updateData(["listId" : newName], forDocument: $0.reference)})
//            }
//
//            self?.batch.commit()
//
//            self?.iUpdate = false
//        }
//
//    }

//
//    //есть уже лист с таким именем
//
//    private func conteinsProfileList(name: String) -> Bool{
//        guard let lists = profile?.lists else {
//            return false
//        }
//
//        return lists.contains(name)
//
//    }
//
//
//    func deleteWordsIn(listName: String?, compl: @escaping(() -> ())) {
//        guard let listName = listName, let profile = self.profile else {
//            return
//        }
//
//        self.iUpdate = true
//
//        self.deleteGroupWord(listName: listName, idUser: profile.id, sourse: .cache) {
//            compl()
//        }
//    }
//
//
//
//
//    private func deleteGroupWord(listName: String, idUser: String, sourse: FirestoreSource = .default, compl: (() -> ())?){
//
//        let collection = Firestore.firestore().collection("Words").whereField("ownerId", isEqualTo: idUser).whereField("completed", isEqualTo: false).whereField("listId", isEqualTo: listName)
//
//        collection.getDocuments(source: sourse) {[weak self] (snaphot, _) in
//
//            let batchLocal = Firestore.firestore().batch()
//
//            if let data = snaphot?.documents {
//                data.forEach({batchLocal.deleteDocument($0.reference)})
//            }
//
//            batchLocal.commit() { _ in
//                self?.iUpdate = false
//
//                if let com = compl{
//                    com()
//                }
//            }
//
//        }
//    }
//
//
//
//    //MARK: WordS
//
//    func createWord(){
//
//        iUpdate = true
//
//        guard let id = idUser else {
//            return
//        }
//
//
//        let Word = Word(ownerId: id)
//        db.collection("Words").document().setData(Word.json)
//    }
//
//    //меняем порядок листов
//
////    private func changeOrderList(){
////
////        guard let profile = FirebaseData.shared.profile, let first = profile.lists.first else {
////            return
////        }
////
////        if first == profile.selectedList {
////            return
////        }
////
////        var newLists: [String] = [profile.selectedList]
////        let otherLists = profile.lists.filter({ newLists.contains($0) == false })
////
////        newLists += otherLists
////
////        profile.lists = newLists
////
////        db.collection("users").document(profile.id).setData(profile.json)
////
////    }
//
//
//
//
//    func getAllWord(sours: FirestoreSource = .default,
//                    compl: @escaping(([Word]) -> Void)) {
//
//        iUpdate = true
//
//        guard let profile = self.profile else {
//            compl([])
//            return
//        }
//
//        let collection = db.collection("Words")
//            .whereField("ownerId", isEqualTo: profile.id)
//
//        collection.getDocuments(source: sours) {[weak self] (snaphot, _) in
//
//            var Words = [Word]()
//
//            if let data = snaphot?.documents {
//                Words = data.map({Word(json: $0.data(), id: $0.documentID)})
//            }
//
//            Words = Words.sorted(by: {$0.rusValue > $1.rusValue})
//            self?.iUpdate = false
//            compl(Words)
//        }
//    }
//
//
//    func lisenWord(compl: @escaping(([Word]) -> Void)) {
//
//        guard let profile = profile else {
//            return
//        }
//
//        db.collection("Words").whereField("ownerId", isEqualTo: profile.id)
//            .whereField("completed", isEqualTo: false)
//            .addSnapshotListener {[weak self] (snaphot, _) in
//            if let selF = self, selF.iUpdate == false {
//                var Words = [Word]()
//
//                if let data = snaphot?.documents {
//                    Words = data.map({Word(json: $0.data(), id: $0.documentID)})
//                }
//
//                compl(Words)
//            }
//        }
//    }
//
//
//    func changeText(Word: Word?, text: String?){
//
//        iUpdate = true
//
//        guard let id = Word?.id else {
//            return
//        }
//
//        let textWord = text ?? ""
//
//        db.collection("Words").document(id).updateData(["text" : textWord])
//
//    }
//
//    func deleteWord(Word: Word){
//
//        iUpdate = true
//
//        guard let id = Word.id else {
//            return
//        }
//
//        db.collection("Words").document(id).delete()
//    }
//
//    func doneWord(Word: Word){
//
//        iUpdate = true
//
//        guard let id = Word.id else {
//            return
//        }
//
//        db.collection("Words").document(id).updateData(["completed" : true])
//    }
    
}
