//
//  ConfirmacionInterfaceController.swift
//  PedirPizzaAppleWatch
//
//  Created by Celia.Almazo on 27/11/16.
//  Copyright © 2016 Celia. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionInterfaceController: WKInterfaceController {
    var pizza:Pizza!

    @IBOutlet var tableView: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        pizza = context as! Pizza
        // Configure interface objects here.
        tableView.setNumberOfRows(4, withRowType: "mainRowType")
        var row = tableView.rowController(at: 0) as! Celda;
        let tamano = pizza.tamano != nil ? pizza.tamano as String : ""
        row.lblText.setText("Tamaño: \(tamano)")
        row = tableView.rowController(at: 1) as! Celda;
        let tipoMasa = pizza.tipoMasa != nil ? pizza.tipoMasa as String : ""
        row.lblText.setText("Masa: \(tipoMasa)")
        row = tableView.rowController(at: 2) as! Celda;
        let tipoQueso = pizza.tipoQueso != nil ? pizza.tipoQueso as String : ""
        row.lblText.setText("Queso: \(tipoQueso)")
        row = tableView.rowController(at: 3) as! Celda;
        let ingredientes = (pizza.ingredientes != nil || pizza.ingredientes.count > 0) ? obtenerCadenaDeIngredientes() : ""
        row.lblText.setText("Ingredientes: \(ingredientes)")

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func obtenerCadenaDeIngredientes() -> String {
        var ingredientesString:NSMutableString = NSMutableString()
        
        if (pizza.ingredientes != nil){
            for ingrediente in pizza.ingredientes! {
                ingredientesString.append(String(format: "%@ | ", (ingrediente as! String)))
            }
            if ingredientesString.hasSuffix(" | ") {
                ingredientesString = NSMutableString(string: ingredientesString.substring(to: ingredientesString.length - 3))
            }
        }
        return ingredientesString as String
    }
    
    @IBAction func confirmarAction() {
        if pizza.tamano == nil || pizza.tamano.isEqual(to: "") {
            mostrarAlertaCon(mensaje: "No has seleccionado el tamaño")
            return
        }
        
        if pizza.tipoMasa == nil || pizza.tipoMasa.isEqual(to: "") {
            mostrarAlertaCon(mensaje: "No has seleccionado tipo de masa")
            return
        }
        
        if pizza.tipoQueso == nil || pizza.tipoQueso.isEqual(to: "") {
            mostrarAlertaCon(mensaje: "No has seleccionado tipo de queso.\nSi no debea un tipo de queso, favor de elegir la opcion \"Sin queso\"")
            return
        }
        
        if pizza.ingredientes == nil || pizza.ingredientes.count <= 0 {
            mostrarAlertaCon(mensaje: "No has seleccionado ningún ingrediente")
            return
        }
        
        mostrarAlertaDePedidoRealizado()
    }
    
    func mostrarAlertaCon(mensaje:String) {
        let action = WKAlertAction(title: "Ok", style: WKAlertActionStyle.default, handler:{
            
            });
        self.presentAlert(withTitle: "Aviso", message: mensaje, preferredStyle: .alert, actions: [action])
    }
    
    func mostrarAlertaDePedidoRealizado() {
        let action = WKAlertAction(title: "Ok", style: WKAlertActionStyle.default, handler:{
            self.popToRootController();
        });
        self.presentAlert(withTitle: "Aviso", message: "¡Tu pedido ha sido enviado a la cocina!", preferredStyle: .alert, actions: [action])
    }

}
