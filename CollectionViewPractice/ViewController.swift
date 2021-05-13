//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 岩本康孝 on 2021/05/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        collectionView.register(SampleCollectionViewCell.self, forCellWithReuseIdentifier: "SampleCollectionViewCell")
        
        collectionView.collectionViewLayout = CustomCollectionViewFlowLayout()
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        collectionView.reloadSections(IndexSet(integer: 0))
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath) as! SampleCollectionViewCell
        cell.contentView.backgroundColor = .red
        return cell
    }
    
    
}
