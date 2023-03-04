<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ Ȯ��</title>
</head>
<body>

	<h3>��й�ȣ Ȯ��</h3>

	<c:choose>
		<c:when test="${msg eq 'modify'}">	
			<div>�����ϱ� ���� ��й�ȣ�� �Է��ϼ���</div>
			<form action="./modify_comment/pw_checked" method="POST" id="modify">
				<div>
					<input type="hidden" name="comment_id" value="${comment.comment_id}"/>
					<input type="password" name="comment_pw"/>
					<input type="submit" value="�Է�"/>
				</div>
			</form>
		</c:when>
		<c:when test="${msg eq 'delete'}">
			<div>�����ϱ� ���� ��й�ȣ�� �Է��ϼ���</div>
			<form action="./delete_comment/do" method="POST" id="delete">
				<div>
					<input type="hidden" name="comment_id" value="${comment.comment_id}"/>
					<input type="hidden" name="board_id" value="${comment.board_id}"/>
					<input type="password" name="comment_pw"/>
					<input type="submit" value="�Է�"/>
				</div>
			</form>
		</c:when>
	</c:choose>
	<div id="pw_check"></div>
	
	<script>
		const pw_check = document.getElementById("pw_check");
		if("<%=request.getParameter("pw_check")%>" == "fail") {
			pw_check.innerHTML += "�߸��� ��й�ȣ�Դϴ�.";
		}
		
		const form = document.getElementByTagName("form");
		
		for (i = 0; i < forms.length; ++i) {
			// �� form �±׿� onsubmit �̺�Ʈ�� ���δ�.
			forms[i].addEventListener('submit', (e) => {
				// �ش� �̺�Ʈ�� �⺻ ������ ���� �� �ִ�.
				e.preventDefault();
				
				// �� ������ ��� ��ҵ�
				const form = e.target;
				const elements = e.target.elements;
				
				const pw_regex = /^(?=.*[a-zA-Z])(?=.*\d).{4,30}$/;
				
				for(j = 0; j < elements.length; ++j) {
					const element = elements[j];
					// name �Ӽ��� �����ϴ� �±׵鸸 �ҷ��´�. (submit ��ư�� üũ�� �ʿ� ����)
					/*if (element.name === '' || element.type === 'submit') {
						console.log('continue.');
						continue;
					}*/
					
					if (element.value == null || element.value == '') {
						window.alert(element.name + 'is empty!!');
						
						// focus() : �ش� ��ҷ� Ŀ���� �ű��.
						element.focus();
						return;
					}
					
					// ��й�ȣ�� ������� �ʴ��� 4���� �̸��̶�� submit���� ����
					if (element.name.includes('comment_pw'))
						&& element.value.length <= 4 ) {
							pw_check.innerHTML += "��й�ȣ�� 4�ڸ� �̻��̾�� �մϴ�.";
							return;
					} else if (element.name.includes('comment_pw'))
						&& element.value.length > 4) {
						const is_valid = pw_regex.test(element.value);
						if(is_valid == false) {
							pw_check.innerHTML += "��й�ȣ�� �ּ� �ϳ��� ���ڿ� ���ڸ� �����ؾ� �մϴ�.";
							return;
						}
					}
				}
				
				// �˻簡 ���� �� ���������� �ش� form�� submit
				form.submit();
			});
		}
	</script>

</body>
</html>