//
//  EventTBCellTableViewCell.swift
//  FinalProject
//
//  Created by pramodie athauda on 3/1/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import UIKit
import Kingfisher

class EventTBCellTableViewCell: UITableViewCell {

    @IBOutlet weak var eventimage: UIImageView!
    

    @IBOutlet weak var txteventname: UILabel!
    
   
    
    @IBOutlet weak var txtdes: UILabel!
    

    var uiimage: UIImage?
    
    
    
   /* var event: AddEventTableView! {
        didSet {
           // self.configCell()
        }
    }*/
    
    
    var addevent: AddEventTableView?{
        didSet{
            
             txteventname.text = addevent?.eventname
            txtdes.text = addevent?.text
            let url = URL(string: (addevent?.imageurl)!)
            
            eventimage.kf.setImage(with: url)
            if let url = url as? URL{
            
              KingfisherManager.shared.retrieveImage(with:url as! Resource, options: nil, progressBlock: nil){
              (image, Error, NSCache,imgeURL) in
         
              self.eventimage.image = image
                 self.eventimage.kf.indicatorType = .activity
                
               }
                
            }
          //txteventname.text = "dsfds"
        }
    }
    override func awakeFromNib() {
        //super.awakeFromNib()
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //config cell
 /*   func configCell() {
        
        
        
        txteventname.text = event.eventname
        txtdes.text = event.text
        
    
        if let url = URL(string: event.imageurl!){
        
            eventimage.kf.setImage(with: url)
        }
    }*/
    

   /* override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }*/

}
