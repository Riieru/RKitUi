import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import RKitUi

//箭头图案
Item{
        id:arrowPath
        //参数
        //箭头尖头部X坐标
        property real arrowHeadX: 0
        //箭头尖头部Y坐标
        property real arrowHeadY: 0
        //箭头尖线段A倾斜角度
        property real arrowHeadInclinationAngle_A: 0
        //箭头尖线段A长度
        property real arrowHeadLength_A: 0
        //箭头尖线段B倾斜角度
        property real arrowHeadInclinationAngle_B: 0
        //箭头尖线段B长度
        property real arrowHeadLength_B: 0
        //箭头杆宽度
        property real arrowShaftWidth: 0
        //箭头杆长度
        property real arrowShaftHeight: 0
        //箭头杆尾部2角圆弧半径X
        property real arrowShaftTailArcRaidusX: 0
        //箭头杆尾部2角圆弧半径Y
        property real arrowShaftTailArcRaidusY: 0
        //箭头杆尾部圆弧所占箭头杆长度
        property real arrowShaftTailArcHeight: 0
        //箭头杆尾部圆弧所占箭头杆宽度
        property real arrowShaftTailArcWidth: 0
        //圆弧方向
        property var arrowShaftTailArcdirection: null


        //图案线段宽度
        property real pathWidth: 0
        //图案线段颜色
        property color pathStrokeColor: "#FFFFFF"
        //图案线条填充颜色
        property color pathFillColor: "#FFFFFF"

        //内部图形区域
        readonly property Shape arrowShape: arrow


        Item{
            id:private_arrowPath
            //箭头尖头部X坐标
            property real arrowHeadX: parent.arrowHeadX
            //箭头尖头部Y坐标
            property real arrowHeadY: parent.arrowHeadY
            //箭头尖线段A倾斜角度
            property real arrowHeadInclinationAngle_A: parent.arrowHeadInclinationAngle_A
            //箭头尖线段A长度
            property real arrowHeadLength_A: parent.arrowHeadLength_A
            //箭头尖线段B倾斜角度
            property real arrowHeadInclinationAngle_B: parent.arrowHeadInclinationAngle_B
            //箭头尖线段B长度
            property real arrowHeadLength_B: parent.arrowHeadLength_B
            //箭头杆宽度
            property real arrowShaftWidth: parent.arrowShaftWidth
            //箭头杆长度
            property real arrowShaftHeight: parent.arrowShaftHeight
            //箭头杆尾部2角圆弧半径X
            property real arrowShaftTailArcRaidusX: parent.arrowShaftTailArcRaidusX
            //箭头杆尾部2角圆弧半径Y
            property real arrowShaftTailArcRaidusY: parent.arrowShaftTailArcRaidusY
            //箭头杆尾部圆弧所占箭头杆长度
            property real arrowShaftTailArcHeight: parent.arrowShaftTailArcHeight
            //箭头杆尾部圆弧所占箭头杆宽度
            property real arrowShaftTailArcWidth: parent.arrowShaftTailArcWidth
            //圆弧方向
            property var arrowShaftTailArcdirection: {
            try{
                if(parent.arrowShaftTailArcdirection === null) throw new Error("未修改圆弧方向")
                return parent.arrowShaftTailArcdirection;
            }catch(e) { console.error(e.message + "来源：", e.stack); }
            }


            //图案线段宽度
            property real pathWidth: parent.pathWidth
            //图案线段颜色
            property color pathStrokeColor: parent.pathStrokeColor
            //图案线条填充颜色
            property color pathFillColor: parent.pathFillColor

            //变量相等判断——增加容错范围   第三个参数为容错范围
            property var valuejudgement: function(value_F,value_B,num){
                if(Math.round(value_F) + num === Math.round(value_B) || Math.round(value_F) - num === Math.round(value_B) || Math.round(value_F) === Math.round(value_B)) {return true;}
                else   {return false;}
            }

            //绘制箭头
            Shape{

                id:arrow

                property var arrowTipParameters: {
                 try{
                    //输出箭头两侧点坐标,箭头尖和箭头杆交界处的2点坐标，箭头杆尾部的两点坐标
                    //箭头两侧点坐标
                    //A点
                    var arrowPointA_X = private_arrowPath.arrowHeadX + Math.cos(Math.PI/180 * private_arrowPath.arrowHeadInclinationAngle_A) * private_arrowPath.arrowHeadLength_A
                    var arrowPointA_Y = private_arrowPath.arrowHeadY + Math.sin(Math.PI/180 * private_arrowPath.arrowHeadInclinationAngle_A) * private_arrowPath.arrowHeadLength_A
                    //B点
                    var arrowPointB_X = private_arrowPath.arrowHeadX + Math.cos(Math.PI/180 * private_arrowPath.arrowHeadInclinationAngle_B) * private_arrowPath.arrowHeadLength_B
                    var arrowPointB_Y = private_arrowPath.arrowHeadY + Math.sin(Math.PI/180 * private_arrowPath.arrowHeadInclinationAngle_B) * private_arrowPath.arrowHeadLength_B
                    //AB两点直线斜率
                    var AB_k = (arrowPointA_Y - arrowPointB_Y) / (arrowPointA_X - arrowPointB_X)
                    //过箭头尖垂直于该直线的交点
                    var centrelineintersectionX = (Math.pow(AB_k,2) * arrowPointA_X - AB_k * arrowPointA_Y + private_arrowPath.arrowHeadX + AB_k * private_arrowPath.arrowHeadY) / (Math.pow(AB_k,2) + 1)
                    var centrelineintersectionY = AB_k * (centrelineintersectionX - arrowPointA_X) + arrowPointA_Y
                    //箭头尖与箭头杆交界处
                    //A点延伸交界处
                    var arrowHeadToShaftA_X = 0
                    var arrowHeadToShaftA_Y = 0
                    //B点延伸交界处
                    var arrowHeadToShaftB_X = 0
                    var arrowHeadToShaftB_Y = 0
                    //A点箭头尾部
                    var arrowShaftA_X = 0
                    var arrowShaftA_Y = 0
                    //B点箭头尾部
                    var arrowShaftB_X = 0
                    var arrowShaftB_Y = 0

                    //AB两点Y坐标的差值
                    const yDiffSign = Math.sign(arrowPointA_Y - arrowPointB_Y);
                    //AB两点X坐标的差值
                    const xDiffSign = Math.sign(arrowPointA_X - arrowPointB_X);
                    //箭头尖X坐标与A点延伸X坐标的差值
                    const arrowcentreToHead_X = Math.sign(centrelineintersectionX - private_arrowPath.arrowHeadX);
                    //箭头尖X坐标与A点延伸Y坐标的差值
                    const arrowcentreToHead_Y = Math.sign(centrelineintersectionY - private_arrowPath.arrowHeadY);

                    //如果AB两点直线坐标重合
                    if(private_arrowPath.valuejudgement(arrowPointA_X,arrowPointB_X,1) && private_arrowPath.valuejudgement(arrowPointA_Y,arrowPointB_Y,1)){
                        //不能使2条斜边重合
                        throw new Error("不能使2条斜边重合");
                    }else{
                        //如果AB两点直线于Y轴平行
                        if (private_arrowPath.valuejudgement(arrowPointA_X,arrowPointB_X,1)) {
                            // X坐标
                            arrowHeadToShaftA_X = arrowHeadToShaftB_X = arrowPointA_X;
                            // Y坐标
                            arrowHeadToShaftA_Y = private_arrowPath.arrowHeadY + (yDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftWidth / 2);
                            arrowHeadToShaftB_Y = private_arrowPath.arrowHeadY - (yDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftWidth / 2);

                            //箭头杆尾部两点坐标
                            //Y坐标
                            arrowShaftA_Y = arrowHeadToShaftA_Y
                            arrowShaftB_Y = arrowHeadToShaftB_Y
                            //X坐标
                            arrowShaftA_X = arrowShaftB_X = arrowHeadToShaftA_X + ((Math.sign(arrowPointA_X - private_arrowPath.arrowHeadX) > 0 ? 1 : -1) * private_arrowPath.arrowShaftHeight)
                        }else if(private_arrowPath.valuejudgement(arrowPointA_Y,arrowPointB_Y,1)){
                        //如果AB两点直线于X轴平行
                            //Y坐标
                            arrowHeadToShaftA_Y = arrowHeadToShaftB_Y = arrowPointA_Y;
                            //X坐标
                            arrowHeadToShaftA_X = private_arrowPath.arrowHeadX + (xDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftWidth / 2);
                            arrowHeadToShaftB_X = private_arrowPath.arrowHeadX - (xDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftWidth / 2);
                            //箭头杆尾部两点坐标
                            //Y坐标
                            arrowShaftA_Y = arrowShaftB_Y = arrowPointA_Y + ((Math.sign(arrowPointA_Y - private_arrowPath.arrowHeadY) > 0 ? 1 : -1) * private_arrowPath.arrowShaftHeight)
                            //X坐标
                            arrowShaftA_X = arrowHeadToShaftA_X
                            arrowShaftB_X = arrowHeadToShaftB_X
                        }else{
                            //如果不垂直于任一轴线
                             // Y坐标
                             arrowHeadToShaftA_Y = centrelineintersectionY + (yDiffSign > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan(AB_k))) * (private_arrowPath.arrowShaftWidth / 2);
                             arrowHeadToShaftB_Y = centrelineintersectionY - (yDiffSign > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan(AB_k))) * (private_arrowPath.arrowShaftWidth / 2);
                              //X坐标
                             arrowHeadToShaftA_X = centrelineintersectionX + (xDiffSign > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(AB_k))) * (private_arrowPath.arrowShaftWidth / 2);
                             arrowHeadToShaftB_X = centrelineintersectionX - (xDiffSign > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(AB_k))) * (private_arrowPath.arrowShaftWidth / 2);
                            //箭头杆尾部两点坐标
                            //判断箭头朝向
                            //Y坐标
                            arrowShaftA_Y = arrowHeadToShaftA_Y + (arrowcentreToHead_Y > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan((-1/AB_k)))) * private_arrowPath.arrowShaftHeight
                            arrowShaftB_Y = arrowHeadToShaftB_Y + (arrowcentreToHead_Y > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan((-1/AB_k)))) * private_arrowPath.arrowShaftHeight
                            //X坐标
                            arrowShaftA_X = arrowHeadToShaftA_X + (arrowcentreToHead_X > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(-(1/AB_k)))) * private_arrowPath.arrowShaftHeight
                            arrowShaftB_X = arrowHeadToShaftB_X + (arrowcentreToHead_X > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(-(1/AB_k)))) * private_arrowPath.arrowShaftHeight
                        }
                    }
                    return {arrowPointA_X:arrowPointA_X,arrowPointA_Y:arrowPointA_Y,arrowPointB_X:arrowPointB_X,arrowPointB_Y:arrowPointB_Y, //AB点坐标
                            arrowHeadToShaftA_X:arrowHeadToShaftA_X,arrowHeadToShaftA_Y:arrowHeadToShaftA_Y,arrowHeadToShaftB_X:arrowHeadToShaftB_X,arrowHeadToShaftB_Y:arrowHeadToShaftB_Y,//AB两点延申坐标
                            arrowShaftA_X:arrowShaftA_X,arrowShaftA_Y:arrowShaftA_Y,arrowShaftB_X:arrowShaftB_X,arrowShaftB_Y:arrowShaftB_Y ,
                           AB_k:AB_k,//AB直线斜率
                           yDiffSign:yDiffSign,xDiffSign:xDiffSign,arrowcentreToHead_X:arrowcentreToHead_X,arrowcentreToHead_Y:arrowcentreToHead_Y } //差值
                 }
                 catch(e) { console.error(e.message + "来源：", e.stack); }

            }
                //箭头尾部圆弧参数
                property var arrowArcParameters: {
                 try{
                     //尾端圆弧坐标
                     //A点箭头尾部圆弧起点
                     var arrowShaftA_ArcStartX = 0
                     var arrowShaftA_ArcStartY = 0
                     //B点箭头尾部圆弧起点
                      var arrowShaftB_ArcStartX = 0
                      var arrowShaftB_ArcStartY = 0
                     //A点箭头尾部圆弧终点
                     var arrowShaftA_ArcEndX = 0
                     var arrowShaftA_ArcEndY = 0
                     //B点箭头尾部圆弧终点
                      var arrowShaftB_ArcEndX = 0
                      var arrowShaftB_ArcEndY = 0

                     //如果AB两点直线坐标重合
                     if(private_arrowPath.valuejudgement(arrowTipParameters.arrowPointA_X,arrowTipParameters.arrowPointB_X,1) && private_arrowPath.valuejudgement(arrowTipParameters.arrowPointA_Y,arrowTipParameters.arrowPointB_Y,1)){
                         //不能使2条斜边重合
                         throw new Error("不能使2条斜边重合");
                     }else{
                          if (private_arrowPath.valuejudgement(arrowTipParameters.arrowPointA_X,arrowTipParameters.arrowPointB_X,1)) {
                         //如果AB两点直线于Y轴平行
                            arrowShaftA_ArcStartX = arrowShaftB_ArcStartX = arrowTipParameters.arrowShaftA_X - (arrowTipParameters.arrowPointA_X - private_arrowPath.arrowHeadX > 0 ? 1 : -1) * private_arrowPath.arrowShaftTailArcHeight
                            arrowShaftA_ArcEndX = arrowShaftB_ArcEndX = arrowTipParameters.arrowShaftA_X
                            arrowShaftA_ArcStartY =arrowTipParameters.arrowShaftA_Y
                            arrowShaftB_ArcStartY =arrowTipParameters.arrowShaftB_Y
                            arrowShaftA_ArcEndY = arrowTipParameters.arrowShaftA_Y - (arrowTipParameters.yDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftTailArcWidth);
                            arrowShaftB_ArcEndY = arrowTipParameters.arrowShaftB_Y + (arrowTipParameters.yDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftTailArcWidth);

                         }else if(private_arrowPath.valuejudgement(arrowTipParameters.arrowPointA_Y,arrowTipParameters.arrowPointB_Y,1)){
                         //如果AB两点直线于X轴平行
                              arrowShaftA_ArcStartY = arrowShaftB_ArcStartY = arrowTipParameters.arrowShaftA_Y - (arrowTipParameters.arrowPointA_Y - private_arrowPath.arrowHeadY > 0 ? 1 : -1) * private_arrowPath.arrowShaftTailArcHeight
                              arrowShaftA_ArcEndY = arrowShaftB_ArcEndY = arrowTipParameters.arrowShaftA_Y
                              arrowShaftA_ArcStartX = arrowTipParameters.arrowShaftA_X
                              arrowShaftB_ArcStartX = arrowTipParameters.arrowShaftB_X
                              arrowShaftA_ArcEndX = arrowTipParameters.arrowShaftA_X - (arrowTipParameters.xDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftTailArcWidth);
                              arrowShaftB_ArcEndX = arrowTipParameters.arrowShaftB_X + (arrowTipParameters.xDiffSign > 0 ? 1 : -1) * (private_arrowPath.arrowShaftTailArcWidth);
                         }else{
                             //如果不垂直于任一轴线
                             //箭头杆尾部圆弧起点坐标
                              //A点箭头尾部圆弧起点
                              arrowShaftA_ArcStartX = arrowTipParameters.arrowShaftA_X - (arrowTipParameters.arrowcentreToHead_X > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(-(1/arrowTipParameters.AB_k)))) * private_arrowPath.arrowShaftTailArcHeight
                              arrowShaftA_ArcStartY = arrowTipParameters.arrowShaftA_Y - (arrowTipParameters.arrowcentreToHead_Y > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan((-1/arrowTipParameters.AB_k)))) * private_arrowPath.arrowShaftTailArcHeight
                              //B点箭头尾部圆弧起点
                              arrowShaftB_ArcStartX = arrowTipParameters.arrowShaftB_X - (arrowTipParameters.arrowcentreToHead_X > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(-(1/arrowTipParameters.AB_k)))) * private_arrowPath.arrowShaftTailArcHeight
                              arrowShaftB_ArcStartY = arrowTipParameters.arrowShaftB_Y - (arrowTipParameters.arrowcentreToHead_Y > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan((-1/arrowTipParameters.AB_k)))) * private_arrowPath.arrowShaftTailArcHeight
                             //箭头杆尾部圆弧终点坐标
                              //A点箭头尾部圆弧终点
                              arrowShaftA_ArcEndX = arrowTipParameters.arrowShaftA_X - (arrowTipParameters.xDiffSign > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(arrowTipParameters.AB_k))) * (private_arrowPath.arrowShaftTailArcWidth);
                              arrowShaftA_ArcEndY = arrowTipParameters.arrowShaftA_Y - (arrowTipParameters.yDiffSign > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan(arrowTipParameters.AB_k))) * (private_arrowPath.arrowShaftTailArcWidth);
                              //B点箭头尾部圆弧终点
                              arrowShaftB_ArcEndX = arrowTipParameters.arrowShaftB_X + (arrowTipParameters.xDiffSign > 0 ? 1 : -1) * Math.abs(Math.cos(Math.atan(arrowTipParameters.AB_k))) * (private_arrowPath.arrowShaftTailArcWidth);
                              arrowShaftB_ArcEndY = arrowTipParameters.arrowShaftB_Y + (arrowTipParameters.yDiffSign > 0 ? 1 : -1) * Math.abs(Math.sin(Math.atan(arrowTipParameters.AB_k))) * (private_arrowPath.arrowShaftTailArcWidth);

                         }
                     }
                     return {arrowShaftA_ArcStartX:arrowShaftA_ArcStartX,arrowShaftA_ArcStartY:arrowShaftA_ArcStartY,arrowShaftB_ArcStartX:arrowShaftB_ArcStartX,arrowShaftB_ArcStartY:arrowShaftB_ArcStartY,
                             arrowShaftA_ArcEndX:arrowShaftA_ArcEndX,arrowShaftA_ArcEndY:arrowShaftA_ArcEndY,arrowShaftB_ArcEndX:arrowShaftB_ArcEndX,arrowShaftB_ArcEndY:arrowShaftB_ArcEndY}


                }catch(e) { console.error(e.message + "来源：", e.stack); }

                }

                ShapePath{
                    //线段宽度
                    strokeWidth: private_arrowPath.pathWidth
                    //线段颜色
                    strokeColor: private_arrowPath.pathStrokeColor
                    //填充颜色
                    fillColor: private_arrowPath.pathFillColor
                    //起始坐标
                        startX: private_arrowPath.arrowHeadX
                        startY: private_arrowPath.arrowHeadY

                        //绘制
                        PathLine{
                            x:arrow.arrowTipParameters.arrowPointA_X
                            y:arrow.arrowTipParameters.arrowPointA_Y
                        }
                        PathLine{
                            x:arrow.arrowTipParameters.arrowHeadToShaftA_X
                            y:arrow.arrowTipParameters.arrowHeadToShaftA_Y
                        }
                        PathLine{
                            x:arrow.arrowArcParameters.arrowShaftA_ArcStartX
                            y:arrow.arrowArcParameters.arrowShaftA_ArcStartY
                        }
                        PathArc{
                            x:arrow.arrowArcParameters.arrowShaftA_ArcEndX
                            y:arrow.arrowArcParameters.arrowShaftA_ArcEndY
                            radiusX: private_arrowPath.arrowShaftTailArcRaidusX
                            radiusY: private_arrowPath.arrowShaftTailArcRaidusY
                            useLargeArc: false
                            direction: private_arrowPath.arrowShaftTailArcdirection
                        }
                        PathLine{
                            x:arrow.arrowArcParameters.arrowShaftB_ArcEndX
                            y:arrow.arrowArcParameters.arrowShaftB_ArcEndY
                        }
                        PathArc{
                            x:arrow.arrowArcParameters.arrowShaftB_ArcStartX
                            y:arrow.arrowArcParameters.arrowShaftB_ArcStartY
                            radiusX: private_arrowPath.arrowShaftTailArcRaidusX
                            radiusY: private_arrowPath.arrowShaftTailArcRaidusY
                            useLargeArc: false
                            direction: private_arrowPath.arrowShaftTailArcdirection
                        }
                        PathLine{
                            x:arrow.arrowTipParameters.arrowHeadToShaftB_X
                            y:arrow.arrowTipParameters.arrowHeadToShaftB_Y
                        }
                        PathLine{
                            x:arrow.arrowTipParameters.arrowPointB_X
                            y:arrow.arrowTipParameters.arrowPointB_Y
                        }
                        PathLine{
                            x:private_arrowPath.arrowHeadX
                            y:private_arrowPath.arrowHeadY
                        }
                }
            }
        }
    }
