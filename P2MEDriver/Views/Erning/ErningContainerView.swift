//
//  ErningContainerView.swift
//  P2MEDriver
//
//  Created by user on 24.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit

class ErningContainerView: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var tripsLabel: UILabel!
    @IBOutlet weak var timeInOnlineLabel: UILabel!
    @IBOutlet weak var erningCollectionView: UICollectionView!

    // MARK: - Properties
    var erningModel: ErningModel?

    
    // MARK: -
    // MARK: - View draw()
    override func draw(_ rect: CGRect) {
        erningCollectionView.delegate = self
        erningCollectionView.dataSource = self
    }
    
    // MARK: - ConfigurateView
    func configurateContainer(withModel: ErningModel) {
        tripsLabel.text = withModel.tripsCount
        timeInOnlineLabel.text = withModel.onlineTime
        erningModel = withModel
        erningCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension ErningContainerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let model = erningModel?.driverErning { return model.count } else { return 0}
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ErnningCollectionViewCell", for: indexPath) as? ErnningCollectionViewCell
        if let model = erningModel?.driverErning { cell?.configureCellWithModel(model[indexPath.row]) }
        return cell!
    }
}

// MARK: - UICollectionViewDelegate
extension ErningContainerView: UICollectionViewDelegate {
    
}






