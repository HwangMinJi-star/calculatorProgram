<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="4"><input type="text" id="display"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" disabled id="result" ></td></tr>
		<tr>
			<td onclick="remove()">AC</td>
			<td onclick="add('(')">(</td>
			<td onclick="add(')')">)</td>
			<td onclick="add('/')">/</td>
		</tr>
		<tr>
			<td onclick="add('7')">7</td>
			<td onclick="add('8')">8</td>
			<td onclick="add('9')">9</td>
			<td onclick="add('*')">*</td>
		</tr>
		<tr>
			<td onclick="add('4')">4</td>
			<td onclick="add('5')">5</td>
			<td onclick="add('6')">6</td>
			<td onclick="add('-')">-</td>
		</tr>
		<tr>
			<td onclick="add('1')">1</td>
			<td onclick="add('2')">2</td>
			<td onclick="add('3')">3</td>
			<td onclick="add('+')">+</td>
		</tr>
		<tr>
			<td colspan="2" onclick="add('0')">0</td>
			<td onclick="add('.')">.</td>
			<td onclick="result()">=</td>
			</tr>
	</table>
	<hr>
	<span>history</span>
	<p id="history">
	</p>
	<script type="text/javascript">
		window.onload = function(){
			var localStorageData = JSON.parse(localStorage.getItem('history'));
			for(var i=0; i<localStorageData.length;i++){
				$('#history').prepend(localStorageData[i] + "<br>");
			}
		}
		var historyArray = [];
		if(!localStorage.getItem('history')){
			localStorage.setItem('history',JSON.stringify(historyArray));
		}
		
		
		function add(char){
			var display = $('#display').val();
			$('#display').val(display + char);
		}
		
		function remove(){
			$('#display').val("");
			$('#result').val("");
		}
		
		function result(){
			var display = $('#display').val();
			//var result = eval(display); 보안문제 때문에 사용 x
			try{
				var result = (new Function('return ' + display))();
				$('#result').val(result);
				var newResult = JSON.parse(localStorage.getItem('history'));
				newResult.push(display + "=" + result);
				JSON.stringify(newResult);
				localStorage.setItem('history',JSON.stringify(newResult));
				$('#history').prepend(display + "=" + result + "<br>");
			}catch(e){
				alert("계산식 오류");
			}
		}
	</script>
</body>
</html>