import QtQuick 2.15
import QtQuick.Shapes
import panel

//圆角矩形背景板
Item {
    id:perCornerRoundRect
    //参数
    //左上角X长度
    property real rectleftTopX: 0
    //左上角Y长度
    property real rectleftTopY: 0
    //左下角X长度
    property real rectleftDownX: 0
    //左下角Y长度
    property real rectleftDownY: 0
    //右上角X长度
    property real rectRightTopX: 0
    //右上角Y长度
    property real rectRightTopY: 0
    //右下角X长度
    property real rectRightDownX: 0
    //右下角Y长度
    property real rectRightDownY: 0
    //圆弧半径X
    property real rectRadiusX: 0
    //圆弧半径Y
    property real rectRadiusY: 0
    //边框宽度
    property real rectBorderWidth: 0
    //边框颜色
    property color rectBorderColor: "#FFFFFF"
    //填充颜色
    property color rectFullColor: "#FFFFFF"


    //内部图形区域
    readonly property Shape roundRectShape: rectBackgroundPath



    Item{
        id:private_rectBackground
        //宽高
        width: parent.width
        height: parent.height
        //左上角X长度
        property real rectleftTopX: parent.rectleftTopX
        //左上角Y长度
        property real rectleftTopY: parent.rectleftTopY
        //左下角X长度
        property real rectleftDownX: parent.rectleftDownX
        //左下角Y长度
        property real rectleftDownY: parent.rectleftDownY
        //右上角X长度
        property real rectRightTopX: parent.rectRightTopX
        //右上角Y长度
        property real rectRightTopY: parent.rectRightTopY
        //右下角X长度
        property real rectRightDownX: parent.rectRightDownX
        //右下角Y长度
        property real rectRightDownY: parent.rectRightDownY
        //圆弧半径X
        property real rectRadiusX: parent.rectRadiusX
        //圆弧半径Y
        property real rectRadiusY: parent.rectRadiusY
        //边框宽度
        property real rectBorderWidth: parent.rectBorderWidth
        //边框颜色
        property color rectBorderColor: parent.rectBorderColor
        //填充颜色
        property color rectFullColor: parent.rectFullColor

        Shape{
            id:rectBackgroundPath
            anchors.fill: parent
            containsMode: Shape.FillContains
            //上方直线长度
            property real rectTopLineWidth: private_rectBackground.width - private_rectBackground.rectleftTopX - private_rectBackground.rectRightTopX
            //下方直线长度
            property real rectDownLineWidth: private_rectBackground.width - private_rectBackground.rectleftDownX - private_rectBackground.rectRightDownX
            //左侧直线长度
            property real rectLeftLineWidth: private_rectBackground.height - private_rectBackground.rectleftTopY - private_rectBackground.rectleftDownY
            //右侧直线长度
            property real rectRightLineWidth: private_rectBackground.height - private_rectBackground.rectRightTopY - private_rectBackground.rectRightDownY
            ShapePath{
              //边框宽度
              strokeWidth: private_rectBackground.rectBorderWidth
              //边框颜色
              strokeColor: private_rectBackground.rectBorderColor
              //填充色
              fillColor: private_rectBackground.rectFullColor
              //起始位置
              startX: private_rectBackground.x + private_rectBackground.rectleftTopX
              startY: private_rectBackground.y

              PathArc{
                  relativeX: -private_rectBackground.rectleftTopX
                  relativeY: private_rectBackground.rectleftTopY
                  radiusX: private_rectBackground.rectRadiusX
                  radiusY: private_rectBackground.rectRadiusY
                  direction : PathArc.Counterclockwise
                  useLargeArc : false
              }
              PathLine{
                  relativeX: 0
                  relativeY: rectBackgroundPath.rectLeftLineWidth
              }
              PathArc{
                  relativeX: private_rectBackground.rectleftDownX
                  relativeY: private_rectBackground.rectleftDownY
                  radiusX: private_rectBackground.rectRadiusX
                  radiusY: private_rectBackground.rectRadiusY
                  direction : PathArc.Counterclockwise
                  useLargeArc : false
              }
              PathLine{
                  relativeX: rectBackgroundPath.rectDownLineWidth
                  relativeY: 0
              }
              PathArc{
                  relativeX: private_rectBackground.rectRightDownX
                  relativeY: -private_rectBackground.rectRightDownY
                  radiusX: private_rectBackground.rectRadiusX
                  radiusY: private_rectBackground.rectRadiusY
                  direction : PathArc.Counterclockwise
                  useLargeArc : false
              }
              PathLine{
                  relativeX: 0
                  relativeY: -rectBackgroundPath.rectRightLineWidth
              }
              PathArc{
                  relativeX: -private_rectBackground.rectRightTopX
                  relativeY: -private_rectBackground.rectRightTopY
                  radiusX: private_rectBackground.rectRadiusX
                  radiusY: private_rectBackground.rectRadiusY
                  direction : PathArc.Counterclockwise
                  useLargeArc : false
              }
              PathLine{
                  relativeX: -rectBackgroundPath.rectTopLineWidth
                  relativeY: 0
              }
            }
        }
    }
}
