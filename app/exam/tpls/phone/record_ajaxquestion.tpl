<div class="page-header">
	<div class="col-1" onclick="javascript:history.back();"><span class="fa fa-chevron-left"></span></div>
	<div class="col-8">我的错题</div>
	<div class="col-1"><span class="iconfont icon-menu hide"></span></div>
</div>
<div class="page-content header footer" data-refresh="yes">
	<div class="list-box bg">
		<ol>
			<li class="unstyled">
				<h4 class="title">
					第 {x2;$number} 题
				</h4>
			</li>
            {x2;if:$parent}
            <li class="unstyled">
				<div class="rows">
					<p>{x2;realhtml:$parent['qrquestion']}</p>
				</div>
			</li>
			{x2;endif}
			<li class="unstyled">
				<div class="rows">
					<p>{x2;realhtml:$question['question']}</p>
				</div>
			</li>
            {x2;if:!$questype['questsort'] && $questype['questchoice'] != 5}
			<li class="unstyled">
				<div class="rows">
					<p>{x2;realhtml:$question['questionselect']}</p>
				</div>
			</li>
			{x2;endif}
			<li class="unstyled rightanswer">
				<div class="rows">
                    {x2;if:strlen($question['questionanswer']) >= 30}
					<div class="intro">
						<span class="badge">正确答案</span>
					</div>
					<div class="intro">
						{x2;realhtml:$question['questionanswer']}
					</div>
					{x2;else}
					<div class="col-4x intro">
						<span class="badge">正确答案</span>
					</div>
					<div class="col-4l intro">
						<b id="rightanswer_{x2;$question['questionid']}">{x2;$question['questionanswer']}</b>
					</div>
					{x2;endif}
				</div>
			</li>
			<li class="unstyled rightanswer">
				<div class="rows">
					{x2;if:strlen($question['questiondescribe']) >= 30}
					<div class="intro">
						<span class="badge">试题解析</span>
					</div>
					<div class="intro">
						{x2;realhtml:$question['questiondescribe']}
					</div>
					{x2;else}
					<div class="col-4x">
						<span class="badge">试题解析</span>
					</div>
					<div class="col-4l intro">
                        {x2;realhtml:$question['questiondescribe']}
					</div>
					{x2;endif}
				</div>
			</li>
			<li class="unstyled"></li>
		</ol>
	</div>
</div>
<div class="page-footer">
	<ol class="pagination">
		<li class="col-8x{x2;if:$number > 1} jump" data-number="{x2;eval: echo $number - 1}{x2;endif}">
            <span class="fa fa-chevron-circle-left"></span>
		</li>
		<li class="col-8x favor" data-questionid="{x2;$record['recordid']}">
			<span class="fa fa-circle-xmark"></span>
		</li>
		<li class="col-5">
			<form method="post" data-target="recordquestionpanel" action="index.php?exam-phone-record-ajax-questions">
				共{x2;$allnumber}题，转到 <input class="text-center" name="page" placeholder="{x2;$number}" type="search" size="3"> 题
			</form>
		</li>
		<li class="col-8x">
			<a href="index.php?exam-phone-lesson-reporterror&questionid={x2;$question['questionid']}" class="ajax">
				<span class="fa fa-wrench"></span>
			</a>
		</li>
		<li class="col-8x{x2;if:$number < $allnumber} jump" data-number="{x2;eval: echo $number + 1}{x2;endif}">
			<span class="fa fa-chevron-circle-right"></span>
		</li>
	</ol>
</div>
<script type="text/javascript">
	function reloadpage()
	{
		submitAjax({url:"index.php?exam-phone-record-ajax-questions&page={x2;$number}","target":"recordquestionpanel"});
	}
	$(function(){
		$('#recordquestionpanel .favor').on('click',function() {
			submitAjax({url:"index.php?exam-phone-record-ajax-delrecord&recordid=" + $(this).attr('data-questionid')});
		});
		$('#recordquestionpanel .jump').on('click',function(){
			var number = parseInt($(this).attr('data-number'));
			if(number <= 0)return ;
			submitAjax({url:"index.php?exam-phone-record-ajax-questions&page="+number,"target":"recordquestionpanel"});
		});
	});
</script>
