import QtQuick
import Quickshell
import Quickshell.Io

ShellRoot {
	PanelWindow {
		id: panel

		anchors {
			top: true
			left: true
      right: true
		}
    color: "transparent"
    implicitHeight: 30

    Item {
      id: panelItem
      width: 800
      height: 30
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter

      Row {
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
          width: 100 
          height: parent.height
          color: "pink"
          radius: 15 

          Rectangle {
            width: 90
            height: 23
            color: "black"
            anchors {
              left: parent.left
              verticalCenter: parent.verticalCenter
              margins: 5
            }
            radius: 15

            Row {
              spacing: 5
              anchors.verticalCenter: parent.verticalCenter
              anchors.horizontalCenter: parent.horizontalCenter

              Text {
                text: "1"
                color: "white"
                font.pointSize: 10
                font.bold: true
              }

              Text {
                text: "terminal"
                color: "white"
                font.pointSize: 10
                font.bold: true
              }
            }
          }
        } // hyprland active workspace with icon of the category (e.g. terminal = terminal icon, browser = web icon)

        Text {
          text: "This is clock"
          font.pointSize: 12
          color: "white"
          anchors.verticalCenter: parent.verticalCenter
        } // clock

        Rectangle {
          width: 10
          height: parent.height
          color: "black"
        } // others: network, bluetooth, battery
      }
    }
	}
}
