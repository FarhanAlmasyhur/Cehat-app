//
//  MenuSeeder.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 23/06/22.
//

import Foundation


class MenuSeeder
{
    var allMenu: [Menu] = []
    
    let menu1: Menu = {
        let name: String = "Ayam Goreng"
        let image: String = "1_Ayam Goreng"
        let ingredients = [
            "50 gram daging ayam"
            ,"1/2 siung bawang putih, tumbuk sedikit kasar"
            ,"Garam secukupnya"
            ,"Kaldu jamur secukupnya"
            ,"ketumbar bubuk secukupnya"
        ]
        
        let cookstep = [
            "Cuci bersih daging ayam. Potong jadi beberapa bagian."
            ,"Baluri daging ayam dengan bawang putih, garam, kaldu, dan ketumbar."
            ,"Ungkep selama kurang lebih 15 menit."
            ,"Panaskan minyak goreng dengan api sedang."
            ,"Goreng daging ayam dengan api kecil sampai matang. Angkat dan tiriskan."

        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 130
        nutrients[.carbohydrate] = 6
        nutrients[.protein] = 11
        nutrients[.fat] = 7
        nutrients[.vitaminA] = 48.3
        nutrients[.vitaminB] = 0.3
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 0.05
        nutrients[.vitaminE] = 1.34
        nutrients[.zinc] = 2.13
        nutrients[.iron] = 1.3
        
        return Menu(id: 1, image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu2: Menu = {
        let name: String = "Ayam Teriyaki"
        let image: String = "2_Ayam Teriyaki"
        let ingredients = [
            "50 gram Dada ayam fillet"
            ,"1/4 Buah bawang bombay"
            ,"1/2 sdm Saus teriyaki"
            ,"Kecap manis"
            ,"Soyu"
            ,"Minyak wijen"
            ,"Kecap ikan"
            ,"1 siung Bawang putih yang dicincang"
            ,"Jahe parut secukupnya"
            ,"Air dan garam secukupnya"

        ]
        
        let cookstep = [
            "Pertama, fillet ayam dengan membuang kulit dan tulangnya dengan cara disisiri menggunakan pisau."
            ,"Berikutnya, potong daging ayam dengan ketebalan 1 cm dan potong lebih kecil lagi sesuai selera."
            ,"Cuci semua bahan yang diperlukan, kemudian iris kecil-kecil."
            ,"Tumis bawang putih sampai harum, lalu tambahkan bawang bombay dan tumis lagi sampai kembali berbau harum."
            ,"Masukkan ayam dan seluruh bumbu yang terdiri dari saus teriyaki, kecap manis, kecap ikan, minyak wijen, soyu, garam, parutan jahe, dan gula ke dalam panci penggorengan."
            ,"Tumis hingga bumbu meresap. Tambahkan air dan tunggu sampai ayam matang dan bumbu mengental."
            ,"Setelah masakan matang sajikan ayam teriyaki dengan brokoli dan wortel rebus. Selain itu, tambahkan taburan wijen yang sudah disangrai."
        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 90
        nutrients[.carbohydrate] = 11
        nutrients[.protein] = 3
        nutrients[.fat] = 3
        nutrients[.vitaminA] = 48.3
        nutrients[.vitaminB] = 0.3
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 0.05
        nutrients[.vitaminE] = 1.34
        nutrients[.zinc] = 2.13
        nutrients[.iron] = 1.3
        
        return Menu(id: 2,image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu3: Menu = {
        let name: String = "Sup Bihun"
        let image: String = "3_Sup Bihun"
        let ingredients = [
            "Bihun beras organik, secukupnya"
            ,"Sayap ayam 1 pcs potong-potong, direbus untuk rasa kaldu"
            ,"Wortel secukupnya, rebus bersama sayap ayam"
            ,"1 siung bawang putih"
            ,"Bawang bombai, sedikit saja potong kecil-kecil"
            ,"Merica bubuk sedikit"
            ,"Gula dan garam secukupnya"
            ,"Daun bawang secukupnya"
        ]
        
        let cookstep = [
            "Panaskan air masukkan wortel dan sayap ayam, masak sampai wortel empuk."
            ,"Panaskan olive oil di wajan, tumis bawang putih dan bawang bombai"
            ,"Masukkan tumisan bawang ke wortel dan sayap ayam yang sedang direbus. Jika wortel sudah empuk, masukkan bihun."
            ,"Tambahkan merica, gula, garam. Masukkan daun bawang, masak sampai bihun matang."

        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 96
        nutrients[.carbohydrate] = 20
        nutrients[.protein] = 1
        nutrients[.fat] = 0
        nutrients[.vitaminA] = 0
        nutrients[.vitaminB] = 0
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 0
        nutrients[.vitaminE] = 0
        nutrients[.zinc] = 0
        nutrients[.iron] = 0
        
        return Menu(id: 3,image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu4: Menu = {
        let name: String = "Tumis Kangkung"
        let image: String = "4_Tumis Kangkung"
        let ingredients = [
            "23 gram saus tiram"
            ,"3 sendok makan minyak goreng"
            ,"300 gram kangkung"
            ,"1 siung bawang putih"
            ,"1 buah bawang merah"
            ,"1 irisan tomat merah"

        ]
        
        let cookstep = [
            "Iris kangkung dan bahan lainnya pisahkan"
            ,"Tumis bawang putih dan bawang merah,tomat merah"
            ,"Lalu masukkan kangkung, saus tiram dan sedikit air"
            ,"Tunggu sampai kangkung masak dan siap disajikan"
        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 211
        nutrients[.carbohydrate] = 8.58
        nutrients[.protein] = 5.5
        nutrients[.fat] = 18.72
        nutrients[.vitaminA] = 18.90
        nutrients[.vitaminB] = 0
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 0
        nutrients[.vitaminE] = 0
        nutrients[.zinc] = 0
        nutrients[.iron] = 3
        
        return Menu(id: 4, image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu6: Menu = {
        let name: String = "Telur Dadar"
        let image: String = "6_Telur Dadar"
        let ingredients = [
            "28 gram telur"
            ,"Bubuk bawang putih (secukupnya)"
            ,"1 batang daun bawang (cincang halus)"
            ,"Lada bubuk (secukupnya)"
            ,"Garam (secukupnya)"
            ,"Minyak goreng (secukupnya)"
        ]
        
        let cookstep = [
            "Pecah telur, campur bersama bubuk bawang, daun bawang, lada dan garam secukupnya. Aduk rata."
             ,"Panaskan minyak di teflon, tuang adonan telur."
            ,"Masak dengan api kecil dan masak telur hingga matang. Balik telur agar matang merata."
             ,"Jika telur atau omelet sudah matang, segera angkat dan sajikan"
        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 43
        nutrients[.carbohydrate] = 0
        nutrients[.protein] = 3
        nutrients[.fat] = 3
        nutrients[.vitaminA] = 126
        nutrients[.vitaminB] = 0.5
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 3.2
        nutrients[.vitaminE] = 0
        nutrients[.zinc] = 0
        nutrients[.iron] = 0
        
        return Menu(id: 6,image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu7: Menu = {
        let name: String = "Salad"
        let image: String = "7_Salad"
        let ingredients = [
            "minyak goreng"
            ,"1 butir telur ayam segar"
            ,"1/4 buah tomat merah, iris kasar"
            ,"4 g bawang bombai/bawang merah cincang"
            ,"1/4 batang daun bawang, iris kasar"
            ,"1/2 tangkai daun ketumbar, iris kasar"
            ,"Saus:"
            ,"1 sdm air jeruk nipis"
            ,"1 sdm saus ikan"
            ,"1/2 sdt gula pasir"
            ,"1/4 buah bawang merah, cincang halus"
            ,"1/4 siung bawang putih, cincang halus"
            ,"1/4 batang serai, ambil bagian yang putih, iris halus"
            ,"2 akar daun ketumbar, iris halus"

        ]
        
        let cookstep = [
            "Panaskan minyak dalam wajan di atas api besar."
            ,"Goreng masing-masing telur hingga pinggirnya kering tetapi bangian tengahnya masih setengah matang. Angkat."
            ,"Saus : Aduk semua bahan saus hingga gulanya larut."
            ,"Taruh telur goreng di piring saji."
            ,"Beri bahan salad; irisan tomat, bawang bombay, daun bawang dan daun ketumbar."
            ,"Siram dengan Sausnya. Sajikan."
        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 90
        nutrients[.carbohydrate] = 1
        nutrients[.protein] = 3
        nutrients[.fat] = 9
        nutrients[.vitaminA] = 126
        nutrients[.vitaminB] = 0.5
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 3.2
        nutrients[.vitaminE] = 0
        nutrients[.zinc] = 0
        nutrients[.iron] = 0
        
        return Menu(id: 7,image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu8: Menu = {
        let name: String = "Stim Ikan"
        let image: String = "8_Stim Ikan"
        let ingredients = [
            "28 gram ikan"
            ,"1 siung bawang putih, geprek"
            ,"1 siung bawang putih, cincang"
            ,"jahe secukupnya, iris memanjang"
            ,"daun bawang, iris memanjang"
            ,"daun ketumbar"
            ,"air secukupnya"
            ,"Bahan Kecap"
            ,"2 sdm saus tiram"
            ,"1 sdm minyak wijen"
            ,"1 sdm kecap asin"
            ,"1 sdm kecap ikan"
            ,"merica secukupnya"
            ,"kaldu bubuk secukupnya"
        ]
        
        let cookstep = [
            "Cuci bersih ikan, tim bersama bawang putih geprek hingga matang. Buang airnya lalu sisihkan."
            ,"Tumis bawang putih cincang dan jahe hingga wangi. Masukkan separuh daun bawang dan bahan kecap. Aduk rata."
            ,"Tambahkan air sedikit, masak mendidih."
            ,"Beri garam."
            ,"Tata ikan yang sudah matang di piring, tuang kecap di atasnya."
            ,"Beri taburan daun ketumbar dan daun bawang."

        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 84
        nutrients[.carbohydrate] = 0
        nutrients[.protein] = 18
        nutrients[.fat] = 1
        nutrients[.vitaminA] = 15
        nutrients[.vitaminB] = 0
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 3
        nutrients[.vitaminE] = 0
        nutrients[.zinc] = 0
        nutrients[.iron] = 0
        
        return Menu(id: 8, image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu9: Menu = {
        let name: String = "Sup Ayam"
        let image: String = "9_Sup Ayam"
        let ingredients = [
            "1 sendok makan minyak kelapa"
            ,"1 buah bawang bombay yang sudah diiris"
            ,"1 buah seledri"
            ,"2 buah wortel"
            ,"500 ml kaldu ayam"
            ,"½ gelas beras merah atau putih (pilih sesuai selera)"
            ,"200 gram ayam paha yang sudah dipotong"
        ]
        
        let cookstep = [
            "Siapkan panci di atas kompor, nyalakan dengan api sedang lalu masukkan minyak kelapa ke dalamnya."
            ,"Setelah panas, tumis bawang bombay, seledri, dan wortel selama 10-15 menit."
            ,"Tambahkan kaldu ayam, lalu panaskan sampai mendidih."
            ,"Kecilkan api, lalu masukkan beras ke dalam panci dan masak bersama kaldu hingga menjadi nasi. Proses ini memakan waktu sekitar 40 menit, sesekali aduk agar nasi matang sempurna"
            ,"Setelah setengah matang, tambahkan ayam dan aduk sampai matang seluruhnya."
            ,"Sajikan selagi hangat."
        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 75
        nutrients[.carbohydrate] = 10
        nutrients[.protein] = 4
        nutrients[.fat] = 3
        nutrients[.vitaminA] = 48.3
        nutrients[.vitaminB] = 0.3
        nutrients[.vitaminC] = 0
        nutrients[.vitaminD] = 0.05
        nutrients[.vitaminE] = 1.34
        nutrients[.zinc] = 2.13
        nutrients[.iron] = 1.3
        
        return Menu(id: 9,image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    let menu10: Menu = {
        let name: String = "Kacang Panjang"
        let image: String = "10_Tumis Kacang Panjang"
        let ingredients = [
            "1 ikat kacang panjang"
            ,"2 siung bawang putih"
            ,"3 siung bawang merah"
            ,"3 sdm kecap manis"
            ,"1/2 sdt kaldu jamur"
            ,"1 gelas air matang"
            ,"Garam, gula, merica secukupnya"
            ,"Minyak goreng secukupnya"

        ]
        
        let cookstep = [
            "Potong bawang putih dan merah, lalu panaskan minyak goreng sedikit untuk menumis. Tumis bawang putih dan bawang merah sampai harum"
            ,"Tambahkan air matang, aduk-aduk bentar. Masukkan kacang panjang yang sudah dipotong panjang."
            ,"Masukkan kecap manis, garam, kaldu jamur, gula, merica, secukupnya."
            ,"Koreksi rasa, jika rasa sudah sesuai selera tutup wajan sebentar supaya kacang panjang bisa matang."
        ]
        
        var nutrients: Nutrients = NutrientsType.list
        nutrients[.calories] = 140
        nutrients[.carbohydrate] = 10
        nutrients[.protein] = 9
        nutrients[.fat] = 9
        nutrients[.vitaminA] = 207
        nutrients[.vitaminB] = 0.14
        nutrients[.vitaminC] = 12.2
        nutrients[.vitaminD] = 0
        nutrients[.vitaminE] = 0.41
        nutrients[.zinc] = 0.24
        nutrients[.iron] = 1.03
        
        return Menu(id: 10,image: image, name: name, ingredients: ingredients, cookStep: cookstep, nutrients: nutrients)
    }()
    
    
    init(){
        allMenu.append(menu1)
        allMenu.append(menu2)
        allMenu.append(menu3)
        allMenu.append(menu4)
//        allMenu.append(menu5)
        allMenu.append(menu6)
        allMenu.append(menu7)
        allMenu.append(menu8)
        allMenu.append(menu9)
        allMenu.append(menu10)
    }
    
    func getAllMenu() -> [Menu] {
        allMenu
    }
    
    func getMenuById(idMenu: Int) -> Menu? {
        return allMenu.first(where: {$0.id == idMenu})
    }
    
    func makeMenuArraybyId(idMenus: [Int]?) -> [Menu]? {
        return idMenus?.map{getMenuById(idMenu: $0)!}
    }
}
