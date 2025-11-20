import QtQuick 2.15
import QtQuick.Shapes
import panel
//特效控件
//一条线会随着path路径游动
//存在BUG待修复，(1)位于setPathAttributes，如果相对路径=0，使用的是绝对路径，而正好绝对路径也=0，那此时绝对路径将会设置错误，会变成上一个pathmove的绝对路径

Item {
    id:flowingPhantom
    //输入
    //需要使用特效的控件
    property Path sourcePath: ShapePath{}
    //path对象的父对象
    property Item sourcePath_parent: Shape{}
    //流动的线两端顶点
    property Item vertex_Front: Shape{}
    property Item vertex_Back: Shape{}
    //流动的线段长度
    property int lineLength: 0
    //流动的线段移动速度
    property int lineSpeed: 0
    //特效循环次数
    property int lineLoop: 1
    //特效开始/停止
    property bool running: false
    //特效线条颜色
    property color pathColor: "#000000"
    //特效线条宽度
    property int pathWidth: 0
    //自定义两端顶点动画
    property PathAnimation vertex_Front_Animation: null
    property PathAnimation vertex_Back_Animation: null
    //显示/隐藏
    property bool visiblepath: false


    //信号——当端点跑到路径交界处时发出信号
    signal changepath();


    Item{
        id: private_flowingPhantom
        anchors.fill:parent

        //需要使用特效的控件
        property Path sourcePath: flowingPhantom.sourcePath
        //path对象的父对象
        property Item sourcePath_parent: flowingPhantom.sourcePath_parent
        //流动的线两端顶点
        property Item vertex_Front: flowingPhantom.vertex_Front
        property Item vertex_Back: flowingPhantom.vertex_Back
        //流动的线段长度
        property int lineLength: flowingPhantom.lineLength
        //流动的线段移动速度
        property int lineSpeed: flowingPhantom.lineSpeed
        //特效循环次数
        property int lineLoop: flowingPhantom.lineLoop
        //特效线条颜色
        property color pathColor: flowingPhantom.pathColor
        //特效线条宽度
        property int pathWidth: flowingPhantom.pathWidth
        //显示/隐藏
        property bool visiblepath: flowingPhantom.visiblepath
        //特效开始/停止
        property var running: {
            if(flowingPhantom.running){
                parallelAnim.start();
            }else{
                parallelAnim.complete();
                frontpoint.stop();
                backpoint.stop();
               }
            }

        //shapepath路径pathmove集合
        property var pathmovearr: []

        //提取pathElements子路径名函数
        property var getPathElementName: function(pathname){
            //正则表达式
            const subfunc = "QQuick([a-zA-Z]+)\(.*\)"
            //获取正则表达式匹配对象
            const match = pathname.match(subfunc);
            return match ? match[1] : "";
        }

        //绑定每个路径的起点为绝对路径（上个路径点的终点),返回完整绝对坐标
        property var convertCoordinates: function(thispath,goalpath,index,pathname){
            //判断是否为指定元素
            if(!(["PathMove"].includes(pathname.toString()))){
            //子路径起点坐标
            var x_;
            var y_;
            //绑定每个路径的起点为绝对路径（上个路径点的终点
                //如果第一个元素不是pathmove，则创建新pathmove(源对象start)坐标
                if(index === 0){
                   x_ = goalpath.startX;
                   y_ = goalpath.startY;
                }else{
                     //如果不是第一个子元素，使用上一个元素的坐标
             x_ = thispath.pathElements[thispath.pathElements.length - 1].x;
             y_ = thispath.pathElements[thispath.pathElements.length - 1].y;
                }
            return {x:x_,y:y_};
            }else return null;
        }

        //复制源子路径的属性，并将终点的相对路径改为绝对路径
        property var setPathAttributes: function(lastpathmove,thispath,goalpath,index,pathname){
            //子路径起点坐标
            var x;
            var y;
            //如果当前元素是pathmove
            if(lastpathmove === null){
                //如果是第一个元素，使用startX
                if(index === 0){
                    if(goalpath.relativeX !== 0) {x = sourcePath.startX + goalpath.relativeX;} else if(goalpath.x === 0){x = sourcePath.startX} else {x = goalpath.x;}
                    if(goalpath.relativeY !== 0) {y = sourcePath.startY + goalpath.relativeY;} else if(goalpath.y === 0){y = sourcePath.startY} else {y = goalpath.y;}
                }else{
                    if(goalpath.relativeX !== 0) {x = thispath.pathElements[thispath.pathElements.length - 1].x + goalpath.relativeX;} else if(goalpath.x === 0){x = thispath.pathElements[thispath.pathElements.length - 1].x} else {x = goalpath.x;}
                    if(goalpath.relativeY !== 0) {y = thispath.pathElements[thispath.pathElements.length - 1].y + goalpath.relativeY;} else if(goalpath.y === 0){y = thispath.pathElements[thispath.pathElements.length - 1].y} else {y = goalpath.y;}
                }
            }else{ //当前元素不是pathmove
                //存在BUG(1)
                //检查上一个元素是不是pathmove
                if(private_flowingPhantom.getPathElementName(thispath.pathElements[thispath.pathElements.length - 1].toString()) === "PathMove"){
                    if(goalpath.relativeX !== 0) {x = thispath.pathElements[thispath.pathElements.length - 1].x + goalpath.relativeX;} else if(goalpath.x === 0){x = thispath.pathElements[thispath.pathElements.length - 1].x} else {x = goalpath.x;}
                    if(goalpath.relativeY !== 0) {y = thispath.pathElements[thispath.pathElements.length - 1].y + goalpath.relativeY;} else if(goalpath.y === 0){y = thispath.pathElements[thispath.pathElements.length - 1].y} else {y = goalpath.y;}
                }else{
                if(goalpath.relativeX !== 0) {x = lastpathmove.x + goalpath.relativeX;}  else if(goalpath.x === 0){x = thispath.pathElements[thispath.pathElements.length - 1].x} else {x = goalpath.x;}
                if(goalpath.relativeY !== 0) {y = lastpathmove.y + goalpath.relativeY;}  else if(goalpath.y === 0){y = thispath.pathElements[thispath.pathElements.length - 1].y} else {x = goalpath.y;}
                }
            }
            //复制属性给新路径
            var attributes = "";
            //如果有其他属性
            if(pathname === "PathArc") {
               var arcdirection = goalpath.direction ? "PathArc.Counterclockwise" : "PathArc.Clockwise";
                attributes = ";direction:" + arcdirection + ";radiusX:" + goalpath.radiusX + ";radiusY:" + goalpath.radiusY + ";useLargeArc:" + goalpath.useLargeArc +";xAxisRotation:" + goalpath.xAxisRotation;
            }
            return "{x:" + x + ";y:" + y + attributes + "}";
        }

        //根据修正值修改patharr中所有元素的绝对坐标
        property var positioncoordinatesX: function (patharr,Correction){
            for(var i = 0;i < patharr.length;i++){
                patharr[i].x += Correction ;
            }
        }
        property var positioncoordinatesY: function (patharr,Correction){
            for(var i = 0;i < patharr.length;i++){
                patharr[i].y += Correction ;
            }
        }

        //保存当前shape源坐标
        Item{
            id:vertex_FrontXY
            width: 0
            height: 0
            x:0
            y:0
        }

         //坐标定位
        Connections {
            target: private_flowingPhantom.sourcePath_parent
            function onWidthChanged() {
                if(vertex_FrontXY.width !== 0){
                    //获取修正值
                    private_flowingPhantom.positioncoordinatesX(private_flowingPhantom.pathmovearr,private_flowingPhantom.sourcePath_parent.width - vertex_FrontXY.width)
                }
                vertex_FrontXY.width = private_flowingPhantom.sourcePath_parent.width;
            }
            function onHeightChanged(){
                if(vertex_FrontXY.height !== 0){
                    //获取修正值
                    private_flowingPhantom.positioncoordinatesY(private_flowingPhantom.pathmovearr,private_flowingPhantom.sourcePath_parent.height - vertex_FrontXY.height)
                }
                vertex_FrontXY.height = private_flowingPhantom.sourcePath_parent.height;
            }
            function onXChanged(){
                if(vertex_FrontXY.x !== 0){
                    //获取修正值
                    private_flowingPhantom.positioncoordinatesX(private_flowingPhantom.pathmovearr,private_flowingPhantom.sourcePath_parent.x - vertex_FrontXY.x)
                }
                vertex_FrontXY.x = private_flowingPhantom.sourcePath_parent.x;
            }
            function onYChanged(){
                if(vertex_FrontXY.y !== 0){
                    //获取修正值
                    private_flowingPhantom.positioncoordinatesY(private_flowingPhantom.pathmovearr,private_flowingPhantom.sourcePath_parent.y - vertex_FrontXY.y)
                }
                vertex_FrontXY.y = private_flowingPhantom.sourcePath_parent.y;
            }
        }
        //更新所有在线外路径隐藏
        property var updatePathishaved: function(){
            var indexBack;
            if(pointpositioning.vertex_Back_index === -1){indexBack = 0;}else{indexBack = pointpositioning.vertex_Back_index}
            for(var i = 1;(private_flowingPhantom.addindex(mainControl_Path.pathElements,pointpositioning.vertex_Front_index,i)) !== indexBack; i++){
               mainControl_Path.pathElements[private_flowingPhantom.addindex(mainControl_Path.pathElements,pointpositioning.vertex_Front_index,i)].x = 0;
               mainControl_Path.pathElements[private_flowingPhantom.addindex(mainControl_Path.pathElements,pointpositioning.vertex_Front_index,i)].y = 0;
            }
        }

        property var updateCoordinatesFront: function(){
                for(var i = 0;i < private_flowingPhantom.pathmovearr.length; i++){
                    //判断经过了哪一个顶点，就将该顶点的下一个元素的坐标更换为端点坐标
                    if(private_flowingPhantom.valuejudgement(private_flowingPhantom.pathmovearr[i].x,private_flowingPhantom.vertex_Front.x,1) &&
                       private_flowingPhantom.valuejudgement(private_flowingPhantom.pathmovearr[i].y,private_flowingPhantom.vertex_Front.y,1)){
                        //记录当前索引
                        var j = private_flowingPhantom.pathmovearr[i].index;
                           while(private_flowingPhantom.getPathElementName(mainControl_Path.pathElements[j].toString()) === "PathMove"){
                               j = private_flowingPhantom.addindex(mainControl_Path.pathElements,j,1);
                           }
                           //找到元素后，赋值给pointpositioning
                           pointpositioning.vertex_Front_index = j;
                           //还原当前顶点
                           private_flowingPhantom.pathmovearr[i].obj.x = private_flowingPhantom.pathmovearr[i].x;
                           private_flowingPhantom.pathmovearr[i].obj.y = private_flowingPhantom.pathmovearr[i].y;
                           //更新所有在线外路径隐藏
                           private_flowingPhantom.updatePathishaved();
                           //切换路径，发出信号
                           if(pointpositioning.vertex_Front_index !== private_flowingPhantom.changeindex) {
                               private_flowingPhantom.changeindex = pointpositioning.vertex_Front_index;
                               flowingPhantom.changepath();
                           }
                           break;
                    }
                }
                //头端点
                mainControl_Path.pathElements[pointpositioning.vertex_Front_index].x =  private_flowingPhantom.vertex_Front.x;
                mainControl_Path.pathElements[pointpositioning.vertex_Front_index].y =  private_flowingPhantom.vertex_Front.y;
        }


        property var updateCoordinatesBack: function(){
                            for(var i = 0;i < private_flowingPhantom.pathmovearr.length; i++){
                                //判断经过了哪一个顶点，就将该顶点的坐标更换为结尾坐标
                                if(private_flowingPhantom.valuejudgement(private_flowingPhantom.pathmovearr[i].x,private_flowingPhantom.vertex_Back.x,1) &&
                                    private_flowingPhantom.valuejudgement(private_flowingPhantom.pathmovearr[i].y,private_flowingPhantom.vertex_Back.y,1)){
                                       pointpositioning.vertex_Back_index = private_flowingPhantom.pathmovearr[i].index;
                                    //更新所有在线外路径隐藏
                                    private_flowingPhantom.updatePathishaved();
                                       break;
                                }
                            }
                            //尾端点
                            mainControl_Path.pathElements[pointpositioning.vertex_Back_index].x =  private_flowingPhantom.vertex_Back.x;
                            mainControl_Path.pathElements[pointpositioning.vertex_Back_index].y =  private_flowingPhantom.vertex_Back.y;
        }

        //循环索引
        property var addindex: function(arr,index,num){
            //如果没有越界
            if(index + num < arr.length) return index + num;
            //如果越界
            if(index + num >= arr.length) return index + num - arr.length;
        }

        property var subindex: function(arr,index,num){
            //如果没有越界
            if(index - num >= 0) return index - num;
            //如果越界
            if(index - num < 0) return index - num + arr.length;
        }

        //变量相等判断——增加容错范围   第三个参数为容错范围
        property var valuejudgement: function(value_F,value_B,num){
            if(Math.round(value_F) + num === Math.round(value_B) || Math.round(value_F) - num === Math.round(value_B) || Math.round(value_F) === Math.round(value_B)) {return true;}
            else   {return false;}
        }

        Item{
            id:pointpositioning
            //头端点所在路径索引
            property int vertex_Front_index: -1
            //尾端点所在路径索引
            property int vertex_Back_index: -1
            //尾端点替换原端点的坐标
            property int vertex_Back_Post_X: -1
            property int vertex_Back_Post_Y: -1
        }
        //作为信号触发标志
        property int changeindex: -1

         //第一个端点坐标定位
        Connections {
            target: private_flowingPhantom.vertex_Front
            function onXChanged() {
                private_flowingPhantom.updateCoordinatesFront();
            }
            function onYChanged(){
               private_flowingPhantom.updateCoordinatesFront();
            }
        }

       // 第二个端点坐标定位
       Connections {
           target: private_flowingPhantom.vertex_Back
           function onXChanged() {
             private_flowingPhantom.updateCoordinatesBack();
           }
           function onYChanged(){
              private_flowingPhantom.updateCoordinatesBack();
           }
       }




        //流动特效控件
        Shape{
          id:mainControl
          anchors.fill:parent
          visible: private_flowingPhantom.visiblepath

          ShapePath {
              id:mainControl_Path
              strokeWidth: private_flowingPhantom.pathWidth
              strokeColor: private_flowingPhantom.pathColor
              fillColor: "transparent"
              //起始位置
              startX: private_flowingPhantom.sourcePath.startX
              startY: private_flowingPhantom.sourcePath.startY

              //动态创建子路径对象
              Component.onCompleted: {
                  //创建对象前缀
                  var QObjectPrefix = "import QtQuick ; import QtQuick.Shapes ; ";
                  //移动坐标类型字符串
                  var pathmove = "PathMove";
                  //保存类型名
                  var pathTypeNameArr = [];
                  for(var i = 0; i < sourcePath.pathElements.length; i++){
                      //子路径对象
                      var pathobj = sourcePath.pathElements[i];
                      //路径对象名
                    var pathTypeName = private_flowingPhantom.getPathElementName(pathobj.toString());
                      //遍历源路径对象下的每一个子路径
                      if(!(["PathArc","PathLine","PathMove"].includes(pathTypeName.toString()))){
                          console.error("flowingPhantom特效控件传入的Shapepath中有无法识别的PathElement");
                          throw new Error("flowingPhantom特效控件传入的Shapepath中有无法识别的PathElement");
                      }
                      //设置生成的pathmove
                      var newpathmoveStr = "{}";
                      //获取该子路径起点的绝对路径
                      var newpathmove = private_flowingPhantom.convertCoordinates(this,pathobj,i,pathTypeName);
                      if(newpathmove !== null)
                      newpathmoveStr = "{x:"+ newpathmove.x + ";y:"+ newpathmove.y +"}";
                      //复制源子路径的属性，并将终点的相对路径改为绝对路径
                      var newpathelement = private_flowingPhantom.setPathAttributes(newpathmove,this,pathobj,i,pathTypeName);

                      //判断如果不是设置原点的子路径，就在前面增加PathMove，作为起点
                      if((i !== 0 && pathTypeName !== pathmove) && (pathTypeNameArr[i-1] !== pathmove))  this.pathElements.push(Qt.createQmlObject(QObjectPrefix + pathmove + newpathmoveStr ,this));
                          //保存类型名
                          pathTypeNameArr.push(pathTypeName);
                  //复制源路径
                this.pathElements.push(Qt.createQmlObject(QObjectPrefix + pathTypeName + newpathelement,this));
              }

                //判断当前path是否都是pathmove
                  var t = 0;
                for(var v = 0; v < pathTypeNameArr.length; v++){
                     if(pathTypeNameArr[v] === pathmove){
                       t++;
                     }
                 }
                //手动报错
                if(t === pathTypeNameArr.length){
                    console.error("错误，传递进来的path对象中都是pathmove元素!");
                    throw new Error("错误，传递进来的path对象中都是pathmove元素!");
                }

                  //将pathmove存放进路径点容器,且将原始坐标复制进对应容器
                  for(var j = 0; j < this.pathElements.length; j++){
                    if(private_flowingPhantom.getPathElementName(this.pathElements[j].toString()) === pathmove){
                      private_flowingPhantom.pathmovearr.push({obj:this.pathElements[j],index:j,x:this.pathElements[j].x,y:this.pathElements[j].y});
                    }
                  }


            }

          }
          Component.onCompleted:{
              //记录源路径父对象的宽高
              vertex_FrontXY.width = private_flowingPhantom.sourcePath_parent.width
              vertex_FrontXY.height = private_flowingPhantom.sourcePath_parent.height
              vertex_FrontXY.x = private_flowingPhantom.sourcePath_parent.x
              vertex_FrontXY.y = private_flowingPhantom.sourcePath_parent.y

          }

        }



      // 动画1：线头的路径动画
      PathAnimation {
          id: frontpoint
          path: private_flowingPhantom.sourcePath
          target: private_flowingPhantom.vertex_Front
          duration: private_flowingPhantom.lineSpeed
          loops: private_flowingPhantom.lineLoop
      }

      // 动画2：线尾的路径动画
      PathAnimation {
          id: backpoint
          path: private_flowingPhantom.sourcePath
          target: private_flowingPhantom.vertex_Back
          duration: private_flowingPhantom.lineSpeed
          loops: private_flowingPhantom.lineLoop
      }

      property PathAnimation animationcomponent_front: (flowingPhantom.vertex_Front_Animation !== null) ? flowingPhantom.vertex_Front_Animation : frontpoint
      property PathAnimation animationcomponent_back: (flowingPhantom.vertex_Back_Animation !== null) ? flowingPhantom.vertex_Back_Animation : backpoint

      //启动动画
      SequentialAnimation {
          id: parallelAnim
          running: false
          loops: 1

          // 动画序列完成后执行停止操作
          ScriptAction {
              script: {
                  private_flowingPhantom.animationcomponent_front.start()
                  private_flowingPhantom.animationcomponent_back.start()
                  private_flowingPhantom.animationcomponent_back.stop()
              }
          }
          PauseAnimation {
              duration: private_flowingPhantom.lineLength
          }
          ScriptAction {
              script: {
                  private_flowingPhantom.animationcomponent_back.start()
              }
          }
    }
  }
}
