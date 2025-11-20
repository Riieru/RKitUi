import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import panel

//下载图案
Item{
        id:downloadPath
      //参数
        //整体图案大小缩放比例
        property real sizeProportion: 0
        //中线长度
        property real midLength: 0
        //中线尾部——左斜线的倾斜角度
        property real leftAngle: 0
        //中线尾部——左斜线的长度
        property real leftLength: 0
        //中线尾部——右斜线的倾斜角度
        property real rightAngle: 0
        //中线尾部——右斜线的长度
        property real rightLength: 0
        //底部横线长度
        property real bottomLenght: 0
        //底部横线与中心位置Y轴距离
        property real bottomToCantreYLenght: 0
        //图案中心位置
        property real pathX: 0
        property real pathY: 0

        //图案线段宽度
        property real pathWidth: 0
        //图案线段颜色
        property color pathColor: "#FFFFFF"

        //内部图形区域
        readonly property Shape downloadShape: downloadshape


        Item{
            id:private_downloadPath

            //中线尾部——左斜线的倾斜角度
            property real leftAngle: parent.leftAngle
            //中线尾部——右斜线的倾斜角度
            property real rightAngle: parent.rightAngle
            //底部横线与中心位置Y轴距离
            property real bottomToCantreYLenght: parent.bottomToCantreYLenght
            //图案中心位置
            property real pathX: parent.pathX
            property real pathY: parent.pathY
            //中线长度
            property real midLength: parent.midLength * parent.sizeProportion
            //中线尾部——左斜线的长度
            property real leftLength: parent.leftLength * parent.sizeProportion
            //中线尾部——右斜线的长度
            property real rightLength: parent.rightLength * parent.sizeProportion
            //底部横线长度
            property real bottomLenght: parent.bottomLenght * parent.sizeProportion
            //图案线段宽度
            property real pathWidth: parent.pathWidth
            //图案线段颜色
            property color pathColor: parent.pathColor

            //下载按钮path绘制
            Shape{
                id:downloadshape
              ShapePath{
                  //线段宽度
                  strokeWidth: private_downloadPath.pathWidth
                  //线段颜色
                  strokeColor: private_downloadPath.pathColor
                  //透明底色
                  fillColor: Qt.rgba(1, 1, 1, 0)
                  //起始位置
                  startX: private_downloadPath.pathX
                  startY: private_downloadPath.pathY

                  //中线
                  PathLine{
                      relativeX: 0
                      relativeY: -private_downloadPath.midLength
                  }

                  PathMove{
                      x:private_downloadPath.pathX
                      y:private_downloadPath.pathY
                  }

                  //中线左侧左斜线
                  PathLine{
                      relativeX: -(Math.cos(Math.PI / 180 * private_downloadPath.leftAngle) * private_downloadPath.leftLength)
                      relativeY: -(Math.sin(Math.PI / 180 * private_downloadPath.leftAngle) * private_downloadPath.leftLength)
                  }

                  PathMove{
                      x:private_downloadPath.pathX
                      y:private_downloadPath.pathY
                  }

                  //中线右侧右斜线
                  PathLine{
                      relativeX: Math.cos(Math.PI / 180 * private_downloadPath.rightAngle) * private_downloadPath.rightLength
                      relativeY: -(Math.sin(Math.PI / 180 * private_downloadPath.rightAngle) * private_downloadPath.rightLength)
                  }

                   //底部横线
                  PathMove{
                      x:private_downloadPath.pathX - (private_downloadPath.bottomLenght / 2)
                      y:private_downloadPath.pathY + private_downloadPath.bottomToCantreYLenght
                  }

                  PathLine{
                      relativeX: private_downloadPath.bottomLenght
                      relativeY: 0
                  }


              }
            }

        }

    }
