import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
ApplicationWindow{
    id:window
    width: 640
    height: 480
    visible: true
    title:qsTr("Status Demo")
    //bağlantı durumunu tutacakdeğişken
    property bool  connected: false //bağlantının aktif olup olmadığını anlamak için kullandık

    // bileşenleri alt alta hizalanmış şekilde ayarlayan değişken
    Column{
        anchors.centerIn: parent
        spacing:20//kutu ve  buton arasındakş boşuk
        //bağlantı kutusu tasarlama
        Rectangle{
            id:statusBox
            width: 200
            height: 60
            radius:10
            color:window.connected?"green":"red"
            //kutu içindeki elemanları yan yana dizmek için (bonus)
            Row{
                anchors.centerIn: parent// bağlantı yazısını tam ortalamaya bu yarıyor
                spacing:10

                Rectangle{//bonus(ışık kontrol)
                    width: 20
                    height: 20
                    radius:width/2
                    color: window.connected?"lightgreen":"darkred"
                    anchors.verticalCenter:parent.verticalCenter//???


                }

                //metin
                Text {
                    id:statustext
                    text:window.connected? "Bağlı":"Bağlı Değil"
                    color: "white"
                    font.bold:true//??
                    font.pixelSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Button{
            id:connectButton
            anchors.horizontalCenter: parent.horizontalCenter
            text:window.connected?"Bağlantıyı Kes":"Bağlan"

            onClicked: {//butona tıklandığında connected değerini tersine çevirir
                window.connected=!window.connected
        }


    }

}
}