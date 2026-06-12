import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "black"

    TextField {
        id: password

        width: 250
        anchors.centerIn: parent

        color: "white"
        echoMode: TextInput.Password
        focus: true

        background: Rectangle {
            color: "transparent"
            border.color: "#444"
            border.width: 1
        }

        onAccepted: {
            sddm.login("me", password.text, "")
        }
    }
}
