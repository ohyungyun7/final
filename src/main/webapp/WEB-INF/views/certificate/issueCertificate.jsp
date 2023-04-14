<%@page import="kr.or.ddit.vo.UserVO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style type="text/css">
.input-group-text{
	display: block;
	border: 1px solid #788393;
}
.form-select{
	border: 1px solid #788393;
}
.table th{
	font-size: 0.9rem;
	text-align: center;
}
.table td{
	text-align: center;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-clipboard page-icon"></i>
	<span class="fw-light">증명서 발급 / </span>증명서 발급
</h4>

<div class="card">
	
	<div class="card-body">
		<h5>증명서 선택</h5><hr/>
		<div class="row">
			<div class="col-6">
				<h5>국문</h5>
				<div class="d-grid gap-2 col-lg-12">
					<c:choose>
						<c:when test="${stuInfo.STU_STATUS == 3 }">
							<button class="btn btn-outline-secondary btn-lg type" type="button" id="G001">졸업 증명서</button>
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER == 8 and (stuInfo.STU_STATUS == 0 or stuInfo.STU_STATUS == 5) }">
							<button class="btn btn-outline-secondary btn-lg type" type="button" id="G003">졸업 예정 증명서</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-secondary btn-lg type" type="button" id="AT001">재학 증명서</button>
						</c:otherwise>
					</c:choose>
					
					<button class="btn btn-outline-secondary btn-lg type" type="button" id="S001">성적 증명서</button>
					<button class="btn btn-outline-secondary btn-lg type" type="button" id="COM001">이수 증명서</button>
					<button class="btn btn-outline-secondary btn-lg type" type="button" id="SR001">학적부 사본</button>
          		</div>
			</div>
			
			<div class="col-6">
				<h5>영문</h5>
				<div class="d-grid gap-2 col-lg-12">
					<c:choose>
						<c:when test="${stuInfo.STU_STATUS == 3 }">
							<button class="btn btn-outline-secondary btn-lg type" type="button" id="G002">졸업 증명서</button>
						</c:when>
						<c:when test="${stuInfo.STU_SEMESTER == 8 and (stuInfo.STU_STATUS == 0 or stuInfo.STU_STATUS == 5) }">
							<button class="btn btn-outline-secondary btn-lg type" type="button" id="G004">졸업 예정 증명서</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-secondary btn-lg type" type="button" id="AT002">재학 증명서</button>
						</c:otherwise>
					</c:choose>
					
					<button class="btn btn-outline-secondary btn-lg type" type="button" id="S002">성적 증명서</button>
					<button class="btn btn-outline-secondary btn-lg type" type="button" id="COM002">이수 증명서</button>
					<button class="btn btn-outline-secondary btn-lg type" type="button" id="SR002">학적부 사본</button>
          		</div>
			</div>
		</div>
		<br/><br/><br/>
		
		
		<h5>용도 선택</h5><hr/>
		<div class="row">
			<div class="col-6">
				<div class="input-group">
					<label class="input-group-text" for="sel_usage" style="width: 20%; text-align: center;">용도</label>
					<select class="form-select" id="sel_usage" disabled>
						<option value="none">선택</option>
						<option value="취업 제출용">취업 제출용</option>
						<option value="자격증 발급용">자격증 발급용</option>
						<option value="신분 확인용">신분 확인용</option>
						<option value="기타 증명서류 제출용">기타 증명서류 제출용</option>
					</select>
				</div>
			</div>
		</div>
		<br/><br/><br/>
		
		<h5>증명서 신청 내역</h5><hr/>
		<div class="table-responsive text-nowrap">
			<table class="table table-bordered">
				<thead class="table-active">
					<tr class="text-nowrap">
						<th>선택 증명서</th>
						<th>용도</th>
						<th>수수료</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="ctType"></td>
						<td id="icUsage"></td>
						<td id="ctPrice"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br/><br/>
		
		<div class="row">
			<div class="col-5"></div>
			<div class="col-2">
				<div class="d-grid gap-2 col-lg-12">
					<button class="btn btn btn-info btn-lg" type="button" id="btnIssued">발급</button>
          		</div>
			</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
