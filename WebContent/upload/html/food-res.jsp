<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>健康检测结果</title>
    <link rel="stylesheet" type="text/css" href="css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/swiper.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
 
    </script>
</head>
<body style="background:#f5f5f5;">
    <div class="wrapper">
        <div class="main ">
            <div class="wrap">
                <section class="cs-section">
                    <div class="cs-head" >
                        <img src="/upload/html/images/smile-icon.png">
                        <div>恭喜您！</div>
                    </div>
                    <div class="cs-content">
                        <div>
                            通过你的测试我们为你推荐以下菜品，希望你能喜欢^_^<br/>
                            点击图片进入该商家去点餐。
                        </div>
                        <a href="/upload/html/index.html?id=${pd.uq_random_sId }"><img src="/${pd.uq_random_goodsimg }" class="all-img"></a>
                        <div class="fd-name">${pd.uq_random_goodsname }</div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</body>
</html>