const [canvasState, setCanvasState] = useState({
    selectedObject: null,
    skewX: 0,
    skewY: 0,
    strokeWidth: 0,
    selectedColor: '#ffffff',
    strokeColor: '#000000',
});

// Handler function for selection events
const handleSelectionEvent = (canvas, type) => {
    const active = canvas.getActiveObject();

    if (type === 'created' || type === 'updated') {
        setCanvasState(prevState => ({
            ...prevState,
            selectedObject: active,
            skewX: active.get('skewX'),
            skewY: active.get('skewY'),
            strokeWidth: active.get('strokeWidth'),
            selectedColor: active.get('fill') ? active.get('fill') : '#000000',
            strokeColor: active.get('stroke') ? active.get('stroke') : '#000000',
        }));
    } else if (type === 'cleared') {
        setCanvasState(prevState => ({
            ...prevState,
            selectedObject: null,
            skewX: 0,
            skewY: 0,
            strokeWidth: 0,
            selectedColor: '#ffffff',
            strokeColor: '#000000',
        }));
    }
};
