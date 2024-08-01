import React, { useRef, useEffect } from 'react';
import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';

const ModelViewer = ({ path }) => {
  const mountRef = useRef(null);

  useEffect(() => {
    let scene = new THREE.Scene();
    let camera = new THREE.PerspectiveCamera(75, mountRef.current.clientWidth / mountRef.current.clientHeight, 0.1, 1000);
    let renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });

    renderer.setSize(mountRef.current.clientWidth, mountRef.current.clientHeight);
    mountRef.current.appendChild(renderer.domElement);

    // let controls = new OrbitControls(camera, renderer.domElement);
    camera.position.z = 5;

    // let ambientLight = new THREE.AmbientLight(0x404040, 1.5); // soft white light
    // scene.add(ambientLight);

    let pointLight = new THREE.PointLight(0xffffff, 1.5);
    pointLight.position.set(10, 10, 10);
    scene.add(pointLight);

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);

    scene.add(ambientLight);


    const backLight = new THREE.DirectionalLight(0xffffff, 1.5);

    backLight.position.set(-1, 2, -2); // Position the light from the back
    scene.add(backLight);


    const directionalLight = new THREE.DirectionalLight(0xffffff, 1); // Strong white light
    directionalLight.position.set(5, 5, 5); // Position it in the scene
    scene.add(directionalLight);
    // const backLight2 = new THREE.DirectionalLight(0xffffff, 1);

    // backLight2.position.set(0, -2, 0); // Position the light from the back
    // scene.add(backLight2);

    const fillLight = new THREE.DirectionalLight(0xffffff, 1.5);

    fillLight.position.set(1, 1, 1); // Position the light to fill shadows
    scene.add(fillLight);

    const material2 = new THREE.MeshStandardMaterial({
        color: 0xFFefefef
    });

    const loader = new GLTFLoader();

    loader.load(path, function (gltf) {
        gltf.scene.position.set(0, 0, 0);
        gltf.scene.scale.set(0.8, 0.8, 0.8);
        gltf.scene.rotation.set(0, -100, 0);
        gltf.scene.traverse(child => {
            if (child.isMesh) {

                child.material = material2;
                if (child.name.includes('cloth')) {
                    child.material = material2;
                }
                if (child.name.includes('Avatar')) {
                    child.visible = false;
                    child.material = material2;
                    // avatar = child;
                }
            }
        })
        scene.add(gltf.scene);
        console.log('3d Model loaded.')
    }, undefined, function (error) {
        console.error(error);
    });

    const animate = function () {
      requestAnimationFrame(animate);
    //   controls.update();
      renderer.render(scene, camera);
    };

    animate();

    const handleResize = () => {
      camera.aspect = mountRef.current.clientWidth / mountRef.current.clientHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(mountRef.current.clientWidth, mountRef.current.clientHeight);
    };

    window.addEventListener('resize', handleResize);

    return () => {
      window.removeEventListener('resize', handleResize);
    //   mountRef.current.removeChild(renderer.domElement);
      scene = null;
      camera = null;
      renderer = null;
    };
  }, [path]);

  return <div ref={mountRef} style={{ width: '100%', height: '400px' }} />;
};

export default ModelViewer;
