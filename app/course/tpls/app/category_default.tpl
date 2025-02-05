{x2;include:header}
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="pages">
            {x2;include:nav}
			<div class="content">
				<div class="col-xs-3">
					<div class="content-box padding">
						<h2 class="title">课程分类</h2>
						<ul class="list-unstyled list-txt">
                            {x2;tree:$catbrother,cat,cid}
							<li class="border{x2;if:v:cat['catid'] == $cat['catid']} active{x2;endif}">
								<a href="index.php?course-app-category&catid={x2;v:cat['catid']}">{x2;v:cat['catname']}</a>
							</li>
                            {x2;endif}
						</ul>
					</div>
				</div>
				<div class="col-xs-9 nopadding">
					<div class="content-box padding">
						<h2 class="title">
                            {x2;$cat['catname']}
							<a href="index.php?course-app" class="badge pull-right">返回</a>
						</h2>
						<ul class="list-unstyled list-img">
                            {x2;tree:$contents['data'],content,cid}
							<li class="border morepadding">
								<h4 class="shorttitle">{x2;v:content['cstitle']}</h4>
								<div class="intro">
									<div class="col-xs-3 img">
										<img src="{x2;v:content['csthumb']}" />
									</div>
									<div class="desc">
										<p>{x2;v:content['csdescribe']}</p>
										<p class="toolbar">
                                            {x2;date:v:content['cstime'],'Y-m-d'}
											【 {x2;$categories[v:content['cscatid']]['catname']} 】
											<a href="index.php?course-app-course&csid={x2;v:content['csid']}" class="btn btn-info pull-right more">查看详情</a>
										</p>
									</div>
								</div>
							</li>
                            {x2;endtree}
                            {x2;if:$contents['pages']}
							<li class="border morepadding">
								<ul class="pagination pull-right">
                                    {x2;$contents['pages']}
								</ul>
							</li>
                            {x2;endif}
						</ul>
					</div>
				</div>
			</div>
            {x2;include:footer}
		</div>
	</div>
</div>
</body>
</html>