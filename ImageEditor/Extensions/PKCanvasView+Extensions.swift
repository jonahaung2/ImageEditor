//
//  PKCanvasView+Extensions.swift
//  PhotoEditor
//
//  Created by Aung Ko Min on 9/7/23.
//

import PencilKit

extension PKCanvasView {
    /// Append shape and register undo action
    func drawShape(_ shape: DrawingShape) {
        let bounds = CGRect(x: bounds.width/3, y: bounds.height/3, width: bounds.width/3, height: bounds.width/3)
        
        let drawing = PKDrawing(with: shape, in: bounds, tool: tool as? PKInkingTool)
        let original = self.drawing
        
        undoManager?.registerUndo(withTarget: self, handler: {
            $0.drawing = original
        })
        self.drawing.append(drawing)
        
        undoManager?.setActionName("Undo adding \(shape.rawValue)")
    }
}
