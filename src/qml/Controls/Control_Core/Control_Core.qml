import QtQuick
import panel

//将各子控件组合为下拉框控件
Item {
    id:conrol_core

    //下拉框背景图案
    property Item controlPath: null
    //下拉框内部控件
    property list<Item> controlChildItem: []

    // Component.onCompleted: {
    //     //图案位于底层
    //     controlPath.parent = conrol_core
    //     for(var i = 0;i < controlChildItem.length;i++){
    //         if(controlChildItem[i].z <= controlPath.z) controlChildItem[i].z = ++controlPath.z
    //         controlChildItem[i].parent = conrol_core;
    //     }
    // }
}
