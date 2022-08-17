//
//  homeViewController.swift
//  ChurchApp
//
//  Created by Heinrich Stoltz on 06/07/22.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnEvents: UIButton!
    @IBOutlet weak var btnprayer: UIButton!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnSocial: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bgPicHome.png")
        self.view.insertSubview(backgroundImage, at: 0)
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
