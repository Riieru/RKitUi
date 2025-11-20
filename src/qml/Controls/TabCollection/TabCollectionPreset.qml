import QtQuick 2.15
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls 2.15
import QtQuick.Controls.Basic
import panel

ScrollView {

    id:tabCollectionPreset

    x:0
    y:0
    width: 50
    height: 50

    clip: true



    //列表容器起始坐标
    property real tabCollectionPresetstartX:0
    property real tabCollectionPresetstartY:0

    //列表容器宽度
    property real tabCollectionPresetWidth:50
    //列表容器高度
    property real tabCollectionPresetHeight:50
    //选项框多个选项页数据
    property list<string> optionsdata:[]
    //选项页间隔高度
    property real optionsSpacingHeight:0
    //选项页宽度
    property real optionsWidth:perCornerRoundRect.width
    //选项页高度
    property real optionsHeight:perCornerRoundRect.height / 10
    //选项页边框宽度
    property real optionsBorderWidth:1
    //选项页边框颜色
    property color optionsBorderColor:"#FFFFFF"
    //选项页填充颜色
    property color optionsFullWidth:"#FFFFFF"
    //选项页字体大小
    property int optionspixelSize:perCornerRoundRect.height / 5
    //选项页字体颜色
    property color optionspixelColor:"#FFFFFF"

    //选项框背景
    property alias perCornerShape:perCornerShapePath

    ColumnLayout {

        Control_Core{
            id:perCornerRoundRect

            x:tabCollectionPreset.tabCollectionPresetstartX
            y:tabCollectionPreset.tabCollectionPresetstartY
            width: tabCollectionPreset.tabCollectionPresetWidth
            height: tabCollectionPreset.tabCollectionPresetHeight

            //选项框多个选项页数据
            property list<string> optionsdata:tabCollectionPreset.optionsdata
            //选项页间隔高度
            property real optionsSpacingHeight:tabCollectionPreset.optionsSpacingHeight
            //选项页宽度
            property real optionsWidth:tabCollectionPreset.optionsWidth
            //选项页高度
            property real optionsHeight:tabCollectionPreset.optionsHeight
            //选项页边框宽度
            property real optionsBorderWidth:tabCollectionPreset.optionsBorderWidth
            //选项页边框颜色
            property color optionsBorderColor:tabCollectionPreset.optionsBorderColor
            //选项页填充颜色
            property color optionsFullWidth:tabCollectionPreset.optionsFullWidth
            //选项页字体大小
            property int optionspixelSize:tabCollectionPreset.optionspixelSize
            //选项页字体颜色
            property color optionspixelColor:tabCollectionPreset.optionspixelColor
            //选项框背景
            property alias perCornerShape:perCornerShapePath




  //预设子组件
    //选项框预设背景控件
    PerCornerRoundRectShape{
     id:perCornerShapePath
       anchors.fill: parent
       //左上角X长度
       rectleftTopX: perCornerRoundRect.width / 12
       //左上角Y长度
       rectleftTopY: perCornerRoundRect.height / 12
       //左下角X长度
       rectleftDownX: perCornerRoundRect.width / 12
       //左下角Y长度
       rectleftDownY: perCornerRoundRect.height / 12
       //右上角X长度
       rectRightTopX: perCornerRoundRect.width / 12
       //右上角Y长度
       rectRightTopY: perCornerRoundRect.height / 12
       //右下角X长度
       rectRightDownX: perCornerRoundRect.width / 12
       //右下角Y长度
       rectRightDownY: perCornerRoundRect.height / 12
       //圆弧半径X
       rectRadiusX: perCornerRoundRect.width / 12
       //圆弧半径Y
       rectRadiusY: perCornerRoundRect.height / 12
       //边框宽度
       rectBorderWidth: 2
       //边框颜色
       rectBorderColor: "blue"
       //填充颜色
       rectFullColor: "green"
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
       layer.enabled: true
       layer.samples: 4

     }

    //选项框预设选项页
    Item{
              id:perCornerOption
              anchors.fill: parent
              //anchors.margins: perCornerShapePath.rectBorderWidth
              visible: false
              Repeater{
                 //生成数量
                 model: perCornerRoundRect.optionsdata
                 //显示
                   delegate: Rectangle{
                        x: 0
                        y: perCornerRoundRect.optionsHeight * index
                        width: perCornerRoundRect.optionsWidth
                        height: perCornerRoundRect.optionsHeight
                        border.color: perCornerRoundRect.optionsBorderColor
                        border.width: perCornerRoundRect.optionsBorderWidth
                        color: perCornerRoundRect.optionsFullWidth

                       Rectangle{
                           id:textarea
                           x:Math.max(perCornerRoundRect.perCornerShape.rectleftTopX,perCornerRoundRect.perCornerShape.rectleftDownX)
                           y:0
                           width: parent.width - (2 * Math.max(perCornerRoundRect.perCornerShape.rectleftTopX,perCornerRoundRect.perCornerShape.rectleftDownX))
                           height: parent.height
                           color: "transparent"
                           clip: true
                        Text {
                            id:datatext
                            text: modelData
                            font.pixelSize: perCornerRoundRect.optionspixelSize
                            color: perCornerRoundRect.optionspixelColor
                            anchors.left: parent.left
                        }
                     }
                       Text {
                           text: datatext.contentWidth > textarea.width ? "..." : ""
                           font.pixelSize: perCornerRoundRect.optionspixelSize
                           color: perCornerRoundRect.optionspixelColor
                           x:parent.width - Math.max(perCornerRoundRect.perCornerShape.rectleftTopX,perCornerRoundRect.perCornerShape.rectleftDownX)
                       }
                    }
                   }

          }



    OpacityMask {
        anchors.fill: parent
        source: perCornerOption
        maskSource: perCornerShapePath
        }
      }
    }
}
