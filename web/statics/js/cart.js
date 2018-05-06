var path = $("#path").val();
$(function () {
    //商品数量减少|删除商品
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
    });
});