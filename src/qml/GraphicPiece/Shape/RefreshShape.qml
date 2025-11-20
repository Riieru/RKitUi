import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import RKitUi

//刷新图案
Item{
        id:refreshPath
        //参数
        //图案圆点坐标X
        property real pathCentrecoordinatesX: 0
        //图案圆点坐标Y
        property real pathCentrecoordinatesY: 0
        //图案圆半径X
        property real pathArcRadiusX: 0
        //图案圆半径Y
        property real pathArcRadiusY: 0
        //图案箭头尖于圆的角度
        property real patharrowHeadAngle: 0
        //图案箭头中心于圆的角度
        property real patharrowCentreAngle: 0
        //图案箭头中心的长度
        property real patharrowCentreWidth: 0
        //图案箭头尾部于圆的角度
        property real patharrowTailAngle: 0
        //图案箭头尾部的长度
        property real patharrowTailWidth: 0
        //箭头朝向（true为顺时针，false为逆时针）
        property bool patharrowTailDirection: true

        //图案线段宽度
        property real pathWidth: 0
        //图案线段颜色
        property color pathStrokeColor: "#FFFFFF"
        //图案线条填充颜色
        property color pathFillColor: "#FFFFFF"

        //内部图形区域
        readonly property Shape refreshShape: refresh

        Item{
            id:private_refreshPath
            //图案圆点坐标X
            property real pathCentrecoordinatesX: parent.pathCentrecoordinatesX
            //图案圆点坐标Y
            property real pathCentrecoordinatesY: parent.pathCentrecoordinatesY
            //图案圆半径X
            property real pathArcRadiusX: parent.pathArcRadiusX
            //图案圆半径Y
            property real pathArcRadiusY: parent.pathArcRadiusY
            //图案箭头尖于圆的角度
            property real patharrowHeadAngle: parent.patharrowHeadAngle
            //图案箭头中心于圆的角度
            property real patharrowCentreAngle: parent.patharrowCentreAngle
            //图案箭头中心的长度
            property real patharrowCentreWidth: parent.patharrowCentreWidth
            //图案箭头尾部于圆的角度
            property real patharrowTailAngle: parent.patharrowTailAngle
            //图案箭头尾部的长度
            property real patharrowTailWidth: parent.patharrowTailWidth
            //箭头朝向（true为顺时针，false为逆时针）
            property var patharrowTailDirection: {
                if(parent.patharrowTailDirection){
                    return PathArc.Clockwise
                }else return PathArc.Counterclockwise
            }

            //图案线段宽度
            property real pathWidth: parent.pathWidth
            //图案线段颜色
            property color pathStrokeColor: parent.pathStrokeColor
            //图案线条填充颜色
            property color pathFillColor: parent.pathFillColor

            //通过不同直线斜率计算直线过椭圆圆心与椭圆的交点
            property var lineAndEllipseIntersection: function(arccentreX,arccentreY,arcRaduisX,arcRadiusY,lineK) {
              //第一个交点
               var x1 = arccentreX - (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
               var y1 = arccentreY - lineK * (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
              //第二个交点
              var x2 = arccentreX + (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
              var y2 = arccentreY + lineK * (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
              return {x1:x1,y1:y1,x2:x2,y2:y2}
            }

            //绘制图案
            Shape{
                id:refresh

                //箭头尖参数
                property var arrowHeadParameters: {
                    //箭头尖坐标
                    var arrowheadX = 0
                    var arrowheadY = 0
                    //如果该直线与XY轴平行
                    if(private_refreshPath.patharrowHeadAngle % 90 === 0){
                        //判断垂直轴线
                        if(private_refreshPath.patharrowHeadAngle / 90 % 2 === 0){
                            //垂直于X轴
                            //判断朝向
                            if(private_refreshPath.patharrowHeadAngle % 360 === 0){
                                //右侧
                                arrowheadX = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX
                                arrowheadY = private_refreshPath.pathCentrecoordinatesY
                            }else{
                                //左侧
                                arrowheadX = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX
                                arrowheadY = private_refreshPath.pathCentrecoordinatesY
                            }
                        }else{
                            //垂直于Y轴
                            //判断朝向
                            if(private_refreshPath.patharrowHeadAngle % 450 === 0){
                                //下方
                                arrowheadX = private_refreshPath.pathCentrecoordinatesX
                                arrowheadY = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY
                            }else{
                                //上方
                                arrowheadX = private_refreshPath.pathCentrecoordinatesX
                                arrowheadY = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY
                            }
                        }
                    }else{
                    //圆心到箭头尖直线斜率
                    var arrowhead_k = Math.tan(Math.PI/180 * private_refreshPath.patharrowHeadAngle)
                    //获取该直线于圆的交点
                    var Intersection_head = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX,private_refreshPath.pathArcRadiusY,arrowhead_k)
                    //判断该角度朝向
                    if(Math.floor(private_refreshPath.patharrowHeadAngle / 180) % 2 === 0){
                        arrowheadX = (Intersection_head.y1 > Intersection_head.y2) ? Intersection_head.x1 : Intersection_head.x2
                        arrowheadY = Math.max(Intersection_head.y1,Intersection_head.y2)
                    }else{
                        arrowheadX = (Intersection_head.y1 < Intersection_head.y2) ? Intersection_head.x1 : Intersection_head.x2
                        arrowheadY = Math.min(Intersection_head.y1,Intersection_head.y2)
                      }
                    }
                    return {arrowheadX:arrowheadX,arrowheadY:arrowheadY}
                }

                    //箭头中心参数
                    property var arrowHeadToShaftParameters: {
                    //箭头两侧点坐标
                    //外侧A点
                    var arrowwingA_X = 0
                    var arrowwingA_Y = 0
                    //内侧B点
                    var arrowwingB_X = 0
                    var arrowwingB_Y = 0
                    //中心交界点
                    //A点中心交界点
                    var arrowHeadToShaftA_X = 0
                    var arrowHeadToShaftA_Y = 0
                    //B点中心交界点
                    var arrowHeadToShaftB_X = 0
                    var arrowHeadToShaftB_Y = 0
                    //如果该直线与XY轴平行
                    if(private_refreshPath.patharrowCentreAngle % 90 === 0){
                        //判断垂直轴线
                        if(private_refreshPath.patharrowCentreAngle / 90 % 2 === 0){
                            //垂直于X轴
                            //判断朝向
                            if(private_refreshPath.patharrowCentreAngle % 360 === 0){
                                //右侧
                                //外侧A点
                                arrowwingA_X = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowCentreWidth / 2
                                arrowwingA_Y = private_refreshPath.pathCentrecoordinatesY
                                //内侧B点
                                arrowwingB_X = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowCentreWidth / 2
                                arrowwingB_Y = private_refreshPath.pathCentrecoordinatesY
                                //A点中心交界点
                                arrowHeadToShaftA_X = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2
                                arrowHeadToShaftA_Y = private_refreshPath.pathCentrecoordinatesY
                                //B点中心交界点
                                arrowHeadToShaftB_X = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2
                                arrowHeadToShaftB_Y = private_refreshPath.pathCentrecoordinatesY
                            }else{
                                //左侧
                                //外侧A点
                                arrowwingA_X = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowCentreWidth / 2
                                arrowwingA_Y = private_refreshPath.pathCentrecoordinatesY
                                //内侧B点
                                arrowwingB_X = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowCentreWidth / 2
                                arrowwingB_Y = private_refreshPath.pathCentrecoordinatesY
                                //A点中心交界点
                                arrowHeadToShaftA_X = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2
                                arrowHeadToShaftA_Y = private_refreshPath.pathCentrecoordinatesY
                                //B点中心交界点
                                arrowHeadToShaftB_X = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2
                                arrowHeadToShaftB_Y = private_refreshPath.pathCentrecoordinatesY
                            }
                        }else{
                            //垂直于Y轴
                            //判断朝向
                            if(!(private_refreshPath.patharrowCentreAngle % 270 === 0)){
                                                            console.log(1)
                                //下方
                                //外侧A点
                                arrowwingA_X = private_refreshPath.pathCentrecoordinatesX
                                arrowwingA_Y = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowCentreWidth / 2
                                //内侧B点
                                arrowwingB_X = private_refreshPath.pathCentrecoordinatesX
                                arrowwingB_Y = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowCentreWidth / 2
                                //A点中心交界点
                                arrowHeadToShaftA_X = private_refreshPath.pathCentrecoordinatesX
                                arrowHeadToShaftA_Y = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2
                                //B点中心交界点
                                arrowHeadToShaftB_X = private_refreshPath.pathCentrecoordinatesX
                                arrowHeadToShaftB_Y = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2
                            }else{
                                //上方
                                //外侧A点
                                arrowwingA_X = private_refreshPath.pathCentrecoordinatesX
                                arrowwingA_Y = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowCentreWidth / 2
                                //内侧B点
                                arrowwingB_X = private_refreshPath.pathCentrecoordinatesX
                                arrowwingB_Y = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowCentreWidth / 2
                                //A点中心交界点
                                arrowHeadToShaftA_X = private_refreshPath.pathCentrecoordinatesX
                                arrowHeadToShaftA_Y = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2
                                //B点中心交界点
                                arrowHeadToShaftB_X = private_refreshPath.pathCentrecoordinatesX
                                arrowHeadToShaftB_Y = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2
                            }
                        }
                    }else{
                    //圆心到箭头中心点的直线斜率
                    var arrowHeadToShaft_k = Math.tan(Math.PI/180 * private_refreshPath.patharrowCentreAngle)
                    //获取该直线于圆的交点
                    //箭翼外侧圆
                    var Intersection_centre_lateral = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowCentreWidth / 2,private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowCentreWidth / 2,arrowHeadToShaft_k)
                    //箭翼内侧圆
                    var Intersection_centre_medial = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowCentreWidth / 2,private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowCentreWidth / 2,arrowHeadToShaft_k)
                    //箭头头尾交界圆交点(外侧）
                    var Intersection_centre_lateral_A = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2,private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2,arrowHeadToShaft_k)
                    //箭头头尾交界圆交点(内侧）
                    var Intersection_centre_medial_B = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2,private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2,arrowHeadToShaft_k)
                    //判断该角度朝向
                    if(Math.floor(private_refreshPath.patharrowCentreAngle / 180) % 2 === 0){
                        //外侧A点
                        arrowwingA_X = (Intersection_centre_lateral.y1 > Intersection_centre_lateral.y2) ? Intersection_centre_lateral.x1 : Intersection_centre_lateral.x2
                        arrowwingA_Y = Math.max(Intersection_centre_lateral.y1,Intersection_centre_lateral.y2)
                        //内侧B点
                        arrowwingB_X = (Intersection_centre_medial.y1 > Intersection_centre_medial.y2) ? Intersection_centre_medial.x1 : Intersection_centre_medial.x2
                        arrowwingB_Y = Math.max(Intersection_centre_medial.y1,Intersection_centre_medial.y2)
                        //A点中心交界点
                        arrowHeadToShaftA_X = (Intersection_centre_lateral_A.y1 > Intersection_centre_lateral_A.y2) ? Intersection_centre_lateral_A.x1 : Intersection_centre_lateral_A.x2
                        arrowHeadToShaftA_Y = Math.max(Intersection_centre_lateral_A.y1,Intersection_centre_lateral_A.y2)
                        //B点中心交界点
                        arrowHeadToShaftB_X = (Intersection_centre_medial_B.y1 > Intersection_centre_medial_B.y2) ? Intersection_centre_medial_B.x1 : Intersection_centre_medial_B.x2
                        arrowHeadToShaftB_Y = Math.max(Intersection_centre_medial_B.y1,Intersection_centre_medial_B.y2)
                    }else{
                        //外侧A点
                        arrowwingA_X = (Intersection_centre_lateral.y1 < Intersection_centre_lateral.y2) ? Intersection_centre_lateral.x1 : Intersection_centre_lateral.x2
                        arrowwingA_Y = Math.min(Intersection_centre_lateral.y1,Intersection_centre_lateral.y2)
                        //内侧B点
                        arrowwingB_X = (Intersection_centre_medial.y1 < Intersection_centre_medial.y2) ? Intersection_centre_medial.x1 : Intersection_centre_medial.x2
                        arrowwingB_Y = Math.min(Intersection_centre_medial.y1,Intersection_centre_medial.y2)
                        //A点中心交界点
                        arrowHeadToShaftA_X = (Intersection_centre_lateral_A.y1 < Intersection_centre_lateral_A.y2) ? Intersection_centre_lateral_A.x1 : Intersection_centre_lateral_A.x2
                        arrowHeadToShaftA_Y = Math.min(Intersection_centre_lateral_A.y1,Intersection_centre_lateral_A.y2)
                        //B点中心交界点
                        arrowHeadToShaftB_X = (Intersection_centre_medial_B.y1 < Intersection_centre_medial_B.y2) ? Intersection_centre_medial_B.x1 : Intersection_centre_medial_B.x2
                        arrowHeadToShaftB_Y = Math.min(Intersection_centre_medial_B.y1,Intersection_centre_medial_B.y2)
                     }
                    }
                    return {arrowwingA_X:arrowwingA_X,arrowwingA_Y:arrowwingA_Y,arrowwingB_X:arrowwingB_X,arrowwingB_Y:arrowwingB_Y,
                            arrowHeadToShaftA_X:arrowHeadToShaftA_X,arrowHeadToShaftA_Y:arrowHeadToShaftA_Y,arrowHeadToShaftB_X:arrowHeadToShaftB_X,arrowHeadToShaftB_Y:arrowHeadToShaftB_Y}
                  }

                //箭头尾部参数
                property var arrowShaftParameters: {
                    //箭头尾部坐标
                    //外侧A点
                    var arrowShaftA_X = 0
                    var arrowShaftA_Y = 0
                    //内侧B点
                    var arrowShaftB_X = 0
                    var arrowShaftB_Y = 0
                    //如果该直线与XY轴平行
                    if(private_refreshPath.patharrowTailAngle % 90 === 0){
                        //判断垂直轴线
                        if(private_refreshPath.patharrowTailAngle / 90 % 2 === 0){
                            //垂直于X轴
                            //判断朝向
                            if(private_refreshPath.patharrowTailAngle % 360 === 0){
                                //右侧
                                //外侧A点
                                arrowShaftA_X = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2
                                arrowShaftA_Y = private_refreshPath.pathCentrecoordinatesY
                                //内侧B点
                                arrowShaftB_X = private_refreshPath.pathCentrecoordinatesX + private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2
                                arrowShaftB_Y = private_refreshPath.pathCentrecoordinatesY
                            }else{
                                //左侧
                                //外侧A点
                                arrowShaftA_X = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2
                                arrowShaftA_Y = private_refreshPath.pathCentrecoordinatesY
                                //内侧B点
                                arrowShaftB_X = private_refreshPath.pathCentrecoordinatesX - private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2
                                arrowShaftB_Y = private_refreshPath.pathCentrecoordinatesY
                            }
                        }else{
                            //垂直于Y轴
                            //判断朝向
                            if(!(private_refreshPath.patharrowTailAngle % 270 === 0)){
                                //下方
                                //外侧A点
                                arrowShaftA_X = private_refreshPath.pathCentrecoordinatesX
                                arrowShaftA_Y = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2
                                //内侧B点
                                arrowShaftB_X = private_refreshPath.pathCentrecoordinatesX
                                arrowShaftB_Y = private_refreshPath.pathCentrecoordinatesY + private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2
                            }else{
                                //上方
                                //外侧A点
                                arrowShaftA_X = private_refreshPath.pathCentrecoordinatesX
                                arrowShaftA_Y = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2
                                //内侧B点
                                arrowShaftB_X = private_refreshPath.pathCentrecoordinatesX
                                arrowShaftB_Y = private_refreshPath.pathCentrecoordinatesY - private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2
                            }
                        }
                    }else{
                    //圆心到箭头尾部点的直线斜率
                    var arrowShaft_k = Math.tan(Math.PI/180 * private_refreshPath.patharrowTailAngle)
                    //获取该直线于圆的交点
                    //外侧圆
                    var Intersection_centre_lateral = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2,private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2,arrowShaft_k)
                    //内侧圆
                    var Intersection_centre_medial = private_refreshPath.lineAndEllipseIntersection(private_refreshPath.pathCentrecoordinatesX,private_refreshPath.pathCentrecoordinatesY,private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2,private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2,arrowShaft_k)
                    //判断该角度朝向
                    if(Math.floor(private_refreshPath.patharrowTailAngle / 180) % 2 === 0){
                        //外侧A点
                        arrowShaftA_X = (Intersection_centre_lateral.y1 > Intersection_centre_lateral.y2) ? Intersection_centre_lateral.x1 : Intersection_centre_lateral.x2
                        arrowShaftA_Y = Math.max(Intersection_centre_lateral.y1,Intersection_centre_lateral.y2)
                        //内侧B点
                        arrowShaftB_X = (Intersection_centre_medial.y1 > Intersection_centre_medial.y2) ? Intersection_centre_medial.x1 : Intersection_centre_medial.x2
                        arrowShaftB_Y = Math.max(Intersection_centre_medial.y1,Intersection_centre_medial.y2)
                    }else{
                        //外侧A点
                        arrowShaftA_X = (Intersection_centre_lateral.y1 < Intersection_centre_lateral.y2) ? Intersection_centre_lateral.x1 : Intersection_centre_lateral.x2
                        arrowShaftA_Y = Math.min(Intersection_centre_lateral.y1,Intersection_centre_lateral.y2)
                        //内侧B点
                        arrowShaftB_X = (Intersection_centre_medial.y1 < Intersection_centre_medial.y2) ? Intersection_centre_medial.x1 : Intersection_centre_medial.x2
                        arrowShaftB_Y = Math.min(Intersection_centre_medial.y1,Intersection_centre_medial.y2)
                    }
                   }
                    return {arrowShaftA_X:arrowShaftA_X,arrowShaftA_Y:arrowShaftA_Y,arrowShaftB_X:arrowShaftB_X,arrowShaftB_Y:arrowShaftB_Y}
                 }


                ShapePath{
                    //线段宽度
                    strokeWidth: private_refreshPath.pathWidth
                    //线段颜色
                    strokeColor: private_refreshPath.pathStrokeColor
                    //填充颜色
                    fillColor: private_refreshPath.pathFillColor
                    //起始坐标
                    startX: refresh.arrowHeadParameters.arrowheadX
                    startY: refresh.arrowHeadParameters.arrowheadY

                    PathLine{
                        x:refresh.arrowHeadToShaftParameters.arrowwingA_X
                        y:refresh.arrowHeadToShaftParameters.arrowwingA_Y
                    }
                    PathLine{
                        x:refresh.arrowHeadToShaftParameters.arrowHeadToShaftA_X
                        y:refresh.arrowHeadToShaftParameters.arrowHeadToShaftA_Y
                    }
                    PathArc{
                        x:refresh.arrowShaftParameters.arrowShaftA_X
                        y:refresh.arrowShaftParameters.arrowShaftA_Y
                        radiusX: private_refreshPath.pathArcRadiusX + private_refreshPath.patharrowTailWidth / 2
                        radiusY: private_refreshPath.pathArcRadiusY + private_refreshPath.patharrowTailWidth / 2
                        useLargeArc: false
                        direction: private_refreshPath.patharrowTailDirection
                    }
                    PathMove{
                        x:refresh.arrowHeadParameters.arrowheadX
                        y:refresh.arrowHeadParameters.arrowheadY
                    }
                    PathLine{
                        x:refresh.arrowHeadToShaftParameters.arrowwingB_X
                        y:refresh.arrowHeadToShaftParameters.arrowwingB_Y
                    }
                    PathLine{
                        x:refresh.arrowHeadToShaftParameters.arrowHeadToShaftB_X
                        y:refresh.arrowHeadToShaftParameters.arrowHeadToShaftB_Y
                    }
                    PathArc{
                        x:refresh.arrowShaftParameters.arrowShaftB_X
                        y:refresh.arrowShaftParameters.arrowShaftB_Y
                        radiusX: private_refreshPath.pathArcRadiusX - private_refreshPath.patharrowTailWidth / 2
                        radiusY: private_refreshPath.pathArcRadiusY - private_refreshPath.patharrowTailWidth / 2
                        useLargeArc: false
                        direction: private_refreshPath.patharrowTailDirection
                    }
                    PathLine{
                        x:refresh.arrowShaftParameters.arrowShaftA_X
                        y:refresh.arrowShaftParameters.arrowShaftA_Y
                    }
                }
            }
        }
    }
