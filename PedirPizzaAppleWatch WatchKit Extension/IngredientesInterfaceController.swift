//
//  IngredientesInterfaceController.swift
//  PedirPizzaAppleWatch
//
//  Created by Celia.Almazo on 27/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesInterfaceController: WKInterfaceController {
    var pizza:Pizza!
    var ingredientesSeleccionados:NSMutableArray = NSMutableArray()
    
    @IBOutlet var tableView: WKInterfaceTable!
    var ingredientes=["Jamon":false,"Pepperoni":false,"Pavo":false,"Salchicha":false,"Aceituna":false,"Cebolla":false,"Pimiento":false,"Piña":false,"Anchoa":false]

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        pizza = context as! Pizza
        if pizza.ingredientes != nil{
            ingredientesSeleccionados = pizza.ingredientes as! NSMutableArray
        }
        
        tableView.setNumberOfRows(ingredientes.count, withRowType: "ingredienteRow")
        for (index, var ingrediente) in ingredientes.enumerated() {
            let row = tableView.rowController(at: index) as! IngredienteCelda;
            row.ingredienteSwitch.setTitle(ingrediente.key)
            row.ingredienteSwitch.setOn(ingrediente.value)
            row.ingredienteItem = ingrediente
            row.ingredientesSeleccionados = ingredientesSeleccionados
            if ingredientesSeleccionados.contains(ingrediente.key) {
                ingrediente.value = true
                row.ingredienteSwitch.setOn(ingrediente.value)
            }
        }
    
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func siguienteAction() {
        pizza.ingredientes = ingredientesSeleccionados
        pushController(withName: "vistaConfirmacion", context: pizza)
    }
}
