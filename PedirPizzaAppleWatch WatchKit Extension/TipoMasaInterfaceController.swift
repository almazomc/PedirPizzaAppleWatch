//
//  TipoMasaInterfaceController.swift
//  PedirPizzaAppleWatch
//
//  Created by Celia.Almazo on 27/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import WatchKit
import Foundation


class TipoMasaInterfaceController: WKInterfaceController {
    var pizza:Pizza!
    let tiposMasa:NSMutableArray = ["Ninguna","Delgada","Gruesa","Crujiente"]

    @IBOutlet var masasPicker: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        var listaTiposMasa:[WKPickerItem] = []
        for masa in tiposMasa {
            let item = WKPickerItem()
            item.title = masa as? String
            item.caption = masa as? String;
            listaTiposMasa.append(item)
        }
        masasPicker.setItems(listaTiposMasa)
        pizza = context as! Pizza
        if pizza.tipoMasa != nil {
            let predicate = NSPredicate(format: "SELF == '\(pizza.tipoMasa as String)'")
            let filter:NSArray = tiposMasa.filtered(using: predicate) as NSArray
            if filter.count > 0 {
                let index = tiposMasa.index(of: filter[0])
                masasPicker.setSelectedItemIndex(index)
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
        let masa:NSString = tiposMasa[value] as! NSString
        if !masa.isEqual(to: "Ninguna") {
            pizza.tipoMasa = masa
        }else{
            pizza.tipoMasa = nil
        }
    }
    
    @IBAction func siguienteAction() {
        pushController(withName: "vistaTipoQueso", context: pizza)
    }
    
}
