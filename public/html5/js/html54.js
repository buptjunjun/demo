
function init(canvasid)
{
    //获取画布
    var c = document.getElementById(canvasid);
    //返回一个ieCanasRenderingContext2D的对象 该对象实现了画布使用的大多数方法
    var ctx = c.getContext("2d");
    //设置线条宽度
    ctx.lineWidth = 1;
    //设置画笔颜色
    ctx.strokeStyle="red";
    //给矩形填充的颜色
    ctx.fillStyle = "green"

    return ctx;
}

/**
 * 放大缩小
 *
 * @param canvasid canvas的id
 */
function scaleTest (canvasid)
{
    var ctx = init(canvasid);

    //创建一个新的路径
    ctx.beginPath();
    ctx.strokeRect(10,10,20,40);
    //沿着xy方向放大2倍
    ctx.scale(2,2);
    ctx.strokeRect(10,40,20,40);
}


/**
 * 平移 平移的是画布
 *
 * @param canvasid canvas的id
 */
function translateTest (canvasid)
{
    var ctx = init(canvasid);
    ctx.st
    //创建一个新的路径
    ctx.beginPath();
    ctx.strokeStyle="#000000";
    ctx.strokeRect(10,10,150,100);

    //画布向(50,100)方向移动
    ctx.translate(50,100);
    ctx.beginPath();
    ctx.strokeStyle="#cccccc";
    ctx.strokeRect(10,10,150,100);

    ctx.translate(-50,-100);
    ctx.beginPath();
    ctx.strokeRect(30,30,150,100);
}


/**
 * 旋转 旋转的是画布
 */
function translateTest (canvasid)
{
    var ctx = init(canvasid);
    //创建一个新的路径
    ctx.beginPath();
    ctx.strokeStyle="#000000";
    ctx.strokeRect(10,10,150,100);

    //旋转30度角
    ctx.rotate(30*Math.PI/180);

    ctx.beginPath();
    ctx.strokeStyle="#cccccc";
    ctx.strokeRect(10,10,150,100);

    ctx.strokeRect(30,30,150,100);
}


//图形渲染

/**
 * 线性渐变
 */
/**
 * 旋转 线性渐变
 */
function linearGradient (canvasid)
{
    var ctx = init(canvasid);

    //创建一个新的路径
    ctx.beginPath();
    //四个参数分别为渐变的出发点与终止点的坐标
    var grd = ctx.createLinearGradient(0,0,200,0);
    grd.addColorStop(0.2,"#00ff00");
    grd.addColorStop(0.8,"#ff0000");

    ctx.fillStyle = grd;
    ctx.fillRect(10,10,200,100);

}

/**
 * 旋转 径向渐变
 */
function radialGradient (canvasid)
{
    var ctx = init(canvasid);

    //创建一个新的路径
    ctx.beginPath();
    //分别为开始圆的圆心坐标和直径，结束圆的坐标和直径
    var grd = ctx.createRadialGradient(100,100,10,100,100,50);
    grd.addColorStop(0,"#00ff00");
    grd.addColorStop(1,"#ff0000");

    ctx.fillStyle = grd;
    ctx.fillRect(0,0,200,200);
}

/**
 * 颜色合成
 * @param canvasid
 */
function colorComposition(canvasid)
{
    var ctx = init(canvasid);

    //创建一个新的路径
    ctx.fillStyle="#00ff00";
    ctx.fillRect(10,10,50,50);

    //source-over表示新绘制的图形绘制到已有图形的顶部。
    ctx.globalCompositeOperation = "source-over";
    ctx.beginPath();
    ctx.fillStyle="#ff0000";
    ctx.arc(50,50,30,Math.PI);
    ctx.fill();
}