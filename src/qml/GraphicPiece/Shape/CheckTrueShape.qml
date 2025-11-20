import QtQuick 2.15
import QtQuick.Shapes
import panel

//正确图案
Item {
    id:checkPath
    //中心原点坐标X
    property real checkCenterX: 0
    //中心原点坐标Y
    property real checkCenterY: 0
    //中心圆半径X
    property real checkCenterArcX: 0
    //中心圆半径Y
    property real checkCenterArcY: 0
    //A直线旋转角度
    property real checkLineAngleA: 0
    //A直线长度
    property real checkLineLengthA: 0
    //A直线宽度
    property real checkLineWidthA: 0
    //A直线顶部圆弧半径X
    property real checkLineTopArcRadiusA_X: 0
    //A直线顶部圆弧半径Y
    property real checkLineTopArcRadiusA_Y: 0
    //A直线圆弧方向
    property int checkLineTopArcDirectionA: 0
    //B直线旋转角度
    property real checkLineAngleB: 0
    //B直线长度
    property real checkLineLengthB: 0
    //B直线宽度
    property real checkLineWidthB: 0
    //B直线顶部圆弧半径X
    property real checkLineTopArcRadiusB_X: 0
    //B直线顶部圆弧半径Y
    property real checkLineTopArcRadiusB_Y: 0
    //B直线圆弧方向
    property int checkLineTopArcDirectionB: 0

    //正确图案边框宽度
    property real checkBorderwidth: 0
    //正确图案边框颜色
    property color checkBorderColor: "#FFFFFF"
    //正确图案内填充颜色
    property color checkFillColor: "#FFFFFF"

    //两直线内侧夹交圆弧——A直线方向长度
    property real checkInnerArcToALength: 0
    //两直线内侧夹交圆弧——B直线方向长度
    property real checkInnerArcToBLength: 0
    //两直线夹交圆弧半径X
    property real checkInnerArcRadiusX: 0
    //两直线夹交圆弧半径Y
    property real checkInnerArcRadiusY: 0

    //两直线外侧夹交圆弧——A直线方向长度
    property real checkouterArcToALength: 0
    //两直线外侧夹交圆弧——B直线方向长度
    property real checkouterArcToBLength: 0
    //两直线外侧夹交圆弧半径X
    property real checkouterArcRadiusX: 0
    //两直线外侧夹交圆弧半径Y
    property real checkouterArcRadiusY: 0

    //内部图形区域
    readonly property Shape checkShape: checkPath_shape

    Item {
        id:private_checkPath
        //中心原点坐标X
        property real checkCenterX: parent.checkCenterX
        //中心原点坐标Y
        property real checkCenterY: parent.checkCenterY
        //中心圆半径X
        property real checkCenterArcX: parent.checkCenterArcX
        //中心圆半径Y
        property real checkCenterArcY: parent.checkCenterArcY
        //A直线旋转角度
        property real checkLineAngleA: parent.checkLineAngleA
        //A直线长度
        property real checkLineLengthA: parent.checkLineLengthA
        //A直线宽度
        property real checkLineWidthA: parent.checkLineWidthA
        //A直线顶部圆弧半径X
        property real checkLineTopArcRadiusA_X: parent.checkLineTopArcRadiusA_X
        //A直线顶部圆弧半径Y
        property real checkLineTopArcRadiusA_Y: parent.checkLineTopArcRadiusA_Y
        //A直线圆弧方向
        property int checkLineTopArcDirectionA: parent.checkLineTopArcDirectionA
        //B直线旋转角度
        property real checkLineAngleB: parent.checkLineAngleB
        //B直线长度
        property real checkLineLengthB: parent.checkLineLengthB
        //B直线宽度
        property real checkLineWidthB: parent.checkLineWidthB
        //B直线顶部圆弧半径X
        property real checkLineTopArcRadiusB_X: parent.checkLineTopArcRadiusB_X
        //B直线顶部圆弧半径Y
        property real checkLineTopArcRadiusB_Y: parent.checkLineTopArcRadiusB_Y
        //B直线圆弧方向
        property int checkLineTopArcDirectionB: parent.checkLineTopArcDirectionB

        //正确图案边框宽度
        property real checkBorderwidth: parent.checkBorderwidth
        //正确图案边框颜色
        property color checkBorderColor: parent.checkBorderColor
        //正确图案内填充颜色
        property color checkFillColor: parent.checkFillColor

        //两直线夹交圆弧——A直线方向长度
        property real checkInnerArcToALength: parent.checkInnerArcToALength
        //两直线夹交圆弧——B直线方向长度
        property real checkInnerArcToBLength: parent.checkInnerArcToBLength
        //两直线夹交圆弧半径X
        property real checkInnerArcRadiusX: parent.checkInnerArcRadiusX
        //两直线夹交圆弧半径Y
        property real checkInnerArcRadiusY: parent.checkInnerArcRadiusY

        //两直线外侧夹交圆弧——A直线方向长度
        property real checkouterArcToALength: parent.checkouterArcToALength
        //两直线外侧夹交圆弧——B直线方向长度
        property real checkouterArcToBLength: parent.checkouterArcToBLength
        //两直线外侧夹交圆弧半径X
        property real checkouterArcRadiusX: parent.checkouterArcRadiusX
        //两直线外侧夹交圆弧半径Y
        property real checkouterArcRadiusY: parent.checkouterArcRadiusY

        //绘制
        Shape{
            id:checkPath_shape

            //A直线斜率
            property real lineK_A: private_checkPath.checkLineAngleA % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_checkPath.checkLineAngleA)
            //B直线斜率
            property real lineK_B: private_checkPath.checkLineAngleB % 180 === 0 ? 0 : Math.tan(Math.PI/180 * private_checkPath.checkLineAngleB)

            //判断A直线和B直线方向
            property int aToBDirection: {
                //A直线角度
               var Aangle = private_checkPath.checkLineAngleA % 360
                //B直线角度
               var Bangle = private_checkPath.checkLineAngleB % 360
                if(Aangle === Bangle) {console.error("AB两条直线重合");return NaN}
                //夹角大小
                var delta = (Bangle - Aangle) % 360;
                if (delta < 0) delta += 360;
                //判断方向
                return delta > 180 ? PathArc.Clockwise : PathArc.Counterclockwise;
            }

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
                var Coordinates = MathGeometry.getParallelLinesEllipseIntersections(private_checkPath.checkCenterX,private_checkPath.checkCenterY,private_checkPath.checkCenterArcX,private_checkPath.checkCenterArcY,checkPath_shape.lineK_A,private_checkPath.checkLineAngleA,private_checkPath.checkLineWidthA)

                //A直线x轴朝向 true为一三象限，false为二四象限
                var DirectionX_A = checkPath_shape.lineK_A >= 0 ? 1 : -1
                //A直线y轴朝向 true为方向朝下，false为方向朝上
                var DirectionY_A = Math.floor(private_checkPath.checkLineAngleA / 180) % 2 === 0 ? 1 : -1

                //左右互换

                InnerpointLeftX = -(DirectionY_A * DirectionX_A) === 1 ? Coordinates.InnerpointLeftX : Coordinates.InnerpointRightX
                InnerpointLeftY = -(DirectionY_A * DirectionX_A) === 1 ? Coordinates.InnerpointLeftY : Coordinates.InnerpointRightY
                InnerpointRightX = -(DirectionY_A * DirectionX_A) === 1 ? Coordinates.InnerpointRightX : Coordinates.InnerpointLeftX
                InnerpointRightY = -(DirectionY_A * DirectionX_A) === 1 ? Coordinates.InnerpointRightY : Coordinates.InnerpointLeftY

                //外侧两点坐标
                //外侧点
                var outerpointLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,checkPath_shape.lineK_A,private_checkPath.checkLineLengthA,(DirectionX_A * DirectionY_A))
                var outerpointRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,checkPath_shape.lineK_A,private_checkPath.checkLineLengthA,(DirectionX_A * DirectionY_A))

                outerpointLeftX = outerpointLeft.x
                outerpointLeftY = outerpointLeft.y
                outerpointRightX = outerpointRight.x
                outerpointRightY = outerpointRight.y

                var Direction = NaN;

                //根据A直线和B直线角度来确定内侧圆弧于哪条直线
                if(checkPath_shape.aToBDirection === PathArc.Counterclockwise){

                    //右侧直线
                    var InnerArcARight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,checkPath_shape.lineK_A,private_checkPath.checkInnerArcToALength,(DirectionX_A * DirectionY_A))
                    var OuterArcALeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,checkPath_shape.lineK_A,private_checkPath.checkouterArcToALength,-(DirectionX_A * DirectionY_A))
                    //坐标
                    InnerpointRightX = InnerArcARight.x
                    InnerpointRightY = InnerArcARight.y
                    InnerpointLeftX = OuterArcALeft.x
                    InnerpointLeftY = OuterArcALeft.y
                    Direction = 1
                }else{
                    //左侧直线
                    var InnerArcALeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,checkPath_shape.lineK_A,private_checkPath.checkInnerArcToALength,(DirectionX_A * DirectionY_A))
                    var OuterArcARight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,checkPath_shape.lineK_A,private_checkPath.checkouterArcToALength,-(DirectionX_A * DirectionY_A))
                    //坐标
                    InnerpointLeftX = InnerArcALeft.x
                    InnerpointLeftY = InnerArcALeft.y
                    InnerpointRightX = OuterArcARight.x
                    InnerpointRightY = OuterArcARight.y
                    Direction = -1
                }

                return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY,
                       outerpointLeftX:outerpointLeftX,outerpointLeftY:outerpointLeftY,outerpointRightX:outerpointRightX,outerpointRightY:outerpointRightY,Direction:Direction}
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
                var Coordinates = MathGeometry.getParallelLinesEllipseIntersections(private_checkPath.checkCenterX,private_checkPath.checkCenterY,private_checkPath.checkCenterArcX,private_checkPath.checkCenterArcY,checkPath_shape.lineK_B,private_checkPath.checkLineAngleB,private_checkPath.checkLineWidthB)

                //B直线x轴朝向 true为一三象限，false为二四象限
                var DirectionX_B = checkPath_shape.lineK_B >= 0 ? 1 : -1
                //B直线y轴朝向 true为方向朝下，false为方向朝上
                var DirectionY_B = Math.floor(private_checkPath.checkLineAngleB / 180) % 2 === 0 ? 1 : -1

                InnerpointLeftX = -(DirectionX_B * DirectionY_B) === 1 ? Coordinates.InnerpointLeftX : Coordinates.InnerpointRightX
                InnerpointLeftY = -(DirectionX_B * DirectionY_B) === 1 ? Coordinates.InnerpointLeftY : Coordinates.InnerpointRightY
                InnerpointRightX = -(DirectionX_B * DirectionY_B) === 1 ? Coordinates.InnerpointRightX : Coordinates.InnerpointLeftX
                InnerpointRightY = -(DirectionX_B * DirectionY_B) === 1 ? Coordinates.InnerpointRightY : Coordinates.InnerpointLeftY

                //外侧两点坐标
                //外侧点
                var outerpointLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,checkPath_shape.lineK_B,private_checkPath.checkLineLengthB,(DirectionX_B * DirectionY_B))
                var outerpointRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,checkPath_shape.lineK_B,private_checkPath.checkLineLengthB,(DirectionX_B * DirectionY_B))

                outerpointLeftX = outerpointLeft.x
                outerpointLeftY = outerpointLeft.y
                outerpointRightX = outerpointRight.x
                outerpointRightY = outerpointRight.y

                var Direction = 0;

                //根据A直线和B直线角度来确定内侧圆弧于哪条直线
                if(checkPath_shape.aToBDirection === PathArc.Counterclockwise){
                    //左侧直线
                    var InnerArcBLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,checkPath_shape.lineK_B,private_checkPath.checkInnerArcToBLength,(DirectionX_B * DirectionY_B))
                    var OuterArcBRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,checkPath_shape.lineK_B,private_checkPath.checkouterArcToBLength,-(DirectionX_B * DirectionY_B))
                    //坐标
                    InnerpointLeftX = InnerArcBLeft.x
                    InnerpointLeftY = InnerArcBLeft.y
                    InnerpointRightX = OuterArcBRight.x
                    InnerpointRightY = OuterArcBRight.y

                    Direction = -1
                }else{
                    //右侧直线
                    var InnerArcBRight = MathGeometry.lineAndKToLocation(InnerpointRightX,InnerpointRightY,checkPath_shape.lineK_B,private_checkPath.checkInnerArcToBLength,(DirectionX_B * DirectionY_B))
                    var OuterArcBLeft = MathGeometry.lineAndKToLocation(InnerpointLeftX,InnerpointLeftY,checkPath_shape.lineK_B,private_checkPath.checkouterArcToBLength,-(DirectionX_B * DirectionY_B))
                    //坐标
                    InnerpointRightX = InnerArcBRight.x
                    InnerpointRightY = InnerArcBRight.y
                    InnerpointLeftX = OuterArcBLeft.x
                    InnerpointLeftY = OuterArcBLeft.y

                    Direction = 1
                }

                return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY,
                       outerpointLeftX:outerpointLeftX,outerpointLeftY:outerpointLeftY,outerpointRightX:outerpointRightX,outerpointRightY:outerpointRightY,Direction:Direction}
            }


            //外部区域
            ShapePath{
                //边框宽度
                strokeWidth: private_checkPath.checkBorderwidth
                //线段颜色
                strokeColor: private_checkPath.checkBorderColor
                //填充颜色
                fillColor: private_checkPath.checkFillColor
                //起始坐标
                startX: checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.InnerpointLeftX : checkPath_shape.lineParameters_A.InnerpointRightX
                startY: checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.InnerpointLeftY : checkPath_shape.lineParameters_A.InnerpointRightY

                //A直线
                PathLine{
                    x:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.outerpointLeftX : checkPath_shape.lineParameters_A.outerpointRightX
                    y:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.outerpointLeftY : checkPath_shape.lineParameters_A.outerpointRightY
                }
                PathArc{
                    x:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.outerpointRightX : checkPath_shape.lineParameters_A.outerpointLeftX
                    y:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.outerpointRightY : checkPath_shape.lineParameters_A.outerpointLeftY
                    radiusX: private_checkPath.checkLineTopArcRadiusA_X
                    radiusY: private_checkPath.checkLineTopArcRadiusA_Y
                    useLargeArc: false
                    direction: private_checkPath.checkLineTopArcDirectionA
                }
                PathLine{
                    x:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.InnerpointRightX : checkPath_shape.lineParameters_A.InnerpointLeftX
                    y:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.InnerpointRightY : checkPath_shape.lineParameters_A.InnerpointLeftY
                }
                // //两直线内侧中间圆弧区域
                PathArc{
                    x:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.InnerpointRightX : checkPath_shape.lineParameters_B.InnerpointLeftX
                    y:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.InnerpointRightY : checkPath_shape.lineParameters_B.InnerpointLeftY
                    radiusX: private_checkPath.checkInnerArcRadiusX
                    radiusY: private_checkPath.checkInnerArcRadiusY
                    useLargeArc: false
                    direction: checkPath_shape.aToBDirection
                }
                //B直线
                PathLine{
                    x:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.outerpointRightX : checkPath_shape.lineParameters_B.outerpointLeftX
                    y:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.outerpointRightY : checkPath_shape.lineParameters_B.outerpointLeftY
                }
                PathArc{
                    x:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.outerpointLeftX : checkPath_shape.lineParameters_B.outerpointRightX
                    y:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.outerpointLeftY : checkPath_shape.lineParameters_B.outerpointRightY
                    radiusX: private_checkPath.checkLineTopArcRadiusB_X
                    radiusY: private_checkPath.checkLineTopArcRadiusB_Y
                    useLargeArc: false
                    direction: private_checkPath.checkLineTopArcDirectionB
                }
                PathLine{
                    x:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.InnerpointLeftX : checkPath_shape.lineParameters_B.InnerpointRightX
                    y:checkPath_shape.lineParameters_B.Direction > 0 ? checkPath_shape.lineParameters_B.InnerpointLeftY : checkPath_shape.lineParameters_B.InnerpointRightY
                }

                PathArc{
                    x:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.InnerpointLeftX : checkPath_shape.lineParameters_A.InnerpointRightX
                    y:checkPath_shape.lineParameters_A.Direction > 0 ? checkPath_shape.lineParameters_A.InnerpointLeftY : checkPath_shape.lineParameters_A.InnerpointRightY
                    radiusX: private_checkPath.checkInnerArcRadiusX
                    radiusY: private_checkPath.checkInnerArcRadiusY
                    useLargeArc: false
                    direction: checkPath_shape.aToBDirection === PathArc.Clockwise ? PathArc.Counterclockwise : PathArc.Clockwise
                }

        }
    }
   }
}
