import QtQuick 2.0

Item {
    id      : root
    width   : 24
    height  : 24
    state     : "notpressed"
    property int animationDuration  : 250
    Rectangle{
        anchors.fill: parent
        color: "blue"
        Rectangle{
            id  : bar1
            x   : 2
            y   : 5
            width : 20
            height: 2
            antialiasing: true
        }

        Rectangle{
            id  : bar2
            x   : 2
            y   : 10
            width : 20
            height: 2
            antialiasing: true
        }

        Rectangle{
            id  : bar3
            x   : 2
            y   : 15
            width : 20
            height: 2
            antialiasing: true
        }

        Rectangle{
            id  : bar4
            x   : 2
            y   : 15
            width : 2
            height: 20
            antialiasing: true
        }
    }

    states:[
        State{
            name: "notpressed"
        },
        State{
            name: "pressed"
            PropertyChanges{target: bar1; rotation: 360}
            PropertyChanges{target: bar2; rotation: 360}
            PropertyChanges{target: bar3; rotation: 360}
        }
    ]
    transitions:[
        Transition{
            RotationAnimation {target: root;  direction: RotationAnimation.Clockwise            ; duration: animationDuration; easing.type: Easing.InOutQuad }
            PropertyAnimation {target: bar1; properties: "rotation, width, x, y"                ; duration: animationDuration; easing.type: Easing.InOutQuad}
            PropertyAnimation {target: bar2; properties: "rotation, width, x, y"                ; duration: animationDuration; easing.type: Easing.InOutQuad}
            PropertyAnimation {target: bar3; properties: "rotation, width, x, y"                ; duration: animationDuration; easing.type: Easing.InOutQuad}
        }
    ]

}

