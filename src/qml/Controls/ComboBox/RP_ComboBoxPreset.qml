import QtQuick
import panel


Control_Core{
    id:asdc
    x:10
    y:10
    width: 200
    height: 200

    //下拉框背景
    property alias comboBoxShape:combobox_rp
    //下拉框左侧按钮控件
    property alias comboBoxLeftItem:leftarrowpath
    //下拉框右上小箭头控件
    property alias comboBoxRightTopItem:righttoparrow
    //下拉框右下小箭头控件
    property alias comboBoxRightDownItem:rightdownarrow
    //下拉框选项卡控件
    property alias comboBoxOptionsItem:optionsAreas



    controlPath: combobox_rp
  controlChildItem:[
        //选项卡区域控件
        optionsAreas,
        //左侧区域控件
        leftarrowpath,
        //右上区域控件
        righttoparrow,
        //右下区域控件
        rightdownarrow
    ]


//预设子组件
  QtObject{
        id:subcomponent

  //下拉框预设背景控件
  property Item rP_ComboBoxPath : RP_ComboBoxShape{
      id:combobox_rp
      anchors.fill: parent
      //下拉框左侧标识图案区域宽度
      comboBoxLeftWidth: 40
      //下拉框左侧标识图案区域高度
      comboBoxLeftHeight: 40
      //下拉框中间文本区域宽度
      comboBoxTextWidth: 80
      //下拉框中间文本区域高度
      comboBoxTextHeight: 30
      //下拉框右侧按钮区域宽度
      comboBoxRightWidth: 40
      //下拉框右侧按钮区域高度
      comboBoxRightHeight: 45
      //左侧圆角半径X
      comboBoxLeftArcRadiusX: 5
      //中间文本区域圆弧半径X
      comboBoxMiddleArcRadiusX: 30
      //右侧圆弧半径X
      comboBoxRightArcRadiusX: 40
      //左侧圆弧半径Y
      comboBoxLeftArcRadiusY: 5
      //中间文本区域圆弧半径Y
      comboBoxMiddleArcRadiusY: 30
      //右侧圆弧半径Y
      comboBoxRightArcRadiusY: 40

      //下拉框左侧与中间区域交界处圆弧半径X
      comboBoxLeftToMiddleArcRadiusX: 90
      //下拉框左侧与中间区域交界处圆弧半径Y
      comboBoxLeftToMiddleArcRadiusY: 90
      //下拉框右侧与中间区域交界处圆弧半径X
      comboBoxRightToMiddleArcRadiusX: 60
      //下拉框右侧与中间区域交界处圆弧半径Y
      comboBoxRightToMiddleArcRadiusY: 60
      //下拉框右侧圆弧x轴宽度
      comboBoxRightArcWidth: 5


      //左侧圆角X宽度
      comboBoxLeftArcWidth: 5
      //左侧圆角Y高度
      comboBoxLeftArcHeight: 5

      //下拉框左侧直线长度
      comboBoxLeftLineLength: 30
      //下拉框右侧直线长度
      comboBoxRightLineLength: 30

      //下拉框与下方文本框交界区域高度
      comboBoxTextPasteHeight: 12
      //下拉框与下方文本框交界宽度
      comboBoxTextPasteDownWidth: 180
      //下拉框与下方文本框交界处右侧圆弧半径X
      comboBoxTextPasteRightArcRadiusX: 390
      //下拉框与下方文本框交界处右侧圆弧半径Y
      comboBoxTextPasteRightArcRadiusY: 390
      //下拉框与下方文本框交界区域实际高度
      comboBoxTextPastActualHeight : 12

      //下拉框左侧标识图案区域边框宽度
      comboBoxLeftBorderWidth: 1
      //下拉框左侧标识图案区域边框颜色
      comboBoxLeftBorderColor: "blue"
      //下拉框左侧标识图案区域填充颜色
      comboBoxLeftFullColor: "#FFFFFF"
      //下拉框中间文本区域边框宽度
      comboBoxMiddleBorderWidth: 1
      //下拉框中间文本区域边框颜色
      comboBoxMiddleBorderColor: "blue"
      //下拉框中间文本区域填充颜色
      comboBoxMiddleFullColor: "#FFFFFF"
      //下拉框右侧按钮区域，方向朝上按钮边框宽度
      comboBoxUpArrowBorderWidth: 1
      //下拉框右侧按钮区域，方向朝上按钮边框颜色
      comboBoxUpArrowBorderColor: "blue"
      //下拉框右侧按钮区域，方向朝上按钮填充颜色
      comboBoxUpArrowFullColor: "#FFFFFF"
      //下拉框右侧按钮区域，方向朝下按钮边框宽度
      comboBoxDownArrowBorderWidth: 1
      //下拉框右侧按钮区域，方向朝下按钮边框颜色
      comboBoxDownArrowBorderColor: "blue"
      //下拉框右侧按钮区域，方向朝下按钮填充颜色
      comboBoxDownArrowFullColor: "#FFFFFF"

      //下拉框与下方文本框交界区域边框宽度
      comboBoxTextPastBorderWidth: 1
      //下拉框与下方文本框交界区域边框颜色
      comboBoxTextPastBorderColor: "blue"
      //下拉框与下方文本框交界区域填充颜色
      comboBoxTextPastFullColor: "#FFFFFF"

      //鼠标区域：仅响应Shape可见区域的交互
      MouseArea {
          id: mousemanager
          anchors.fill: parent
          // 启用鼠标悬停检测
          hoverEnabled: true
          propagateComposedEvents: true
          //是否鼠标在控件内
          property bool isMouseSideItem:false
          //判断鼠标是否在leftShape的可见区域内
          property bool isMouseInLeftShapeVisibleArea: {
          if(containsMouse){
              // 将鼠标坐标转换为Shape的本地坐标
              var localPos = parent.comboBoxLeftShape.mapFromItem(parent,mouseX,mouseY);
              // 判断点是否在形状内部
              if(parent.comboBoxLeftShape.contains(localPos)) return true;
          }
          return false
       }
          //判断鼠标是否在middleShape的可见区域内
          property bool isMouseInmiddleShapeVisibleArea: {
          if(containsMouse){
              // 将鼠标坐标转换为Shape的本地坐标
              var localPos = parent.comboBoxMiddleShape.mapFromItem(parent,mouseX,mouseY);
              // 判断点是否在形状内部
              if(parent.comboBoxMiddleShape.contains(localPos)) return true;
          }
          return false
       }
          //判断鼠标是否在rightTopShape的可见区域内
          property bool isMouseInrightTopShapeVisibleArea: {
          if(containsMouse){
              // 将鼠标坐标转换为Shape的本地坐标
              var localPos = parent.comboBoxrightTopShape.mapFromItem(parent,mouseX,mouseY);
              // 判断点是否在形状内部
              if(parent.comboBoxrightTopShape.contains(localPos)) return true;
          }
          return false
       }
          //判断鼠标是否在rightDownShape的可见区域内
          property bool isMouseInrightDownShapeVisibleArea: {
          if(containsMouse){
              // 将鼠标坐标转换为Shape的本地坐标
              var localPos = parent.comboBoxrightDownShape.mapFromItem(parent,mouseX,mouseY);
              // 判断点是否在形状内部
              if(parent.comboBoxrightDownShape.contains(localPos)) return true;
          }
          return false
       }
          //判断鼠标是否在comboBoxPastShape的可见区域内
          property bool isMouseInPastShapeVisibleArea: {
          if(containsMouse){
              // 将鼠标坐标转换为Shape的本地坐标
              var localPos = parent.comboBoxPastShape.mapFromItem(parent,mouseX,mouseY);
              // 判断点是否在形状内部
              if(parent.comboBoxPastShape.contains(localPos)) return true;
          }
          return false
       }
   }

   }

  //下拉框左侧按钮控件
  property Item rP_ComboBoxLeftItem :ArrowShape{
          id:leftarrowpath
          //箭头尖头部X坐标
          arrowHeadX: combobox_rp.x + combobox_rp.comboBoxLeftWidth-14
          //箭头尖头部Y坐标
          arrowHeadY: combobox_rp.y + combobox_rp.comboBoxLeftHeight / 2
          //箭头尖线段A倾斜角度
          arrowHeadInclinationAngle_A: 180+45
          //箭头尖线段A长度
          arrowHeadLength_A: 16
          //箭头尖线段B倾斜角度
          arrowHeadInclinationAngle_B: 180-45
          //箭头尖线段B长度
          arrowHeadLength_B: 16
          //箭头杆宽度
          arrowShaftWidth: 8
          //箭头杆长度
          arrowShaftHeight: 12
          //箭头杆尾部2角圆弧半径X
          arrowShaftTailArcRaidusX: 10
          //箭头杆尾部2角圆弧半径Y
          arrowShaftTailArcRaidusY: 10
          //箭头杆尾部圆弧所占箭头杆长度
          arrowShaftTailArcHeight: 1
          //箭头杆尾部圆弧所占箭头杆宽度
          arrowShaftTailArcWidth: 1
          arrowShaftTailArcdirection:PathArc.Clockwise

          //旋转
          transform: Rotation {
          origin.x: (combobox_rp.x + combobox_rp.comboBoxLeftWidth) / 2; origin.y: combobox_rp.x + combobox_rp.comboBoxLeftHeight / 2
          angle: 0
          }

          //图案线段宽度
          pathWidth: 2
          //图案线段颜色
          pathStrokeColor: "blue"
          //图案线条填充颜色
          pathFillColor: "red"
         }

  //下拉框右上小箭头控件
   property Item rP_ComboBoxRightTopItem: SmallArrowShape{
          id:righttoparrow
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

  //下拉框右下小箭头控件
        property Item rP_ComboBoxRightDownItem: SmallArrowShape{
               id:rightdownarrow
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

  //下拉框选项区域控件
  property Item rP_ComboBoxOptionsArea: PerCornerRoundRectShape{
            id:optionsAreas
            x:combobox_rp.x + combobox_rp.comboBoxLeftArcWidth
            y:combobox_rp.y + combobox_rp.comboBoxLeftHeight + combobox_rp.comboBoxTextPastActualHeight
            width:150
            height:50
            //左上角X长度
            rectleftTopX: 0
            //左上角Y长度
            rectleftTopY: 0
            //左下角X长度
            rectleftDownX: 0
            //左下角Y长度
            rectleftDownY: 0
            //右上角X长度
            rectRightTopX: 0
            //右上角Y长度
            rectRightTopY: 0
            //右下角X长度
            rectRightDownX: 0
            //右下角Y长度
            rectRightDownY: 0
            //圆弧半径X
            rectRadiusX: 20
            //圆弧半径Y
            rectRadiusY: 20
            //边框宽度
            rectBorderWidth: 1
            //边框颜色
            rectBorderColor: "blue"
            //填充颜色
            rectFullColor: "transparent"
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
}
