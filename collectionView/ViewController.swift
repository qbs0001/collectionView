//
//  ViewController.swift
//  collectionView
//
//  Created by 0001 QBS on 2020/06/25.
//  Copyright © 2020 qbs0001. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // コレクションビューを接続
    @IBOutlet var collectionView: UICollectionView!
    
    // 色のラベルを格納する配列
    var colorArray = [String]()
    // 色のラベルを変更するインデックスを格納する変数
    var colorIndex = Int()
    // セグエする際のセルを格納する変数
    var segueCell: UICollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // コレクションビューのセルをカスタムセルにする
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // セルの数は、５０個
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // カスタムセルで再利用
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        // 初期の色を緑にして、配列に格納する
        colorArray.append("緑")
        // 配列からラベルを設定する
        cell.colorLabel.text = colorArray[indexPath.row]
        
        // ラベルに応じてセルの背景色を変更する
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
        
        // セルの選択を解除する
        self.collectionView.deselectItem(at: indexPath, animated: true)
        // ラベルを変更するため、選択されたインデックスを設定する
        colorIndex = indexPath.row
        // 色を変更するため、選択されたセルを設定する
        segueCell = self.collectionView.cellForItem(at: indexPath)
        // 色選択画面にセグエ
        performSegue(withIdentifier: "cellSegue", sender: nil)
    }
    
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 色選択画面を設定
        let inputViewController: InputViewController = segue.destination as! InputViewController
        
        // 色選択画面の場合（今はこれだけ）
        if segue.identifier == "cellSegue" {
            // 色選択画面の色をセルの色にする
            inputViewController.view.backgroundColor = segueCell?.backgroundColor
            // 色選択画面のピッカー初期値を色に応じて設定する
            switch inputViewController.view.backgroundColor {
                case UIColor.red:
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
    
    @IBAction func backToMain(segue: UIStoryboardSegue) {
        print("戻ってきました")
        // セルのラベルを背景色と同じにする。
        // 配列のインデックス＝セルのインデックス
        switch segueCell?.backgroundColor {
            case UIColor.red:
                colorArray[colorIndex] = "赤"
            case UIColor.green:
                colorArray[colorIndex] = "緑"
            case UIColor.blue:
                colorArray[colorIndex] = "青"
            default: break
        }
        // テーブルをリロードする
        collectionView.reloadData()
    }
}
