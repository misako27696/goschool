<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<script type="text/javascript">
jQuery(document).ready(function($) {
	
	<!-- 届出欠席 -->
	  var prefix_order_list = 'todokede_list_'; // 品目入力欄のname属性の接頭辞

		// "品目の追加"ボタンを押した場合の処理
		$('#btn_todokede').click(function(){
			// 品目入力欄を追加
			var len_list = $('#todokede_list > li').length;
			var new_list = '<li><select name="' + prefix_order_list + len_list + '"></li>';
			$('#todokede_list').append(new_list);

			// 削除ボタンの一旦全消去し、配置し直す
			$('#todokede_list input[type="button"]').remove();
			len_list++;
			for (var i = 0; i < len_list; i++) {
				var new_btn = '<input type="button" value="削除">';
				$('#todokede_list > li').eq(i).append(new_btn);
			}
				
		});

		// 削除ボタンを押した場合の処理
		$(document).on('click', '#todokede_list input[type="button"]', function(ev) {
			// 品目入力欄を削除
			var idx = $(ev.target).parent().index();
			$('#todokede_list > li').eq(idx).remove();

			var len_list = $('#todokede_list > li').length;

			// 入力欄がひとつになるなら、削除ボタンは不要なので消去
			if (len_list == 1) $('#todokede_list input[type="button"]').remove();

			// 入力欄の番号を振り直す
			for (var i=0; i<len_list; i++) {
				$('#todokede_list > li').eq(i).children('input[type="text"]').attr('name', prefix_order_list + i);
			}
		});
		
		<!-- 無届欠席 -->
		var prefix_order_list = 'mutodokede_list_'; // 品目入力欄のname属性の接頭辞

		// "品目の追加"ボタンを押した場合の処理
		$('#btn_mutodokede').click(function(){
			// 品目入力欄を追加
			
			var len_list = $('#mutodokede_list > li').length;
			var new_list = '<li><select name="' + prefix_order_list + len_list + '">';

			
			
			// データを出力する。
			/* for ( var i = 0; i < members.size(); ++i ) {
				Map<String, String> member = members.get( i );
				String student_number	=	member.get( "student_number" ).toString();
				String lastname	=	member.get( "lastname" ).toString();
				String firstname	=	member.get( "firstname" ).toString();
				String student_id	=	member.get( "student_id" ).toString();
				
				new_list+='<option value="' + student_id + '">' + lastname+firstname + '</option>');
			} */
			
			new_list+='</select></li>';
			
			$('#mutodokede_list').append(new_list);
			
			// 削除ボタンの一旦全消去し、配置し直す
			$('#mutodokede_list input[type="button"]').remove();
			len_list++;
			for (var i = 0; i < len_list; i++) {
				var new_btn = '<input type="button" value="削除">';
				$('#mutodokede_list > li').eq(i).append(new_btn);
			}
				
		});

		// 削除ボタンを押した場合の処理
		$(document).on('click', '#mutodokede_list input[type="button"]', function(ev) {
			// 品目入力欄を削除
			var idx = $(ev.target).parent().index();
			$('#mutodokede_list > li').eq(idx).remove();

			var len_list = $('#mutodokede_list > li').length;

			// 入力欄がひとつになるなら、削除ボタンは不要なので消去
			if (len_list == 1) $('#mutodokede_list input[type="button"]').remove();

			// 入力欄の番号を振り直す
			for (var i=0; i<len_list; i++) {
				$('#mutodokede_list > li').eq(i).children('input[type="text"]').attr('name', prefix_order_list + i);
			}
		});
		
		<!-- 遅刻 -->
		var prefix_order_list = 'tikoku_list_'; // 品目入力欄のname属性の接頭辞

		// "品目の追加"ボタンを押した場合の処理
		$('#btn_tikoku').click(function(){
			// 品目入力欄を追加
			var len_list = $('#tikoku_list > li').length;
			var new_list = '<li><input type="text" size="40" name="' + prefix_order_list + len_list + '"></li>';
			$('#tikoku_list').append(new_list);

			// 削除ボタンの一旦全消去し、配置し直す
			$('#tikoku_list input[type="button"]').remove();
			len_list++;
			for (var i = 0; i < len_list; i++) {
				var new_btn = '<input type="button" value="削除">';
				$('#tikoku_list > li').eq(i).append(new_btn);
			}
				
		});

		// 削除ボタンを押した場合の処理
		$(document).on('click', '#tikoku_list input[type="button"]', function(ev) {
			// 品目入力欄を削除
			var idx = $(ev.target).parent().index();
			$('#tikoku_list > li').eq(idx).remove();

			var len_list = $('#tikoku_list > li').length;

			// 入力欄がひとつになるなら、削除ボタンは不要なので消去
			if (len_list == 1) $('#tikoku_list input[type="button"]').remove();

			// 入力欄の番号を振り直す
			for (var i=0; i<len_list; i++) {
				$('#tikoku_list > li').eq(i).children('input[type="text"]').attr('name', prefix_order_list + i);
			}
		});
		
		<!-- 早退 -->
		var prefix_order_list = 'soutai_list_'; // 品目入力欄のname属性の接頭辞

		// "品目の追加"ボタンを押した場合の処理
		$('#btn_soutai').click(function(){
			// 品目入力欄を追加
			var len_list = $('#soutai_list > li').length;
			var new_list = '<li><input type="text" size="40" name="' + prefix_order_list + len_list + '"></li>';
			$('#soutai_list').append(new_list);

			// 削除ボタンの一旦全消去し、配置し直す
			$('#soutai_list input[type="button"]').remove();
			len_list++;
			for (var i = 0; i < len_list; i++) {
				var new_btn = '<input type="button" value="削除">';
				$('#soutai_list > li').eq(i).append(new_btn);
			}
				
		});

		// 削除ボタンを押した場合の処理
		$(document).on('click', '#soutai_list input[type="button"]', function(ev) {
			// 品目入力欄を削除
			var idx = $(ev.target).parent().index();
			$('#soutai_list > li').eq(idx).remove();

			var len_list = $('#soutai_list > li').length;

			// 入力欄がひとつになるなら、削除ボタンは不要なので消去
			if (len_list == 1) $('#soutai_list input[type="button"]').remove();

			// 入力欄の番号を振り直す
			for (var i=0; i<len_list; i++) {
				$('#soutai_list > li').eq(i).children('input[type="text"]').attr('name', prefix_order_list + i);
			}
		});
		
		<!-- 欠課 -->
		var prefix_order_list = 'kekka_list_'; // 品目入力欄のname属性の接頭辞

		// "品目の追加"ボタンを押した場合の処理
		$('#btn_kekka').click(function(){
			// 品目入力欄を追加
			var len_list = $('#kekka_list > li').length;
			var new_list = '<li><select name="month" style="width:90px">' +
             　  '<option value="">欠席時限</option>' +
               '<option value="1">1限目</option>' +
               '<option value="2">2限目</option>' +
               '<option value="3">3限目</option>' +
               '<option value="4">4限目</option>' +
               '<option value="5">5限目</option>' +
               '<option value="6">6限目</option>' +
               '<option value="7">7限目</option>' +
              '</select><br/>' +
			'<input type="text" size="40" name="' + prefix_order_list + len_list + '"></li>';
			$('#kekka_list').append(new_list);

			// 削除ボタンの一旦全消去し、配置し直す
			$('#kekka_list input[type="button"]').remove();
			len_list++;
			for (var i = 0; i < len_list; i++) {
				var new_btn = '<input type="button" value="削除">';
				$('#kekka_list > li').eq(i).append(new_btn);
			}
				
		});

		// 削除ボタンを押した場合の処理
		$(document).on('click', '#kekka_list input[type="button"]', function(ev) {
			// 品目入力欄を削除
			var idx = $(ev.target).parent().index();
			$('#kekka_list > li').eq(idx).remove();

			var len_list = $('#kekka_list > li').length;

			// 入力欄がひとつになるなら、削除ボタンは不要なので消去
			if (len_list == 1) $('#kekka_list input[type="button"]').remove();

			// 入力欄の番号を振り直す
			for (var i=0; i<len_list; i++) {
				$('#kekka_list > li').eq(i).children('input[type="text"]').attr('name', prefix_order_list + i);
			}
		});
	});
</script>
    