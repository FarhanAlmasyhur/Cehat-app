//
//  ViewController.swift
//  ScrollableView
//
//  Created by Muhammad Farhan Almasyhur on 16/06/22.
//

import UIKit

class DetailMenuViewController: UIViewController {

    @IBOutlet weak var menuDetail: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var listBahan: UILabel!
    @IBOutlet weak var caraMasak: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    let bahan: [String] = ["1 ikat kacang panjang"
                         ,"2 siung bawang putih"
                         ,"3 siung bawang merah"
                         ,"3 sdm kecap manis"
                         ,"1/2 sdt kaldu jamur"
                         ,"1 gelas air matang"
                         ,"Garam, gula, merica secukupnya"
                         ,"Minyak goreng secukupnya"]
    let masak: [String] = ["Potong bawang putih dan merah, lalu panaskan minyak goreng sedikit untuk menumis. Tumis bawang putih dan bawang merah sampai harum"
                           ,"Tambahkan air matang, aduk-aduk bentar. Masukkan kacang panjang yang sudah dipotong panjang."
                           ,"Masukkan kecap manis, garam, kaldu jamur, gula, merica, secukupnya."
                           ,"Koreksi rasa, jika rasa sudah sesuai selera tutup wajan sebentar supaya kacang panjang bisa matang."]
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        menu = Menu(name: "Kacang Panjang", ingredients: bahan, cookStep: masak, age: "0-1 Tahun", nutrients: NutrientsType.list)
        setupCollectionView()
    }
    
    func setupView(){
        menuDetail.layer.cornerRadius = 20
        listBahan.attributedText = BulletListHelper.createBulletedList(fromStringArray: bahan)
        caraMasak.attributedText = BulletListHelper.createBulletedList(fromStringArray: masak, isNumbered: true)
    }
    
    func setupCollectionView(){
        collectionView.dataSource = self
        
    }

}


