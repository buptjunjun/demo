/**
 * Created by Admin on 14-7-12.
 */


/**
 *  usage: set class to tooltip
 */
    function loadtips()
    {
        var x = 10;
        var y = 20;
        $(".mytips").on("mouseover",function(e){
            this.myTitle = this.title;
            this.title = "";
//            var tooltip = "<div id='tooltip'>"+ this.myTitle +"<\/div>"; //创建 div 元素 文字提示
//            $("body").append(tooltip);    //把它追加到文档中

            $("#tooltip")
                .css({
                    "top": (e.pageY+y) + "px",
                    "left": (e.pageX+x)  + "px"
                }).show(0);      //设置x坐标和y坐标，并且显示
        }).on("mouseout",function(){
            this.title = this.myTitle;
            $("#tooltip").hide();   //移除
        });
//        .on("mousemove",function(e){
//            $("#tooltip")
//                .css({
//                    "top": (e.pageY+y) + "px",
//                    "left": (e.pageX+x)  + "px"
//                });
//        });
    }

    $(function(){
        loadtips();
    })

    function preloadimages(arr){
        var newimages=[]
        var arr=(typeof arr!="object")? [arr] : arr  //确保参数总是数组
        for (var i=0; i<arr.length; i++){
            newimages[i]=new Image()
            newimages[i].src=arr[i]
        }
    }

function renderTable(idprefix,tableid,divid,width, height)
{
    var $t_body =  $("<table border=1 id='"+tableid+"'></table>");
    var count = 0;
    for(var i = 0;i < height; i++)
    {
        var $tr = $("<tr></tr>");
        for (var j = 0; j < width; j++)
        {
            var position=i+""+j;
            $td = $("<td id='"+idprefix+position+"'  ondrop='drop(event)' ondragover='allowDrop(event)'></td>");
            $tr.append($td);
            count+=1;
        }
        $t_body.append($tr);

    }

    $("#"+divid).append($t_body);
}
