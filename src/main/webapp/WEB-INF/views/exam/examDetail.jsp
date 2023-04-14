<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
</style>

<div class="card">
	<div class="card-header">
		<div class="col-md-12"><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2023년 1학기 생화학실험(온라인) 기말고사</h5></div>
		<div class="container">
			<table class="table table-bordered" style="text-align: center;">
				<thead class="table-active">
					<tr class="text-nowrap">
						<th>총점</th>
						<th class="si_target">내점수</th>
						<th>맞은문항</th>
						<th>틀린문항</th>
						<th>진행시간</th>
					</tr>
				</thead>
				<tbody>
						<th>100점</th>
						<th>${totalCount*trueCount}점</th>
						<th>${trueCount}</th>
						<th>${falseCount}</th>
						<th>${minute}분${second}초</th>
				</tbody>
			</table>
		</div>
	</div>
	<div class="card-header">
		<div class="container">
			<table class="table table-bordered " style="text-align: center;">
				<thead class="table-active">
					<tr class="text-nowrap">
						<th>번호</th>
						<th class="si_target">타입</th>
						<th>제목</th>
						<th>정답</th>
						<th>응시자답안</th>
						<th>배점</th>
						<th>점수</th>
						<th>결과</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="examqueVO" items="${examQueListAndAns}" varStatus="stat">
						<tr style="text-align: center;">
							<th>${stat.index+1}</th>
							<th>객관식</th>
							<th>${examqueVO.examqueQue}</th>
							<th>${examqueVO.examqueAns}</th>
							<th>${examqueVO.ansAns}</th>
							<th>${totalCount}</th>
							<c:if test="${examqueVO.examqueAns eq  examqueVO.ansAns}">
								<th>${totalCount}</th>
							</c:if>
							<c:if test="${examqueVO.examqueAns ne  examqueVO.ansAns}">
								<th>0</th>
							</c:if>
							<c:if test="${examqueVO.examqueAns eq  examqueVO.ansAns}">
								<th><img src="/resources/images/result_true.png"/></th>
							</c:if>
							<c:if test="${examqueVO.examqueAns ne  examqueVO.ansAns}">
								<th><img src="/resources/images/result_false.png"/></th>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>




