import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Layouts
import RKitUi

//错误图案
Item{
        id:errorPath
        //中心原点坐标X
        property real errorCenterX: 0
        //中心原点坐标Y
        property real errorCenterY: 0
        //中心圆半径X
        property real errorCenterArcX: 0
        //中心圆半径Y
        property real errorCenterArcY: 0
        //A直线旋转角度
        property real errorLineAngleA: 0
        //A直线长度
        property real errorLineLengthA: 0
        //A直线宽度
        property real errorLineWidthA: 0
        //A直线顶部圆弧半径X
        property real errorLineTopArcRadiusA_X: 0
        //A直线顶部圆弧半径Y
        property real errorLineTopArcRadiusA_Y: 0
        //A直线圆弧方向
        property int errorLineTopArcDirectionA: 0
        //B直线旋转角度
        property real errorLineAngleB: 0
        //B直线长度
        property real errorLineLengthB: 0
        //B直线宽度
        property real errorLineWidthB: 0
        //B直线顶部圆弧半径X
        property real errorLineTopArcRadiusB_X: 0
        //B直线顶部圆弧半径Y
        property real errorLineTopArcRadiusB_Y: 0
        //B直线圆弧方向
        property int errorLineTopArcDirectionB: 0
        //C直线旋转角度
        property real errorLineAngleC: 0
        //C直线长度
        property real errorLineLengthC: 0
        //C直线宽度
        property real errorLineWidthC: 0
        //C直线顶部圆弧半径X
        property real errorLineTopArcRadiusC_X: 0
        //C直线顶部圆弧半径Y
        property real errorLineTopArcRadiusC_Y: 0
        //C直线圆弧方向
        property int errorLineTopArcDirectionC: 0
        //D直线旋转角度
        property real errorLineAngleD: 0
        //D直线长度
        property real errorLineLengthD: 0
        //D直线宽度
        property real errorLineWidthD: 0
        //D直线顶部圆弧半径X
        property real errorLineTopArcRadiusD_X: 0
        //D直线顶部圆弧半径Y
        property real errorLineTopArcRadiusD_Y: 0
        //D直线圆弧方向
        property int errorLineTopArcDirectionD: 0

        //错误图案四肢边框宽度
        property real errorBorderwidth: 0
        //错误图案四肢边框颜色
        property color errorBorderColor: "#FFFFFF"
        //错误图案四肢内填充颜色
        property color errorFillColor: "#FFFFFF"

        //错误图案中心边框宽度
        property real errorCenterBorderwidth: 0
        //错误图案中心颜色
        property color errorCenterBorderColor: "#FFFFFF"
        //错误图案中心内填充颜色
        property color errorCenterFillColor: "#FFFFFF"

        //内部图形区域
        readonly property Shape errorShape: errorPath_shape

        Item{
            id:private_errorPath
            //中心原点坐标X
            property real errorCenterX: parent.errorCenterX
            //中心原点坐标Y
            property real errorCenterY: parent.errorCenterY
            //中心圆半径X
            property real errorCenterArcX: parent.errorCenterArcX
            //中心圆半径Y
            property real errorCenterArcY: parent.errorCenterArcY
            //A直线旋转角度
            property real errorLineAngleA: parent.errorLineAngleA
            //A直线长度
            property real errorLineLengthA: parent.errorLineLengthA
            //A直线宽度
            property real errorLineWidthA: parent.errorLineWidthA
            //A直线顶部圆弧半径X
            property real errorLineTopArcRadiusA_X: parent.errorLineTopArcRadiusA_X
            //A直线顶部圆弧半径Y
            property real errorLineTopArcRadiusA_Y: parent.errorLineTopArcRadiusA_Y
            //A直线圆弧方向
            property int errorLineTopArcDirectionA: parent.errorLineTopArcDirectionA
            //B直线旋转角度
            property real errorLineAngleB: parent.errorLineAngleB
            //B直线长度
            property real errorLineLengthB: parent.errorLineLengthB
            //B直线宽度
            property real errorLineWidthB: parent.errorLineWidthB
            //B直线顶部圆弧半径X
            property real errorLineTopArcRadiusB_X: parent.errorLineTopArcRadiusB_X
            //B直线顶部圆弧半径Y
            property real errorLineTopArcRadiusB_Y: parent.errorLineTopArcRadiusB_Y
            //B直线圆弧方向
            property int errorLineTopArcDirectionB: parent.errorLineTopArcDirectionB
            //C直线旋转角度
            property real errorLineAngleC: parent.errorLineAngleC
            //C直线长度
            property real errorLineLengthC: parent.errorLineLengthC
            //C直线宽度
            property real errorLineWidthC: parent.errorLineWidthC
            //C直线顶部圆弧半径X
            property real errorLineTopArcRadiusC_X: parent.errorLineTopArcRadiusC_X
            //C直线顶部圆弧半径Y
            property real errorLineTopArcRadiusC_Y: parent.errorLineTopArcRadiusC_Y
            //C直线圆弧方向
            property int errorLineTopArcDirectionC: parent.errorLineTopArcDirectionC
            //D直线旋转角度
            property real errorLineAngleD: parent.errorLineAngleD
            //D直线长度
            property real errorLineLengthD: parent.errorLineLengthD
            //D直线宽度
            property real errorLineWidthD: parent.errorLineWidthD
            //D直线顶部圆弧半径X
            property real errorLineTopArcRadiusD_X: parent.errorLineTopArcRadiusD_X
            //D直线顶部圆弧半径Y
            property real errorLineTopArcRadiusD_Y: parent.errorLineTopArcRadiusD_Y
            //D直线圆弧方向
            property int errorLineTopArcDirectionD: parent.errorLineTopArcDirectionD

            //错误图案四肢边框宽度
            property real errorBorderwidth: parent.errorBorderwidth
            //错误图案四肢边框颜色
            property color errorBorderColor: parent.errorBorderColor
            //错误图案四肢内填充颜色
            property color errorFillColor: parent.errorFillColor

            //错误图案中心边框宽度
            property real errorCenterBorderwidth: parent.errorCenterBorderwidth
            //错误图案中心颜色
            property color errorCenterBorderColor: parent.errorCenterBorderColor
            //错误图案中心内填充颜色
            property color errorCenterFillColor: parent.errorCenterFillColor

            //绘制
            Shape{
                id:errorPath_shape

                //A直线斜率
                property real lineK_A: private_errorPath.errorLineAngleA % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_errorPath.errorLineAngleA)
                //B直线斜率
                property real lineK_B: private_errorPath.errorLineAngleB % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_errorPath.errorLineAngleB)
                //C直线斜率
                property real lineK_C: private_errorPath.errorLineAngleC % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_errorPath.errorLineAngleC)
                //D直线斜率
                property real lineK_D: private_errorPath.errorLineAngleD % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_errorPath.errorLineAngleD)

                //A直线内侧圆弧方向
                property int errorLineTopArcDirectionA: parent.errorLineTopArcDirectionA === PathArc.Clockwise ? PathArc.Counterclockwise : PathArc.Clockwise
                //B直线内侧圆弧方向
                property int errorLineTopArcDirectionB: parent.errorLineTopArcDirectionB === PathArc.Clockwise ? PathArc.Counterclockwise : PathArc.Clockwise
                //C直线内侧圆弧方向
                property int errorLineTopArcDirectionC: parent.errorLineTopArcDirectionC === PathArc.Clockwise ? PathArc.Counterclockwise : PathArc.Clockwise
                //D直线内侧圆弧方向
                property int errorLineTopArcDirectionD: parent.errorLineTopArcDirectionD === PathArc.Clockwise ? PathArc.Counterclockwise : PathArc.Clockwise

                //A直线坐标参数
            property var lineParameters_A: {
                    //内侧两点坐标
                    var InnerpointLeftX = 0
                    var InnerpointLeftY = 0
                    var InnerpointRightX = 0
                    var InnerpointRightY = 0
                    //外侧两点坐标
                    var outerpointLeftX = 0
                    var outerpointLeftY = 0
                    var outerpointRightX = 0
                    var outerpointRightY = 0

                    //坐标
                    var Coordinates = MathGeometry.getParallelLinesEllipseIntersections(private_errorPath.errorCenterX,private_errorPath.errorCenterY,private_errorPath.errorCenterArcX,private_errorPath.errorCenterArcY,errorPath_shape.lineK_A,private_errorPath.errorLineAngleA,private_errorPath.errorLineWidthA)

                    InnerpointLeftX = Coordinates.InnerpointLeftX
                    InnerpointLeftY = Coordinates.InnerpointLeftY
                    InnerpointRightX = Coordinates.InnerpointRightX
                    InnerpointRightY = Coordinates.InnerpointRightY

                    //外侧两点坐标
                    //A直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_A = errorPath_shape.lineK_A >= 0 ? 1 : -1
                    //A直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_A = Math.floor(private_errorPath.errorLineAngleA / 180) % 2 === 0 ? 1 : -1
                    //外侧点
                    var outerpointLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,errorPath_shape.lineK_A,private_errorPath.errorLineLengthA,(DirectionX_A * DirectionY_A))
                    var outerpointRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,errorPath_shape.lineK_A,private_errorPath.errorLineLengthA,(DirectionX_A * DirectionY_A))

                    outerpointLeftX = outerpointLeft.x
                    outerpointLeftY = outerpointLeft.y
                    outerpointRightX = outerpointRight.x
                    outerpointRightY = outerpointRight.y

                    return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY,
                           outerpointLeftX:outerpointLeftX,outerpointLeftY:outerpointLeftY,outerpointRightX:outerpointRightX,outerpointRightY:outerpointRightY}
                }

                //B直线坐标参数
            property var lineParameters_B: {
                    //内侧两点坐标
                    var InnerpointLeftX = 0
                    var InnerpointLeftY = 0
                    var InnerpointRightX = 0
                    var InnerpointRightY = 0
                    //外侧两点坐标
                    var outerpointLeftX = 0
                    var outerpointLeftY = 0
                    var outerpointRightX = 0
                    var outerpointRightY = 0

                    //坐标
                    var Coordinates = MathGeometry.getParallelLinesEllipseIntersections(private_errorPath.errorCenterX,private_errorPath.errorCenterY,private_errorPath.errorCenterArcX,private_errorPath.errorCenterArcY,errorPath_shape.lineK_B,private_errorPath.errorLineAngleB,private_errorPath.errorLineWidthB)

                    InnerpointLeftX = Coordinates.InnerpointLeftX
                    InnerpointLeftY = Coordinates.InnerpointLeftY
                    InnerpointRightX = Coordinates.InnerpointRightX
                    InnerpointRightY = Coordinates.InnerpointRightY

                    //外侧两点坐标
                    //B直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_B = errorPath_shape.lineK_B >= 0 ? 1 : -1
                    //B直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_B = Math.floor(private_errorPath.errorLineAngleB / 180) % 2 === 0 ? 1 : -1
                    //外侧点
                    var outerpointLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,errorPath_shape.lineK_B,private_errorPath.errorLineLengthB,(DirectionX_B * DirectionY_B))
                    var outerpointRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,errorPath_shape.lineK_B,private_errorPath.errorLineLengthB,(DirectionX_B * DirectionY_B))

                    outerpointLeftX = outerpointLeft.x
                    outerpointLeftY = outerpointLeft.y
                    outerpointRightX = outerpointRight.x
                    outerpointRightY = outerpointRight.y

                    return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY,
                           outerpointLeftX:outerpointLeftX,outerpointLeftY:outerpointLeftY,outerpointRightX:outerpointRightX,outerpointRightY:outerpointRightY}
                }

                //C直线坐标参数
            property var lineParameters_C: {
                    //内侧两点坐标
                    var InnerpointLeftX = 0
                    var InnerpointLeftY = 0
                    var InnerpointRightX = 0
                    var InnerpointRightY = 0
                    //外侧两点坐标
                    var outerpointLeftX = 0
                    var outerpointLeftY = 0
                    var outerpointRightX = 0
                    var outerpointRightY = 0

                    //坐标
                    var Coordinates = MathGeometry.getParallelLinesEllipseIntersections(private_errorPath.errorCenterX,private_errorPath.errorCenterY,private_errorPath.errorCenterArcX,private_errorPath.errorCenterArcY,errorPath_shape.lineK_C,private_errorPath.errorLineAngleC,private_errorPath.errorLineWidthC)

                    InnerpointLeftX = Coordinates.InnerpointLeftX
                    InnerpointLeftY = Coordinates.InnerpointLeftY
                    InnerpointRightX = Coordinates.InnerpointRightX
                    InnerpointRightY = Coordinates.InnerpointRightY

                    //外侧两点坐标
                    //C直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_C = errorPath_shape.lineK_C >= 0 ? 1 : -1
                    //C直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_C = Math.floor(private_errorPath.errorLineAngleC / 180) % 2 === 0 ? 1 : -1
                    //外侧点
                    var outerpointLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,errorPath_shape.lineK_C,private_errorPath.errorLineLengthC,(DirectionX_C * DirectionY_C))
                    var outerpointRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,errorPath_shape.lineK_C,private_errorPath.errorLineLengthC,(DirectionX_C * DirectionY_C))

                    outerpointLeftX = outerpointLeft.x
                    outerpointLeftY = outerpointLeft.y
                    outerpointRightX = outerpointRight.x
                    outerpointRightY = outerpointRight.y

                    return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY,
                           outerpointLeftX:outerpointLeftX,outerpointLeftY:outerpointLeftY,outerpointRightX:outerpointRightX,outerpointRightY:outerpointRightY}
                }

                //C直线坐标参数
            property var lineParameters_D: {
                    //内侧两点坐标
                    var InnerpointLeftX = 0
                    var InnerpointLeftY = 0
                    var InnerpointRightX = 0
                    var InnerpointRightY = 0
                    //外侧两点坐标
                    var outerpointLeftX = 0
                    var outerpointLeftY = 0
                    var outerpointRightX = 0
                    var outerpointRightY = 0

                    //坐标
                    var Coordinates = MathGeometry.getParallelLinesEllipseIntersections(private_errorPath.errorCenterX,private_errorPath.errorCenterY,private_errorPath.errorCenterArcX,private_errorPath.errorCenterArcY,errorPath_shape.lineK_D,private_errorPath.errorLineAngleD,private_errorPath.errorLineWidthD)

                    InnerpointLeftX = Coordinates.InnerpointLeftX
                    InnerpointLeftY = Coordinates.InnerpointLeftY
                    InnerpointRightX = Coordinates.InnerpointRightX
                    InnerpointRightY = Coordinates.InnerpointRightY

                    //外侧两点坐标
                    //A直线x轴朝向 true为一三象限，false为二四象限
                    var DirectionX_D = errorPath_shape.lineK_D >= 0 ? 1 : -1
                    //A直线y轴朝向 true为方向朝下，false为方向朝上
                    var DirectionY_D = Math.floor(private_errorPath.errorLineAngleD / 180) % 2 === 0 ? 1 : -1
                    //外侧点
                    var outerpointLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,errorPath_shape.lineK_D,private_errorPath.errorLineLengthD,(DirectionX_D * DirectionY_D))
                    var outerpointRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,errorPath_shape.lineK_D,private_errorPath.errorLineLengthD,(DirectionX_D * DirectionY_D))

                    outerpointLeftX = outerpointLeft.x
                    outerpointLeftY = outerpointLeft.y
                    outerpointRightX = outerpointRight.x
                    outerpointRightY = outerpointRight.y

                    return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY,
                           outerpointLeftX:outerpointLeftX,outerpointLeftY:outerpointLeftY,outerpointRightX:outerpointRightX,outerpointRightY:outerpointRightY}
                }


                //中心区域
                ShapePath{
                    //边框宽度
                    strokeWidth: private_errorPath.errorCenterBorderwidth
                    //线段颜色
                    strokeColor: private_errorPath.errorCenterBorderColor
                    //填充颜色
                    fillColor: private_errorPath.errorCenterFillColor
                    //起始坐标
                    startX: private_errorPath.errorCenterX
                    startY: private_errorPath.errorCenterY - private_errorPath.errorCenterArcY

                    //中心圆
                    PathArc{
                        relativeX: 0
                        relativeY: private_errorPath.errorCenterArcY * 2
                        radiusX: private_errorPath.errorCenterArcX
                        radiusY: private_errorPath.errorCenterArcY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }
                    PathArc{
                        relativeX: 0
                        relativeY: -private_errorPath.errorCenterArcY * 2
                        radiusX: private_errorPath.errorCenterArcX
                        radiusY: private_errorPath.errorCenterArcY
                        useLargeArc: false
                        direction: PathArc.Clockwise
                    }

                }

                //外部区域
                ShapePath{
                     //边框宽度
                    strokeWidth: private_errorPath.errorBorderwidth
                    //线段颜色
                    strokeColor: private_errorPath.errorBorderColor
                    //填充颜色
                    fillColor: private_errorPath.errorFillColor
                    //起始坐标
                    startX: errorPath_shape.lineParameters_A.InnerpointLeftX
                    startY: errorPath_shape.lineParameters_A.InnerpointLeftY

                    //A直线
                    PathLine{
                        x:errorPath_shape.lineParameters_A.outerpointLeftX
                        y:errorPath_shape.lineParameters_A.outerpointLeftY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_A.outerpointRightX
                        y:errorPath_shape.lineParameters_A.outerpointRightY
                        radiusX: private_errorPath.errorLineTopArcRadiusA_X
                        radiusY: private_errorPath.errorLineTopArcRadiusA_Y
                        useLargeArc: false
                        direction: private_errorPath.errorLineTopArcDirectionA
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_A.InnerpointRightX
                        y:errorPath_shape.lineParameters_A.InnerpointRightY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_A.InnerpointLeftX
                        y:errorPath_shape.lineParameters_A.InnerpointLeftY
                        radiusX: private_errorPath.errorCenterArcX
                        radiusY: private_errorPath.errorCenterArcY
                        useLargeArc: false
                        direction: errorPath_shape.errorLineTopArcDirectionA
                    }
                }
                    ShapePath{
                        //边框宽度
                        strokeWidth: private_errorPath.errorBorderwidth
                        //线段颜色
                        strokeColor: private_errorPath.errorBorderColor
                        //填充颜色
                        fillColor: private_errorPath.errorFillColor

                    //B直线
                    PathMove{
                        x:errorPath_shape.lineParameters_B.InnerpointLeftX
                        y:errorPath_shape.lineParameters_B.InnerpointLeftY
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_B.outerpointLeftX
                        y:errorPath_shape.lineParameters_B.outerpointLeftY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_B.outerpointRightX
                        y:errorPath_shape.lineParameters_B.outerpointRightY
                        radiusX: private_errorPath.errorLineTopArcRadiusB_X
                        radiusY: private_errorPath.errorLineTopArcRadiusB_Y
                        useLargeArc: false
                        direction: private_errorPath.errorLineTopArcDirectionB
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_B.InnerpointRightX
                        y:errorPath_shape.lineParameters_B.InnerpointRightY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_B.InnerpointLeftX
                        y:errorPath_shape.lineParameters_B.InnerpointLeftY
                        radiusX: private_errorPath.errorCenterArcX
                        radiusY: private_errorPath.errorCenterArcY
                        useLargeArc: false
                        direction: errorPath_shape.errorLineTopArcDirectionB
                    }
                    }
                    ShapePath{
                        //边框宽度
                        strokeWidth: private_errorPath.errorBorderwidth
                        //线段颜色
                        strokeColor: private_errorPath.errorBorderColor
                        //填充颜色
                        fillColor: private_errorPath.errorFillColor
                    //C直线
                    PathMove{
                        x:errorPath_shape.lineParameters_C.InnerpointLeftX
                        y:errorPath_shape.lineParameters_C.InnerpointLeftY
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_C.outerpointLeftX
                        y:errorPath_shape.lineParameters_C.outerpointLeftY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_C.outerpointRightX
                        y:errorPath_shape.lineParameters_C.outerpointRightY
                        radiusX: private_errorPath.errorLineTopArcRadiusC_X
                        radiusY: private_errorPath.errorLineTopArcRadiusC_Y
                        useLargeArc: false
                        direction: private_errorPath.errorLineTopArcDirectionC
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_C.InnerpointRightX
                        y:errorPath_shape.lineParameters_C.InnerpointRightY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_C.InnerpointLeftX
                        y:errorPath_shape.lineParameters_C.InnerpointLeftY
                        radiusX: private_errorPath.errorCenterArcX
                        radiusY: private_errorPath.errorCenterArcY
                        useLargeArc: false
                        direction: errorPath_shape.errorLineTopArcDirectionC
                    }
                    }

                    ShapePath{
                        //边框宽度
                        strokeWidth: private_errorPath.errorBorderwidth
                        //线段颜色
                        strokeColor: private_errorPath.errorBorderColor
                        //填充颜色
                        fillColor: private_errorPath.errorFillColor
                    //D直线
                    PathMove{
                        x:errorPath_shape.lineParameters_D.InnerpointLeftX
                        y:errorPath_shape.lineParameters_D.InnerpointLeftY
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_D.outerpointLeftX
                        y:errorPath_shape.lineParameters_D.outerpointLeftY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_D.outerpointRightX
                        y:errorPath_shape.lineParameters_D.outerpointRightY
                        radiusX: private_errorPath.errorLineTopArcRadiusD_X
                        radiusY: private_errorPath.errorLineTopArcRadiusD_Y
                        useLargeArc: false
                        direction: private_errorPath.errorLineTopArcDirectionD
                    }
                    PathLine{
                        x:errorPath_shape.lineParameters_D.InnerpointRightX
                        y:errorPath_shape.lineParameters_D.InnerpointRightY
                    }
                    PathArc{
                        x:errorPath_shape.lineParameters_D.InnerpointLeftX
                        y:errorPath_shape.lineParameters_D.InnerpointLeftY
                        radiusX: private_errorPath.errorCenterArcX
                        radiusY: private_errorPath.errorCenterArcY
                        useLargeArc: false
                        direction: errorPath_shape.errorLineTopArcDirectionD
                    }
                    }
                }
            }
        }

