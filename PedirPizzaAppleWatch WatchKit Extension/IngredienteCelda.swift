//
//  IngredienteCelda.swift
//  PedirPizzaAppleWatch
//
//  Created by Celia.Almazo on 27/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import WatchKit

class IngredienteCelda: NSObject {

    var ingredienteItem:(key:String, value:Bool)!
    var ingredientesSeleccionados:NSMutableArray!
    
    @IBOutlet var ingredienteSwitch: WKInterfaceSwitch!
    
    @IBAction func switchAction(_ value: Bool) {
        ingredienteSwitch.setOn(value)
        ingredienteItem.value = value
        if value {
            ingredientesSeleccionados.add(ingredienteItem)
        }else{
            ingredientesSeleccionados.remove(ingredienteItem)
        }
    }
    
}
