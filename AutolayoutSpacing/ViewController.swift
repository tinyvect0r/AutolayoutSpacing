//
//  ViewController.swift
//  AutolayoutSpacing
//
//  Created by define68 on 12/7/14.
//
//

import UIKit

class ViewController: UIViewController {

    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView1 = UIImageView(image: UIImage(named: "square.png"))
        self.view.addSubview(imageView1)
        imageView2 = UIImageView(image: UIImage(named: "square.png"))
        self.view.addSubview(imageView2)
        imageView3 = UIImageView(image: UIImage(named: "square.png"))
        self.view.addSubview(imageView3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutImageVIews()
    }

    private func layoutImageVIews() {
        let spaceBetweenEachButton = (self.view.bounds.size.width - imageView1.intrinsicContentSize().width - imageView2.intrinsicContentSize().width - imageView3.intrinsicContentSize().width) / 4.0
        var constraintV: NSLayoutConstraint?
        var constraintsH: [NSLayoutConstraint]?
        
        imageView1.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView2.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView3.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        constraintsH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(space)-[imageView1]-(space)-[imageView2]-(space)-[imageView3]-(space)-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: ["space":spaceBetweenEachButton], views: ["imageView1":imageView1, "imageView2":imageView2, "imageView3":imageView3]) as? Array
        self.view.addConstraints(constraintsH!)
        constraintV = NSLayoutConstraint(item: imageView1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        self.view.addConstraint(constraintV!)
    }
}

