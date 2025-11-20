import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import panel

//菜单图案
Item{
        id:menuPath
        //菜单图案线条数量
         property int objCount: 0
        //菜单图案中各线条间隔长度
         property real objIntervalLength: 0
        //菜单图案中线条高度（圆弧半径Y）
         property real objHeight: 0
        //线条参数
        //第一个线条左侧圆的坐标X
         property real objLeftArcX: 0
        //第一个线条左侧圆的坐标Y
         property real objLeftArcY: 0
        //线条左右侧两圆的间隔长度
         property real objLeftToRightIntervalLength: 0
        //线条右侧图案总长度(2圆弧+1直线)
         property real objRightLength: 0
        //线条左侧圆的X轴半径
         property real objLeftRadiusX: 0
        //线条右侧圆的X轴半径
         property real objRightRadiusX: 0

        //图案线段宽度
        property real pathWidth: 0
        //图案线段颜色
        property color pathStrokeColor: "#FFFFFF"
        //图案线条填充颜色
        property color pathFillColor: "#FFFFFF"

        Item{
            id:private_menuPath

            //菜单图案线条数量
             property int objCount: parent.objCount
            //菜单图案中各线条间隔长度
             property real objIntervalLength: parent.objIntervalLength
            //菜单图案中线条高度（圆弧半径Y）
             property real objHeight: parent.objHeight
            //线条参数
            //第一个线条左侧圆的圆心坐标X
             property real objLeftArcX: parent.objLeftArcX
            //第一个线条左侧圆的圆心坐标Y
             property real objLeftArcY: parent.objLeftArcY
            //线条左右侧两圆的间隔长度
             property real objLeftToRightIntervalLength: parent.objLeftToRightIntervalLength
            //线条右侧图案总长度(2圆弧+1直线)
             property real objRightLength: parent.objRightLength
            //线条左侧圆的X轴半径
             property real objLeftRadiusX: parent.objLeftRadiusX
            //线条右侧圆的X轴半径
             property real objRightRadiusX: parent.objRightRadiusX

            //图案线段宽度
            property real pathWidth: parent.pathWidth
            //图案线段颜色
            property color pathStrokeColor: parent.pathStrokeColor
            //图案线条填充颜色
            property color pathFillColor: parent.pathFillColor

            //绘制菜单图案
                //动态生成多个线条图案
               Repeater{
               //生成数量
               model: private_menuPath.objCount
               //显示
                 delegate: Shape{
                            ShapePath{
                        //线段宽度
                        strokeWidth: private_menuPath.pathWidth
                        //线段颜色
                        strokeColor: private_menuPath.pathStrokeColor
                        //填充颜色
                        fillColor: private_menuPath.pathFillColor
                        //起始坐标
                            startX: private_menuPath.objLeftArcX
                            startY: private_menuPath.objLeftArcY - (private_menuPath.objHeight / 2) + (index * private_menuPath.objIntervalLength)

                       //绘制左侧圆
                       PathArc{
                           relativeX: 0
                           relativeY: private_menuPath.objHeight
                           radiusX: private_menuPath.objLeftRadiusX
                           radiusY: private_menuPath.objHeight / 2
                           direction : PathArc.Clockwise
                           useLargeArc : true
                       }
                       PathArc{
                           relativeX: 0
                           relativeY: -private_menuPath.objHeight
                           radiusX: private_menuPath.objLeftRadiusX
                           radiusY: private_menuPath.objHeight / 2
                           direction : PathArc.Clockwise
                           useLargeArc : true
                       }

                       //绘制右侧椭圆
                       PathMove{
                           relativeX: private_menuPath.objLeftRadiusX + private_menuPath.objLeftToRightIntervalLength + private_menuPath.objRightRadiusX
                           relativeY: 0
                       }
                       PathArc{
                           relativeX: 0
                           relativeY: private_menuPath.objHeight
                           radiusX: private_menuPath.objRightRadiusX
                           radiusY: private_menuPath.objHeight / 2
                           direction : PathArc.Counterclockwise
                           useLargeArc : true
                       }
                       PathLine{
                           relativeX: private_menuPath.objRightLength - (2 * private_menuPath.objRightRadiusX)
                           relativeY: 0
                       }
                       PathArc{
                           relativeX: 0
                           relativeY: -private_menuPath.objHeight
                           radiusX: private_menuPath.objRightRadiusX
                           radiusY: private_menuPath.objHeight / 2
                           direction : PathArc.Counterclockwise
                           useLargeArc : true
                       }
                       PathLine{
                           relativeX: -(private_menuPath.objRightLength - (2 * private_menuPath.objRightRadiusX))
                           relativeY: 0
                       }

                     }
                   }
              }
        }
    }
