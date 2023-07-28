//
//  SpringViewController.swift
//  Seasons ver.2
//
//  Created by 陳佩琪 on 2023/7/28.
//

import UIKit
import SpriteKit


class SpringViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        gradientLayer.colors = [UIColor(red: 182/255, green: 96/255, blue: 115/255, alpha: 1).cgColor,UIColor.white.cgColor]
        gradientLayer.locations = [0.25,0.9]
        view.layer.addSublayer(gradientLayer)

        
        let gifImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 635, height: 844))
        gifImageView.image = UIImage.animatedImageNamed("springgif-", duration: 8)
        gifImageView.contentMode = .scaleAspectFit
        view.addSubview(gifImageView)
        
        UIView.animate(withDuration: 8, delay: 0, options: [.curveEaseInOut], animations: {
            gifImageView.frame.origin.x = -245
        }, completion: nil)
        
        let calligraphyImageView = UIImageView(image: UIImage(named: "calligraphy-spring"))
        calligraphyImageView.frame = CGRect(x: 287, y: 260, width: 306, height: 323)
        gifImageView.mask = calligraphyImageView
        calligraphyImageView.transform = CGAffineTransform(scaleX: 50, y: 50)
        
        UIView.animate(withDuration: 2, delay: 6, options: [.curveEaseInOut], animations: {
            calligraphyImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
         
        
        let skView = SKView()
        skView.frame = view.frame
        skView.backgroundColor = UIColor.clear
        let skScene = SKScene()
        skScene.size = skView.frame.size
        skScene.anchorPoint = CGPoint(x: 0.5, y: 1)
        skScene.backgroundColor = UIColor.clear
        let emitterNode = SKEmitterNode(fileNamed: "springParticle")
        skScene.addChild(emitterNode!)
        skView.presentScene(skScene)
        view.addSubview(skView)
        skView.alpha = 0
        
        UIView.animate(withDuration: 2, delay: 8, options: [.curveEaseInOut], animations: {
            skView.alpha = 1
        }, completion: nil)
        
        
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
