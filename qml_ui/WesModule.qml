import QtQuick 2.5

Item {
    id: root
    width: 380
    height: 300    
    property var clickAction
    property variant curModel

    ListView {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 4
        clip: true
        model:       parent.curModel
        orientation: ListView.Vertical
        delegate:    wesDelegate
    }

    Component{
//        properties
        id: wesDelegate
        Rectangle{
            id: rectWesDelegate
            width: 380
            height: 24
            antialiasing: true
            color: index % 2 == 0 ? "blue" : "purple"
            Text {
                text :  name+' '+idm+' '+qsTr(descr)+'wes: '+wes
                color : index % 2 == 0 ? "white" : "black"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(typeof clickAction === "function"){
//                        create function for each member
                        clickAction(name,index);
                    }
                }
            }
        }
    }

}

