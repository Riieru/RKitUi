pragma Singleton
import QtQuick 2.15


//数学图形计算
QtObject {
    id:mathGeometry
    readonly property real adad:11
    //通过不同直线斜率计算直线过椭圆圆心与椭圆的交点
   readonly property var lineAndEllipseToOriginIntersection: function(arccentreX,arccentreY,arcRaduisX,arcRadiusY,lineK) {
       //第一个交点
        var x1 = arccentreX - (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
        var y1 = arccentreY - lineK * (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
       //第二个交点
       var x2 = arccentreX + (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
       var y2 = arccentreY + lineK * (arcRaduisX * arcRadiusY) / Math.sqrt(Math.pow(arcRadiusY,2)+Math.pow(lineK,2) * Math.pow(arcRaduisX,2));
       return {x1:x1,y1:y1,x2:x2,y2:y2}
     }

    //通过不同直线斜率和过直线的一点计算直线过椭圆的交点
    readonly property var lineAndEllipseIntersection: function(arccentreX,arccentreY,arcRaduisX,arcRadiusY,lineK,linepointX,linepointY) {
        //组合方程 Ax² + Bx + C = 0
        //系数A
        var A = (1 / (arcRaduisX * arcRaduisX)) + ((lineK * lineK) / (arcRadiusY * arcRadiusY))
        //系数B
        var B = 2 * ((lineK * ((linepointY - lineK * linepointX) - arccentreY)) / (arcRadiusY * arcRadiusY) - arccentreX / (arcRaduisX * arcRaduisX));
        //系数C
        var C = (((linepointY - lineK * linepointX) - arccentreY) * ((linepointY - lineK * linepointX) - arccentreY) ) / (arcRadiusY * arcRadiusY) + (arccentreX * arccentreX) / (arcRaduisX * arcRaduisX) - 1
        //判别式
        var judgment = (B * B) - (4 * A * C)
        //如果直线不经过圆，返回NaN
        if(judgment < 0){
            console.error("lineAndEllipseIntersection函数使用错误，该直线不经过该椭圆")
            return{x1:NaN,x2:NaN,y1:NaN,y2:NaN}
        }
        //有解
        //x坐标
        var x1 = (-B + Math.sqrt(judgment)) / (2 * A)
        var x2 = (-B - Math.sqrt(judgment)) / (2 * A)
        //y坐标
        var y1 = (lineK * x1) + (linepointY - lineK * linepointX)
        var y2 = (lineK * x2) + (linepointY - lineK * linepointX)
        return {x1:x1,x2:x2,y1:y1,y2:y2}
      }

    readonly property var lineAndEllipseIntersectionVerticalX: function(arccentreX,arccentreY,arcRaduisX,arcRadiusY,linepointX,linepointY){
            //直线方程x = linepointX
            //参数平方
            var numeratorY = (linepointX - arccentreX) * (linepointX - arccentreX);
            var denominatorX = arcRaduisX * arcRaduisX;
            //x超出椭圆范围
            if (numeratorY > denominatorX) {
                console.error("直线不经过椭圆");
                return {x1:NaN,x2:NaN,y1:NaN,y2:NaN};
            }
            var Parametersy = arcRadiusY * arcRadiusY * (1 - numeratorY / denominatorX);
            //0不能开根号
            if (Parametersy < 0) {
                console.error("直线不经过椭圆");
                return {x1:NaN,x2:NaN,y1:NaN,y2:NaN};
            }
            var y1 = arccentreY + Math.sqrt(Parametersy);
            var y2 = arccentreY - Math.sqrt(Parametersy);
            return {x1:linepointX,x2:linepointX,y1:y1,y2:y2};
    }

    //给定直线斜率和长度，根据直线上一点坐标求过一段距离后的坐标
    readonly property var lineAndKToLocation: function(startX,startY,lineK,linelength,Direction) {
      //坐标
       var x = startX + (Direction * (linelength / Math.sqrt(1 + Math.pow(lineK,2))))
       var y = startY + (Direction * (linelength * lineK) / Math.sqrt(1 + Math.pow(lineK,2)))
      return {x:x,y:y}
    }

    //根据传递进来的椭圆半径X和Y，2个椭圆上的点，求椭圆圆心
    readonly property var ellipseCenterCalculation:function(radiusX,radiusY,ApointX,ApointY,BpointX,BpointY){
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
    readonly property var ellipseToLineDistanceLength:function(centerX,centerY,radiusX,radiusY,lineF_X,lineF_Y,lineS_X,lineS_Y){
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

    //以一条已知直线为基准，以输入旋转角度方向，获取与该直线平行的前后两条直线，与已知椭圆的交点
      readonly property var getParallelLinesEllipseIntersections: function(centerX,centerY,radiusX,radiusY,lineK,lineAngle,RectangleWidth){
        //内侧两点坐标
        var InnerpointLeftX;
        var InnerpointLeftY;
        var InnerpointRightX;
        var InnerpointRightY;

        //获取中间直线与椭圆交点（按角度取方向）
        var centerLinepointX;
        var centerLinepointY;
        //获取坐标
       var Centercoordinates = MathGeometry.lineAndEllipseToOriginIntersection(centerX,centerY,radiusX,radiusY,lineK)
        //判断朝向
        if(Math.floor(lineAngle / 180) % 2 === 0){
            //取y坐标小的
            centerLinepointY = Math.max(Centercoordinates.y1,Centercoordinates.y2)
        }else{
            centerLinepointY = Math.min(Centercoordinates.y1,Centercoordinates.y2)
        }
        //选择同x坐标
        if(centerLinepointY === Centercoordinates.y1){
            centerLinepointX = Centercoordinates.x1
        }else{
            centerLinepointX = Centercoordinates.x2
        }
        //目前直线方程 y = lineK_A * （x - centerLinepointX) + centerLinepointY
        //该直线左侧直线方程 y = lineK_A * （x - centerLinepointX) + centerLinepointY + 两直线y轴偏移距离
        //该直线法线与y轴的夹角
        var NormalToYAngle = (lineAngle % 180) > 90 ? 180 - (lineAngle % 180) : lineAngle % 180
        var NormalToYRadian;
        var lineconst;
        //如果法线与y轴夹角为90，则与x轴垂直
        if(!(NormalToYAngle === 90)){
        //转换弧度制
        NormalToYRadian = Math.PI/180 * NormalToYAngle
        //两直线y轴偏移距离
        lineconst = RectangleWidth / 2 / Math.cos(NormalToYRadian)
        }

        //目前直线方程 y = lineK_A * （x - centerLinepointX) + centerLinepointY
        //该直线左侧直线方程 y = lineK_A * （x - centerLinepointX) + centerLinepointY + lineconst
        //该直线右侧直线方程 y = lineK_A * （x - centerLinepointX) + centerLinepointY - lineconst
        //左侧直线一点
        var LinepointleftX;
        var LinepointleftY;
        //右侧直线一点
        var LinepointRightX;
        var LinepointRightY;
        //该两条直线与椭圆的交点
        var leftSidecoordinates;
        var rightSidecoordinates;

        //如果该直线与x轴垂直
        if(NormalToYAngle === 90){
            LinepointleftY = LinepointRightY = centerLinepointY
            LinepointleftX = centerLinepointX - RectangleWidth / 2
            LinepointRightX = centerLinepointX + RectangleWidth / 2
            //获取该两条直线与椭圆的交点
            leftSidecoordinates = MathGeometry.lineAndEllipseIntersectionVerticalX(centerX,centerY,radiusX,radiusY,LinepointleftX,LinepointleftY)
            rightSidecoordinates = MathGeometry.lineAndEllipseIntersectionVerticalX(centerX,centerY,radiusX,radiusY,LinepointRightX,LinepointRightY)
        }else{
        //左侧直线一点
        LinepointleftX = centerLinepointX
        LinepointleftY = lineK * (LinepointleftX - centerLinepointX) + centerLinepointY + lineconst
        //右侧直线一点
        LinepointRightX = centerLinepointX
        LinepointRightY = lineK * (LinepointRightX - centerLinepointX) + centerLinepointY - lineconst
        //获取该两条直线与椭圆的交点
        leftSidecoordinates = MathGeometry.lineAndEllipseIntersection(centerX,centerY,radiusX,radiusY,lineK,LinepointleftX,LinepointleftY)
        rightSidecoordinates = MathGeometry.lineAndEllipseIntersection(centerX,centerY,radiusX,radiusY,lineK,LinepointRightX,LinepointRightY)
        }
            //判断朝向
        if(Math.floor(lineAngle / 180) % 2 === 0){
            //取y坐标小的
            InnerpointLeftY = Math.max(leftSidecoordinates.y1,leftSidecoordinates.y2)
            InnerpointRightY = Math.max(rightSidecoordinates.y1,rightSidecoordinates.y2)
        }else{
            InnerpointLeftY = Math.min(leftSidecoordinates.y1,leftSidecoordinates.y2)
            InnerpointRightY = Math.min(rightSidecoordinates.y1,rightSidecoordinates.y2)
        }
        if(InnerpointLeftY === leftSidecoordinates.y1 && leftSidecoordinates.y1 === leftSidecoordinates.y2){
            InnerpointLeftX = Math.floor(lineAngle / 180) % 2 === 0 ? Math.max(leftSidecoordinates.x1,leftSidecoordinates.x2) : Math.min(leftSidecoordinates.x1,leftSidecoordinates.x2)
            InnerpointRightX = Math.floor(lineAngle / 180) % 2 === 0 ? Math.max(rightSidecoordinates.x1,rightSidecoordinates.x2) : Math.min(rightSidecoordinates.x1,rightSidecoordinates.x2)
        }else{
          //选择同x坐标
          if(InnerpointLeftY === leftSidecoordinates.y1){
              InnerpointLeftX = leftSidecoordinates.x1
              InnerpointRightX = rightSidecoordinates.x1
          }else{
              InnerpointLeftX = leftSidecoordinates.x2
              InnerpointRightX = rightSidecoordinates.x2
          }
        }
        return{InnerpointLeftX:InnerpointLeftX,InnerpointLeftY:InnerpointLeftY,InnerpointRightX:InnerpointRightX,InnerpointRightY:InnerpointRightY}
    }

    //传递进椭圆圆心坐标，半径XY，所求点的X坐标，求出所求点的Y坐标
    readonly property var ellipsePointY:function(centerX,centerY,radiusX,radiusY,pointX){
            //Y坐标
            var pointY1 = centerY + radiusY * Math.sqrt(1 - (((pointX - centerX) * (pointX - centerX)) / (radiusX * radiusX)))
            var pointY2 = centerY - radiusY * Math.sqrt(1 - (((pointX - centerX) * (pointX - centerX)) / (radiusX * radiusX)))
            if(pointY1 === NaN || pointY2 === NaN) console.error("求解椭圆坐标时出错")
            return {pointY1:pointY1,pointY2:pointY2}
    }

    //传递进椭圆圆心坐标，半径XY，所求点的X坐标，求出所求点的X坐标
    readonly property var ellipsePointX:function(centerX,centerY,radiusX,radiusY,pointY){
            //Y坐标
            var pointX1 = centerX + radiusX * Math.sqrt(1 - (((pointY - centerY) * (pointY - centerY)) / (radiusY * radiusY)))
            var pointX2 = centerX - radiusX * Math.sqrt(1 - (((pointY - centerY) * (pointY - centerY)) / (radiusY * radiusY)))
            if(pointX1 === NaN || pointX2 === NaN) console.error("求解椭圆坐标时出错")
            return {pointX1:pointX1,pointX2:pointX2}
    }

}
