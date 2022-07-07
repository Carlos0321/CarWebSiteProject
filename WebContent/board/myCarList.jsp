<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
 <div id="wrap">
    
                <div class="h_title_wrap">
                    <h3 class="h_title"><strong>전체</strong> <span class="t_gray" data-bind-text="carRvwListCnt"></span></h3>
                    <div class="right">
                        <select class="select type_02" title="검색 정렬 선택" id="sortType" data-bind-change="setSort()">
                            <option value="1" selected>최신순</option>
                            <option value="2">별점높은순</option>
                            <option value="3">좋아요순</option>
                        </select>
                    </div>
                </div>
                <ul class="review_list type_02" data-bind-each="carRvwList" data-bind-visible="carRvwList.length != 0">
                    <li>
                        <a href="#none" role="button" class="box" data-bind-click="goDl('{{=$index}}')">
                        	{{ if($data.dclYn == "Y") { }}
								<p class="ico_txt">신고 5회 이상 접수된 글입니다.</p>
							{{ } }}
                            <div class="nickname_box">
                                <div class="profile_img {{=$data.clnImgBgrOloVl}}"><!--[D]개발참고: 컬러클래스) white / red / pink / purple / blue / skyblue / green / yellow -->
                                    <span class="img">
                                    {{ if($data.clnPhtImgPhTt==" ") { }}
                                	<img src="/conts/images/mycar/bg_profile_basic.png" alt="프로필 기본이미지"><!--기본이미지-->
                                    {{ }else{ }}
                                    <img src="{{=$data.clnPhtImgPhTt}}" alt="{{=$data.clnPhtImgPhTtAlt}}">
                                    {{ } }}
                                        <!--이미지가 들어갈 때:
                                            <img src="/conts/images/model/303_3555.png" alt="K5 화이트 배경색 프로필 이미지"> [D]개발참고: 접근성관련) alt값에 브랜드명+배경색(title값)+'배경색'+'프로필 이미지' 조합 값 유동적 입력
                                        -->
                                    </span>
                                </div>
                                <div class="title">{{=$data.clnNknmVl}}</div>
                            </div>
                            <div class="info_wrap">
                                <div class="info_txt">
                                    <strong class="title">{{=$data.vhNm}}</strong>
                                    <div class="sub_txt">
                                        <span class="ver">{{=$data.vhDlMdlNm}}</span>
                                        <span class="year">{{=$data.carYdtVlNm}}</span>
                                    </div>
                                    <div class="sub_etc">
                                        <span class="grade"><i class="blind">별점</i>{{=$data.ncrVaSc}}</span>
                                        <span class="favorite"><i class="blind">좋아요 수</i>{{=$data.bbsPfrCt}}</span>
                                    </div>
                                </div>
                                <div class="info_img">
                                	{{ if($data.imgUrlAr==null) { }}
                                	<img src="/conts/images/mycar/img_none_car.jpg" alt="자동차 이미지">
                                    {{ }else{ }}
                                    <img src="{{=$data.imgUrlAr}}" alt="{{=$data.vhNm}}" height="100%" style="object-fit:cover;">
                                    {{ } }}
                                </div>
                            </div>
                            <div class="text_wrap">
                                {{=$data.vaTt}}
                            </div>
                        </a>
                    </li>
                </ul>
                </div>
                </div>
                </div>
                </div>
                
</body>
</html>