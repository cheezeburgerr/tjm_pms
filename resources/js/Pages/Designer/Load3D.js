import * as THREE from 'three';
import {
    GLTFLoader
} from 'three/examples/jsm/loaders/GLTFLoader.js';
import {
    OrbitControls
} from 'three/examples/jsm/controls/OrbitControls';
import {
    color
} from 'three/examples/jsm/nodes/Nodes';


var avatar;


export function toggleVisibility() {

    if (avatar) {
        avatar.visible = !avatar.visible;
    }
}

export function changeAvatarColor(color, setAvatarColor) {

    if (avatar) {
        avatar.material.color.set(color.hex);
        setAvatarColor(color.hex)
    }
}

// import * as fabric from 'fabric';
export function init(path, canvas, containerWidth, containerHeight) {
    const raycaster = new THREE.Raycaster();
    const mouse = new THREE.Vector2();
    const onClickPosition = new THREE.Vector2();

    const scene = new THREE.Scene();

    const camera = new THREE.PerspectiveCamera(50, containerWidth / containerHeight, 0.01, 1000);
    // camera.position.z = 50;
    camera.position.set(0, 0, 50);

    const container = document.getElementById("renderer");
    const renderer = new THREE.WebGLRenderer({
        alpha: true,
        antialias: true
    });


    renderer.setSize(containerWidth, containerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);


    const scene2 = new THREE.Scene();

    const camera2 = new THREE.PerspectiveCamera(30, containerWidth / containerHeight, 0.01, 1000);
    // camera.position.z = 50;
    camera.position.set(0, 0, 50);
    camera2.position.set(0, 0, 75);

    const container2 = document.getElementById("to_save");
    const renderer2 = new THREE.WebGLRenderer({
        alpha: false,
        antialias: true
    });

    renderer2.setClearColor(0xeeeeee, 1);

    renderer2.setSize(containerWidth, containerHeight);
    renderer2.setPixelRatio(window.devicePixelRatio);

    const textureLoader = new THREE.TextureLoader();
    textureLoader.load('/images/TJM_LOGO.png', (texture) => {
        const planeGeometry = new THREE.PlaneGeometry(13, 7);
        const planeMaterial = new THREE.MeshStandardMaterial({
            map: texture,
            transparent: true, // Enable transparency
            opacity: 0.8 // Set desired opacity (0.0 to 1.0)
        });
        const plane = new THREE.Mesh(planeGeometry, planeMaterial);
        plane.rotation.x = 0; // Rotate the plane to face the camera
        plane.position.z = -5; // Position it behind other objects
        scene2.add(plane);
    });

    var group = new THREE.Group();
    scene.add(group);

    var group2 = new THREE.Group();
    scene2.add(group2);

    camera.aspect = containerWidth / containerHeight;
    camera.updateProjectionMatrix();
    container.appendChild(renderer.domElement);
    container2.appendChild(renderer2.domElement);

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
    const ambientLight2 = new THREE.AmbientLight(0xffffff, 0.5); // Softer ambient light
    scene.add(ambientLight);
    scene2.add(ambientLight2);

    const backLight = new THREE.DirectionalLight(0xffffff, 1.5);

    backLight.position.set(-1, 2, -2); // Position the light from the back
    scene.add(backLight);


    const directionalLight = new THREE.DirectionalLight(0xffffff, 1); // Strong white light
    directionalLight.position.set(5, 5, 5); // Position it in the scene
    scene2.add(directionalLight);
    // const backLight2 = new THREE.DirectionalLight(0xffffff, 1);

    // backLight2.position.set(0, -2, 0); // Position the light from the back
    // scene.add(backLight2);

    const fillLight = new THREE.DirectionalLight(0xffffff, 1.5);

    fillLight.position.set(1, 1, 1); // Position the light to fill shadows
    scene.add(fillLight);

    const pointLight = new THREE.PointLight(0xffffff, 0.5);

    pointLight.position.set(2, 3, 2); // Position the point light to add more natural lighting
    // scene.add(pointLight);


    const texture = new THREE.Texture(document.getElementById("canvas"));
    texture.anisotropy = renderer.capabilities.getMaxAnisotropy();

    const material = new THREE.MeshPhysicalMaterial({
        map: texture
    });

    const material2 = new THREE.MeshPhysicalMaterial({
        color: 0xFFDBAC
    });

    material.roughness = 0.7;

    material.map.repeat.y = -1;
    material.map.offset.y = 1;

    // const axesHelper = new THREE.AxesHelper(5);
    // scene.add(axesHelper);
    loadModel(path, material, material2, group);
    loadModel2(path, material, group2);

    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = 0.1;
    controls.minDistance = 25; // Adjust as needed
    controls.maxDistance = 50;



    // Load SVG content





    function applyColorsToSvg(color, text) {
        canvas.getObjects().forEach(function (object) {
            if (object.type === 'group') {
                // Traverse the group objects
                object._objects.forEach(function (innerObject) {
                    if (innerObject.id === text) {
                        innerObject.set({
                            fill: color
                        });
                    }
                });
                canvas.renderAll();
            }
        });
    }

    function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
    }

    // Add event listener for window resize
    window.addEventListener('resize', onWindowResize, false);
    // Function to apply colors to SVG based on color pickers


    // const stats = Stats();
    // document.body.appendChild(stats.dom);

    const animate = () => {
        // stats.update();
        controls.update();

        window.requestAnimationFrame(animate);
        texture.needsUpdate = true;
        renderer.render(scene, camera);
        renderer2.render(scene2, camera2);
    };





    animate();






    fabric.Canvas.prototype.getPointer = function (e, ignoreZoom) {
        console.log('BEG getPointer');
        if (this._absolutePointer && !ignoreZoom) {
            return this._absolutePointer;
        }
        if (this._pointer && ignoreZoom) {
            return this._pointer;
        }
        var pointer = fabric.util.getPointer(e),
            upperCanvasEl = this.upperCanvasEl,
            bounds = upperCanvasEl.getBoundingClientRect(),
            boundsWidth = bounds.width || 0,
            boundsHeight = bounds.height || 0,
            cssScale;

        if (!boundsWidth || !boundsHeight) {
            if ('top' in bounds && 'bottom' in bounds) {
                boundsHeight = Math.abs(bounds.top - bounds.bottom);
            }
            if ('right' in bounds && 'left' in bounds) {
                boundsWidth = Math.abs(bounds.right - bounds.left);
            }
        }
        this.calcOffset();
        pointer.x = pointer.x - this._offset.left;
        pointer.y = pointer.y - this._offset.top;
        /* BEGIN PATCH CODE */
        if (e.target !== this.upperCanvasEl) {
            var positionOnScene = getPositionOnScene(container, e);
            console.log('positionOnScene:', positionOnScene);
            pointer.x = positionOnScene.x;
            pointer.y = positionOnScene.y;
        }
        /* END PATCH CODE */
        console.log('pointer1:', pointer);
        if (!ignoreZoom) {
            pointer = this.restorePointerVpt(pointer);
        }

        if (boundsWidth === 0 || boundsHeight === 0) {
            cssScale = {
                width: 1,
                height: 1
            };
        } else {
            cssScale = {
                width: upperCanvasEl.width / boundsWidth,
                height: upperCanvasEl.height / boundsHeight
            };
        }

        return {
            x: pointer.x * cssScale.width,
            y: pointer.y * cssScale.height
        };
    }

    container.addEventListener("mousedown", onMouseEvt, false);

    // Mouse event handler
    function onMouseEvt(evt) {
        evt.preventDefault();
        const positionOnScene = getPositionOnScene(container, evt);
        if (positionOnScene) {
            const canvasRect = canvas._offset;
            const simEvt = new MouseEvent(evt.type, {
                clientX: canvasRect.left + positionOnScene.x,
                clientY: canvasRect.top + positionOnScene.y
            });
            canvas.upperCanvasEl.dispatchEvent(simEvt);
        }
    }

    // Function to convert mouse coordinates to scene coordinates
    function getPositionOnScene(sceneContainer, evt) {
        const array = getMousePosition(sceneContainer, evt.clientX, evt.clientY);
        onClickPosition.fromArray(array);
        const intersects = getIntersects(onClickPosition, scene.children);
        if (intersects.length > 0 && intersects[0].uv) {
            const uv = intersects[0].uv;
            const canvasRect = canvas.upperCanvasEl.getBoundingClientRect();
            const realX = uv.x * canvasRect.width;
            const realY = uv.y * canvasRect.height;
            return {
                x: getRealPosition('x', uv.x),
                y: getRealPosition('y', uv.y),
            };
        }
        return null;
    }


    function getRealPosition(axis, value) {
        const CORRECTION_VALUE = axis === "x" ? 4.5 : 5.5;
        return Math.round(value * 2000) - CORRECTION_VALUE;
    }
    // Function to convert mouse coordinates to canvas coordinates
    function getMousePosition(dom, x, y) {
        const rect = dom.getBoundingClientRect();
        return [(x - rect.left) / rect.width, (y - rect.top) / rect.height];
    }

    // Function to get intersection points
    function getIntersects(point, objects) {

        mouse.set(point.x * 2 - 1, -(point.y * 2) + 1);
        raycaster.setFromCamera(mouse, camera);
        return raycaster.intersectObjects(objects);
    }

    // Function to convert UV coordinates to real position


    // Event listener for fabric.js canvas object selection
    canvas.on('selection:created', function () {
        // Disable OrbitControls when an object is selected
        controls.enabled = false;
    });

    // Event listener for fabric.js canvas object deselection
    canvas.on('selection:cleared', function () {
        // Enable OrbitControls when no object is selected
        controls.enabled = true;
    });

    console.log(canvas.getObjects());

    return () => {
        container.removeChild(renderer.domElement);
      };

}
export function loadModel(path, material, material2, group) {
    const loader = new GLTFLoader();

    loader.load(`/storage/models/${path}`, function (gltf) {
        gltf.scene.position.set(0, 0, 0);
        gltf.scene.scale.set(4, 4, 4);
        gltf.scene.rotation.set(0, -100, 0);
        gltf.scene.traverse(child => {
            if (child.isMesh) {

                child.material = material;
                if (child.name.includes('cloth')) {
                    child.material = material;
                }
                if (child.name.includes('Avatar')) {
                    child.material = material2;
                    avatar = child;
                }
            }
        })
        group.add(gltf.scene);
        console.log('3d Model loaded.')
    }, undefined, function (error) {
        console.error(error);
    });
}


