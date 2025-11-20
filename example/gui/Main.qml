import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Layouts
import Qt3D.Render 2.9
import QtQuick.Controls 2.15
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic
import panel

Window {
    id: window
    width: 1400
    height:1200
    visible: true
    title: qsTr("Optimized Window")

      Searchbox{
          id:sss
          x:300
          y:0
        height:120
        width: 400
         Layout.alignment: Qt.AlignHCenter
         textframeweight: 1
         buttonframeweight: 1
         centreRadius:1.85
         borderRadiusRatio: 0.2
         textProportion:0.7
         buttonProportion:0.2
         spacingProportion:0.0025
         magnifyingglassframeweight : 2
         fontSize : 0.7
         buttonflatradiusProportion: 0.3
      }

    Rectangle{
        x:100
        y:250
        width: 200
        height: 100

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "blue"

        Catbutton{
            id:teee
             x:0
             y:0
             // width: 200
             // height: 200
             anchors.fill: parent
            facefillColor:Qt.rgba(238/255,165/255,64/255,1)
            faceMousehoverfillColor:"red"
            faceMousedownfillColor:"blue"
            layer.enabled: true
            layer.samples: 12


        buttonstrokeColor:"#E4080A"
        buttonWidth:2
        faceproportion:1
        leftEarParameters: Catbutton.EarParameterObj{
            earMidpointInclinationRatio: 0.3
            leftpointearAngleProportion: 0.3
            rightpointearAngleProportion: 0.5
            earSlantratio: 0.1
            earlenthportion: 1
            leftradius:3
            rightradius:5
            earfillColor:Qt.rgba(255/255,192/255,203/255,1)
            earMousehoverfillColor: "red"
            earMousedownfillColor: "blue"
        }
        rightEarParameters: Catbutton.EarParameterObj{
            earMidpointInclinationRatio: 0.3
            leftpointearAngleProportion: 0.5
            rightpointearAngleProportion: 0.3
            earSlantratio: 0.1
            earlenthportion: 1
            leftradius:5
            rightradius:3
            earfillColor:Qt.rgba(255/255,192/255,203/255,1)
            earMousehoverfillColor: "red"
            earMousedownfillColor: "blue"
        }
        mouseParameters: Catbutton.MouthParameterObj{
            //嘴部中点位置偏移范围比例(0~1)
           mouseMidpointInclinationRatio: 0.5
            //嘴部中点位置于圆心的长度比例(0~1)___圆心——>椭圆底部
           mouseMidpointLengthRatio: 0.9
            //嘴部左侧端点位置偏移范围比例(0~1)
           mouseLeftpointInclinationRatio: 0.7
            //嘴部左侧端点于圆心的长度比例(0~1)___圆心——>椭圆左下
           mouseLeftpointLengthRatio: 0.7
            //嘴部右侧端点位置偏移范围比例(0~1)
           mouseRightpointInclinationRatio: 0.7
            //嘴部右侧端点于圆心的长度比例(0~1)___圆心——>椭圆右下
           mouseRightpointLengthRatio: 0.7
         //半径
            //嘴部左侧端点到嘴部中点的半径比例___以最小半径为基础倍增
           mouseLeftToMidpointRadiusRatio: 5
            //嘴部右侧端点到嘴部中点的半径比例___以最小半径为基础倍增
           mouseRightToMidpointRadiusRatio: 5
        }
        embedParameters: Catbutton.EmbedObj{
             embedObject:Rectangle{
                 clip: true
                 width: 32
                 height: 32
                 //边框宽度
                 border.width: 1
                 //边框颜色
                 border.color: "black"
                 // 设置透明
                 color: Qt.rgba(1, 1, 1, 0)
                 Shape{
                     ShapePath{
                         strokeColor:"blue"
                         startX: 0
                         startY: 0
                         PathLine{
                             x:40
                             y:40
                         }
                     }
                 }

             }
             objX:50
             objY:50
        }

        }
   }


    Rectangle{
        x:300
        y:250
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

       DownloadShape{
             id:aaad
             //整体图案大小缩放比例
             sizeProportion: 1.2
             //中线长度
             midLength: 120
             //中线尾部——左斜线的倾斜角度
             leftAngle: 45
             //中线尾部——左斜线的长度
             leftLength: 50
             //中线尾部——右斜线的倾斜角度
             rightAngle: 45
             //中线尾部——右斜线的长度
             rightLength: 50
             //底部横线长度
             bottomLenght: 80
             //底部横线与中心位置Y轴距离
             bottomToCantreYLenght: 10
             //图案中心位置
             pathX: parent.width/2
             pathY: parent.height / 4 * 3

             //图案线段宽度
             pathWidth: 3
             //图案线段颜色
             pathColor: "blue"
        }

}
    Rectangle{
        x:500
        y:250
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"


        MenuShape{
             id:aawwetrew
             //菜单图案线条数量
              objCount: 6
             //菜单图案中各线条间隔长度
              objIntervalLength: 20
             //菜单图案中线条高度（圆弧半径Y）
              objHeight: 10
             //线条参数
             //第一个线条左侧圆的坐标X
             objLeftArcX: 50
             //第一个线条左侧圆的坐标Y
              objLeftArcY: 50
             //线条左右侧两圆的间隔长度
              objLeftToRightIntervalLength: 20
             //线条右侧图案总长度(2圆弧+1直线)
             objRightLength: 90
             //线条左侧圆的X轴半径
              objLeftRadiusX: 10
             //线条右侧圆的X轴半径
              objRightRadiusX: 10

             //图案线段宽度
             pathWidth: 2
             //图案线段颜色
             pathStrokeColor: "blue"
             //图案线条填充颜色
             pathFillColor: "yellow"
        }




}
    Rectangle{
        x:700
        y:250
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

        ArrowShape{
         //箭头尖头部X坐标
         arrowHeadX: 120
         //箭头尖头部Y坐标
         arrowHeadY: 130
         //箭头尖线段A倾斜角度
         arrowHeadInclinationAngle_A: -45+90+90+90
         //箭头尖线段A长度
         arrowHeadLength_A: 60
         //箭头尖线段B倾斜角度
         arrowHeadInclinationAngle_B: 45+90+90+90
         //箭头尖线段B长度
         arrowHeadLength_B: 60
         //箭头杆宽度
         arrowShaftWidth: 20
         //箭头杆长度
         arrowShaftHeight: 60
         //箭头杆尾部2角圆弧半径X
         arrowShaftTailArcRaidusX: 10
         //箭头杆尾部2角圆弧半径Y
         arrowShaftTailArcRaidusY: 10
         //箭头杆尾部圆弧所占箭头杆长度
         arrowShaftTailArcHeight: 8
         //箭头杆尾部圆弧所占箭头杆宽度
         arrowShaftTailArcWidth: 8
         arrowShaftTailArcdirection:PathArc.Clockwise

         //图案线段宽度
         pathWidth: 2
         //图案线段颜色
         pathStrokeColor: "blue"
         //图案线条填充颜色
         pathFillColor: "red"
        }
}

    Rectangle{
        x:900
        y:250
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

        RefreshShape{
         //图案圆点坐标X
         pathCentrecoordinatesX: 70
         //图案圆点坐标Y
         pathCentrecoordinatesY: 130
         //图案圆半径X
         pathArcRadiusX: 80
         //图案圆半径Y
         pathArcRadiusY: 80
         //图案箭头尖于圆的角度
         patharrowHeadAngle: -100
         //图案箭头中心于圆的角度
         patharrowCentreAngle: -80
         //图案箭头中心的长度
         patharrowCentreWidth: 50
         //图案箭头尾部于圆的角度
         patharrowTailAngle: 60
         //图案箭头尾部的长度
         patharrowTailWidth: 30
         //箭头朝向（true为顺时针，false为逆时针）
         patharrowTailDirection: true

         //图案线段宽度
         pathWidth: 2
         //图案线段颜色
         pathStrokeColor: "blue"
         //图案线条填充颜色
         pathFillColor: "red"
        }
}

    Rectangle{
        x:300
        y:450
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

        MagnifierShape{
         //放大镜镜框原点坐标X
         magnifierCoordinatesX: 80
         //放大镜镜框原点坐标Y
         magnifierCoordinatesY: 80
         //放大镜镜框圆半径X
         magnifierRadiusX: 40
         //放大镜镜框圆半径Y
         magnifierRadiusY: 40
         //放大镜镜框边框宽度
         magnifierBorderwidth: 1
         //放大镜镜框边框颜色
         magnifierBorderColor: "blue"
         //放大镜镜框填充颜色
         magnifierFillColor: "#FFFFFF"

         //放大镜镜片圆半径X
         magnifierLensRadiusX: 38
         //放大镜镜片圆半径Y
         magnifierLensRadiusY: 38
         //放大镜镜片边框宽度
         magnifierLensBorderwidth: 1
         //放大镜镜片边框颜色
         magnifierLensBorderColor: "blue"
         //放大镜镜片填充颜色
         magnifierLensFillColor: "yellow"

         //放大镜手柄中线偏移角度
         magnifierHandleAngle: 45
         //放大镜手柄长度
         magnifierHandlelength: 70
         //放大镜手柄左侧偏移角度
         magnifierHandLeftAngle: 55
         //放大镜手柄右侧偏移角度
         magnifierHandRightAngle: 35
         //放大镜手柄末端圆弧半径X
         magnifierHandArcRadiusX: 50
         //放大镜手柄末端圆弧半径Y
         magnifierHandArcRadiusY: 50
         //放大镜手柄边框宽度
         magnifierHandBorderwidth: 1
         //放大镜手柄边框颜色
         magnifierHandBorderColor: "blue"
         //放大镜手柄填充颜色
         magnifierHandFillColor: "#FFFFFF"
        }
}



    Rectangle{
        x:500
        y:450
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

        PerCornerRoundRectShape{
         id:aaaaaa
           x:0
           y:0
           width:100
           height:100
           //左上角X长度
           rectleftTopX: 50
           //左上角Y长度
           rectleftTopY: 50
           //左下角X长度
           rectleftDownX: 50
           //左下角Y长度
           rectleftDownY: 50
           //右上角X长度
           rectRightTopX: 50
           //右上角Y长度
           rectRightTopY: 50
           //右下角X长度
           rectRightDownX: 50
           //右下角Y长度
           rectRightDownY: 50
           //圆弧半径X
           rectRadiusX: 50
           //圆弧半径Y
           rectRadiusY: 50
           //边框宽度
           rectBorderWidth: 1
           //边框颜色
           rectBorderColor: "blue"
           //填充颜色
           rectFullColor: "#FFFFFF"
           MouseArea{
               id: rectBackground_mouse
               anchors.fill: parent
               propagateComposedEvents: true
               //鼠标悬停检测
               hoverEnabled: true
               //判断鼠标是否在Shape的可见区域内
               property bool isMouseInShape: {
                   var value = false;
               if(containsMouse){
                   //将鼠标坐标转换为Shape的本地坐标
                   var localPos = parent.roundRectShape.mapFromItem(parent, mouseX, mouseY);
                   //判断点是否在按钮内部
                  return parent.roundRectShape.contains(localPos) ? true : false;
                     }else{return false}
               }
           }

        }

}

    Rectangle{
        x:700
        y:450
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

        SmallArrowShape{
         //外侧箭头尖坐标X
         outerArrowHeadX: 40
         //外侧箭头尖坐标Y
         outerArrowHeadY: 40
         //箭头直线A外侧旋转角度
         arrowLineOuterAngle_A: 45
         //箭头直线B外侧旋转角度
         arrowLineOuterAngle_B: 135
         //箭头直线A内侧旋转角度
         arrowLineSideAngle_A: 45
         //箭头直线B内侧旋转角度
         arrowLineSideAngle_B: 135
         //外侧箭头直线A长度
         outerArrowLineLength_A: 50
         //外侧箭头直线B长度
         outerArrowLineLength_B: 50
         //内侧箭头尖于外侧箭头尖的角度
         arrowHeadInsideToOuterAngle: 90
         //内侧箭头尖于外侧箭头尖的长度
         arrowHeadInsideToOuterLength: 20
         //内侧箭头直线A长度
         insideArrowLineLength_A: 20
         //内侧箭头直线B长度
         insideArrowLineLength_B: 20
         //箭头边框宽度
         arowBorderwidth: 5
         //箭头边框颜色
         arrowBorderColor: "blue"
         //箭头图案内填充颜色
         arrowFillColor: "yellow"
        }
}
    Rectangle{
        x:900
        y:450
        width: 300
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12



        TabCollectionPreset{
                     id:asdc
                    //  comboBoxShape.comboBoxLeftHeight: 20

                     //x:10
                     //y:10

                     width: 200
                     height: 200

                     tabCollectionPresetWidth:500
                     //列表容器高度
                     tabCollectionPresetHeight:500

                     tabCollectionPresetstartX: 10
                     tabCollectionPresetstartY: 20

                     //选项框多个选项页数据
                      optionsdata:["wscfdseew","dcwedcfwesdawsedfewsafc","wedffc"]
                     //选项页间隔高度
                     optionsSpacingHeight:0
                     //选项页宽度
                     optionsWidth:400
                     //选项页高度
                     optionsHeight:20
                     //选项页边框宽度
                     optionsBorderWidth:1
                     //选项页边框颜色
                     optionsBorderColor:"blue"
                     //选项页填充颜色
                     optionsFullWidth:"yellow"
                     //选项页字体大小
                     optionspixelSize:16
                     //选项页字体颜色
                     optionspixelColor:"green"

                     // 垂直滚动条（完整自定义版本）
                     ScrollBar.vertical: ScrollBar {
                         id: vScrollBar
                         x:parent.width - width
                         y:parent.height / 10
                         width: 12  // 滚动条宽度（包含轨道和滑块）
                         height: parent.height - 2 * (parent.height / 10)
                         policy: ScrollBar.AsNeeded  // 按需显示，避免空间浪费

                         // 轨道背景（灰色圆角矩形）
                         background: Rectangle {
                             width: parent.width
                             height: parent.height
                             radius: width / 2  // 轨道圆角（与宽度匹配）
                             color: "#f0f0f0"
                         }

                         // 滑块（核心：动态大小+圆角+抗锯齿）
                         contentItem: Rectangle {
                             id: handle
                             width: vScrollBar.width - 4
                             height: Math.max(20, vScrollBar.height * vScrollBar.size)   // 动态高度
                             radius: handle.width / 2  // 圆角半径（确保完全圆形）

                             // 样式：渐变色+边框+抗锯齿
                             gradient: Gradient {
                                 GradientStop { position: 0; color: "#66ccff" }
                                 GradientStop { position: 1; color: "#4499ff" }
                             }
                             border.color: "#3366dd"
                             border.width: 1

                             // 抗锯齿关键设置
                             layer.enabled: true
                             layer.smooth: true  // 启用抗锯齿，修复圆角边缘截断

                             // 鼠标悬停效果（可选增强）
                             MouseArea {
                                 anchors.fill: parent
                                 hoverEnabled: true
                                 onEntered: handle.scale = 1.05  // 悬停放大
                                 onExited: handle.scale = 1.0    // 恢复原大小
                                 onPressed: (mouse) => { mouse.accepted = false }
                             }
                         }
                     }
                     // 水平滚动条（关键修正：位置、尺寸、滑块依赖ID）
                     ScrollBar.horizontal: ScrollBar {
                         id: hScrollBar
                         x: parent.width / 10    // 左留边距（和垂直滚动条边距一致）
                         y: parent.height - height  // 靠底显示（水平滚动条默认在底部）
                         width: parent.width - 2 * (parent.width / 10)  // 宽度=父元素宽度-左右边距
                         height: 12               // 水平滚动条高度（窄条，和垂直滚动条宽度一致）
                         policy: ScrollBar.AsNeeded

                         // 轨道背景（适配水平方向，圆角用height/2）
                         background: Rectangle {
                             width: parent.width
                             height: parent.height
                             radius: height / 2  // 水平轨道圆角=高度/2（保持圆形）
                             color: "#f0f0f0"
                         }

                         // 滑块
                         contentItem: Rectangle {
                             width: Math.max(1, hScrollBar.width * hScrollBar.size)
                             height: hScrollBar.height - 4
                             radius: height / 2  // 圆角=高度/2（保持圆形）
                             gradient: Gradient {
                                 GradientStop { position: 0; color: "#66ccff" }
                                 GradientStop { position: 1; color: "#4499ff" }
                             }
                             border.color: "#3366dd"
                             border.width: 1
                             layer.enabled: true
                             layer.smooth: true

                             MouseArea {
                                 anchors.fill: parent
                                 hoverEnabled: true
                                 onEntered: parent.scale = 1.05
                                 onExited: parent.scale = 1.0
                                 onPressed:(mouse) => { mouse.accepted = false }
                             }
                         }
                     }
              }
            }




    Rectangle{
        x:700
        y:650
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

        ErrorShape{
                 //中心原点坐标X
                 errorCenterX: 130
                 //中心原点坐标Y
                 errorCenterY: 130
                 //中心圆半径X
                 errorCenterArcX: 6
                 //中心圆半径Y
                 errorCenterArcY: 6
                 //A直线旋转角度
                 errorLineAngleA: 280
                 //A直线长度
                 errorLineLengthA: 60
                 //A直线宽度
                 errorLineWidthA: 10
                 //A直线顶部圆弧半径X
                 errorLineTopArcRadiusA_X: 4
                 //A直线顶部圆弧半径Y
                 errorLineTopArcRadiusA_Y: 4
                 //A直线圆弧方向
                 errorLineTopArcDirectionA: PathArc.Counterclockwise
                 //B直线旋转角度
                 errorLineAngleB: 50
                 //B直线长度
                 errorLineLengthB: 40
                 //B直线宽度
                 errorLineWidthB: 10
                 //B直线顶部圆弧半径X
                 errorLineTopArcRadiusB_X: 4
                 //B直线顶部圆弧半径Y
                 errorLineTopArcRadiusB_Y: 4
                 //B直线圆弧方向
                 errorLineTopArcDirectionB: PathArc.Counterclockwise
                 //C直线旋转角度
                 errorLineAngleC: 130
                 //C直线长度
                 errorLineLengthC: 40
                 //C直线宽度
                 errorLineWidthC: 9
                 //C直线顶部圆弧半径X
                 errorLineTopArcRadiusC_X: 4
                 //C直线顶部圆弧半径Y
                 errorLineTopArcRadiusC_Y: 4
                 //C直线圆弧方向
                 errorLineTopArcDirectionC: PathArc.Clockwise
                 //D直线旋转角度
                 errorLineAngleD: 210
                 //D直线长度
                 errorLineLengthD: 40
                 //D直线宽度
                 errorLineWidthD: 10
                 //D直线顶部圆弧半径X
                 errorLineTopArcRadiusD_X: 4
                 //D直线顶部圆弧半径Y
                 errorLineTopArcRadiusD_Y: 4
                 //D直线圆弧方向
                 errorLineTopArcDirectionD: PathArc.Clockwise

                 //错误图案边框宽度
                 errorBorderwidth: 1
                 //错误图案边框颜色
                 errorBorderColor: "blue"
                 //错误图案内填充颜色
                 errorFillColor: "yellow"

                 //错误图案中心边框宽度
                 errorCenterBorderwidth: 1
                 //错误图案中心颜色
                 errorCenterBorderColor: "blue"
                 //错误图案中心内填充颜色
                 errorCenterFillColor: "yellow"

        }
}


    Rectangle{
        x:900
        y:650
        width: 200
        height: 200

        //边框宽度
        border.width: 1
        //边框颜色
        border.color: "black"
        color: "red"

        layer.enabled: true
        layer.samples: 12

     CheckTrueShape{
            id:checkPath
            //中心原点坐标X
            checkCenterX: 80
            //中心原点坐标Y
            checkCenterY: 80
            //中心圆半径X
            checkCenterArcX: 10
            //中心圆半径Y
            checkCenterArcY: 10
            //A直线旋转角度
            checkLineAngleA: 235
            //A直线长度
            checkLineLengthA: 30
            //A直线宽度
            checkLineWidthA: 10
            //A直线顶部圆弧半径X
            checkLineTopArcRadiusA_X: 70
            //A直线顶部圆弧半径Y
            checkLineTopArcRadiusA_Y: 70
            //A直线圆弧方向
            checkLineTopArcDirectionA: PathArc.Clockwise
            //B直线旋转角度
            checkLineAngleB: 330
            //B直线长度
            checkLineLengthB: 70
            //B直线宽度
            checkLineWidthB: 10
            //B直线顶部圆弧半径X
            checkLineTopArcRadiusB_X: 70
            //B直线顶部圆弧半径Y
            checkLineTopArcRadiusB_Y: 70
            //B直线圆弧方向
            checkLineTopArcDirectionB: PathArc.Clockwise

            //正确图案边框宽度
            checkBorderwidth: 1
            //正确图案边框颜色
            checkBorderColor: "blue"
            //正确图案内填充颜色
            checkFillColor: "yellow"

            //两直线夹交圆弧——A直线方向长度
            checkInnerArcToALength: 5
            //两直线夹交圆弧——B直线方向长度
            checkInnerArcToBLength: 5
            //两直线夹交圆弧半径X
            checkInnerArcRadiusX: 60
            //两直线夹交圆弧半径Y
            checkInnerArcRadiusY: 60

            //两直线外侧夹交圆弧——A直线方向长度
            checkouterArcToALength: 5
            //两直线外侧夹交圆弧——B直线方向长度
            checkouterArcToBLength: 5
            //两直线外侧夹交圆弧半径X
            checkouterArcRadiusX: 60
            //两直线外侧夹交圆弧半径Y
            checkouterArcRadiusY: 60

     }

}

}


