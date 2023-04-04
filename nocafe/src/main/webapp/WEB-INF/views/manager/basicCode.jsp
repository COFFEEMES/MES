<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  #codeSearch {
    width: 90%;
    margin: 0 auto;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px 20px;
  }
</style>
<div class="container-fluid px-4">
  <h1 class="mt-4">기초 코드 관리</h1>
  <ul class="breadcrumb mb-4">
    <li class="breadcrumb-item">
      <a href="/"><i class="fas fa-home"></i></a>
    </li>
    <li class="breadcrumb-item">> 영업관리</li>
    <li class="breadcrumb-item active">> 주문서 관리</li>
  </ul>
  <div id="codeSearch"><span>코드명</span> <input /></div>
  <table class="table"></table>
</div>
