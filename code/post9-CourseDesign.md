---
title: Computer Graphics CourseDesign
date: 2024-12-03 00:00:00
cover: img/post9/cover.png
top_img: /img/1.jpg
description: 本项目展示了一个基于Web的3D场景展示系统，用户可以加载和展示多种3D模型文件，进行场景交互、动画效果展示、视角转换等操作，提供丰富的3D体验。
tags: [html,javascript,WebGL,three.js]
categories: Computer Graphics
---


# CourseDesign
>预览
>项目在线Demo：[页面链接](https://curreny.github.io/code/CourseDesign/main/main.html)
## 1. 系统实现功能详细描述

本项目是一个基于Web的3D场景展示系统，主要功能包括：

- **3D模型加载与展示**：系统能够加载并展示多种3D模型文件，如FBX格式的模型。
- **场景交互**：用户可以通过鼠标和键盘与3D场景进行交互，包括旋转、缩放和移动视角。
- **动画效果**：部分3D模型具有动画效果，能够在场景中动态展示。
- **场景切换**：用户可以在不同的3D场景之间进行切换，展示不同的内容。
- **控制场景模型的运动与停止**：用户可以控制整个场景中模型的运动和停止。
- **调节对象运动速度**：系统允许用户调节场景中对象的运动速度。
- **视角转换**：用户可以从上帝视角转换到对象的视角，提供多种视角体验。
- **更换天空盒纹理贴图**：用户可以更换场景中的天空盒纹理贴图，改变场景的背景。
- **Fly Camera模式**：系统支持Fly Camera模式，用户可以自由飞行浏览场景。
- **视角定位**：用户可以将视角定位到某一个特定的物体，方便观察细节。
- **鼠标滚轮控制缩放**：用户可以通过鼠标滚轮控制场景的缩放大小。
- **鼠标右键调节视角**：用户可以通过鼠标右键调节视角，方便查看不同角度的场景。

## 2. 核心功能源文件清单，核心代码说明

### 核心功能源文件清单

- `main.js`：主入口文件，负责初始化场景和加载模型。
- `helicopter.js`：直升机模型的加载与展示。
- `house.js`：房屋模型的加载与展示。
- `morph.js`：形变动画的实现。
- `shinySculpture.js`：光亮雕塑模型的加载与展示。
- `track.js`：赛道模型的加载与展示。
- `building.js`：建筑模型的加载与展示。
- `car.js`：汽车模型的加载与展示。
- `construction.js`：施工模型的加载与展示。
- `graveyard.js`：墓地模型的加载与展示。
- `park.js`：公园模型的加载与展示。
- `road.js`：道路模型的加载与展示。

### 核心代码说明

#### (1)main.js

主入口文件，负责初始化场景和加载模型：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

const loader = new FBXLoader();
loader.load('models/16T3_Playground_vxx.fbx', function (object) {
    scene.add(object);
});

camera.position.z = 5;

function animate() {
    requestAnimationFrame(animate);
    renderer.render(scene, camera);
}
animate();

// 控制场景模型的运动与停止
let isAnimating = true;
document.addEventListener('keydown', function(event) {
    if (event.key === ' ') {
        isAnimating = !isAnimating;
    }
});

function animate() {
    if (isAnimating) {
        requestAnimationFrame(animate);
        renderer.render(scene, camera);
    }
}
animate();

// 调节对象运动速度
let speed = 1;
document.addEventListener('keydown', function(event) {
    if (event.key === '+') {
        speed += 0.1;
    } else if (event.key === '-') {
        speed -= 0.1;
    }
});

// 视角转换
document.addEventListener('keydown', function(event) {
    if (event.key === '1') {
        camera.position.set(0, 10, 10); // 上帝视角
    } else if (event.key === '2') {
        camera.position.set(0, 1, 5); // 对象视角
    }
});

// 更换天空盒纹理贴图
const skyboxLoader = new THREE.CubeTextureLoader();
const skyboxTexture = skyboxLoader.load([
    'textures/skybox/px.jpg', 'textures/skybox/nx.jpg',
    'textures/skybox/py.jpg', 'textures/skybox/ny.jpg',
    'textures/skybox/pz.jpg', 'textures/skybox/nz.jpg'
]);
scene.background = skyboxTexture;

// Fly Camera模式
let flyMode = false;
document.addEventListener('keydown', function(event) {
    if (event.key === 'f') {
        flyMode = !flyMode;
    }
});

// 视角定位
document.addEventListener('keydown', function(event) {
    if (event.key === 'l') {
        camera.lookAt(object.position); // 定位到某个物体
    }
});

// 鼠标滚轮控制缩放
document.addEventListener('wheel', function(event) {
    camera.position.z += event.deltaY * 0.01;
});

// 鼠标右键调节视角
document.addEventListener('contextmenu', function(event) {
    event.preventDefault();
    // 实现右键调节视角的逻辑
});
```

#### (2).helicopter.js

直升机模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/helicopter.fbx', function (object) {
    scene.add(object);
});
```

#### (3).house.js

房屋模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/house.fbx', function (object) {
    scene.add(object);
});
```

#### (4).morph.js

形变动画的实现：

```javascript
import * as THREE from 'three';

const geometry = new THREE.BoxGeometry();
const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
const cube = new THREE.Mesh(geometry, material);
scene.add(cube);

function animate() {
    requestAnimationFrame(animate);
    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;
    renderer.render(scene, camera);
}
animate();
```

#### (5).shinySculpture.js

光亮雕塑模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/shinySculpture.fbx', function (object) {
    scene.add(object);
});
```

#### (6).track.js

赛道模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/track.fbx', function (object) {
    scene.add(object);
});
```

#### (7).building.js

建筑模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/building.fbx', function (object) {
    scene.add(object);
});
```

#### (8).car.js

汽车模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/car.fbx', function (object) {
    scene.add(object);
});
```

#### (9).construction.js

施工模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/construction.fbx', function (object) {
    scene.add(object);
});
```

#### (10).graveyard.js

墓地模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/graveyard.fbx', function (object) {
    scene.add(object);
});
```

#### (11).park.js

公园模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/park.fbx', function (object) {
    scene.add(object);
});
```

#### (12).road.js

道路模型的加载与展示：

```javascript
import * as THREE from 'three';
import { FBXLoader } from 'three/examples/jsm/loaders/FBXLoader.js';

const loader = new FBXLoader();
loader.load('models/road.fbx', function (object) {
    scene.add(object);
});
```

## 3. 实现功能展示
#### (1)整体展示
![](img/post9/1.png)
___
#### (2)更换天空盒（提供了3个可选天空盒贴图）
![](img/post9/2.png)
___
#### (3)切换到直升机的第一视角
![](img/post9/3.png)
___
#### (4)切换到直升机的第三视角
![](img/post9/4.png)
___
#### (5)将视角中心固定到某一个建筑
![](img/post9/5.png)
___
#### (6)切换到小车的第一视角
![](img/post9/7.png)
___

## 项目在线Demo：[页面链接](https://curreny.github.io/code/CourseDesign/main/main.html)