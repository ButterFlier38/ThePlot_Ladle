//
//  TimelineView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//

import SwiftUI

struct TimelineView: View {
    var recipe :Recipe
//    let steps: [Int] = [2, 4,5]
    
//    func getNoOfSteps( recipe.noofsteps) {
//       return steps
//    }
    var body: some View {
        GeometryReader { geometry in
        NavigationView{
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height/11))
                    path.addLine(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height - 50))
//                    path.move(to: CGPoint(x: 0, y: 0))
//                    path.addLine(to: CGPoint(x:0, y: 0))
                }
                .stroke(CustomColor.selectionblue, style: StrokeStyle(lineWidth: 10, dash: [20]))
        VStack{
            Text("Start")
                .font(Font.custom("HappyMonkey-Regular", size: 40))
                .foregroundColor(CustomColor.selectionblue)
//                .shadow(color: CustomColor.selectionblue, radius: 3, x: 2, y: 2)
                .position(x: geometry.size.width/18, y: geometry.size.height/20 - 20)
            
            ForEach(recipe.noofsteps, id: \.self){step in
                NavigationLink(destination: CreateRecipeView()){
                    Spacer()
                ZStack{
                    
                Circle()
                   
                        Text(step.description)
                        .foregroundColor(.white)
                    }
                .navigationViewStyle(.columns)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                }
                
//                Text("\(recipe.noofsteps)").foregroundColor(.black)
            }
        
        }.frame(width: 100, height: 900, alignment: .leading)
            }
            
        }
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(recipe: RecipeViewModel().recipesStore[1])
    }
}
