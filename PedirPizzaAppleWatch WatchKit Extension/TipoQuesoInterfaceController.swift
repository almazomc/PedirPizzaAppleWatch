//
//  TipoQuesoInterfaceController.swift
//  PedirPizzaAppleWatch
//
//  Created by Celia.Almazo on 27/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import WatchKit
import Foundation

class TipoQuesoInterfaceController: WKInterfaceController {
    var pizza:Pizza!
    let tiposQueso:NSMutableArray = ["Ninguno","Mozarela","Cheddar","Parmesano"]

    @IBOutlet var quesosPicker: WKInterfacePicker!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        var listaQuesos:[WKPickerItem] = []
        for queso in tiposQueso {
            let item = WKPickerItem()
            item.title = queso as? String
            item.caption = queso as? String;
            listaQuesos.append(item)
        }
        quesosPicker.setItems(listaQuesos)
        
        pizza = context as! Pizza
        if pizza.tipoQueso != nil {
            let predicate = NSPredicate(format: "SELF == '\(pizza.tipoQueso as String)'")
            let filter:NSArray = tiposQueso.filtered(using: predicate) as NSArray
            if filter.count > 0 {
                let index = tiposQueso.index(of: filter[0])
                quesosPicker.setSelectedItemIndex(index)
            }
        }
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
        let queso:NSString = tiposQueso[value] as! NSString
        if !queso.isEqual(to: "Ninguno") {
            pizza.tipoQueso = queso
        }else{
            pizza.tipoQueso = nil
        }
    }
    
    
    @IBAction func siguienteAction() {
        pushController(withName: "vistaIngredientes", context: pizza)
    }
}
