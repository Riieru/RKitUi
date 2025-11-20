import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts
import panel

//下拉框
Item {
    id:comboBoxPath_RP
    //参数
    //下拉框左侧标识图案区域宽度
    property real comboBoxLeftWidth: 0
    //下拉框左侧标识图案区域高度
    property real comboBoxLeftHeight: 0
    //下拉框中间文本区域宽度
    property real comboBoxTextWidth: 0
    //下拉框中间文本区域高度
    property real comboBoxTextHeight: 0
    //下拉框右侧按钮区域宽度
    property real comboBoxRightWidth: 0
    //下拉框右侧按钮区域高度
    property real comboBoxRightHeight: 0
    //左侧圆角半径X
    property real comboBoxLeftArcRadiusX: 0
    //中间文本区域圆弧半径X
    property real comboBoxMiddleArcRadiusX: 0
    //右侧圆角半径X
    property real comboBoxRightArcRadiusX: 0
    //左侧圆角半径Y
    property real comboBoxLeftArcRadiusY: 0
    //中间文本区域圆弧半径Y
    property real comboBoxMiddleArcRadiusY: 0
    //右侧圆角半径Y
    property real comboBoxRightArcRadiusY: 0

    //左侧圆角X宽度
    property real comboBoxLeftArcWidth: 0
    //左侧圆角Y高度
    property real comboBoxLeftArcHeight: 0

    //下拉框左侧与中间区域交界处圆弧半径X
    property real comboBoxLeftToMiddleArcRadiusX: 0
    //下拉框左侧与中间区域交界处圆弧半径Y
    property real comboBoxLeftToMiddleArcRadiusY: 0
    //下拉框右侧与中间区域交界处圆弧半径X
    property real comboBoxRightToMiddleArcRadiusX: 0
    //下拉框右侧与中间区域交界处圆弧半径Y
    property real comboBoxRightToMiddleArcRadiusY: 0

    //下拉框右侧圆弧x轴宽度
    property real comboBoxRightArcWidth: 0

    //下拉框左侧直线长度
    property real comboBoxLeftLineLength: 0
    //下拉框右侧直线长度
    property real comboBoxRightLineLength: 0

    //下拉框与下方文本框交界区域高度
    property real comboBoxTextPasteHeight: 0
    //下拉框与下方文本框交界宽度
    property real comboBoxTextPasteDownWidth: 0
    //下拉框与下方文本框交界处右侧圆弧半径X
    property real comboBoxTextPasteRightArcRadiusX: 0
    //下拉框与下方文本框交界处右侧圆弧半径Y
    property real comboBoxTextPasteRightArcRadiusY: 0
    //下拉框与下方文本框交界区域实际高度
    property real comboBoxTextPastActualHeight : 0

    //下拉框左侧标识图案区域边框宽度
    property real comboBoxLeftBorderWidth: 0
    //下拉框左侧标识图案区域边框颜色
    property color comboBoxLeftBorderColor: "#FFFFFF"
    //下拉框左侧标识图案区域填充颜色
    property color comboBoxLeftFullColor: "#FFFFFF"
    //下拉框中间文本区域边框宽度
    property real comboBoxMiddleBorderWidth: 0
    //下拉框中间文本区域边框颜色
    property color comboBoxMiddleBorderColor: "#FFFFFF"
    //下拉框中间文本区域填充颜色
    property color comboBoxMiddleFullColor: "#FFFFFF"
    //下拉框右侧按钮区域，方向朝上按钮边框宽度
    property real comboBoxUpArrowBorderWidth: 0
    //下拉框右侧按钮区域，方向朝上按钮边框颜色
    property color comboBoxUpArrowBorderColor: "#FFFFFF"
    //下拉框右侧按钮区域，方向朝上按钮填充颜色
    property color comboBoxUpArrowFullColor: "#FFFFFF"
    //下拉框右侧按钮区域，方向朝下按钮边框宽度
    property real comboBoxDownArrowBorderWidth: 0
    //下拉框右侧按钮区域，方向朝下按钮边框颜色
    property color comboBoxDownArrowBorderColor: "#FFFFFF"
    //下拉框右侧按钮区域，方向朝下按钮填充颜色
    property color comboBoxDownArrowFullColor: "#FFFFFF"

    //下拉框与下方文本框交界区域边框宽度
    property real comboBoxTextPastBorderWidth: 0
    //下拉框与下方文本框交界区域边框颜色
    property color comboBoxTextPastBorderColor: "#FFFFFF"
    //下拉框与下方文本框交界区域填充颜色
    property color comboBoxTextPastFullColor: "#FFFFFF"

    //左侧区域形状
    readonly property Shape comboBoxLeftShape: leftShape
    //中间显示区域形状
    readonly property Shape comboBoxMiddleShape: middleShape
    //右侧上箭头图案区域区域形状
    readonly property Shape comboBoxrightTopShape: rightTopShape
    //右侧下箭头图案区域区域形状
    readonly property Shape comboBoxrightDownShape: rightDownShape
    //与下方选项区域区域形状
    readonly property Shape comboBoxPastShape: comboBoxPastShape



    Item{
        id:private_comboBoxPAth_RP
        //宽高
        width: parent.width
        height: parent.height
        //下拉框左侧标识图案区域宽度
        property real comboBoxLeftWidth: parent.comboBoxLeftWidth
        //下拉框左侧标识图案区域高度
        property real comboBoxLeftHeight: parent.comboBoxLeftHeight
        //下拉框中间文本区域宽度
        property real comboBoxTextWidth: parent.comboBoxTextWidth
        //下拉框中间文本区域高度
        property real comboBoxTextHeight: parent.comboBoxTextHeight
        //下拉框右侧按钮区域宽度
        property real comboBoxRightWidth: parent.comboBoxRightWidth
        //下拉框右侧按钮区域高度
        property real comboBoxRightHeight: parent.comboBoxRightHeight
        //左侧圆角半径X
        property real comboBoxLeftArcRadiusX: parent.comboBoxLeftArcRadiusX
        //中间文本区域圆弧半径X
        property real comboBoxMiddleArcRadiusX: parent.comboBoxMiddleArcRadiusX
        //右侧圆弧半径X
        property real comboBoxRightArcRadiusX: parent.comboBoxRightArcRadiusX
        //左侧圆角半径Y
        property real comboBoxLeftArcRadiusY: parent.comboBoxLeftArcRadiusY
        //中间文本区域圆弧半径Y
        property real comboBoxMiddleArcRadiusY: parent.comboBoxMiddleArcRadiusY
        //右侧圆弧半径Y
        property real comboBoxRightArcRadiusY: parent.comboBoxRightArcRadiusY

        //左侧圆角X宽度
        property real comboBoxLeftArcWidth: parent.comboBoxLeftArcWidth
        //左侧圆角Y高度
        property real comboBoxLeftArcHeight: parent.comboBoxLeftArcHeight

        //下拉框左侧直线长度
        property real comboBoxLeftLineLength: parent.comboBoxLeftLineLength
        //下拉框右侧直线长度
        property real comboBoxRightLineLength: parent.comboBoxRightLineLength

        //下拉框左侧与中间区域交界处圆弧半径X
        property real comboBoxLeftToMiddleArcRadiusX: parent.comboBoxLeftToMiddleArcRadiusX
        //下拉框左侧与中间区域交界处圆弧半径Y
        property real comboBoxLeftToMiddleArcRadiusY: parent.comboBoxLeftToMiddleArcRadiusY
        //下拉框右侧与中间区域交界处圆弧半径X
        property real comboBoxRightToMiddleArcRadiusX: parent.comboBoxRightToMiddleArcRadiusX
        //下拉框右侧与中间区域交界处圆弧半径Y
        property real comboBoxRightToMiddleArcRadiusY: parent.comboBoxRightToMiddleArcRadiusY

        //下拉框右侧圆弧x轴宽度
        property real comboBoxRightArcWidth: parent.comboBoxRightArcWidth

        //下拉框与下方文本框交界区域高度
        property real comboBoxTextPasteHeight: parent.comboBoxTextPasteHeight
        //下拉框与下方文本框交界宽度
        property real comboBoxTextPasteDownWidth: parent.comboBoxTextPasteDownWidth
        //下拉框与下方文本框交界处右侧圆弧半径X
        property real comboBoxTextPasteRightArcRadiusX: parent.comboBoxTextPasteRightArcRadiusX
        //下拉框与下方文本框交界处右侧圆弧半径Y
        property real comboBoxTextPasteRightArcRadiusY: parent.comboBoxTextPasteRightArcRadiusY
        //下拉框与下方文本框交界区域实际高度
        property real comboBoxTextPastActualHeight : parent.comboBoxTextPastActualHeight


        //下拉框左侧标识图案区域边框宽度
        property real comboBoxLeftBorderWidth: parent.comboBoxLeftBorderWidth
        //下拉框左侧标识图案区域边框颜色
        property color comboBoxLeftBorderColor: parent.comboBoxLeftBorderColor
        //下拉框左侧标识图案区域填充颜色
        property color comboBoxLeftFullColor: parent.comboBoxLeftFullColor

        //下拉框中间文本区域边框宽度
        property real comboBoxMiddleBorderWidth: parent.comboBoxMiddleBorderWidth
        //下拉框中间文本区域边框颜色
        property color comboBoxMiddleBorderColor: parent.comboBoxMiddleBorderColor
        //下拉框中间文本区域填充颜色
        property color comboBoxMiddleFullColor: parent.comboBoxMiddleFullColor

        //下拉框右侧按钮区域，方向朝上按钮边框宽度
        property real comboBoxUpArrowBorderWidth: parent.comboBoxUpArrowBorderWidth
        //下拉框右侧按钮区域，方向朝上按钮边框颜色
        property color comboBoxUpArrowBorderColor: parent.comboBoxUpArrowBorderColor
        //下拉框右侧按钮区域，方向朝上按钮填充颜色
        property color comboBoxUpArrowFullColor: parent.comboBoxUpArrowFullColor

        //下拉框右侧按钮区域，方向朝下按钮边框宽度
        property real comboBoxDownArrowBorderWidth: parent.comboBoxDownArrowBorderWidth
        //下拉框右侧按钮区域，方向朝下按钮边框颜色
        property color comboBoxDownArrowBorderColor: parent.comboBoxDownArrowBorderColor
        //下拉框右侧按钮区域，方向朝下按钮填充颜色
        property color comboBoxDownArrowFullColor: parent.comboBoxDownArrowFullColor

        //下拉框与下方文本框交界区域边框宽度
        property real comboBoxTextPastBorderWidth: parent.comboBoxTextPastBorderWidth
        //下拉框与下方文本框交界区域边框颜色
        property color comboBoxTextPastBorderColor: parent.comboBoxTextPastBorderColor
        //下拉框与下方文本框交界区域填充颜色
        property color comboBoxTextPastFullColor: parent.comboBoxTextPastFullColor



        //根据传递进来的椭圆半径X和Y，2个椭圆上的点，求椭圆圆心
        property var ellipseCenterCalculation:function(radiusX,radiusY,ApointX,ApointY,BpointX,BpointY){
                //判断输入
                if (ApointX === BpointX && ApointY === BpointY) {
                    console.error("两点重合，无法计算圆心");
                    return { centerX_First:NaN,centerX_Second:NaN,centerY_First:NaN,centerY_Second:NaN};
                }
                //两点距离超过最长直径长度，错误
                if(Math.sqrt(((ApointX - BpointX) * (ApointX - BpointX)) + ((ApointY - BpointY) * (ApointY - BpointY))) > Math.max(radiusX,radiusY)){
                    console.error("两点距离超过最长直径长度，无法计算圆心");
                    return { centerX_First:NaN,centerX_Second:NaN,centerY_First:NaN,centerY_Second:NaN};
                }

                //坐标值
                var centerX_First = 0
                var centerX_Second = 0
                var centerY_First = 0
                var centerY_Second = 0
                //X坐标
                if(ApointY === BpointY){
                   centerX_First = centerX_Second = (ApointX + BpointX) / 2
                   centerY_First = ApointY - radiusY * Math.sqrt(1 - (((ApointX - BpointX) * (ApointX - BpointX)) / (4 * (radiusX * radiusX))))
                   centerY_Second = ApointY + radiusY * Math.sqrt(1 - (((ApointX - BpointX) * (ApointX - BpointX)) / (4 * (radiusX * radiusX))))
                }else{
                centerX_First = ((ApointX + BpointX) / 2) - ((radiusX * radiusX) * (ApointY - BpointY) * Math.sqrt(1 - (((ApointX - BpointX) * (ApointX - BpointX)) / (4 * (radiusX * radiusX))) - (((ApointY - BpointY) * (ApointY - BpointY)) / (4 * (radiusY * radiusY)))))/
                                    Math.sqrt(((radiusX * radiusX) * ((ApointY - BpointY) * (ApointY - BpointY))) + (radiusY * radiusY) * ((ApointX - BpointX) * (ApointX - BpointX)))
                centerX_Second = ((ApointX + BpointX) / 2) + ((radiusX * radiusX) * (ApointY - BpointY) * Math.sqrt(1 - (((ApointX - BpointX) * (ApointX - BpointX)) / (4 * (radiusX * radiusX))) - (((ApointY - BpointY) * (ApointY - BpointY)) / (4 * (radiusY * radiusY)))))/
                                    Math.sqrt(((radiusX * radiusX) * ((ApointY - BpointY) * (ApointY - BpointY))) + (radiusY * radiusY) * ((ApointX - BpointX) * (ApointX - BpointX)))
                //Y坐标
                centerY_First = (ApointY + BpointY) / 2 + (((ApointX - BpointX) * (radiusY * radiusY)) / ((ApointY - BpointY) * (radiusX * radiusX))) * ((ApointX + BpointX) / 2 - centerX_First)
                centerY_Second = (ApointY + BpointY) / 2 + (((ApointX - BpointX) * (radiusY * radiusY)) / ((ApointY - BpointY) * (radiusX * radiusX))) * ((ApointX + BpointX) / 2 - centerX_Second)
                }
                return{centerX_First:centerX_First,centerX_Second:centerX_Second,centerY_First:centerY_First,centerY_Second:centerY_Second}
            }

        //传递进椭圆圆心坐标，椭圆半径XY，直线2点在椭圆上的坐标求出以直线为分割线，椭圆与直线距离最远的点
        property var ellipseToLineDistanceLength:function(centerX,centerY,radiusX,radiusY,lineF_X,lineF_Y,lineS_X,lineS_Y){
            //离心角最值
            var centripetalAngle_MAX;
            var centripetalAngle_MIN;
            //直线表达式一般式系数A
            var linecoefficientA = lineF_Y - lineS_Y
            //直线表达式一般式系数B
            var linecoefficientB = lineS_X - lineF_X
            //直线表达式一般式系数C
            var linecoefficientC = (lineF_X * lineS_Y) - (lineS_X * lineF_Y)
            //椭圆上点的X轴系数
            var Arccoefficient_X = radiusX * linecoefficientA
            //椭圆上点的Y轴系数
            var Arccoefficient_Y = radiusY * linecoefficientB

            //正弦型函数振幅
            var Scope = Math.sqrt(Arccoefficient_X * Arccoefficient_X + Arccoefficient_Y * Arccoefficient_Y)
            //常数项
            const linecon = linecoefficientA * centerX + linecoefficientB * centerY + linecoefficientC;

            //弧度差
            var radian = Math.atan2(Arccoefficient_Y,Arccoefficient_X)

            //确定最远和最近点
            const F1 = Math.abs(linecon + Scope)
            const F2 = Math.abs(linecon - Scope)

            //获取其坐标离心角
            if(F1 >= F2){
                centripetalAngle_MAX = radian
                centripetalAngle_MIN = Math.PI + radian
            }else{
                centripetalAngle_MAX = Math.PI + radian
                centripetalAngle_MIN = radian
            }

            return{max_X:centerX + radiusX * Math.cos(centripetalAngle_MAX),max_Y:centerY + radiusY * Math.sin(centripetalAngle_MAX),min_X:centerX + radiusX * Math.cos(centripetalAngle_MIN),min_Y:centerY + radiusY * Math.sin(centripetalAngle_MIN)}

        }

        //传递进椭圆圆心坐标，半径XY，所求点的X坐标，求出所求点的Y坐标
        property var ellipsePointY:function(centerX,centerY,radiusX,radiusY,pointX){
                //Y坐标
                var pointY1 = centerY + radiusY * Math.sqrt(1 - (((pointX - centerX) * (pointX - centerX)) / (radiusX * radiusX)))
                var pointY2 = centerY - radiusY * Math.sqrt(1 - (((pointX - centerX) * (pointX - centerX)) / (radiusX * radiusX)))
                if(pointY1 === NaN || pointY2 === NaN) console.error("求解椭圆坐标时出错")
                return {pointY1:pointY1,pointY2:pointY2}
        }

        //传递进椭圆圆心坐标，半径XY，所求点的X坐标，求出所求点的X坐标
        property var ellipsePointX:function(centerX,centerY,radiusX,radiusY,pointY){
                //Y坐标
                var pointX1 = centerX + radiusX * Math.sqrt(1 - (((pointY - centerY) * (pointY - centerY)) / (radiusY * radiusY)))
                var pointX2 = centerX - radiusX * Math.sqrt(1 - (((pointY - centerY) * (pointY - centerY)) / (radiusY * radiusY)))
                if(pointX1 === NaN || pointX2 === NaN) console.error("求解椭圆坐标时出错")
                return {pointX1:pointX1,pointX2:pointX2}
        }

        //绘制
        Shape{
            id:comboBoxShape
            //左侧区域与中间区域的高度差
            property real comboBoxLeftToMiddleHeightDifference: private_comboBoxPAth_RP.comboBoxLeftHeight - private_comboBoxPAth_RP.comboBoxTextHeight
            //右侧区域与中间区域的高度差
            property real comboBoxRightToMiddleHeightDifference: private_comboBoxPAth_RP.comboBoxRightHeight - private_comboBoxPAth_RP.comboBoxTextHeight

            //中间区域左侧圆弧突出宽度
            property real comboBoxMiddleArcRightLength: {
                    //圆心坐标
               var centerpoint =  private_comboBoxPAth_RP.ellipseCenterCalculation(private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX,private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY,
                                                             private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth,
                                                             private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2,
                                                             private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth,
                                                             private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2 + private_comboBoxPAth_RP.comboBoxTextHeight)
                //获取该直线右侧圆弧距离
                var arcParameters = private_comboBoxPAth_RP.ellipseToLineDistanceLength(centerpoint.centerX_First,centerpoint.centerY_First,private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX,private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY,
                                                                                    private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth,
                                                                                    private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2,
                                                                                    private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth,
                                                                                    private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2 + private_comboBoxPAth_RP.comboBoxTextHeight)

                return Math.abs(private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth - arcParameters.min_X)
            }

            //下拉框与下方文本框交界区域右侧圆弧参数
            property var comboBoxTextPastArcParameters : {
                    //圆弧默认两端坐标
                    var arcpoint1_X = private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftArcWidth + private_comboBoxPAth_RP.comboBoxLeftLineLength
                    var arcpoint1_Y = private_comboBoxPAth_RP.y + private_comboBoxPAth_RP.comboBoxLeftHeight

                    var arcpoint2_X = private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxTextPasteDownWidth
                    var arcpoint2_Y = private_comboBoxPAth_RP.y + private_comboBoxPAth_RP.comboBoxLeftHeight + private_comboBoxPAth_RP.comboBoxTextPasteHeight
                    //圆弧对应椭圆的圆心坐标
                    var center = private_comboBoxPAth_RP.ellipseCenterCalculation(private_comboBoxPAth_RP.comboBoxTextPasteRightArcRadiusX,private_comboBoxPAth_RP.comboBoxTextPasteRightArcRadiusY,arcpoint1_X,arcpoint1_Y,arcpoint2_X,arcpoint2_Y)
                    return {centerX:center.centerX_First,centerY:center.centerY_First}
            }

            //下拉框与下方文本框交界区域右侧圆弧末端实际坐标
            property var comboBoxTextPastActualCoordinates : {
                    //y坐标
                    var arcEndpointY = private_comboBoxPAth_RP.y + private_comboBoxPAth_RP.comboBoxLeftHeight + private_comboBoxPAth_RP.comboBoxTextPastActualHeight
                    //x坐标
                    var arcpointX = private_comboBoxPAth_RP.ellipsePointX(comboBoxShape.comboBoxTextPastArcParameters.centerX,comboBoxShape.comboBoxTextPastArcParameters.centerY,private_comboBoxPAth_RP.comboBoxTextPasteRightArcRadiusX,private_comboBoxPAth_RP.comboBoxTextPasteRightArcRadiusY,arcEndpointY)
                    var arcEndpointX = arcpointX.pointX2
                    return {arcEndpointX:arcEndpointX,arcEndpointY:arcEndpointY}
            }

            Shape{
                    id:leftShape
                     containsMode: Shape.FillContains
            //左侧区域
            ShapePath{
                //线段宽度
                strokeWidth: private_comboBoxPAth_RP.comboBoxLeftBorderWidth
                //线段颜色
                strokeColor: private_comboBoxPAth_RP.comboBoxLeftBorderColor
                //透明底色
                fillColor: private_comboBoxPAth_RP.comboBoxLeftFullColor
                //起始位置
                startX: private_comboBoxPAth_RP.x
                startY: private_comboBoxPAth_RP.y
                PathMove{
                         relativeX: private_comboBoxPAth_RP.comboBoxLeftArcWidth
                         relativeY: 0
                }
                PathArc{
                        relativeX: -private_comboBoxPAth_RP.comboBoxLeftArcWidth
                        relativeY: private_comboBoxPAth_RP.comboBoxLeftArcHeight
                        radiusX: private_comboBoxPAth_RP.comboBoxLeftArcRadiusX
                        radiusY: private_comboBoxPAth_RP.comboBoxLeftArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Counterclockwise
                }
                PathLine{
                        relativeX: 0
                        relativeY: private_comboBoxPAth_RP.comboBoxLeftHeight - private_comboBoxPAth_RP.comboBoxLeftArcHeight * 2
                }
                PathArc{
                        relativeX: private_comboBoxPAth_RP.comboBoxLeftArcWidth
                        relativeY: private_comboBoxPAth_RP.comboBoxLeftArcHeight
                        radiusX: private_comboBoxPAth_RP.comboBoxLeftArcRadiusX
                        radiusY: private_comboBoxPAth_RP.comboBoxLeftArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Counterclockwise
                }
                PathLine{
                        relativeX: private_comboBoxPAth_RP.comboBoxLeftLineLength
                        relativeY: 0
                }
                PathArc{
                        relativeX: private_comboBoxPAth_RP.comboBoxLeftWidth - private_comboBoxPAth_RP.comboBoxLeftArcRadiusX - private_comboBoxPAth_RP.comboBoxLeftLineLength
                        relativeY: -comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2
                        radiusX: private_comboBoxPAth_RP.comboBoxLeftToMiddleArcRadiusX
                        radiusY: private_comboBoxPAth_RP.comboBoxLeftToMiddleArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                }
                PathArc{
                        relativeX: 0
                        relativeY: -private_comboBoxPAth_RP.comboBoxTextHeight
                        radiusX: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX
                        radiusY: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                }
                PathArc{
                        relativeX: -(private_comboBoxPAth_RP.comboBoxLeftWidth - private_comboBoxPAth_RP.comboBoxLeftArcRadiusX - private_comboBoxPAth_RP.comboBoxLeftLineLength)
                        relativeY: -comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2
                        radiusX: private_comboBoxPAth_RP.comboBoxLeftToMiddleArcRadiusX
                        radiusY: private_comboBoxPAth_RP.comboBoxLeftToMiddleArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                }
                PathLine{
                        relativeX: -private_comboBoxPAth_RP.comboBoxLeftLineLength
                        relativeY: 0
                }
             }
            }
            Shape{
                    id:middleShape
                    containsMode: Shape.FillContains
            //绘制中间区域
            ShapePath{
                    //线段宽度
                    strokeWidth: private_comboBoxPAth_RP.comboBoxMiddleBorderWidth
                    //线段颜色
                    strokeColor: private_comboBoxPAth_RP.comboBoxMiddleBorderColor
                    //透明底色
                    fillColor: private_comboBoxPAth_RP.comboBoxMiddleFullColor
                    //起始位置
                    startX: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth
                    startY: private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2

                    PathArc{
                            relativeX: 0
                            relativeY: private_comboBoxPAth_RP.comboBoxTextHeight
                            radiusX: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Counterclockwise
                    }
                    PathLine{
                            relativeX: private_comboBoxPAth_RP.comboBoxTextWidth - comboBoxShape.comboBoxMiddleArcRightLength * 2
                            relativeY: 0
                    }
                    PathArc{
                            relativeX: 0
                            relativeY: -private_comboBoxPAth_RP.comboBoxTextHeight
                            radiusX: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Counterclockwise
                    }
                    PathLine{
                            relativeX: -(private_comboBoxPAth_RP.comboBoxTextWidth - comboBoxShape.comboBoxMiddleArcRightLength * 2)
                            relativeY: 0
                    }
               }
            }
            Shape{
                    id:rightTopShape
                    containsMode: Shape.FillContains
            //绘制右侧区域-上箭头图案区域
            ShapePath{
                    //线段宽度
                    strokeWidth: private_comboBoxPAth_RP.comboBoxUpArrowBorderWidth
                    //线段颜色
                    strokeColor: private_comboBoxPAth_RP.comboBoxUpArrowBorderColor
                    //透明底色
                    fillColor: private_comboBoxPAth_RP.comboBoxUpArrowFullColor
                    //起始位置
                    startX: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth + private_comboBoxPAth_RP.comboBoxTextWidth - comboBoxShape.comboBoxMiddleArcRightLength * 2
                    startY: private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2

                    PathArc{
                            relativeX: comboBoxShape.comboBoxMiddleArcRightLength
                            relativeY: private_comboBoxPAth_RP.comboBoxTextHeight / 2
                            radiusX: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Clockwise
                    }
                    PathLine{
                            relativeX: private_comboBoxPAth_RP.comboBoxRightWidth - comboBoxShape.comboBoxMiddleArcRightLength
                            relativeY: 0
                    }
                    PathArc{
                            relativeX: -private_comboBoxPAth_RP.comboBoxRightArcWidth
                            relativeY: -(private_comboBoxPAth_RP.comboBoxRightHeight / 2)
                            radiusX: private_comboBoxPAth_RP.comboBoxRightArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxRightArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Counterclockwise
                    }
                    PathLine{
                            relativeX: -private_comboBoxPAth_RP.comboBoxRightLineLength
                            relativeY: 0
                    }
                    PathArc{
                            x: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth + private_comboBoxPAth_RP.comboBoxTextWidth - comboBoxShape.comboBoxMiddleArcRightLength * 2
                            y: private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2
                            radiusX: private_comboBoxPAth_RP.comboBoxRightToMiddleArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxRightToMiddleArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Clockwise
                    }
              }
            }
            Shape{
                    id:rightDownShape
                    containsMode: Shape.FillContains
            //绘制右侧区域-下箭头图案区域
            ShapePath{
                    //线段宽度
                    strokeWidth: private_comboBoxPAth_RP.comboBoxDownArrowBorderWidth
                    //线段颜色
                    strokeColor: private_comboBoxPAth_RP.comboBoxDownArrowBorderColor
                    //透明底色
                    fillColor: private_comboBoxPAth_RP.comboBoxDownArrowFullColor
                    //起始位置
                    startX: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth + private_comboBoxPAth_RP.comboBoxTextWidth - comboBoxShape.comboBoxMiddleArcRightLength * 2
                    startY: private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2 + private_comboBoxPAth_RP.comboBoxTextHeight

                    PathArc{
                            relativeX: comboBoxShape.comboBoxMiddleArcRightLength
                            relativeY: -private_comboBoxPAth_RP.comboBoxTextHeight / 2
                            radiusX: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxMiddleArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Counterclockwise
                    }
                    PathLine{
                            relativeX: private_comboBoxPAth_RP.comboBoxRightWidth - comboBoxShape.comboBoxMiddleArcRightLength
                            relativeY: 0
                    }
                    PathArc{
                            relativeX: -private_comboBoxPAth_RP.comboBoxRightArcWidth
                            relativeY: private_comboBoxPAth_RP.comboBoxRightHeight / 2
                            radiusX: private_comboBoxPAth_RP.comboBoxRightArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxRightArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Clockwise
                    }
                    PathLine{
                            relativeX: -private_comboBoxPAth_RP.comboBoxRightLineLength
                            relativeY: 0
                    }
                    PathArc{
                            x: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftWidth + private_comboBoxPAth_RP.comboBoxTextWidth - comboBoxShape.comboBoxMiddleArcRightLength * 2
                            y: private_comboBoxPAth_RP.y + comboBoxShape.comboBoxLeftToMiddleHeightDifference / 2 + private_comboBoxPAth_RP.comboBoxTextHeight
                            radiusX: private_comboBoxPAth_RP.comboBoxRightToMiddleArcRadiusX
                            radiusY: private_comboBoxPAth_RP.comboBoxRightToMiddleArcRadiusY
                            useLargeArc: false
                            direction: PathArc.Counterclockwise
                    }
             }
            }

            Shape{
                    id:comboBoxPastShape
                    containsMode: Shape.FillContains
            //控件区与下方选项区域的交界区域
            ShapePath{
                //线段宽度
                strokeWidth: private_comboBoxPAth_RP.comboBoxTextPastBorderWidth
                //线段颜色
                strokeColor: private_comboBoxPAth_RP.comboBoxTextPastBorderColor
                //填充颜色
                fillColor: private_comboBoxPAth_RP.comboBoxTextPastFullColor
                //起始位置
                startX: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftArcWidth
                startY: private_comboBoxPAth_RP.y + private_comboBoxPAth_RP.comboBoxLeftHeight

                PathLine{
                        relativeX: private_comboBoxPAth_RP.comboBoxLeftLineLength
                        relativeY: 0
                }
                PathArc{
                        x: comboBoxShape.comboBoxTextPastActualCoordinates.arcEndpointX
                        y: comboBoxShape.comboBoxTextPastActualCoordinates.arcEndpointY
                        radiusX: private_comboBoxPAth_RP.comboBoxTextPasteRightArcRadiusX
                        radiusY: private_comboBoxPAth_RP.comboBoxTextPasteRightArcRadiusY
                        useLargeArc: false
                        direction: PathArc.Counterclockwise
                }
                PathLine{
                        x: private_comboBoxPAth_RP.x + private_comboBoxPAth_RP.comboBoxLeftArcWidth
                        y: private_comboBoxPAth_RP.y + private_comboBoxPAth_RP.comboBoxLeftHeight + private_comboBoxPAth_RP.comboBoxTextPastActualHeight
                }
                PathLine{
                        relativeX: 0
                        relativeY: -private_comboBoxPAth_RP.comboBoxTextPastActualHeight
                }
            }
          }
        }
    }
}