export function loadModel2(path, material, group2) {
    const loader = new GLTFLoader();

    loader.load(`/storage/models/${path}`, function (gltf) {
        gltf.scene.position.set(-15, 0, 0);
        gltf.scene.scale.set(4, 4, 4);
        gltf.scene.rotation.set(0, -150, 0);
        gltf.scene.traverse(child => {
            if (child.isMesh) {

                child.material = material;
                if (child.name.includes('cloth')) {
                    child.material = material;
                }
                if (child.name.includes('Avatar')) {
                    child.visible = false;
                }
            }
        })
        group2.add(gltf.scene);
        console.log('3d Model loaded.')
    }, undefined, function (error) {
        console.error(error);
    });

    const loader2 = new GLTFLoader();

    loader2.load(`/storage/models/${path}`, function (gltf) {
        gltf.scene.position.set(15, 0, 0);
        gltf.scene.scale.set(4, 4, 4);
        gltf.scene.rotation.set(0, 500, 0);
        gltf.scene.traverse(child => {
            if (child.isMesh) {

                child.material = material;
                if (child.name.includes('cloth')) {
                    child.material = material;
                }
                if (child.name.includes('Avatar')) {
                    child.visible = false;
                }
            }
        })
        group2.add(gltf.scene);
        console.log('3d Model loaded.')
    }, undefined, function (error) {
        console.error(error);
    });
}
