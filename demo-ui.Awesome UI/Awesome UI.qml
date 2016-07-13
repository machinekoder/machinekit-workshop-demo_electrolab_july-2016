/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 1.1
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0

HalApplicationWindow {
    id: main

    name: "ui"
    title: qsTr("Awesome UI")

    HalButton {
        anchors.centerIn: parent
        name: "power"
        text: "Power"
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: 56
        checkable: true
    }

    HalLed {
        id: ledRound1
        name: "ferror-led"
        x: 206
        y: 246
    }

    HalRoundGauge {
        id: roundGauge1
        name: "ferror"
        x: 290
        y: 219
        maximumValue: 1
        minimumValue: -1
    }

    HalSlider {
        id: sliderHorizontal1
        name: "maxaccel"
        x: 108
        y: 436
        maximumValue: 10000
    }
}
