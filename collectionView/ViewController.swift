//
//  ViewController.swift
//  collectionView
//
//  Created by 0001 QBS on 2020/06/25.
//  Copyright © 2020 qbs0001. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colorArray = [String]()
    var colorIndex = Int()
    
    var segueCell : UICollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        
        self.collectionView.register(UINib (nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        //cell.backgroundColor = .green
        colorArray.append("緑")
        cell.colorLabel.text = colorArray[indexPath.row]
        
        switch cell.colorLabel.text {
            case "赤":
                cell.backgroundColor = .red
                
            case "緑":
                cell.backgroundColor = .green
                
            case "青":
                cell.backgroundColor = .blue
                
            default: break
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました")
        
        colorIndex = indexPath.row
        
        self.collectionView.deselectItem(at: indexPath, animated: true)
        
        self.segueCell = self.collectionView.cellForItem(at: indexPath)
        //self.segueCell?.backgroundColor = .blue
        
        performSegue(withIdentifier: "cellSegue", sender: nil)
        
    }
    
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let inputViewController: InputViewController = segue.destination as! InputViewController
        
        if segue.identifier == "cellSegue" {
            inputViewController.view.backgroundColor = self.segueCell?.backgroundColor
            
            switch inputViewController.view.backgroundColor {
            case UIColor.red:
                //inputViewController.initColor = 0
                inputViewController.pickerView.selectRow(0, inComponent: 0, animated: true)
                
            case UIColor.green:
                inputViewController.pickerView.selectRow(1, inComponent: 0, animated: true)
                
            case UIColor.blue:
                inputViewController.pickerView.selectRow(2, inComponent: 0, animated: true)
                
            default: break
            }
        } else {
          return
        }
    }
    
    @IBAction func backToMain(segue: UIStoryboardSegue){
        print("戻ってきました")
        
        
        
        switch self.segueCell?.backgroundColor {
            case UIColor.red:
                colorArray[self.colorIndex] = "赤"
                
            case UIColor.green:
                colorArray[self.colorIndex] = "緑"
                
            case UIColor.blue:
                colorArray[self.colorIndex] = "青"
                
            default: break
            
            
        }
        
        collectionView.reloadData()
        
    }



}

