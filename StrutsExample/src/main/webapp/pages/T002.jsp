<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<title>Search - Training</title>
</head>
<style type="text/css">
	<%@ include file="/WEB-INF/css/common.css"%>
</style>
<style type="text/css">
<%@ include file="/WEB-INF/css/T002.css"%>
</style>
<body>
	<style type="text/jsp">
  <%@include file="/WEB-INF/include/header.jsp"%>
</style>

	<div class="search-container">
		<div class="search-container__dan">
			<div class="search-container__text search-container__text_text">
				Login > Search Customer</div>
			<div class="search-container__context">
				<div class="search-container__logo">
					Welcome
					<%
				if (session.getAttribute("namenamewellcom") != null) {
					String name = (String) session.getAttribute("namenamewellcom");
				%>
					<div class="search-container__logo--wellcomname"><%=" " + name%></div>
					<%
					}
					%>
				</div>

				<a href="/CustomerSystem/T001"
					class="search-container__logout search-container__text_text"
					onclick="Logout() "> Log Out </a>
			</div>

			<div class="search-container__line"></div>


			<form id="form-Search" action="/CustomerSystem/T002" method="POST">
				<div class="search-container__handalSearch">
					<div
						class="search-container__handalSearch--margin handalSearch-customerName">
						<div
							class="handalSearch-customercommon handalSearch-customerName__text search-container__text_text">Customer
							Name</div>
						<%
						if (request.getAttribute("nameSearch") != null) {
						%>
						<input id="txtCustomerName" name="txtCustomerName"
							value="<%=request.getAttribute("nameSearch")%>" maxLength="50" />
						<%
						}
						%>
						<%
						if (request.getAttribute("nameSearch") == null) {
						%>
						<input id="txtCustomerName" name="txtCustomerName" maxLength="50" />
						<%
						}
						%>
					</div>

					<%
					if (request.getAttribute("sexSearch") == null) {
					%>
					<div
						class="search-container__handalSearch--margin handalSearch-customerSex">
						<div
							class="handalSearch-customercommon handalSearch-customerSex__text search-container__text_text">Sex</div>
						<select name="browser" value="1" id="cboSex">
							<option value=""></option>
							<option value="0">Male</option>
							<option value="1">Female</option>
						</select>
					</div>
					<%
					}
					%>
					<%
					if (request.getAttribute("sexSearch") != null) {
					%>
					<div
						class="search-container__handalSearch--margin handalSearch-customerSex">
						<div
							class="handalSearch-customercommon handalSearch-customerSex__text search-container__text_text">Sex</div>
						<select name="browser" id="cboSex">
							<option value=""></option>
							<option value="0"
								<%if (request.getAttribute("sexSearch") != null && request.getAttribute("sexSearch").equals("0")) {%>
								selected <%}%>>Male</option>
							<option value="1"
								<%if (request.getAttribute("sexSearch") != null && request.getAttribute("sexSearch").equals("1")) {%>
								selected <%}%>>Female</option>
						</select>
					</div>
					<%
					}
					%>

					<div
						class="search-container__handalSearch--margin handalSearch-BirthdayFrom">
						<div
							class="handalSearch-customercommon handalSearch-BirthdayFrom__text search-container__text_text">Birthday</div>


						<%
						if (request.getAttribute("dataFrom") != null) {
						%>
						<input id="txtBirthdayForm" class="txtCustomerValidateFROM"
							value="<%=request.getAttribute("dataFrom")%>"
							name="txtBirthdayFromName" maxLength="10" />
						<%
						}
						%>

						<%
						if (request.getAttribute("birthdayFromSearch") != null && request.getAttribute("birthDayFromFrom") == null) {
						%>
						<input id="txtBirthdayForm" class="txtCustomerValidateFROM"
							value="<%=request.getAttribute("birthdayFromSearch")%>"
							name="txtBirthdayFromName" maxLength="10" />
						<%
						}
						%>

						<%
						if (request.getAttribute("dataFrom") == null && request.getAttribute("birthDayFromFrom") == null
								&& request.getAttribute("birthdayFromSearch") == null) {
						%>
						<input id="txtBirthdayForm" class="txtCustomerValidateFROM"
							name="txtBirthdayFromName" maxLength="10" />
						<%
						}
						%>

						<%
						if (request.getAttribute("birthDayFromFrom") != null) {
						%>
						<input id="txtBirthdayForm" class="txtCustomerValidateFROM"
							value="<%=request.getAttribute("birthDayFromFrom")%>"
							name="txtBirthdayFromName" maxLength="10" />
						<%
						}
						%>

						<lable class="handalSearch-BirthdayFrom__ngangcach">～</lable>

						<%
						if (request.getAttribute("dataTo") != null) {
						%>
						<input id="txtBirthdayTo" class="txtCustomerValidateTO"
							value="<%=request.getAttribute("dataTo")%>"
							name="txtBirthdayToName" maxLength="10" />
						<%
						}
						%>

						<%
						if (request.getAttribute("dataTo") == null && request.getAttribute("birthDayToTo") == null) {
						%>
						<input id="txtBirthdayTo" class="txtCustomerValidateTO"
							name="txtBirthdayToName" maxLength="10" />
						<%
						}
						%>

						<%
						if (request.getAttribute("birthDayToTo") != null) {
						%>
						<input id="txtBirthdayForm" class="txtCustomerValidateFROM"
							value="<%=request.getAttribute("birthDayToTo")%>"
							name="txtBirthdayFromName" maxLength="10" />
						<%
						}
						%>
					</div>

					<div class="handalSearch-btnSearch">
						<button type="submit" id="btnSearch">Search</button>
					</div>
				</div>


				<div class="search-container__btnContext--chuyenhuong">
					<div class="search-container__btnContext--start">


						<logic:equal name="ListData" value="null">
							<button id="btnFirst" disabled="true"><<</button>
							<button id="btnPrevious" disabled="true"><</button>
						</logic:equal>

						<logic:notEqual name="ListData" value="null">
							<logic:equal name="tag" value="1">
								<button id="btnFirst" disabled="true"><<</button>
								<button id="btnPrevious" disabled="true"><</button>
							</logic:equal>
							<logic:notEqual name="tag" value="1">
								<button id="btnFirst" href="/CustomerSystem/T002?index=1"><<</button>
								<button id="btnPrevious"
									href="/CustomerSystem/T002?index=${tag-1}"><</button>
							</logic:notEqual>
						</logic:notEqual>


						<lable
							class="search-container__btnContext--textstart search-container__text_text">Previous</lable>
					</div>

					<div class="search-container__btnContext--end">
						<lable
							class="search-container__btnContext--textend search-container__text_text">Next</lable>

						<logic:equal name="ListData" value="null">
							<button id="btnNext" disabled="disabled">&gt;</button>
							<button id="btnPrevious" disabled="disabled">&gt;&gt;</button>
						</logic:equal>
						<logic:notEqual name="ListData" value="null">
							<logic:equal name="tag" value="endP">
   <button id="btnNext" disabled="disabled">&gt;</button>
   <button id="btnPrevious" disabled="disabled">&gt;&gt;</button>
