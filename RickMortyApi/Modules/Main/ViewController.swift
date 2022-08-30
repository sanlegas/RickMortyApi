//
//  ViewController.swift
//  RickMortyApi
//
//  Created by ISAAC DAVID SANTIAGO on 15/08/22.
//

import UIKit

class ViewController: UIViewController {
    var presenter: ViewToPresenterMainModuleProtocol?

    var titleTextView:UILabel = {
        let textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 40)
        textView.text = "Rick & Morty API"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .gray
        textView.textAlignment = .center
        return textView
    }()
    
    var tableCharacters: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: 350, height: 160)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
       
        let table = UICollectionView(frame: .zero, collectionViewLayout: layout)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .gray
        return table
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter?.loadCharacteres(successRes: {
            self.tableCharacters.reloadData()
        }, failureRes: {
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testRes()
        view.backgroundColor = .blue
        view.addSubview(titleTextView)
        
        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextView.widthAnchor.constraint(equalToConstant: 320),
            titleTextView.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        tableCharacters.dataSource = self
        tableCharacters.delegate = self
        tableCharacters.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        tableCharacters.register(SubclassedCollectionViewCell.self, forCellWithReuseIdentifier: "subclassedcell")

        view.addSubview(tableCharacters)
        
        NSLayoutConstraint.activate([
            tableCharacters.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 20),
            tableCharacters.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableCharacters.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableCharacters.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.82)
        ])
        
    }
}

extension ViewController: PresenterToViewMainModuleProtocol{
    // TODO: Implement View Output Methods
}


extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected: \(presenter?.characteresLocal?[indexPath.row])")
    }
    
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let characteres = presenter?.characteresLocal{
            return  characteres.count 
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subclassedcell", for: indexPath) as? SubclassedCollectionViewCell{
            cell.setupCell(character: (presenter?.characteresLocal?[indexPath.item])!)
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
    
    
}
