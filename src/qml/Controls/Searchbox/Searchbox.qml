import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Controls.Basic
import RKitUi

 Item {
     id: pillSearchBox;
     width:0;
     height:0;



     // 圆弧x半径比例系数(0~1)
     property real borderRadiusRatio: 0
     //文本框宽度占比
     property real textProportion: 0
     //按钮宽度占比
     property real buttonProportion: 0
     //文本框和按钮的间距占比
     property real spacingProportion: 0

     //文本框填充颜色
     property color textfillcolor: Qt.rgba(255/255,192/255,203/255,1)
     //文本框边框颜色
     property color textframecolor: Qt.rgba(139/255,0,139/255,1)
     //按钮框填充颜色
     property color buttonfillcolor: Qt.rgba(0/255,191/255,255/255,1)
     //按钮框边框颜色
     property color buttonframecolor: Qt.rgba(139/255,0,139/255,1)
     //按钮聚焦颜色
     property color buttonfocuscolor: Qt.rgba(0/255,154/255,205/255,1)
     //按钮点击颜色
     property color buttonclickcolor: Qt.rgba(0/255,104/255,139/255,1)

     //文本框边框宽度
     property int textframeweight: 0
     //按钮框边框宽度
     property int buttonframeweight: 0
     //按钮图案放大镜边缘宽度
     property int magnifyingglassframeweight : 0

     //按钮图案放大镜半径比例
      property real centreRadius : 0
     //文本框字体大小比例
     property real fontSize : 0
     //按钮圆角半径比例——基于控件高度
     property real buttonflatradiusProportion: 0

     //信号——发送文本框内容
     signal sendText(string text);

     Item{
         id: private_Searchbox

         //圆弧Y半径
         property real borderRadius_Y: height / 2
         //圆弧X半径
         property real borderRadius_X:  {
            let calculated = height * borderRadiusRatio;
            return Math.min(borderRadius_Y, Math.min(calculated, height));
         }

         //控件中组件的宽度
         property var componentwidth: {
             try{
                     //如果比例范围溢出，则抛出
                  if(parent.textProportion + parent.buttonProportion + parent.spacingProportion > 1){ throw new Error("组件占比异常"); }
                  else       return{textwidth: parent.textProportion * parent.width,
                                    buttonwidth: parent.buttonProportion * parent.width,
                                    spacingwidth: parent.spacingProportion * parent.width}
             }
             catch(e) { console.error(e.message + "来源：", e.stack); }
         }

         //按钮圆角半径—基于控件高度
         property real buttonflatradius: {
                 try{
                         //范围于0~1
                      if(parent.buttonflatradiusProportion < 0 || parent.buttonflatradiusProportion > 1){ throw new Error("按钮右侧小圆角半径异常"); }
                      else       return parent.buttonflatradiusProportion * (pillSearchBox.height / 2)
                 }
                 catch(e) { console.error(e.message + "来源：", e.stack); }
         }


         //枚举类型
         property int textArea : 1
         property int buttonArea : 2
         //鼠标 进入/移出控件标志
         property bool input_output_sign : true


         anchors.fill: parent

        Shape {
                 id: pillShape
                 anchors.fill: parent
                 containsMode: Shape.FillContains

                 antialiasing: true
                 //文本框
                 ShapePath {
                     id: textpath_

                         joinStyle: ShapePath.RoundJoin


                     //文本框边框颜色
                     strokeColor: pillSearchBox.textframecolor
                     //文本框填充颜色
                     fillColor: pillSearchBox.textfillcolor
                     //文本框边框宽度
                     strokeWidth:pillSearchBox.textframeweight

                     PathMove { x: private_Searchbox.borderRadius_X ; y: 0 }

                     // 左侧半圆
                     PathArc {
                         relativeX: 0
                         relativeY: private_Searchbox.borderRadius_Y * 2
                         radiusX: private_Searchbox.borderRadius_X
                         radiusY: private_Searchbox.borderRadius_Y
                         useLargeArc: true
                         direction: PathArc.Counterclockwise
                     }

                     // 右侧直线
                     PathLine {
                         relativeX: (private_Searchbox.componentwidth.textwidth - 2 * private_Searchbox.borderRadius_X)
                         relativeY: 0
                     }

                     // 右侧半圆
                     PathArc {
                         relativeX: 0
                         relativeY: -private_Searchbox.borderRadius_Y * 2
                         radiusX: private_Searchbox.borderRadius_X
                         radiusY: private_Searchbox.borderRadius_Y
                         useLargeArc: true
                         direction: PathArc.Counterclockwise
                     }

                     // 闭合路径
                     PathLine {
                         relativeX: -(private_Searchbox.componentwidth.textwidth - 2 * private_Searchbox.borderRadius_X)
                         relativeY: 0
                     }
                 }
        }

           Shape{
                     id:buttonShape
                     anchors.fill: parent
                     containsMode: Shape.FillContains

                     property var buttonchangefunc : function buttonchangefunc() {
                     if(mousemanager.isMouseInShape == private_Searchbox.buttonArea) {
                          //触发悬浮事件
                          isHovered = true;
                            return pillSearchBox.buttonfocuscolor;
                     }else{
                          isHovered = false;
                            return pillSearchBox.buttonfillcolor;
                     }
            }
                     //鼠标悬停状态
                     property bool isHovered: false


                     antialiasing: true

                 //按钮
                 ShapePath {
                     id:buttonpath_

                     // 设置样式属性
                     strokeWidth: pillSearchBox.buttonframeweight
                     strokeColor: pillSearchBox.buttonframecolor
                     //填充颜色
                     fillColor: buttonShape.buttonchangefunc()


                     //移动至按钮起点
                     PathMove{x: private_Searchbox.componentwidth.textwidth - private_Searchbox.borderRadius_X + private_Searchbox.componentwidth.spacingwidth; y: 0}
                     //绘制右凸圆弧
                     PathArc {
                         relativeX: 0
                         relativeY: private_Searchbox.borderRadius_Y * 2
                         radiusX: private_Searchbox.borderRadius_X
                         radiusY: private_Searchbox.borderRadius_Y
                         useLargeArc: false
                         direction: PathArc.Clockwise
                     }
                     //按钮下方线段
                     PathLine {
                         relativeX: private_Searchbox.componentwidth.buttonwidth - private_Searchbox.buttonflatradius
                         relativeY: 0
                     }
                     //右侧圆弧
                     PathArc {
                         relativeX: private_Searchbox.buttonflatradius
                         relativeY: -private_Searchbox.buttonflatradius
                         radiusX: private_Searchbox.buttonflatradius
                         radiusY: private_Searchbox.buttonflatradius
                         useLargeArc: false
                         direction: PathArc.Counterclockwise
                     }
                     PathLine {
                         relativeX: 0
                         relativeY: -(pillSearchBox.height - private_Searchbox.buttonflatradius * 2)
                     }
                     PathArc {
                         relativeX: -private_Searchbox.buttonflatradius
                         relativeY: -private_Searchbox.buttonflatradius
                         radiusX: private_Searchbox.buttonflatradius
                         radiusY: private_Searchbox.buttonflatradius
                         useLargeArc: false
                         direction: PathArc.Counterclockwise
                     }

                     //按钮上方封闭线段
                     PathLine {
                         relativeX: -(private_Searchbox.componentwidth.buttonwidth - private_Searchbox.buttonflatradius)
                         relativeY: 0
                     }
                  }
                 }

           //仅在鼠标悬浮在按钮上才开启特效
           Shape {
               id: indicator
               visible: buttonShape.isHovered
           }

           Shape {
               id: indicator_2
               visible: buttonShape.isHovered
           }

           FlowingPhantom{
                id: text_A
                sourcePath: buttonpath_
                vertex_Front: indicator
                vertex_Back: indicator_2
                lineLength: 3000
                lineSpeed: 10000
                lineLoop: Animation.Infinite
                running: buttonShape.isHovered
                pathColor: "#16242D"
                pathWidth: 4
                sourcePath_parent: buttonShape
                visiblepath: buttonShape.isHovered
           }

                   //放大镜图案
                 Rectangle {

                     id:buttonDraw
                        //按钮区域去除左侧圆弧的实际区域
                        property real buttonrealweight : private_Searchbox.componentwidth.buttonwidth-private_Searchbox.borderRadius_X
                        //按钮宽度等比例10分
                        property real proportionalweight : buttonDraw.buttonrealweight/10
                        property real proportionalheigth : pillSearchBox.height/10
                        //圆心坐标
                        property int centreCoordinatesX : private_Searchbox.componentwidth.textwidth + private_Searchbox.componentwidth.spacingwidth + buttonDraw.proportionalweight * 4
                        property int centreCoordinatesY : buttonDraw.proportionalheigth * 4
                        //圆的半径比例
                        property real centreRadius : pillSearchBox.centreRadius

                     //边框宽度
                     border.width: pillSearchBox.magnifyingglassframeweight
                     //边框颜色
                     border.color: "white"

                     x:buttonDraw.centreCoordinatesX-Math.min(buttonDraw.proportionalweight*buttonDraw.centreRadius,buttonDraw.proportionalheigth*buttonDraw.centreRadius)
                     y:buttonDraw.centreCoordinatesY-Math.min(buttonDraw.proportionalweight*buttonDraw.centreRadius,buttonDraw.proportionalheigth*buttonDraw.centreRadius)
                 width: Math.min(buttonDraw.proportionalweight * buttonDraw.centreRadius*2,buttonDraw.proportionalheigth * buttonDraw.centreRadius*2)
                 height: buttonDraw.width
                 color: buttonpath_.fillColor
                 radius: width/2

                 }

                 Shape{
                     id : buttonDraw_line
                     ShapePath{
                     strokeWidth: pillSearchBox.magnifyingglassframeweight

                      //放大镜柄
                         PathMove {
                             // 右下方45度方向的圆上点
                             x: buttonDraw.centreCoordinatesX + Math.cos(Math.PI/4) * buttonDraw.width/2
                             y: buttonDraw.centreCoordinatesY + Math.sin(Math.PI/4) * buttonDraw.height/2
                         }
                         PathLine {
                             relativeX:Math.cos(Math.PI/4) * Math.min(buttonDraw.proportionalweight * 2 , buttonDraw.proportionalheigth * 2)
                             relativeY:Math.sin(Math.PI/4) * Math.min(buttonDraw.proportionalweight * 2 , buttonDraw.proportionalheigth * 2)
                         }
                     }

                 }


                 //鼠标区域：仅响应Shape可见区域的交互
                 MouseArea {
                     id: mousemanager
                     anchors.fill: parent
                     // 启用鼠标悬停检测
                     hoverEnabled: true
                     //判断鼠标是否在Shape的可见区域内
                     property int isMouseInShape: {
                     if(containsMouse){
                         // 将鼠标坐标转换为Shape的本地坐标
                         var localPos = pillShape.mapFromItem(private_Searchbox, mouseX, mouseY);
                         // 判断点是否在形状内部
                         if(pillShape.contains(localPos)) return private_Searchbox.textArea;


                         //如果在按钮区域，返回按钮标志
                         var buttonpos = buttonShape.mapFromItem(private_Searchbox,mouseX, mouseY);
                         if(buttonShape.contains(buttonpos)) return private_Searchbox.buttonArea;

                         return 0;
                          }else{
                         return 0;
                            }
                     }

                     propagateComposedEvents: true

                     cursorShape: {
                     switch(isMouseInShape){
                            //文本框
                            case private_Searchbox.textArea : return Qt.IBeamCursor;
                            //按钮
                            case private_Searchbox.buttonArea : return Qt.PointingHandCursor;
                            //默认
                            default : return Qt.ArrowCursor
                     }
                     }


                     onClicked: {
                        pillSearchBox.sendText(searchText.text)
                   }
                     onPressed: {

                     // 点击：仅在Shape内部时让文本框聚焦
                     switch(isMouseInShape){
                            //文本框
                             case private_Searchbox.textArea : searchText.forceActiveFocus(); break;
                             //按钮
                             case private_Searchbox.buttonArea : {
                                  buttonShape.forceActiveFocus();
                                  buttonpath_.fillColor = buttonclickcolor
                                          break;
                             }
                     }
                     }
                     onReleased: {
                          //恢复按钮颜色
                       buttonpath_.fillColor = Qt.binding(function(){return buttonShape.buttonchangefunc()});
                     }

                       onExited: private_Searchbox.input_output_sign = false;
                       onEntered: private_Searchbox.input_output_sign = true;



                 }

                 //控件
                 //文本框

                 TextField {
                      id:searchText
                    x:private_Searchbox.borderRadius_X
                     y:0
                     height:pillSearchBox.height
                     width: private_Searchbox.componentwidth.textwidth - private_Searchbox.borderRadius_X * 2
                     placeholderText: "请输入内容"
                     background: Rectangle {
                         color: "transparent"
                        anchors.fill: parent
                 }
                      font.pixelSize : Math.round(height * pillSearchBox.fontSize)

                 }





     }
 }
