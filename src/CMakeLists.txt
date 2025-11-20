cmake_minimum_required(VERSION 3.28)

project(RKitUiSource VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 COMPONENTS Quick QML Core Gui REQUIRED)

#检查包是否找到
if(NOT Qt6_FOUND)
    message(FATAL_ERROR "Qt6模块未找到")
endif()
if(NOT Qt6Quick_FOUND)
    message(FATAL_ERROR "Qt6子模块Quick未找到")
endif()
if(NOT Qt6Qml_FOUND)
    message(FATAL_ERROR "Qt6子模块QML未找到")
endif()
if(NOT Qt6Core_FOUND)
    message(FATAL_ERROR "Qt6子模块Core未找到")
endif()
if(NOT Qt6Gui_FOUND)
    message(FATAL_ERROR "Qt6子模块Gui未找到")
endif()

# qml目录
set(QML_PATH qml)

# qml单例对象目录
set(QML_SINGLETON qml/SupportSingletonObject)

#获取所有单例qml对象文件路径
file(GLOB_RECURSE qml_singleton_filelist
    ${QML_SINGLETON}/*.qml
)

message("acdadaaaaaaaaaaaaa" + ${qml_singleton_filelist})

#给单例对象设置必要属性
set_source_files_properties(${qml_singleton_filelist}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

# qml文件集合
set(${PROJECT_NAME}_qml "")

#获取所有qml文件路径
file(GLOB_RECURSE qml_filelist
    ${QML_PATH}/*.qml
)

#将qml文件集合的qml目录前的前缀目录去掉
foreach(qml_path ${qml_filelist})
file(RELATIVE_PATH qml_relative ${PROJECT_SOURCE_DIR} ${qml_path})
#保存各文件夹路径
list(APPEND ${PROJECT_NAME}_qml ${qml_relative})
endforeach()

# c++辅助类目录
set(TOOLTYPE_HEAD_PATH tooltype/include)
set(TOOLTYPE_SRC_PATH tooltype/src)

#所有源文件和头文件
file(GLOB ${PROJECT_NAME}_head
    ${TOOLTYPE_HEAD_PATH}/*.h      
)
file(GLOB ${PROJECT_NAME}_src
    ${TOOLTYPE_SRC_PATH}/*.cpp
)

qt_add_qml_module(${PROJECT_NAME}
    URI "panel"
    VERSION 1.0
    STATIC
    NO_PLUGIN
    QML_FILES
     ${${PROJECT_NAME}_qml}

)

#包含头文件
target_include_directories(${PROJECT_NAME} PRIVATE ${TOOLTYPE_HEAD_PATH})

#添加源文件
target_sources(${PROJECT_NAME} PRIVATE
    ${${PROJECT_NAME}_src}
)

# #添加头文件
target_sources(${PROJECT_NAME} PRIVATE
    ${${PROJECT_NAME}_head}
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick
)

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

#安装库文件
install(TARGETS ${PROJECT_NAME}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME}
    BUNDLE DESTINATION ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME}
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME}
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME}
)

#安装qmldir和和qmltypes放到执行目录下
install(FILES
   ${CMAKE_CURRENT_BINARY_DIR}/qmldir
   ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.qmltypes
   DESTINATION ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME}
)

#安装qml文件
install(DIRECTORY
    ${CMAKE_CURRENT_BINARY_DIR}/qml
    DESTINATION ${CMAKE_INSTALL_PREFIX}/${PROJECT_NAME}
)
