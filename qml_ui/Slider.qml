import QtQuick 2.0

Item {
    id: root

    property real value: 0
    property real minimum: 0
    property real maximum: 10

    width: 250
    height: 50
    opacity: enabled? 1: 0.3

    Repeater{
        model: 2
        Rectangle{
            x: !index? 0: pill.x+pill.width-radius
            width: !index? pill.x+radius:root.width-x
            color: 'black'
            anchors.verticalCenter: parent.verticalCenter

        }
    }
    Rectangle { // Pill
            id: pill
            x: (value - minimum) / (maximum - minimum) * (root.width - pill.width) // Pixels from value
            width: parent.height
            height: width
            border.width: 0.05 * root.height
            radius: 0.5 * height
        }

    MouseArea {
        anchors.fill: parent
        onPressed:          if(pill.x < mouse.x  &&  mouse.x < pill.x + pill.width)  pill.opacity = 0.5 // down state
        onReleased:           {pill.opacity = 1;  setPixels(mouse.x)}// tap
        onCanceled:            pill.opacity = 1
        onPositionChanged:  if(pill.opacity < 1)  setPixels(mouse.x) // drag pill
    }


        function setPixels(pixels) {
            var value = (maximum - minimum) / (root.width - pill.width) * (pixels - pill.width / 2) + minimum // value from pixels
            root.value = Math.min(Math.max(minimum, value), maximum)
        }

}

