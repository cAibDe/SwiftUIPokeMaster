//
//  PokemonInfoRow.swift
//  SwiftUIPokeMaster
//
//  Created by 张鹏 on 2023/9/7.
//

import SwiftUI

struct PokemonInfoRow: View {
    ///数据模型
    let model : PokemonViewModel
    
    let expanded:Bool //是否展示底部按钮
    
    var body: some View {
        VStack {
            HStack{
                Image("Pokemon-\(model.id)")
                    .resizable()//默认情况下，SwiftUI中图片绘制会优先遵从图片本身大小。如果我们想要图片可以按照所在的frame缩放，需要添加这个属性
                    .frame(width: 50,height: 50)
                    .aspectRatio(contentMode: .fit)//图片的原始尺寸比例和使用frame所设定的长宽比可能有所不同。aspectRatio让图片能够保持原始比例。不过在本例中，缩放钱的图片长宽比也是1:1，所以预览中不会有什么变化
                    .shadow(radius: 4)//给图片增加一些阴影的视觉效果
                Spacer()
                VStack(alignment: .trailing){
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(.top,12)
            HStack(spacing:expanded ?  20 : 0 ){//按照设计，需要在按钮之前添加一定的间距
                Spacer()
                Button(action: {
                    print("Fav")
                }) {
                    Image(systemName: "star")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {
                    print("Panel")
                }) {
                    Image(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {
                    print("Web")
                }) {
                    Image(systemName: "info.circle")
                        .modifier(ToolButtonModifier())
                }
            }.padding(.bottom,12)
                .opacity(expanded ? 1.0 :0.0).frame(maxHeight: expanded ?.infinity :0)
        }
        .frame(height:expanded ? 120 : 80)
        .padding(.leading,23)//左侧间距
        .padding(.trailing,15)//右侧间距
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(model.color,style: StrokeStyle(lineWidth: 4))//设置描边
                RoundedRectangle(cornerRadius: 20)//设置圆角
                //                .fill(Color.green)//填充颜色
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.white,model.color]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )//设置渐变色
            }
        ).padding(.horizontal)
//            .animation(.default)//这是 隐式动画
//            .onTapGesture {
//                withAnimation {
//                    self.expanded.toggle() // 用于 切换布尔值的 函数
//                }
//
//            }
    }
}
/*
 View Modifier 视图修改器
 我们可以重构一些重复定义的属性，你可以理解为有点类似于H5的CSS
 */
struct ToolButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30,height: 30)
    }
}
struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
//        PokemonInfoRow(model: .sample(id: 1), expanded: true)
        VStack {
            PokemonInfoRow(model: .sample(id: 1), expanded: false)
            PokemonInfoRow(model: .sample(id: 21), expanded: true)
            PokemonInfoRow(model: .sample(id: 25), expanded: false)
        }
    }
}
