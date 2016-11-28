//
//  InterfaceController.swift
//  PedirPizzaAppleWatch WatchKit Extension
//
//  Created by Celia.Almazo on 24/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var pizza:Pizza = Pizza()
    let tamanos:NSMutableArray = ["Ninguno","Chica","Mediana","Grande"]

    @IBOutlet var picker: WKInterfacePicker!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var listaTamanos:[WKPickerItem] = []
        for tamano in tamanos {
            let item = WKPickerItem()
            item.title = tamano as? String
            item.caption = tamano as? String;
            listaTamanos.append(item)
        }
        picker.setItems(listaTamanos)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func changeValue(_ value: Int) {
        let tam:NSString = tamanos[value] as! NSString
        if !tam.isEqual(to: "Ninguno") {
            pizza.tamano = tam
        }else{
            pizza.tamano = nil
        }
    }
    
    @IBAction func siguienteAction() {
        pushController(withName: "vistaTipoDeMasa", context: pizza)
    }
}
