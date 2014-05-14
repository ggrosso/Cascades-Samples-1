/* Copyright (c) 2012-2013 BlackBerry Limited.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import bb.cascades 1.3

ImageView {
    id: sign
    property bool activated: false

    imageSource: "asset:///images/Sign.png"
    translationX: ui.du(71.1)
    translationY: ui.du(55.6)
    pivotY: ui.du(12.2)
    pivotX: ui.du(-5.6)
    
    attachedObjects: [
        // animations performed by framework when value of rotationZ changes
        ImplicitAnimationController {
            propertyName: "rotationZ"
            enabled: false
        }
    ]
    
    animations: [
        SequentialAnimation {
            id: swingAnimation
            animations: [
		        RotateTransition {
		            toAngleZ: ui.du(1.1)
		            duration: 100
		        },
		        RotateTransition {
		            toAngleZ: ui.du(-1.1)
		            duration: 200
		        },
		        RotateTransition {
		            toAngleZ: ui.du(0.6)
		            duration: 100
		        },
		        RotateTransition {
		            toAngleZ: ui.du(-0.6)
		            duration: 100
		        },
		        RotateTransition {
		            toAngleZ: ui.du(0.2)
		            duration: 100
		        },
		        RotateTransition {
		            toAngleZ: ui.du(-0.2)
		            duration: 100
		        },
		        RotateTransition {
		            toAngleZ: ui.du(0)
		            duration: 100
		        }
            ]
        }
    ]

    function activate() {
        sign.activated = true
        if (swingAnimation.isPlaying()) {
            swingAnimation.stop()
        }
        if (!swingAnimation.isPlaying()) {
            swingAnimation.play()
        }
        sign.translationY = ui.du(35.6)
    }
    
    function deactivate() {
        sign.activated = false
        sign.translationY = ui.du(55.6)
    }
}
