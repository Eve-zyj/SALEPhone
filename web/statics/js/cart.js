var path = $("#path").val();
$(function () {

   /* //商品数量减少|删除商品
    $(".minus").click(function () {
        var quantity = $(this).next().val();
        if(quantity==1){
            if(confirm("已经是最后一件商品了，确定要删除吗？")){
                $(this).parent().parent().parent().remove();
            };
        }else{
            quantity--;
        }
        $(this).next().val(quantity);
    });
    //商品数量增加
    $(".plus").click(function () {
        var quantity = $(this).prev().val();
        quantity++;
        $(this).prev().val(quantity);
    });
    //加入购物车操作
    $(".add_to_cart_button").click(function () {
        var proid = $(".proid").val();
        var pronum = $(".pronum").val();
        //Ajax进入购物车页面，传数据
        $.ajax({
            url:path+"/cart/addCart.do",
            type:"post",
            dataType:"json",
            data:"",
        });
    });*/

   $(".add_to_cart_button").click(function(){
       countCost();
       var param=$(".cart").serialize();
       addCart(param);
   });
   $(".quantity").change(function(){
       countCost();
   });
   //改变数目时要改变总价
    function countCost(){
        var num=$("#quantity").val();
        var price=$("#quantity").attr("price");
        $(".cost").val(parseFloat(price)*parseInt(num));
    }
    //添加购物车ajax请求
   function addCart(param){
        $.ajax({
            url:path+"/addCart.do",
            type:"post",
            data:param,
            success:function(result){
                if(result.logResult==0 || result.logResult==""){
                    alert("请登陆后再添加！");
                    return false;
                }
                if(result.addResult==1 ||result.addResult=="1"){
                    alert("添加成功");
                }else{
                    alert("添加失败");
                }
            },
            error:function () {
                alert("通信失败");
            }
        });
   }


});