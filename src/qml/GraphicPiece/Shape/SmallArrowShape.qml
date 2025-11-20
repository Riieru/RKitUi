import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import panel

//小箭头图案
Item{
        id:smallArrowPath
        //参数
        //外侧箭头尖坐标X
        property real outerArrowHeadX: 0
        //外侧箭头尖坐标Y
        property real outerArrowHeadY: 0
        //箭头直线A外侧旋转角度
        property real arrowLineOuterAngle_A: 0
        //箭头直线B外侧旋转角度
        property real arrowLineOuterAngle_B: 0
        //箭头直线A内侧旋转角度
        property real arrowLineSideAngle_A: 0
        //箭头直线B内侧旋转角度
        property real arrowLineSideAngle_B: 0
        //外侧箭头直线A长度
        property real outerArrowLineLength_A: 0
        //外侧箭头直线B长度
        property real outerArrowLineLength_B: 0
        //内侧箭头尖于外侧箭头尖的角度
        property real arrowHeadInsideToOuterAngle: 0
        //内侧箭头尖于外侧箭头尖的长度
        property real arrowHeadInsideToOuterLength: 0
        //内侧箭头直线A长度
        property real insideArrowLineLength_A: 0
        //内侧箭头直线B长度
        property real insideArrowLineLength_B: 0
        //箭头边框宽度
        property real arowBorderwidth: 0
        //箭头边框颜色
        property color arrowBorderColor: "#FFFFFF"
        //箭头图案内填充颜色
        property color arrowFillColor: "#FFFFFF"

        //内部图形区域
        readonly property Shape smallArrowShape: smallArrowShape

        Item{
            id:private_smallArrowPath
            //参数
            //外侧箭头尖坐标X
            property real outerArrowHeadX: parent.outerArrowHeadX
            //外侧箭头尖坐标Y
            property real outerArrowHeadY: parent.outerArrowHeadY
            //箭头直线A外侧旋转角度
            property real arrowLineOuterAngle_A: parent.arrowLineOuterAngle_A
            //箭头直线B外侧旋转角度
            property real arrowLineOuterAngle_B: parent.arrowLineOuterAngle_B
            //箭头直线A内侧旋转角度
            property real arrowLineSideAngle_A: parent.arrowLineSideAngle_A
            //箭头直线B内侧旋转角度
            property real arrowLineSideAngle_B: parent.arrowLineSideAngle_B
            //外侧箭头直线A长度
            property real outerArrowLineLength_A: parent.outerArrowLineLength_A
            //外侧箭头直线B长度
            property real outerArrowLineLength_B: parent.outerArrowLineLength_B
            //内侧箭头尖于外侧箭头尖的角度
            property real arrowHeadInsideToOuterAngle: parent.arrowHeadInsideToOuterAngle
            //内侧箭头尖于外侧箭头尖的长度
            property real arrowHeadInsideToOuterLength: parent.arrowHeadInsideToOuterLength
            //内侧箭头直线A长度
            property real insideArrowLineLength_A: parent.insideArrowLineLength_A
            //内侧箭头直线B长度
            property real insideArrowLineLength_B: parent.insideArrowLineLength_B
            //箭头边框宽度
            property real arowBorderwidth: parent.arowBorderwidth
            //箭头边框颜色
            property color arrowBorderColor: parent.arrowBorderColor
            //箭头图案内填充颜色
            property color arrowFillColor: parent.arrowFillColor

            //给定直线斜率和长度，根据直线上一点坐标求过一段距离后的坐标
            property var lineAndKToLocation: function(startX,startY,lineK,linelength,Direction) {
              //坐标
               var x = startX + (Direction * (linelength / Math.sqrt(1 + Math.pow(lineK,2))))
               var y = startY + (Direction * (linelength * lineK) / Math.sqrt(1 + Math.pow(lineK,2)))
              return {x:x,y:y}
            }

            Shape{
                id:smallArrowShape

                //内侧箭头尖坐标
                property var insideArrowLocation:{
                    //斜率
                   var arrowHead_K = private_smallArrowPath.arrowHeadInsideToOuterAngle % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_smallArrowPath.arrowHeadInsideToOuterAngle)
                    //箭头尖相连直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX = arrowHead_K >= 0 ? 1 : -1
                    //箭头尖相连直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY = Math.floor(private_smallArrowPath.arrowHeadInsideToOuterAngle / 180) % 2 === 0 ? 1 : -1
                    //获取坐标
                    var LineBPoint = private_smallArrowPath.lineAndKToLocation(private_smallArrowPath.outerArrowHeadX,private_smallArrowPath.outerArrowHeadY,arrowHead_K,private_smallArrowPath.arrowHeadInsideToOuterLength,(DirectionX * DirectionY))
                    //坐标
                    return {x:LineBPoint.x,y:LineBPoint.y}
                }

                //外侧直线A斜率
                property real arrowOuterLineK_A: private_smallArrowPath.arrowLineOuterAngle_A % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_smallArrowPath.arrowLineOuterAngle_A)
                //外侧直线B斜率
                property real arrowOuterLineK_B: private_smallArrowPath.arrowLineOuterAngle_B % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_smallArrowPath.arrowLineOuterAngle_B)
                //内侧直线A斜率
                property real arrowSideLineK_A: private_smallArrowPath.arrowLineSideAngle_A % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_smallArrowPath.arrowLineSideAngle_A)
                //内侧直线B斜率
                property real arrowSideLineK_B: private_smallArrowPath.arrowLineSideAngle_B % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_smallArrowPath.arrowLineSideAngle_B)

                //外侧箭头两侧坐标
                property var bothOuterOfExternal:{
                    //A直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_A = arrowOuterLineK_A >= 0 ? 1 : -1
                    //A直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_A = Math.floor(private_smallArrowPath.arrowLineOuterAngle_A / 180) % 2 === 0 ? 1 : -1
                    //获取坐标
                    var LineAPoint = private_smallArrowPath.lineAndKToLocation(private_smallArrowPath.outerArrowHeadX,private_smallArrowPath.outerArrowHeadY,smallArrowShape.arrowOuterLineK_A,private_smallArrowPath.outerArrowLineLength_A,(DirectionX_A * DirectionY_A))
                    //A直线于终点坐标
                    var LineAPointX = LineAPoint.x
                    var LineAPointY = LineAPoint.y
                    //B直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_B = arrowOuterLineK_B >= 0 ? 1 : -1
                    //B直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_B = Math.floor(private_smallArrowPath.arrowLineOuterAngle_B / 180) % 2 === 0 ? 1 : -1
                    //获取坐标
                    var LineBPoint = private_smallArrowPath.lineAndKToLocation(private_smallArrowPath.outerArrowHeadX,private_smallArrowPath.outerArrowHeadY,smallArrowShape.arrowOuterLineK_B,private_smallArrowPath.outerArrowLineLength_B,(DirectionX_B * DirectionY_B))
                    //A直线于终点坐标
                    var LineBPointX = LineBPoint.x
                    var LineBPointY = LineBPoint.y

                    return {LineAPointX:LineAPointX,LineAPointY:LineAPointY,LineBPointX:LineBPointX,LineBPointY:LineBPointY}
                }

                //内侧箭头两侧坐标
                property var bothSideOfExternal:{
                    //A直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_A = arrowSideLineK_A >= 0 ? 1 : -1
                    //A直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_A = Math.floor(private_smallArrowPath.arrowLineSideAngle_A / 180) % 2 === 0 ? 1 : -1
                    //获取坐标
                    var LineAPoint = private_smallArrowPath.lineAndKToLocation(smallArrowShape.insideArrowLocation.x,smallArrowShape.insideArrowLocation.y,smallArrowShape.arrowSideLineK_A,private_smallArrowPath.insideArrowLineLength_A,(DirectionX_A * DirectionY_A))
                    //A直线于终点坐标
                    var LineAPointX = LineAPoint.x
                    var LineAPointY = LineAPoint.y
                    //B直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_B = arrowSideLineK_B >= 0 ? 1 : -1
                    //B直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_B = Math.floor(private_smallArrowPath.arrowLineSideAngle_B / 180) % 2 === 0 ? 1 : -1
                    //获取坐标
                    var LineBPoint = private_smallArrowPath.lineAndKToLocation(smallArrowShape.insideArrowLocation.x,smallArrowShape.insideArrowLocation.y,smallArrowShape.arrowSideLineK_B,private_smallArrowPath.insideArrowLineLength_B,(DirectionX_B * DirectionY_B))
                    //A直线于终点坐标
                    var LineBPointX = LineBPoint.x
                    var LineBPointY = LineBPoint.y

                    return {LineAPointX:LineAPointX,LineAPointY:LineAPointY,LineBPointX:LineBPointX,LineBPointY:LineBPointY}
                }

                ShapePath{
                    //边框宽度
                    strokeWidth: private_smallArrowPath.arowBorderwidth
                    //线段颜色
                    strokeColor: private_smallArrowPath.arrowBorderColor
                    //填充颜色
                    fillColor: private_smallArrowPath.arrowFillColor
                    //起始坐标
                    startX: smallArrowShape.bothOuterOfExternal.LineBPointX
                    startY: smallArrowShape.bothOuterOfExternal.LineBPointY

                    //外侧
                    PathLine{
                        x:private_smallArrowPath.outerArrowHeadX
                        y:private_smallArrowPath.outerArrowHeadY
                    }
                    PathLine{
                        x:smallArrowShape.bothOuterOfExternal.LineAPointY
                        y:smallArrowShape.bothOuterOfExternal.LineAPointY
                    }
                    //内侧
                    PathLine{
                        x:smallArrowShape.bothSideOfExternal.LineAPointX
                        y:smallArrowShape.bothSideOfExternal.LineAPointY
                    }
                    PathLine{
                        x:smallArrowShape.insideArrowLocation.x
                        y:smallArrowShape.insideArrowLocation.y
                    }
                    PathLine{
                        x:smallArrowShape.bothSideOfExternal.LineBPointX
                        y:smallArrowShape.bothSideOfExternal.LineBPointY
                    }
                    PathLine{
                        x:smallArrowShape.bothOuterOfExternal.LineBPointX
                        y:smallArrowShape.bothOuterOfExternal.LineBPointY
                    }
                }
            }
        }
    }
