<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
td{
	font-size: 0.8rem;
}
</style>

<h4 class="title fw-bold py-3 mb-2 categoryBar">
	<i class="bx bx-street-view page-icon"></i>
	<span class="fw-light" >학적변동 신청 / </span>학적변동 신청내역
</h4>

<div class="card">
	<div class="card-header">
		<h5 class="title">
			<a href="/home" class="categoryBar">메인</a>&nbsp;/&nbsp;<a href="#" class="s">학적변동 신청내역</a>
		</h5>
	</div>
	<div class="card-body">
		<div class="card divTb w-px-700 h-px-120 mx-auto">
			<table class="table table-bordered" style="height:100%; table-layout:fixed;">
					<tr>
						<th width="10%" style="background: #d2e8f1;">학번</th>
						<td width="14%">201901001</td>
						<th width="11%" style="background: #d2e8f1;">이름</th>
						<td width="13%">이효림</td>
						<th width="7%" style="background: #d2e8f1;">학적상태</th>
						<td width="10%">재학</td>
					</tr>
					<tr>
						<th style="background: #d2e8f1;">학과(전공)</th>
						<td>화학과</td>
						<th style="background: #d2e8f1;">학년/학기</th>
						<td colspan="3">
							1<span>학년</span>
							1<span>학기</span>
						</td>
					</tr>
					<tr>
						<th style="background: #d2e8f1;">복수전공</th>
						<td>없음</td>
						<th rowspan="2" style="background: #d2e8f1;">이수학점</th>
						<th style="background: #d2e8f1; text-align:center;">전공</th>
						<td colspan="2">24</td>
					</tr>
					<tr>
						<th style="background: #d2e8f1;">부전공</th>
						<td>없음</td>
						<th style="background: #d2e8f1; text-align:center;">교양</th>
						<td colspan="2">24</td>
					</tr>
			</table>
		</div>
		<hr />
		<div class="card">
			<div class="card-body">
				<div class="mx-auto" >
					<div class="row text-end" style="">
						<label for="html5-search-input" class="col-md-1 col-form-label">전과년도</label>
						<div class="col-md-2">
							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						</div>
						<label for="html5-search-input" class="col-md-1 col-form-label">전과학기</label>
						<div class="col-md-3">
							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						</div>
						<label for="html5-search-input" class="col-md-1 col-form-label">전과사유</label>
						<div class="col-md-4">
							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						</div>
					</div>
					<br/>
					<div class="row text-end" style="">
						<label for="html5-search-input" class="col-md-1 col-form-label">전과 대학</label>
						<div class="col-md-2">
							<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
								<option>공과대학</option>
								<option>인문대학</option>
				            </select>
						</div>
						<label for="html5-search-input" class="col-md-1 col-form-label">전과학과</label>
						<div class="col-md-3">
							<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
								<option>1</option>
								<option>2</option>
				            </select>
						</div>
						<label for="html5-search-input" class="col-md-1 col-form-label">추가 등록금</label>
						<div class="col-md-4">
							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						</div>
					</div>
					<br/>
					<div class="row text-end">
						<label for="html5-search-input" class="col-md-1 col-form-label">신청 날짜</label>
						<div class="col-md-4">
							<input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						</div>
					</div>
					<button type="submit" class="btn btn-primary col-2" style="float: right; margin: 20px;" >전과</button>
				</div>
			</div>
			<div class="card-footer"></div>
		</div>
	</div>
</div>


