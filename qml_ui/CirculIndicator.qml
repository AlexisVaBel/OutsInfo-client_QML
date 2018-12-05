import QtQuick 2.0

Item {
    id      : root
    width:  45
    height: 45
    state     : "released"
    property int animationDuration  : 250
    property int intSeconds                 : 0
    property int intStartTime             : 0
    property real angleMux                : 0;

    Canvas{
        id: indicator
        anchors.fill: parent

        onPaint:{
            var radius           = 20;
            var ctx                =  indicator.getContext('2d');
            ctx.beginPath();
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle          ="#9c27b0";
            ctx.fill();
            ctx.beginPath();
            ctx.lineWidth      =2;
            ctx.fillStyle           = "#9c27b0";
            ctx.shadowColor ="black"
            ctx.strokeStyle     = "white"
            ctx.arc(width/2, height/2, radius, 0, -angleMux, true)
            ctx.fill();
            ctx.stroke();
        }
    }

    Text{
        id      :   counterText
        x: 9
        y: 10
        color: "#2e0505"
        text   :    root.intSeconds
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Timer{
        id              : elpsTimer
        interval    : 100
        running   : false
        repeat      : true
        onTriggered: root.timeChanged()

    }
    function restartCounter(){
        root.intStartTime=0;
        root.intSeconds=0;
    }

    function timeChanged(){
        console.log(root.intSeconds);
        if(root.intSeconds>=100)root.intSeconds=0
        else
            root.intSeconds+=1;
        root.angleMux=  Math.PI*(root.intSeconds)/50
        indicator.requestPaint()
    }

    states:[
        State{
            name: "released"
            PropertyChanges{target: elpsTimer;running:false}
        },
        State{
            name: "pressed"
            PropertyChanges{target: indicator; rotation: -350;}
            PropertyChanges{target: elpsTimer;running:true}
        }
    ]

    transitions:[
        Transition{
            from: "released"; to : "pressed";
            RotationAnimation {target: indicator;  direction:    RotationAnimation.Counterclockwise ; duration: animationDuration; easing.type: Easing.InOutQuad }

        }
        ,
        Transition{
            from: "pressed"; to : "released";
            RotationAnimation {target: indicator;  direction:    RotationAnimation.Clockwise ; duration: animationDuration; easing.type: Easing.InOutQuad }
        }
    ]
    Component.onCompleted:{
        from: "pressed"; to : "released";
        root.restartCounter()
    }

}
