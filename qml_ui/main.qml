import QtQuick 2.5
//import QtCharts 2.0
import QtQuick.Window 2.2
import "qrc:/js/loader.js" as LoaderJson;

Window {
    visible: true
    Rectangle{
        id: menuHolder
        x: 0
        y: 0
        width: parent.width
        height: menuBack.height+2

        MenuBackButton{
            id: menuBack
            x: 5
            y: 5
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    menuBack.state=menuBack.state==="menu"?"back":"menu";
                }
            }
        }

        BtnLoad{
            id: btnWesModule
            x: menuBack.width+10
            y: 5
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(btnWesModule.state==="notpressed")
                        LoaderJson.getModulesListApi01("http://localhost:8080/modules/",curWesMdl.curModel);//
                    btnWesModule.state=btnWesModule.state==="notpressed"?"pressed":"notpressed";
                }
            }
        }
    }


    WesModule{
        id: curWesMdl
        y:  menuHolder.height
        width: menuHolder.width
        curModel: ListModel{
        }
        clickAction: function(name,idx){
            // asking rest sending to function our model and index
            LoaderJson.getMainByModuleApi01("http://localhost:8080/main/"+name,curWesMdl.curModel,idx);
        }
    }


}