</logic:equal>

<logic:notEqual name="tag" value="endP">
   <button id="btnNext"
           onclick="location.href='/CustomerSystem/T002?index=<%= Integer.parseInt(request.getParameter("tag"))+1 %>'">&gt;</button>
   <button id="btnPrevious"
           onclick="location.href='/CustomerSystem/T002?index=<%=request.getAttribute("endP")%>'">&gt;&gt;</button>
</logic:notEqual>

						</logic:notEqual>


					</div>
				</div>
				<table class="search-container__table">
					<tr class="search-container__table--tieude">
						<th class="searchtable-trcheck"><input type="checkbox"
							id="checkAll" name="checkboxAll" value=""
							onclick="checkBox(this)"></th>
						<th class="searchtable-trid">Customer ID</th>
						<th class="searchtable-trname">Customer Name</th>
						<th class="searchtable-trsex">Sex</th>
						<th class="searchtable-trbirthday">Birthday</th>
						<th class="searchtable-traddress">Address</th>
					</tr>
					<logic:notEmpty name="ListData">
						<logic:iterate name="ListData" id="dept">
							<tr>
								<td class="searchtable-check"></td>
								<td><a
									href="/CustomerSystem/T003?id=<bean:write name='dept' property='CUSTOMER_ID' />"
									class="searchtable-id"><bean:write name='dept'
											property='CUSTOMER_ID' /></a></td>
								<td class="searchtable-name"><bean:write name='dept'
										property='CUSTOMER_NAME' /></td>
								<td class="searchtable-sex"><bean:write name='dept'
										property='SEX' /></td>
								<td class="searchtable-birthday"><bean:write name='dept'
										property='BIRTHDAY' /></td>
								<td class="searchtable-address"><bean:write name='dept'
										property='ADDRESS' /></td>
							</tr>
						</logic:iterate>
					</logic:notEmpty>
				</table>
				<div class="search-btn__form">
					<button class="search-container__nav-btnAddNew">
						<a href="/CustomerSystem/T003">Add new</a>
					</button>
					<%
					Object listDataSearch = request.getAttribute("listDataSearch");
					Object ListA = request.getAttribute("ListA");
					%>
					<%
					if (request.getAttribute("listDataSearch") == null && request.getAttribute("ListA") == null) {
					%>
					<button type="button" disabled style="pointer-events: none;"
						class="search-container__delete" onclick="deleteRows()">Delete</button>


					<%
					} else if (request.getAttribute("buttonDelete") != null) {
					%>
					<button type="button" disabled style="pointer-events: none;"
						class="search-container__delete" onclick="deleteRows()">Delete</button>

					<%
					} else {
					%>
					<button type="button" class="search-container__delete"
						onclick="deleteRows()">Delete</button>
					<%
					}
					%>

				</div>
			</form>
		</div>
		<footer class="footer">
			<div class="header-br"></div>
			<div class="footer-text__copyright">Copyright (c) 2000-2008
				FUJINET, All Rights Reserved.</div>
		</footer>
	</div>
	</div>
	<script>
		
	<%@include file="/WEB-INF/js/T002.js"%>
		
	</script>
</body>
</html>