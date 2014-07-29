
function init(canvasid)
{
    //获取画布
    var c = document.getElementById(canvasid);
    //返回一个ieCanasRenderingContext2D的对象 该对象实现了画布使用的大多数方法
    var ctx = c.getContext("2d");
    //设置线条宽度
    ctx.lineWidth = 1;
    //设置画笔颜色
    //ctx.strokeStyle="red";
    //给矩形填充的颜色
    //ctx.fillStyle = "green"

    return ctx;
}

/**
 * 在id为 canvasid的画布上画一条直线
 *
 * @param canvasid canvas的id
 */
function drawline (canvasid,p1x,p1y,p2x,p2y)
{
    var ctx = init(canvasid);

    //创建一个新的路径
    ctx.beginPath();

    //将光标位置移动到坐标(10,10)处
    ctx.moveTo(p1x,p1y);
    //从画笔的当前坐标移动到坐标(150,50)处 绘制一条直线。
    ctx.lineTo(p2x,p2y);

    //绘制好定义好的路径
    ctx.stroke();
}

/**
 * 在id为 canvasid的画布上画一个矩形
 *
 * @param canvasid canvas的id
 */
function drawRect(canvasid,px,py,width,length)
{
    var ctx = init(canvasid);
    //创建一个新的路径
    ctx.beginPath();

    //(10,10)是起点的坐标，70，40是矩形的长宽
    ctx.rect(px,py,width,length);
    //填充颜色
    //ctx.fill();
    //绘制好定义好的路径
    ctx.stroke();
}


/**
 * 在id为 canvasid的画布上画一个圆弧
 *
 * @param canvasid canvas的id
 */
function drawArc(canvasid,px,py)
{
    var ctx = init(canvasid);
    //创建一个新的路径
    ctx.beginPath();
    //(100,100)是圆弧中心的坐标，70是圆弧半径，0是起始角度，90终止角度，true表示是否逆时针
    ctx.arc(px,py,20,0,90*Math.PI/180,false);
    //填充颜色
    ctx.fill();
    //绘制好定义好的路径
    ctx.stroke();
}



/**
 * 在id为 canvasid的画布上画一个圆弧矩形
 *
 * @param canvasid canvas的id
 */
function drawArcRect(canvasid)
{
    var ctx = init(canvasid);
    //创建一个新的路径
    ctx.beginPath();

    ctx.moveTo(20,20);
    ctx.lineTo(70,20);

    /**
     * 5个参数，当前的坐标是p0(70,20),前两个表示坐标p1(120,30) p2(120,70)这三个点
     * 圆弧分别与 p0p1和p1p2相切
     */
    ctx.arcTo(120,30,120,70,50);
    ctx.lineTo(120,120);
    //填充颜色
    ctx.fill();
    //绘制好定义好的路径
    ctx.stroke();
}


/**
 * 在id为 canvasid的画布上画一个矩形
 *
 * @param canvasid canvas的id
 */
function clearRect(canvasid,px,py,width,length)
{

    var ctx = init(canvasid);
    //创建一个新的路径
    ctx.beginPath();


    //(10,10)是起点的坐标，70，40是矩形的长宽
    ctx.rect(px,py,width,length);
    //填充颜色
    ctx.fill();
    //绘制好定义好的路径
    ctx.stroke();

    //px,py表示起点坐标 后面两个参数表示长宽
    ctx.clearRect(px,py,width/2,length/2);
}





/**
 * 在制定的区域绘图
 * 当调用flip后只能在当前flip画的那个区域绘图。
 *
 * @param canvasid canvas的id
 */
function testflip(canvasid)
{
    var ctx = init(canvasid);
    //创建一个新的路径
    ctx.beginPath();


    ctx.rect(150,150,100,50);
    //在上面那个矩形区域内绘图了
    ctx.clip();

    ctx.beginPath();
    //我们画的矩形会超出上面那个矩形的区域，但是只能看到上个矩形区域以内的矩形
    ctx.fillRect(160,160,200,200);
}


/**
 * 绘制文字
 * @param canvasid
 * @param px
 * @param py
 */
function renderText(canvasid,px,py)
{
    var ctx = init(canvasid);

    //字体大小和字体
    ctx.font ="normal 18px Arial";

    //文字对齐方式
    ctx.textAlign = "left";
    ctx.textBaseline = "hanging";
    //设置文字内容
    ctx.fillText("hello world",10,200,100);
    //空心的字
    //ctx.strokeText("hello 吃了没",px,py);
}

/**
 * 绘制文字
 * @param canvasid
 * @param px
 * @param py
 */
function renderText(canvasid,px,py,text)
{
    var ctx = init(canvasid);

    //字体大小和字体
    ctx.font ="normal 18px Arial";

    //文字对齐方式
    ctx.textAlign = "left";
    ctx.textBaseline = "hanging";
    //设置文字内容
    ctx.fillText(text,10);
    //空心的字
    //ctx.strokeText("hello 吃了没",px,py);
}


/**
 * 绘制图片......
 * @param canvasid
 */
function drawImage(canvasid,imagepath,px,py)
{
    var ctx = init(canvasid);
    ctx.beginPath();

    //图片img
    var img= new Image();
    img.src = imagepath;

    //ctx.drawImage(img,dx,dy,dw,dh)
    // dx dy表示在canvas中的坐标值 dw dh 绘制的高和宽有缩放
    // ctx.drawImage(img,10,10,100,100);
    // ctx.drawImage(img,sx,sy,sw,sh,dx,dy,dw,dh)
    // 将图片华sx sy sw sh的区域, 后面的dx dy 是相对的坐标
    ctx.drawImage(img,10,10,400,400,10,10,90,90);
}


