import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import RKitUi
//米老鼠形状按钮
Item {
  //接口
id:catbutton

  //耳朵参数集合对象
  component EarParameterObj : Item{
    //耳朵中点位置偏移范围比例(0~1)
    property real earMidpointInclinationRatio: 0
    //耳朵宽度控制角范围比例(从中点到两侧末端)(0~1)
    //左侧
    property real leftpointearAngleProportion: 0
    //右侧
    property real rightpointearAngleProportion: 0
    //耳朵倾斜角度比例
    property real earSlantratio: 0
    //耳朵长度比例
    property real earlenthportion: 0
    //耳朵两侧圆弧半径 大小比例
    //左侧
    property real leftradius: 0
    //右侧
    property real rightradius: 0
    //耳朵默认填充颜色
    property color earfillColor: "#FFFFFF"
    //耳朵鼠标悬浮填充颜色
    property color earMousehoverfillColor: "#FFFFFF"
    //耳朵鼠标按下填充颜色
    property color earMousedownfillColor: "#FFFFFF"
  }

  //嘴部参数集合对象
  component MouthParameterObj : Item{
  //以下角度倾斜均已圆心为原点
     //嘴部中点位置偏移范围比例(0~1)
    property real mouseMidpointInclinationRatio: 0
     //嘴部中点位置于圆心的长度比例(0~1)___圆心——>椭圆底部
    property real mouseMidpointLengthRatio: 0
     //嘴部左侧端点位置偏移范围比例(0~1)
    property real mouseLeftpointInclinationRatio: 0
     //嘴部左侧端点于圆心的长度比例(0~1)___圆心——>椭圆左下
    property real mouseLeftpointLengthRatio: 0
     //嘴部右侧端点位置偏移范围比例(0~1)
    property real mouseRightpointInclinationRatio: 0
     //嘴部右侧端点于圆心的长度比例(0~1)___圆心——>椭圆右下
    property real mouseRightpointLengthRatio: 0
  //半径
     //嘴部左侧端点到嘴部中点的半径比例___以最小半径为基础倍增
    property real mouseLeftToMidpointRadiusRatio: 0
     //嘴部右侧端点到嘴部中点的半径比例___以最小半径为基础倍增
    property real mouseRightToMidpointRadiusRatio: 0
  }

  //嘴部参数集合对象
  component EmbedObj : Item{
           //嵌入控件
           property Item embedObject: null
           //控件嵌入位置
           //X
           property real objX: 0
           //Y
           property real objY: 0
}

  //输入
  //宽度
  width: 0
  //高度
  height: 0
  //嵌入控件参数
  property EmbedObj embedParameters: null
  //按钮边框颜色___默认白色
  property color buttonstrokeColor: "#FFFFFF"
  //按钮边框宽度___默认0
  property int buttonWidth: 0
  //脸部大小比例
  property real faceproportion: 0
  //脸部填充颜色
  property color facefillColor: "#FFFFFF"
  //脸部鼠标悬浮填充颜色
  property color faceMousehoverfillColor: "#FFFFFF"
  //脸部鼠标按下填充颜色
  property color faceMousedownfillColor: "#FFFFFF"
  //左耳参数
  property EarParameterObj leftEarParameters: null
  //右耳参数
  property EarParameterObj rightEarParameters: null
  //嘴部参数
  property MouthParameterObj mouseParameters: null


  //输出信号
  //鼠标点击
  signal buttononClicked();
  //鼠标释放
  signal buttononReleased();
  //鼠标按下
  signal buttononPressed();
  //鼠标移出
  signal buttononExited();
  //鼠标移入
  signal buttononEntered();

  Item{
      //内部实例
      id:private_catbutton

      //宽度
      width: parent.width
      //高度
      height: parent.height
      //按钮边框颜色___默认白色
      property color buttonstrokeColor: parent.buttonstrokeColor
      //脸部填充颜色
      property color facefillColor: parent.facefillColor
      //脸部鼠标悬浮填充颜色
      property color faceMousehoverfillColor: parent.faceMousehoverfillColor
      //脸部鼠标按下填充颜色
      property color faceMousedownfillColor: parent.faceMousedownfillColor

      //按钮边框宽度___默认0
      property int buttonWidth: {
        try{
          //边框宽度不得小于等于0
          if(parent.buttonWidth <= 0){ throw new Error("buttonWidth输入错误，不得小于等于0"); }
          else                         return parent.buttonWidth;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //脸部比例
      property real faceproportion: {
        try{
           //取值范围(0.1~1]，不包含0
           if(parent.faceproportion <= 0.1 || parent.faceproportion > 1){ throw new Error("faceproportion的取值范围是(0.1~1]"); }
           else                                                         return parent.faceproportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //左耳参数
      Item{
        id:leftear

        //耳朵中点位置偏移范围
        readonly property var angleOfEarTiltRange: {return {min: 0,max: 90}}
        //耳朵倾斜角度范围
        readonly property var earSlantRange: {return {min: 0,max: 90}}

      //耳朵长度比例
      property real earlenthportion: {
        try{
           //取值范围(0~1]
           if(catbutton.leftEarParameters.earlenthportion <= 0.1 || catbutton.leftEarParameters.earlenthportion > 1){ throw new Error("earsizeportion的取值范围是(0~1]"); }
           else                                                         return 1 - catbutton.leftEarParameters.earlenthportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //左耳朵左右两侧固定点控制角
      //左侧
      property real leftpointearAngle: {
        try{
           //取值范围(0~1]
           if(catbutton.leftEarParameters.leftpointearAngleProportion < 0 || catbutton.leftEarParameters.leftpointearAngleProportion > 1){ throw new Error("leftpointearAngleProportion的取值范围是(0~1]"); }
           else                                                         return (angleOfEarTiltRange.max - earMidpointInclinationRatio) * catbutton.leftEarParameters.leftpointearAngleProportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }
      //右侧
      property real rightpointearAngle: {
        try{
           //取值范围(0~1]
           if(catbutton.leftEarParameters.rightpointearAngleProportion < 0 || catbutton.leftEarParameters.rightpointearAngleProportion > 1){ throw new Error("rightpointearAngleProportion的取值范围是(0~1]"); }
           else                                                         return (earMidpointInclinationRatio - angleOfEarTiltRange.min) * catbutton.leftEarParameters.rightpointearAngleProportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //耳朵中点位置偏移范围
      property real earMidpointInclinationRatio: {
        try{
           //取值范围(0~1]
           if(catbutton.leftEarParameters.earMidpointInclinationRatio < 0 || catbutton.leftEarParameters.earMidpointInclinationRatio > 1){ throw new Error("inclinationratio的取值范围是(0~1]"); }
           else                                                               return angleOfEarTiltRange.min + catbutton.leftEarParameters.earMidpointInclinationRatio * (angleOfEarTiltRange.max - angleOfEarTiltRange.min);
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
       }

      //耳朵倾斜角度
      property real earSlantratio: {
        try{
           //取值范围(0~1]
           if(catbutton.leftEarParameters.earSlantratio < 0 || catbutton.leftEarParameters.earSlantratio > 1){ throw new Error("earSlantratio的取值范围是(0~1]"); }
           else                                                               return earSlantRange.min + catbutton.leftEarParameters.earSlantratio * (earSlantRange.max - earSlantRange.min);
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

        //耳朵大小比例
        property var earsizeportion: {
          try{
             //取值范围大于等于1
             if((catbutton.leftEarParameters.leftradius < 1) && (catbutton.leftEarParameters.rightradius < 1)){ throw new Error("半径的取值范围需大于等于1"); }
             else                                                               return {leftradius:catbutton.leftEarParameters.leftradius,rightradius:catbutton.leftEarParameters.rightradius};
          }
          catch(e) { console.error(e.message + "来源：", e.stack); }
           }
        //耳朵填充颜色
        property color earfillColor: catbutton.leftEarParameters.earfillColor
        //耳朵鼠标悬浮填充颜色
        property color earMousehoverfillColor: catbutton.leftEarParameters.earMousehoverfillColor
        //耳朵鼠标按下填充颜色
        property color earMousedownfillColor: catbutton.leftEarParameters.earMousedownfillColor
      }
      //右耳参数
      Item{
        id:rightear

        //耳朵中点位置偏移范围
        readonly property var angleOfEarTiltRange: {return {min: 0,max: 90}}
        //耳朵倾斜角度范围
        readonly property var earSlantRange: {return {min: 0,max: 90}}

      //耳朵长度比例
      property real earlenthportion: {
        try{
           //取值范围(0~1]
           if(catbutton.rightEarParameters.earlenthportion <= 0.1 || catbutton.rightEarParameters.earlenthportion > 1){ throw new Error("earsizeportion的取值范围是(0~1]"); }
           else                                                         return 1 - catbutton.rightEarParameters.earlenthportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //耳朵左右两侧固定点控制角
      //左侧
      property real leftpointearAngle: {
        try{
           //取值范围(0~1]
           if(catbutton.rightEarParameters.leftpointearAngleProportion < 0 || catbutton.rightEarParameters.leftpointearAngleProportion > 1){ throw new Error("leftpointearAngleProportion的取值范围是(0~1]"); }
           else                                                         return (earMidpointInclinationRatio - angleOfEarTiltRange.min) * catbutton.rightEarParameters.leftpointearAngleProportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }
      //右侧
      property real rightpointearAngle: {
        try{
           //取值范围(0~1]
           if(catbutton.rightEarParameters.rightpointearAngleProportion < 0 || catbutton.rightEarParameters.rightpointearAngleProportion > 1){ throw new Error("rightpointearAngleProportion的取值范围是(0~1]"); }
           else                                                         return (angleOfEarTiltRange.max - earMidpointInclinationRatio) * catbutton.rightEarParameters.rightpointearAngleProportion;
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //耳朵中点位置偏移范围
      property real earMidpointInclinationRatio: {
        try{
           //取值范围(0~1]
           if(catbutton.rightEarParameters.earMidpointInclinationRatio < 0 || catbutton.rightEarParameters.earMidpointInclinationRatio > 1){ throw new Error("inclinationratio的取值范围是(0~1]"); }
           else                                                               return angleOfEarTiltRange.min + catbutton.rightEarParameters.earMidpointInclinationRatio * (angleOfEarTiltRange.max - angleOfEarTiltRange.min);
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
       }

      //耳朵倾斜角度
      property real earSlantratio: {
        try{
           //取值范围(0~1]
           if(catbutton.rightEarParameters.earSlantratio < 0 || catbutton.rightEarParameters.earSlantratio > 1){ throw new Error("earSlantratio的取值范围是(0~1]"); }
           else                                                               return earSlantRange.min + catbutton.rightEarParameters.earSlantratio * (earSlantRange.max - earSlantRange.min);
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
      }

      //耳朵大小比例
      property var earsizeportion: {
        try{
           //取值范围大于等于1
           if((catbutton.rightEarParameters.leftradius < 1) && (catbutton.rightEarParameters.rightradius < 1)){ throw new Error("半径的取值范围需大于等于1"); }
           else                                                               return {leftradius:catbutton.rightEarParameters.leftradius,rightradius:catbutton.rightEarParameters.rightradius};
        }
        catch(e) { console.error(e.message + "来源：", e.stack); }
       }
        //耳朵填充颜色
        property color earfillColor: catbutton.rightEarParameters.earfillColor
        //耳朵鼠标悬浮填充颜色
        property color earMousehoverfillColor: catbutton.rightEarParameters.earMousehoverfillColor
        //耳朵鼠标按下填充颜色
        property color earMousedownfillColor: catbutton.rightEarParameters.earMousedownfillColor
      }
      //嘴部参数
      Item{
         id:mouse
         //常量
         //嘴部中点位置偏移范围
         readonly property var angleOfMouseMidpointRange:{return{max: 180, min: 0}}
         //嘴部左右两侧位置偏移范围
         readonly property var angleOfMouseSideRange:{return{max: 180, min: 0}}

         //嘴部中点位置倾斜角度
         property real mouseMidpointInclinationRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseMidpointInclinationRatio < 0 || catbutton.mouseParameters.mouseMidpointInclinationRatio > 1){ throw new Error("mouseMidpointInclinationRatio的取值范围是(0~1]"); }
              else                                                               return (angleOfMouseMidpointRange.max - angleOfMouseMidpointRange.min) * catbutton.mouseParameters.mouseMidpointInclinationRatio + angleOfMouseMidpointRange.min;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }

         //嘴部中点位置于圆心的长度___圆心——>椭圆底部
         property real mouseMidpointLengthRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseMidpointLengthRatio < 0 || catbutton.mouseParameters.mouseMidpointLengthRatio > 1){ throw new Error("mouseMidpointLengthRatio的取值范围是(0~1]"); }
              else                                                               return catbutton.mouseParameters.mouseMidpointLengthRatio;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }
         //嘴部左侧端点倾斜角度
         property real mouseLeftpointInclinationRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseLeftpointInclinationRatio < 0 || catbutton.mouseParameters.mouseLeftpointInclinationRatio > 1){ throw new Error("mouseLeftpointInclinationRatio的取值范围是(0~1]"); }
              else                                                               return mouseMidpointInclinationRatio - (mouseMidpointInclinationRatio - angleOfMouseSideRange.min) * catbutton.mouseParameters.mouseLeftpointInclinationRatio;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }
         //嘴部左侧端点于圆心的长度
         property real mouseLeftpointLengthRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseLeftpointLengthRatio < 0 || catbutton.mouseParameters.mouseLeftpointLengthRatio > 1){ throw new Error("mouseLeftpointLengthRatio的取值范围是(0~1]"); }
              else                                                               return catbutton.mouseParameters.mouseLeftpointLengthRatio;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }
         //嘴部右侧端点倾斜角度
         property real mouseRightpointInclinationRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseRightpointInclinationRatio < 0 || catbutton.mouseParameters.mouseRightpointInclinationRatio > 1){ throw new Error("mouseRightpointInclinationRatio的取值范围是(0~1]"); }
              else                                                               return (angleOfMouseSideRange.max - mouseMidpointInclinationRatio) * catbutton.mouseParameters.mouseRightpointInclinationRatio + mouseMidpointInclinationRatio;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }
         //嘴部右侧端点于圆心的长度
         property real mouseRightpointLengthRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseRightpointLengthRatio < 0 || catbutton.mouseParameters.mouseRightpointLengthRatio > 1){ throw new Error("mouseRightpointLengthRatio的取值范围是(0~1]"); }
              else                                                               return catbutton.mouseParameters.mouseRightpointLengthRatio;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }
          //嘴部左侧端点到嘴部中点的半径比例___以最小半径为基础倍增
         property real mouseLeftToMidpointRadiusRatio: {
           try{
              //取值范围(0~1]
              if(catbutton.mouseParameters.mouseLeftToMidpointRadiusRatio < 1){ throw new Error("mouseLeftToMidpointRadiusRatio的取值范围是大于等于1"); }
              else                                                               return catbutton.mouseParameters.mouseLeftToMidpointRadiusRatio;
           }
           catch(e) { console.error(e.message + "来源：", e.stack); }
         }
         //嘴部右侧端点到嘴部中点的半径比例___以最小半径为基础倍增
        property real mouseRightToMidpointRadiusRatio: {
          try{
             //取值范围(0~1]
             if(catbutton.mouseParameters.mouseRightToMidpointRadiusRatio < 1){ throw new Error("mouseRightToMidpointRadiusRatio的取值范围是大于等于1"); }
             else                                                               return catbutton.mouseParameters.mouseRightToMidpointRadiusRatio;
          }
          catch(e) { console.error(e.message + "来源：", e.stack); }
        }

      }




      //按钮绘制
      Shape{
          id:mickeyMousebuttonDraw
          anchors.fill: parent
          //确定按钮范围
          containsMode: Shape.FillContains

          //脸蛋圆心坐标
          property var facecentrecoordinates: {
            //x轴永远是width居中位置
            var x = parent.width / 2;
            //y轴最大值为按10分比例划分，只使用从下往上10分之8区域
            var y = parent.height - (parent.height - parent.height / 10 * 2) / 2
            return {centreX: x,centreY: y};
          }

          //脸蛋半径
          property var faceRadius: {
            //y轴最大值为按10分比例划分，只使用从下往上10分之8区域
            var radiusY_MAX =(parent.height - parent.height / 10 * 2) / 2;
            //x轴最大值为按10分比例划分，居中的10分之8区域
            var radiusX_MAX = (parent.width - parent.width / 10 * 2) / 2
            //根据比例，返回半径(不能小于输入的宽高等比例长度)
            var radiusY = parent.faceproportion * radiusY_MAX;
            var radiusX = parent.faceproportion * radiusX_MAX;
            //返回最终半径
            return {radiusY:radiusY,radiusX:radiusX};
          }

          //通过不同直线斜率计算直线过椭圆圆心与椭圆的交点
          property var lineAndEllipseIntersection: function(lineK) {
            //第一个交点
             var x1 = facecentrecoordinates.centreX - (faceRadius.radiusX * faceRadius.radiusY) / Math.sqrt(Math.pow(faceRadius.radiusY,2)+Math.pow(lineK,2) * Math.pow(faceRadius.radiusX,2));
             var y1 = facecentrecoordinates.centreY - lineK * (faceRadius.radiusX * faceRadius.radiusY) / Math.sqrt(Math.pow(faceRadius.radiusY,2)+Math.pow(lineK,2) * Math.pow(faceRadius.radiusX,2));
            //第二个交点
            var x2 = facecentrecoordinates.centreX + (faceRadius.radiusX * faceRadius.radiusY) / Math.sqrt(Math.pow(faceRadius.radiusY,2)+Math.pow(lineK,2) * Math.pow(faceRadius.radiusX,2));
            var y2 = facecentrecoordinates.centreY + lineK * (faceRadius.radiusX * faceRadius.radiusY) / Math.sqrt(Math.pow(faceRadius.radiusY,2)+Math.pow(lineK,2) * Math.pow(faceRadius.radiusX,2));
            return {x1:x1,y1:y1,x2:x2,y2:y2}
          }

         //左耳参数
          property var leftEarParameters: {
            try{
              var straightangle = 180;
              //中点坐标
              //先获取圆心到耳朵中点直线的斜率
              var Midpointgradient = Math.tan(Math.PI/straightangle * (straightangle/2 - leftear.earMidpointInclinationRatio));
              //获取交点坐标
              var Intersection = lineAndEllipseIntersection(Midpointgradient);
              //左耳中点坐标
              var Midpointx = Math.min(Intersection.x1,Intersection.x2)
              var Midpointy = Math.min(Intersection.y1,Intersection.y2)

              //左耳左侧点坐标
              //先获取圆心到耳朵左侧点直线的斜率
              var Lefthandslope = Math.tan(Math.PI/straightangle * (straightangle/2 - leftear.earMidpointInclinationRatio - leftear.leftpointearAngle));
              //获取交点坐标
              Intersection = lineAndEllipseIntersection(Lefthandslope);
              //左耳左侧点坐标
              var leftx = Math.min(Intersection.x1,Intersection.x2)
              var lefty = Math.min(Intersection.y1,Intersection.y2)

              //右耳左侧点坐标
              //先获取圆心到耳朵右侧点直线的斜率
              var righthandslope = Math.tan(Math.PI/straightangle * (straightangle/2 - leftear.earMidpointInclinationRatio + leftear.rightpointearAngle));
              //获取交点坐标
              Intersection = lineAndEllipseIntersection(righthandslope);
              //左耳左侧点坐标
              var rightx = Math.min(Intersection.x1,Intersection.x2)
              var righty = Math.min(Intersection.y1,Intersection.y2)

              //耳朵底到顶部的斜率
              var k2 = Math.tan(Math.PI/straightangle * leftear.earSlantratio)
              //长度不超过点到控件边框距离的一半
              //耳朵顶部坐标
              //当与y交点坐标为0时,x大于0
              var topx = Midpointy * (leftear.earlenthportion - 1) / k2 + Midpointx
              var topy = Midpointy * leftear.earlenthportion
              //当与y交点坐标为0时,x小于0
              if(topx < 0){
                 topx = Midpointx * leftear.earlenthportion
                 topy = k2 * (Midpointx * leftear.earlenthportion - Midpointx) + Midpointy
              }

              //左耳最小半径
              //左侧圆弧半径
              var leftera_rad_min =Math.sqrt(Math.pow(leftx - topx,2) + Math.pow(lefty - topy,2)) / 2
              //右侧圆弧半径
              var rightera_rad_min =Math.sqrt(Math.pow(rightx - topx,2) + Math.pow(righty - topy,2)) / 2

              return {topx:topx,topy:topy,leftx:leftx,lefty:lefty,rightx:rightx,righty:righty,leftear_rad_min:leftera_rad_min,rightera_rad_min:rightera_rad_min}

            }catch(e){console.error(e.message + "来源：", e.stack);}
          }

          //右耳参数
           property var rightEarParameters: {
             try{
               var straightangle = 180;
               //中点坐标
               //先获取圆心到耳朵中点直线的斜率
               var Midpointgradient = -Math.tan(Math.PI/straightangle * (straightangle/2 - rightear.earMidpointInclinationRatio));
               //获取交点坐标
               var Intersection = lineAndEllipseIntersection(Midpointgradient);
               //右耳中点坐标
               var Midpointx = Math.max(Intersection.x1,Intersection.x2)
               var Midpointy = Math.min(Intersection.y1,Intersection.y2)

               //右耳左侧点坐标
               //先获取圆心到耳朵左侧点直线的斜率
               var Lefthandslope = -Math.tan(Math.PI/straightangle * (straightangle/2 - rightear.earMidpointInclinationRatio + rightear.leftpointearAngle));
               //获取交点坐标
               Intersection = lineAndEllipseIntersection(Lefthandslope);
               //右耳左侧点坐标
               var leftx = Math.max(Intersection.x1,Intersection.x2)
               var lefty = Math.min(Intersection.y1,Intersection.y2)

               //左耳右侧点坐标
               //先获取圆心到耳朵右侧点直线的斜率
               var righthandslope = -Math.tan(Math.PI/straightangle * (straightangle/2 - rightear.earMidpointInclinationRatio - rightear.rightpointearAngle));
               //获取交点坐标
               Intersection = lineAndEllipseIntersection(righthandslope);
               //右耳右侧点坐标
               var rightx = Math.max(Intersection.x1,Intersection.x2)
               var righty = Math.min(Intersection.y1,Intersection.y2)

               //耳朵底到顶部的斜率
               var k2 = -Math.tan(Math.PI/straightangle * rightear.earSlantratio)
               //长度不超过点到控件边框距离的一半
               //耳朵顶部坐标
               //当与y交点坐标为0时,x小于width
               var topx = Midpointy * (rightear.earlenthportion - 1) / k2 + Midpointx
               var topy = Midpointy * rightear.earlenthportion
               //当与y交点坐标为0时,x大于width
               if(topx > private_catbutton.width){
                  topx = Midpointx + (private_catbutton.width - Midpointx) * (1 - rightear.earlenthportion)
                  topy = -k2 * (Midpointx - topx) + Midpointy
               }

               //右耳最小半径
               //左侧圆弧半径
               var leftera_rad_min =Math.sqrt(Math.pow(leftx - topx,2) + Math.pow(lefty - topy,2)) / 2
               //右侧圆弧半径
               var rightera_rad_min =Math.sqrt(Math.pow(rightx - topx,2) + Math.pow(righty - topy,2)) / 2

               return {topx:topx,topy:topy,leftx:leftx,lefty:lefty,rightx:rightx,righty:righty,leftear_rad_min:leftera_rad_min,rightear_rad_min:rightera_rad_min}

             }catch(e){console.error(e.message + "来源：", e.stack);}
           }

          //嘴参数
          property var mouseParameters: {
           //半圆周角
           var straightangle = 180;
            //返回3个点的坐标和最小半径
           //嘴部中点坐标
           //中点直线斜率
           var MidpointK = Math.tan(Math.PI/straightangle * mouse.mouseMidpointInclinationRatio);
           var MidIntersection = lineAndEllipseIntersection(MidpointK);
           //中线于椭圆的交点
           var MidpointToRadioX = ((MidIntersection.y1 < MidIntersection.y2) ? MidIntersection.x1 : MidIntersection.x2);
           var MidpointToRadioY = Math.max(MidIntersection.y1,MidIntersection.y2);
           //嘴部中点坐标
           var MidpointX = facecentrecoordinates.centreX + (MidpointToRadioX - facecentrecoordinates.centreX) * mouse.mouseMidpointLengthRatio;
           var MidpointY = facecentrecoordinates.centreY + (MidpointToRadioY - facecentrecoordinates.centreY) * mouse.mouseMidpointLengthRatio;

           //嘴部左端坐标
           //左侧端点于圆心斜率
           var LeftPointK = Math.tan(Math.PI/straightangle * mouse.mouseLeftpointInclinationRatio);
           var LeftIntersection = lineAndEllipseIntersection(LeftPointK);
           //左侧端点于圆心直线于椭圆的交点
           var LeftpointToRadioX = ((LeftIntersection.y1 < LeftIntersection.y2) ? LeftIntersection.x1 : LeftIntersection.x2);
           var LeftpointToRadioY = Math.max(LeftIntersection.y1,LeftIntersection.y2);
           //嘴部左端坐标
           var LeftpointX = facecentrecoordinates.centreX + (LeftpointToRadioX - facecentrecoordinates.centreX) * mouse.mouseLeftpointLengthRatio;
           var LeftpointY = facecentrecoordinates.centreY + (LeftpointToRadioY - facecentrecoordinates.centreY) * mouse.mouseLeftpointLengthRatio;

           //嘴部右端坐标
           //右侧端点于圆心斜率
           var RightPointK = Math.tan(Math.PI/straightangle * mouse.mouseRightpointInclinationRatio);
           var RightIntersection = lineAndEllipseIntersection(RightPointK);
           //右侧端点于圆心直线于椭圆的交点
           var RightpointToRadioX = ((RightIntersection.y1 < RightIntersection.y2) ? RightIntersection.x1 : RightIntersection.x2);
           var RightpointToRadioY = Math.max(RightIntersection.y1,RightIntersection.y2);
           //嘴部左端坐标
           var RightpointX = facecentrecoordinates.centreX + (RightpointToRadioX - facecentrecoordinates.centreX) * mouse.mouseRightpointLengthRatio;
           var RightpointY = facecentrecoordinates.centreY + (RightpointToRadioY - facecentrecoordinates.centreY) * mouse.mouseRightpointLengthRatio;

           //嘴部左侧端点到嘴部中点的最小半径
            var LeftToMidPoint_min_Radius = Math.sqrt(Math.pow(LeftpointToRadioX - MidpointToRadioX,2) + Math.pow(LeftpointToRadioY - MidpointToRadioY,2)) / 2
            var RightToMidPoint_min_Radius = Math.sqrt(Math.pow(RightpointToRadioX - MidpointToRadioX,2) + Math.pow(RightpointToRadioY - MidpointToRadioY,2)) / 2

           return {MidpointX:MidpointX,MidpointY:MidpointY,LeftpointX:LeftpointX,LeftpointY:LeftpointY,RightpointX:RightpointX,RightpointY:RightpointY,LeftToMidPoint_min_Radius:LeftToMidPoint_min_Radius,RightToMidPoint_min_Radius:RightToMidPoint_min_Radius}
          }

          ShapePath{
              //路径绘制
              id:mickeyMousebuttonPath
              //圆角线端
              capStyle:ShapePath.RoundCap
              //设置边框颜色
              strokeColor: private_catbutton.buttonstrokeColor
              //设置边框宽度
              strokeWidth: private_catbutton.buttonWidth
              //填充颜色
              fillColor: private_catbutton.facefillColor
              //起始坐标位于脸部居中底部
              //起始绝对坐标X
              startX: mickeyMousebuttonDraw.facecentrecoordinates.centreX
              //起始绝对坐标Y
              startY: mickeyMousebuttonDraw.facecentrecoordinates.centreY - mickeyMousebuttonDraw.faceRadius.radiusY

              // 脸蛋
              PathArc{
                relativeX: 0
                relativeY: mickeyMousebuttonDraw.faceRadius.radiusY * 2
                radiusX: mickeyMousebuttonDraw.faceRadius.radiusX
                radiusY: mickeyMousebuttonDraw.faceRadius.radiusY
                direction: PathArc.Clockwise
              }
              PathArc{
                relativeX: 0
                relativeY: -mickeyMousebuttonDraw.faceRadius.radiusY * 2
                radiusX: mickeyMousebuttonDraw.faceRadius.radiusX
                radiusY: mickeyMousebuttonDraw.faceRadius.radiusY
                direction: PathArc.Clockwise
              }
          }
          ShapePath{
              //路径绘制
              id:leftearPath
              //圆角线端
              capStyle:ShapePath.RoundCap
              //设置边框颜色
              strokeColor: private_catbutton.buttonstrokeColor
              //设置边框宽度
              strokeWidth: private_catbutton.buttonWidth
              //填充颜色
              fillColor: leftear.earfillColor
              //绘制左耳
              PathMove{
                x:mickeyMousebuttonDraw.leftEarParameters.leftx
                y:mickeyMousebuttonDraw.leftEarParameters.lefty
              }
              PathArc{
                x: mickeyMousebuttonDraw.leftEarParameters.topx
                y: mickeyMousebuttonDraw.leftEarParameters.topy
                radiusX: mickeyMousebuttonDraw.leftEarParameters.leftear_rad_min * leftear.earsizeportion.leftradius
                radiusY: mickeyMousebuttonDraw.leftEarParameters.leftear_rad_min * leftear.earsizeportion.leftradius
                direction: PathArc.Clockwise
                useLargeArc:false
              }
              PathArc{
                x: mickeyMousebuttonDraw.leftEarParameters.rightx
                y: mickeyMousebuttonDraw.leftEarParameters.righty
                radiusX: mickeyMousebuttonDraw.leftEarParameters.leftear_rad_min * leftear.earsizeportion.rightradius
                radiusY: mickeyMousebuttonDraw.leftEarParameters.leftear_rad_min * leftear.earsizeportion.rightradius
                direction: PathArc.Clockwise
                useLargeArc:false
              }
          }
          ShapePath{
              //路径绘制
              id:rightearPath
              //圆角线端
              capStyle:ShapePath.RoundCap
              //设置边框颜色
              strokeColor: private_catbutton.buttonstrokeColor
              //设置边框宽度
              strokeWidth: private_catbutton.buttonWidth
              //填充颜色
              fillColor: rightear.earfillColor
              //绘制右耳
              PathMove{
                x:mickeyMousebuttonDraw.rightEarParameters.leftx
                y:mickeyMousebuttonDraw.rightEarParameters.lefty
              }
              PathArc{
                x: mickeyMousebuttonDraw.rightEarParameters.topx
                y: mickeyMousebuttonDraw.rightEarParameters.topy
                radiusX: mickeyMousebuttonDraw.rightEarParameters.leftear_rad_min * rightear.earsizeportion.leftradius
                radiusY: mickeyMousebuttonDraw.rightEarParameters.leftear_rad_min * rightear.earsizeportion.leftradius
                direction: PathArc.Clockwise
                useLargeArc:false
              }
              PathArc{
                x: mickeyMousebuttonDraw.rightEarParameters.rightx
                y: mickeyMousebuttonDraw.rightEarParameters.righty
                radiusX: mickeyMousebuttonDraw.rightEarParameters.rightear_rad_min * rightear.earsizeportion.rightradius
                radiusY: mickeyMousebuttonDraw.rightEarParameters.rightear_rad_min * rightear.earsizeportion.rightradius
                direction: PathArc.Clockwise
                useLargeArc:false
              }
          }
          ShapePath{
              //路径绘制
              id:mousePath
              //圆角线端
              capStyle:ShapePath.RoundCap
              //设置边框颜色
              strokeColor: private_catbutton.buttonstrokeColor
              //设置边框宽度
              strokeWidth: private_catbutton.buttonWidth
              //填充颜色
              fillColor: private_catbutton.facefillColor
              //绘制嘴
              PathMove{
                x:mickeyMousebuttonDraw.mouseParameters.LeftpointX
                y:mickeyMousebuttonDraw.mouseParameters.LeftpointY
              }
              PathArc{
                x: mickeyMousebuttonDraw.mouseParameters.MidpointX
                y: mickeyMousebuttonDraw.mouseParameters.MidpointY
                radiusX: mickeyMousebuttonDraw.mouseParameters.LeftToMidPoint_min_Radius * mouse.mouseLeftToMidpointRadiusRatio
                radiusY: mickeyMousebuttonDraw.mouseParameters.LeftToMidPoint_min_Radius * mouse.mouseLeftToMidpointRadiusRatio
                direction: PathArc.Counterclockwise
                useLargeArc:false
              }
              PathArc{
                x: mickeyMousebuttonDraw.mouseParameters.RightpointX
                y: mickeyMousebuttonDraw.mouseParameters.RightpointY
                radiusX: mickeyMousebuttonDraw.mouseParameters.RightToMidPoint_min_Radius * mouse.mouseRightToMidpointRadiusRatio
                radiusY: mickeyMousebuttonDraw.mouseParameters.RightToMidPoint_min_Radius * mouse.mouseRightToMidpointRadiusRatio
                direction: PathArc.Counterclockwise
                useLargeArc:false
              }
          }
          //将嵌入控件加载
          Component.onCompleted: {
            if(catbutton.embedParameters !== null){
                       catbutton.embedParameters.embedObject.parent = embed
                       embed.x = catbutton.embedParameters.objX
                       embed.y = catbutton.embedParameters.objX
                       embed.width = catbutton.embedParameters.embedObject.width
                       embed.height = catbutton.embedParameters.embedObject.height
            }
          }
      }
      //嵌入控件绘制
      Item{
           id:embed
      }

      //鼠标事件
      MouseArea {
          id: mousemanager

          //操作函数
          property var mousehoverfunc: function(){
            //更换脸颜色为悬浮状态
        mickeyMousebuttonPath.fillColor = private_catbutton.faceMousehoverfillColor
        mousePath.fillColor = private_catbutton.faceMousehoverfillColor
           //更换耳朵颜色为悬浮状态
        leftearPath.fillColor = leftear.earMousehoverfillColor
        rightearPath.fillColor = rightear.earMousehoverfillColor
      }
          property var mouseDefaultfunc: function(){
            //恢复脸颜色
        mickeyMousebuttonPath.fillColor = private_catbutton.facefillColor
        mousePath.fillColor = private_catbutton.facefillColor
           //恢复耳朵颜色
        leftearPath.fillColor = leftear.earfillColor
        rightearPath.fillColor = rightear.earfillColor
      }
          property var mousePressedfunc: function(){
            //更换脸颜色为按下状态
        mickeyMousebuttonPath.fillColor = private_catbutton.faceMousedownfillColor
        mousePath.fillColor = private_catbutton.faceMousedownfillColor
           //更换耳朵颜色为按下状态
        leftearPath.fillColor = leftear.earMousedownfillColor
        rightearPath.fillColor = rightear.earMousedownfillColor
      }

          //鼠标按下为true，释放为false
          property bool mousedown: false;

          anchors.fill: parent
          //鼠标悬停检测
          hoverEnabled: true
          //判断鼠标是否在Shape的可见区域内
          property int isMouseInShape: {
              var value = false;
          if(containsMouse){
              //将鼠标坐标转换为Shape的本地坐标
              var localPos = mickeyMousebuttonDraw.mapFromItem(private_catbutton, mouseX, mouseY);
              //判断点是否在按钮内部
             return mickeyMousebuttonDraw.contains(localPos) ? true : false;
                }else{return false}
          }
            propagateComposedEvents: true
            //设置光标
            cursorShape: {
            if(isMouseInShape){
                   return Qt.PointingHandCursor;
            }else{
                   return Qt.ArrowCursor;
            }
            }
            //被点击后输出信号
            onClicked: {
              if(isMouseInShape){
               catbutton.buttononClicked();
              }
          }
            //释放按钮
            onReleased: {

               if(isMouseInShape){
                 catbutton.buttononReleased();
                    mousehoverfunc();
               }else{
                  mouseDefaultfunc();
               }
               mousedown = false;
            }

              onExited: {
                  if(!isMouseInShape){
                    catbutton.buttononExited();
                      mouseDefaultfunc();
                 }
              }

              onPositionChanged: {
                   if(isMouseInShape){
                     //鼠标按下时保持
                     if(mousedown) {
                       catbutton.buttononEntered();
                        return;
                     }else{
                    catbutton.buttononEntered();
                    mousehoverfunc();
                     }
              }else{
                mouseDefaultfunc();
                 }
              }

              onPressed:{
                   if(isMouseInShape){
                     mousedown = true;
                catbutton.buttononPressed();
                mousePressedfunc();
                 }
              }
        }
      }


}




