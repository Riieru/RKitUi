import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import panel

//放大镜图案
Item{
        id:magnifierPath
        //参数
        //放大镜镜框原点坐标X
        property real magnifierCoordinatesX: 0
        //放大镜镜框原点坐标Y
        property real magnifierCoordinatesY: 0
        //放大镜镜框圆半径X
        property real magnifierRadiusX: 0
        //放大镜镜框圆半径Y
        property real magnifierRadiusY: 0
        //放大镜镜框边框宽度
        property real magnifierBorderwidth: 0
        //放大镜镜框边框颜色
        property color magnifierBorderColor: "#FFFFFF"
        //放大镜镜框填充颜色
        property color magnifierFillColor: "#FFFFFF"

        //放大镜镜片圆半径X
        property real magnifierLensRadiusX: 0
        //放大镜镜片圆半径Y
        property real magnifierLensRadiusY: 0
        //放大镜镜片边框宽度
        property real magnifierLensBorderwidth: 0
        //放大镜镜片边框颜色
        property color magnifierLensBorderColor: "#FFFFFF"
        //放大镜镜片填充颜色
        property color magnifierLensFillColor: "#FFFFFF"

        //放大镜手柄中线偏移角度
        property real magnifierHandleAngle: 0
        //放大镜手柄长度
        property real magnifierHandlelength: 0
        //放大镜手柄左侧偏移角度
        property real magnifierHandLeftAngle: 0
        //放大镜手柄右侧偏移角度
        property real magnifierHandRightAngle: 0
        //放大镜手柄末端圆弧半径X
        property real magnifierHandArcRadiusX: 0
        //放大镜手柄末端圆弧半径Y
        property real magnifierHandArcRadiusY: 0
        //放大镜手柄边框宽度
        property real magnifierHandBorderwidth: 0
        //放大镜手柄边框颜色
        property color magnifierHandBorderColor: "#FFFFFF"
        //放大镜手柄填充颜色
        property color magnifierHandFillColor: "#FFFFFF"

        //内部图形区域
        readonly property Shape magniferShape: magnifierShape

        Item{
            id:private_magniferpath
            //放大镜镜框原点坐标X
            property real magnifierCoordinatesX: parent.magnifierCoordinatesX
            //放大镜镜框原点坐标Y
            property real magnifierCoordinatesY: parent.magnifierCoordinatesY
            //放大镜镜框圆半径X
            property real magnifierRadiusX: parent.magnifierRadiusX
            //放大镜镜框圆半径Y
            property real magnifierRadiusY: parent.magnifierRadiusY
            //放大镜镜框边框宽度
            property real magnifierBorderwidth: parent.magnifierBorderwidth
            //放大镜镜框边框颜色
            property color magnifierBorderColor: parent.magnifierBorderColor
            //放大镜镜框填充颜色
            property color magnifierFillColor: parent.magnifierFillColor

            //放大镜镜片圆半径X
            property real magnifierLensRadiusX: parent.magnifierLensRadiusX
            //放大镜镜片圆半径Y
            property real magnifierLensRadiusY: parent.magnifierLensRadiusY
            //放大镜镜片边框宽度
            property real magnifierLensBorderwidth: parent.magnifierLensBorderwidth
            //放大镜镜片边框颜色
            property color magnifierLensBorderColor: parent.magnifierLensBorderColor
            //放大镜镜片填充颜色
            property color magnifierLensFillColor: parent.magnifierLensFillColor

            //放大镜手柄中线偏移角度
            property real magnifierHandleAngle: parent.magnifierHandleAngle
            //放大镜手柄长度
            property real magnifierHandlelength: parent.magnifierHandlelength
            //放大镜手柄左侧偏移角度
            property real magnifierHandLeftAngle: parent.magnifierHandLeftAngle
            //放大镜手柄右侧偏移角度
            property real magnifierHandRightAngle: parent.magnifierHandRightAngle
            //放大镜手柄末端圆弧半径X
            property real magnifierHandArcRadiusX: parent.magnifierHandArcRadiusX
            //放大镜手柄末端圆弧半径Y
            property real magnifierHandArcRadiusY: parent.magnifierHandArcRadiusY
            //放大镜手柄边框宽度
            property real magnifierHandBorderwidth: parent.magnifierHandBorderwidth
            //放大镜手柄边框颜色
            property real magnifierHandBorderColor: parent.magnifierHandBorderColor
            //放大镜手柄填充颜色
            property real magnifierHandFillColor: parent.magnifierHandFillColor

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

            //绘制
            Shape{
                id:magnifierShape
                //放大镜柄中线斜率
                property real magnifierHandLineK: Math.tan(Math.PI/180 * private_magniferpath.magnifierHandleAngle)
                //放大镜柄左侧直线斜率
                property real magnifierHandLeftLineK: Math.tan(Math.PI/180 * private_magniferpath.magnifierHandLeftAngle)
                //放大镜柄右侧直线斜率
                property real magnifierHandRightLineK: Math.tan(Math.PI/180 * private_magniferpath.magnifierHandRightAngle)

                //放大镜柄两侧与镜片的交点坐标
                property var magnifierHandToCentrePoint: {
                  var leftpoint = private_magniferpath.lineAndEllipseIntersection(private_magniferpath.magnifierCoordinatesX,private_magniferpath.magnifierCoordinatesY,private_magniferpath.magnifierRadiusX,private_magniferpath.magnifierRadiusY,magnifierShape.magnifierHandLeftLineK);
                  var rightpoint = private_magniferpath.lineAndEllipseIntersection(private_magniferpath.magnifierCoordinatesX,private_magniferpath.magnifierCoordinatesY,private_magniferpath.magnifierRadiusX,private_magniferpath.magnifierRadiusY,magnifierShape.magnifierHandRightLineK);
                    //左侧直线交点
                    var leftpointX = 0
                    var leftpointY = 0
                  if(Math.floor(private_magniferpath.magnifierHandLeftAngle / 180 )% 2 === 0) {
                      leftpointX = Math.round(leftpoint.y2) >= Math.round(leftpoint.y1) ? leftpoint.x2 : leftpoint.x1
                      leftpointY = Math.max(Math.round(leftpoint.y2),Math.round(leftpoint.y1))
                  }else{
                      leftpointX = Math.round(leftpoint.y2) < Math.round(leftpoint.y1) ? leftpoint.x2 : leftpoint.x1
                      leftpointY = Math.min(Math.round(leftpoint.y2),Math.round(leftpoint.y1))
                  }
                  //右侧直线交点
                  var rightpointX = 0
                  var rightpointY = 0
                  if(Math.floor(private_magniferpath.magnifierHandRightAngle / 180 )% 2 === 0) {
                      rightpointX = Math.round(rightpoint.y2) > Math.round(rightpoint.y1) ? rightpoint.x2 : rightpoint.x1
                      rightpointY = Math.max(Math.round(rightpoint.y2),Math.round(rightpoint.y1))
                  }else{
                      rightpointX = Math.round(rightpoint.y2) < Math.round(rightpoint.y1) ? rightpoint.x2 : rightpoint.x1
                      rightpointY = Math.min(Math.round(rightpoint.y2),Math.round(rightpoint.y1))
                  }
                  return{leftpointX:leftpointX,leftpointY:leftpointY,rightpointX:rightpointX,rightpointY:rightpointY}
                }

                //放大镜柄两侧尾部端点坐标
                property var magnifierHandTailPoint: {
                    //根据角度来判断朝向 true一三象限
                    var Direction = magnifierShape.magnifierHandLineK > 0 ? 1 : -1;
                    //放大镜柄尾部左侧直线端点
                    var leftTailPointX = 0
                    var leftTailPointY = 0
                    //放大镜柄尾部右侧直线端点
                    var rightTailPointX = 0
                    var rightTailPointY = 0
                if(Math.floor(private_magniferpath.magnifierHandleAngle / 180 )% 2 === 0) {
                    leftTailPointY = magnifierShape.magnifierHandToCentrePoint.leftpointY + Direction * (private_magniferpath.magnifierHandlelength * magnifierShape.magnifierHandLineK) / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2))
                    leftTailPointX = magnifierShape.magnifierHandToCentrePoint.leftpointX + Direction * (private_magniferpath.magnifierHandlelength / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2)))
                    rightTailPointY = magnifierShape.magnifierHandToCentrePoint.rightpointY + Direction * (private_magniferpath.magnifierHandlelength * magnifierShape.magnifierHandLineK) / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2))
                    rightTailPointX = magnifierShape.magnifierHandToCentrePoint.rightpointX + Direction * (private_magniferpath.magnifierHandlelength / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2)))
               }else{
                    leftTailPointY = magnifierShape.magnifierHandToCentrePoint.leftpointY - Direction * (private_magniferpath.magnifierHandlelength * magnifierShape.magnifierHandLineK) / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2))
                    leftTailPointX = magnifierShape.magnifierHandToCentrePoint.leftpointX - Direction * (private_magniferpath.magnifierHandlelength / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2)))
                    rightTailPointY = magnifierShape.magnifierHandToCentrePoint.rightpointY - Direction * (private_magniferpath.magnifierHandlelength * magnifierShape.magnifierHandLineK) / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2))
                    rightTailPointX = magnifierShape.magnifierHandToCentrePoint.rightpointX - Direction * (private_magniferpath.magnifierHandlelength / Math.sqrt(1 + Math.pow(magnifierShape.magnifierHandLineK,2)))
                }
                return {leftTailPointX:leftTailPointX,leftTailPointY:leftTailPointY,rightTailPointX:rightTailPointX,rightTailPointY:rightTailPointY}
            }

                //放大镜镜框
                ShapePath{
                    //线段宽度
                    strokeWidth: private_magniferpath.magnifierBorderwidth
                    //线段颜色
                    strokeColor: private_magniferpath.magnifierBorderColor
                    //填充颜色
                    fillColor: private_magniferpath.magnifierFillColor
                    //起始坐标
                    startX: private_magniferpath.magnifierCoordinatesX
                    startY: private_magniferpath.magnifierCoordinatesY - private_magniferpath.magnifierRadiusY

                    //绘制镜框
                    PathArc{
                        relativeX:0
                        relativeY:private_magniferpath.magnifierRadiusY * 2
                        radiusX: private_magniferpath.magnifierRadiusX
                        radiusY: private_magniferpath.magnifierRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                    PathArc{
                        relativeX:0
                        relativeY:-private_magniferpath.magnifierRadiusY * 2
                        radiusX: private_magniferpath.magnifierRadiusX
                        radiusY: private_magniferpath.magnifierRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                }

                //放大镜镜片
                ShapePath{
                    //线段宽度
                    strokeWidth: private_magniferpath.magnifierLensBorderwidth
                    //线段颜色
                    strokeColor: private_magniferpath.magnifierLensBorderColor
                    //填充颜色
                    fillColor: private_magniferpath.magnifierLensFillColor
                    //起始坐标
                    startX: private_magniferpath.magnifierCoordinatesX
                    startY: private_magniferpath.magnifierCoordinatesY - private_magniferpath.magnifierLensRadiusY

                    //绘制镜片
                    PathArc{
                        relativeX:0
                        relativeY:private_magniferpath.magnifierLensRadiusY * 2
                        radiusX: private_magniferpath.magnifierLensRadiusX
                        radiusY: private_magniferpath.magnifierLensRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                    PathArc{
                        relativeX:0
                        relativeY:-private_magniferpath.magnifierLensRadiusY * 2
                        radiusX: private_magniferpath.magnifierLensRadiusX
                        radiusY: private_magniferpath.magnifierLensRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                }

                    //绘制放大镜手柄
                ShapePath{
                    //线段宽度
                    strokeWidth: private_magniferpath.magnifierHandBorderwidth
                    //线段颜色
                    strokeColor: private_magniferpath.magnifierHandBorderColor
                    //填充颜色
                    fillColor: private_magniferpath.magnifierHandFillColor
                    //起始坐标
                    startX: magnifierShape.magnifierHandToCentrePoint.leftpointX
                    startY: magnifierShape.magnifierHandToCentrePoint.leftpointY

                    PathLine{
                        x:magnifierShape.magnifierHandTailPoint.leftTailPointX
                        y:magnifierShape.magnifierHandTailPoint.leftTailPointY
                    }
                    PathArc{
                        x:magnifierShape.magnifierHandTailPoint.rightTailPointX
                        y:magnifierShape.magnifierHandTailPoint.rightTailPointY
                        radiusX: private_magniferpath.magnifierHandArcRadiusX
                        radiusY: private_magniferpath.magnifierHandArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Counterclockwise
                    }
                    PathLine{
                        x:magnifierShape.magnifierHandToCentrePoint.rightpointX
                        y:magnifierShape.magnifierHandToCentrePoint.rightpointY
                    }
                    PathArc{
                        x:magnifierShape.magnifierHandToCentrePoint.leftpointX
                        y:magnifierShape.magnifierHandToCentrePoint.leftpointY
                        radiusX: private_magniferpath.magnifierRadiusX
                        radiusY: private_magniferpath.magnifierRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                }
            }
        }
    }
