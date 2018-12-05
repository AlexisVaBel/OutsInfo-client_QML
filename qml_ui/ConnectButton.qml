import QtQuick 2.0

Item {
    width   : 68
    height  : 40

    property int animationDuration  : 250
    state     : "released"
    Rectangle{
        id                :  bar1
        anchors.fill: parent
        color           : "#fa00ff"

        Item{
            id: connector
            width   : 30
            height  : 30
            x:0
            y:10
            Rectangle{
                id: connectorLeft
                width:20
                height:20
                color:"gray"
                radius: 5
            }
            Rectangle{
                id: connectorLeftV
                width:10
                height:30
                x:18
                y:-5
                color:"gray"
                radius: 5
            }
            Rectangle{
                id: pin1
                width:10
                height:4
                x:28
                y:4
                color:"grey"
            }
            Rectangle{
                id: pin2
                width:10
                height:4
                x:28
                y:12
                color:"grey"
            }
        }

        Item{
            id: socket
            width   : 30
            height  : 30
            x:40
            y:10
            Rectangle{
                id: socketRight
                x:8
                width:20
                height:20
                color:"gray"
                radius: 5
            }
            Rectangle{
                id: socketRightV
                width:10
                height:30
                y:-5
                color:"gray"
                radius: 5
            }
        }


    }

states:[
    State{
        name: "released"
    },
    State{
        name: "pressed"
        PropertyChanges{target: connector; x: 6;}
        PropertyChanges{target: socket; x: 34;}
    }
]
transitions:[
    Transition{
        from: "released"; to : "pressed";
        PropertyAnimation {target: connector; properties: " x"                     ; duration: animationDuration; easing.type: Easing.InOutQuad}
        PropertyAnimation {target: socket     ; properties: " x"                     ; duration: animationDuration; easing.type: Easing.InOutQuad}
    }
    ,
    Transition{
        from: "pressed"; to : "released";
        PropertyAnimation {target: connector; properties: " x"                     ; duration: animationDuration; easing.type: Easing.InOutQuad}
        PropertyAnimation {target: socket     ; properties: " x"                     ; duration: animationDuration; easing.type: Easing.InOutQuad}
    }
]
}
