//
//  ViewController.swift
//  ex00
//
//  Created by Phumudzo NEVHUTALA on 2018/10/05.
//  Copyright © 2018 Phumudzo NEVHUTALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var myCollectionView: UICollectionView!
//    let imageArray : [String] = ["image1", "image2", "image3", "image4"]
    let imageArray : [String] = ["https://www.vactualpapers.com/wallpapers/beautiful-photography-hd-wallpaper-no041/download/3840x2160.jpg", "https://media.boingboing.net/wp-content/uploads/2015/04/fd7e709a7c1f8920835cc08ab1a22105.jpg", "https://wallpaper.wiki/wp-content/uploads/2017/04/wallpaper.wiki-Photography-HD-Images-Wallpapers-PIC-WPD0010003.jpg", "https://images5.alphacoders.com/877/thumb-350-877733.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/3 - 3
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        myCollectionView.collectionViewLayout = layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* number of views or boxes*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    /* populate views with images */
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! MyViewCell
        
        let url = URL(string: imageArray[indexPath.row])

        cell.activityIndicator.startAnimating()
        if url != nil {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if data != nil{
                        cell.activityIndicator.stopAnimating()
                        cell.imgView.image = UIImage(data: data!)
                        
                    }
                    else{
                        cell.activityIndicator.stopAnimating()
                        cell.imgView.image = UIImage(named: "default.jpg")
                        print("Could not load image")
                    }
                }
            }
        }
        cell.imgView.image = UIImage(named: imageArray[indexPath.row] + ".jpg")
        return cell
    }
}

