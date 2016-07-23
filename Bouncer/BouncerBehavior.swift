//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by Mads Bielefeldt on 07/06/15.
//  Copyright (c) 2015 GN ReSound. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior
{
    let gravity = UIGravityBehavior()
    
    let collider: UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
        }()
    
    let blockBehavior: UIDynamicItemBehavior = {
        let blockBehavior = UIDynamicItemBehavior()
        blockBehavior.allowsRotation = true
        blockBehavior.elasticity = CGFloat(NSUserDefaults.standardUserDefaults().doubleForKey("BouncerBehavior.Elasticity"))
        blockBehavior.friction = 0
        blockBehavior.resistance = 0
        NSNotificationCenter.defaultCenter().addObserverForName(NSUserDefaultsDidChangeNotification, object: nil, queue: nil, usingBlock: { (NSNotification) in
            blockBehavior.elasticity = CGFloat(NSUserDefaults.standardUserDefaults().doubleForKey("BouncerBehavior.Elasticity"))
        })
        return blockBehavior
        }()
    
    override init()
    {
        super.init()
        
        self.addChildBehavior(gravity)
        self.addChildBehavior(collider)
        self.addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: String)
    {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(block: UIView)
    {
        dynamicAnimator?.referenceView?.addSubview(block)
        
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView)
    {
        gravity.removeItem(block)
        collider.removeItem(block)
        blockBehavior.removeItem(block)
        
        block.removeFromSuperview()
    }
}