let ctSnum;
let t_ctType = $("#ctType");
let t_ctPrice = $("#ctPrice");
let t_sel_useAge = $("#sel_usage");
let t_icUseage = $("#icUsage");
let stuInfo;

var IMP = window.IMP; 
IMP.init("imp67708830"); 

$(".type").on("click", function() {
	// 용도선택, 신청내역 테이블 초기화
	t_sel_useAge.val("none");
	t_icUseage.text("");
	t_ctPrice.text("");
	
	ctSnum = $(this).attr("id");
	
	let ctText = $(this).text();
	if(ctSnum[ctSnum.length - 1] == '1' || ctSnum[ctSnum.length - 1] == '3'){
		ctText = ctText + '(국)';
	}else{
		ctText = ctText + '(영)';
	}
	
	t_ctType.text(ctText);
	t_sel_useAge.removeAttr("disabled");
});

t_sel_useAge.on("change", function() {
	t_icUseage.text($(this).val());
	
	$.ajax({
		url: "/certificate/getPrice",
		data: {"ctSnum" : ctSnum},
		type: "get",
		beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			t_ctPrice.text(result);
		}
	});
});

$("#btnIssued").on("click", function() {
	if(t_ctType.text() == ""){
        Swal.fire({
            title: '증명서를 선택해주세요.',
            showClass: {
              popup: 'animate__animated animate__bounceIn'
            },
            icon: 'warning',
            customClass: {
              confirmButton: 'btn btn-primary'
            },
            buttonsStyling: false
          });
		return;
	}
	
	if(t_icUseage.text() == ""){
        Swal.fire({
            title: '용도를 선택해주세요',
            showClass: {
              popup: 'animate__animated animate__bounceIn'
            },
            icon: 'warning',
            customClass: {
              confirmButton: 'btn btn-primary'
            },
            buttonsStyling: false
          });
		return;
	}
	
	let uuid = uuidv4();
	
	IMP.request_pay({
			pg : 'html5_inicis.INIpayTest',
			pay_method : 'card',
			merchant_uid: uuid, 
			name : t_ctType.text(),
			amount : t_ctPrice.text(),
			buyer_email : "${stuInfo.STU_EMAIL}",
			buyer_name : "${stuInfo.STU_NM_KOR}",
			buyer_tel : "${stuInfo.STU_PN}",
			buyer_addr : "${stuInfo.STU_ADDR}",
			buyer_postcode : "${stuInfo.STU_ZIP}"
		}, function (rsp) { // callback
		if (rsp.success) {
			$.ajax({
				url: "/certificate/issuedCertificate",
				data: {
						"icNum": uuid,
						"ctSnum": ctSnum,
						"icUsage": t_icUseage.text()
					   },
				type: "post",
				beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
		    		Swal.fire({
						title: '증명서 보관함으로<br/>이동하시겠습니까?',
						showDenyButton: true,
						confirmButtonText: 'Yes',
						denyButtonText: 'No',
						customClass: {
							actions: 'my-actions',
							cancelButton: '',
							confirmButton: 'btn btn-primary',
							denyButton: 'btn btn-secondary',
						}
					}).then((result) => {
						if(result.isConfirmed){
							location.href="/certificate/lokerCertificate";
						}
					});
				}
			}); // ajax끝
    	} else {
			Swal.fire({
				title: '결제 오류. 다시 시도해주세요.',
				showClass: {
					popup: 'animate__animated animate__bounceIn'
				},
				icon: 'error',
				customClass: {
					confirmButton: 'btn btn-primary'
				},
				buttonsStyling: false
			});
			
        } // if문 끝
	}); // 결제 API 끝
});

function uuidv4() {
  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  );
}
</script>
