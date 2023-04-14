<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<!-- tab -->
		
			  <div class="nav-align-top mb-4">
			    <ul class="nav nav-tabs nav-fill" role="tablist">
			      <li class="nav-item" role="presentation">
			        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="false" tabindex="-1">
			        	<i class='bx bx-leaf'></i> 휴학
			        </button>
			      </li>
			      <li class="nav-item" role="presentation">
			        <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="true">
			        	<i class='bx bxs-leaf' ></i> 복학
			        </button>
			      </li>
			    </ul>
			    <div class="tab-content">
					<div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
						<!-- 휴학 신청양식 -->
				        <form>
				        	<input type="hidden" value="" />
					        <div class="mb-3 row">
						      <label for="html5-text-input" class="col-md-2 col-form-label">휴학일자</label>
						      <div class="col-md-10">
						        <input class="form-control" type="text" value="2023-03-11" id="html5-text-input" />
						      </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="html5-email-input" class="col-md-2 col-form-label">사유</label>
						      	<div class="col-md-10">
							      	<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
										<option>개인사정</option>
										<option>군휴학</option>
										<option>건강악화</option>
						            </select>
					            </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="html5-month-input" class="col-md-2 col-form-label">휴학기수</label>
						      <div class="col-md-4">
						        <select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
									<option>1</option>
									<option>2</option>
					            </select>
						      </div>
						      <label for="html5-search-input" class="col-md-2 col-form-label">복학 학기</label>
						      <div class="col-md-4">
						        <input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						      </div>
						    </div>
						    <div class="mb-3 row">
						    </div>
				          <button type="submit" class="btn btn-primary col-2" style="float: right;" >휴학</button>
				        </form>
				    </div>
					<!-- /휴학신청 -->
			      <!-- 복학신청 -->
			      <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
						<form>
				        	<input type="hidden" value="" />
					        <div class="mb-3 row">
						      <label for="html5-text-input" class="col-md-2 col-form-label">휴학일자</label>
						      <div class="col-md-10">
						        <input class="form-control" type="text" value="2023-03-11" id="html5-text-input" />
						      </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="html5-email-input" class="col-md-2 col-form-label">사유</label>
						      	<div class="col-md-10">
							      	<select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
										<option>개인사정</option>
										<option>군휴학</option>
										<option>건강악화</option>
						            </select>
					            </div>
						    </div>
						    <div class="mb-3 row">
						      <label for="html5-month-input" class="col-md-2 col-form-label">휴학기수</label>
						      <div class="col-md-4">
						        <select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default"> -->
									<option>1</option>
									<option>2</option>
					            </select>
						      </div>
						      <label for="html5-search-input" class="col-md-2 col-form-label">복학 학기</label>
						      <div class="col-md-4">
						        <input class="form-control" type="search" value="2024년도-1학기" id="html5-search-input" />
						      </div>
						    </div>
						    <div class="mb-3 row">
						    </div>
				          <button type="submit" class="btn btn-primary col-2" style="float: right;" >복학</button>
				        </form>
			      </div>
			      <!-- /복학신청 -->
			  </div>
			    <!-- /"tab-content" -->
		
		<!-- /tab -->
	</div>
</div>
