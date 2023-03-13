//
//  DetailsViewController.swift
//  VIPERUIKitDemo
//
//  Created by Mindaugas Balakauskas on 31/01/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet var labelData: UILabel!
    
    var someProduct: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        labelData.text = someProduct?.title

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
