<%--
  ~ Copyright (c) 2012. The Genome Analysis Centre, Norwich, UK
  ~ MISO project contacts: Robert Davey @ TGAC
  ~ **********************************************************************
  ~
  ~ This file is part of MISO.
  ~
  ~ MISO is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ MISO is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with MISO.  If not, see <http://www.gnu.org/licenses/>.
  ~
  ~ **********************************************************************
  --%>
<%@ include file="../header.jsp" %>

<script src="<c:url value='/scripts/jquery/datatables/js/jquery.dataTables.min.js'/>" type="text/javascript"></script>

<div id="maincontent">
<div id="contentcolumn">
  <h1>
    <c:choose><c:when test="${submission.id != 0}">Edit</c:when><c:otherwise>Create</c:otherwise></c:choose> Submission
    <button id="save" type="button" class="fg-button ui-state-default ui-corner-all">Save</button>
  </h1>
  <div class="right fg-toolbar ui-helper-clearfix paging_full_numbers">
    <c:if test="${submission.id != 0}">
      <a href="#" onclick="Submission.download(${submission.id})" class="ui-button ui-state-default">Download</a>
      <span></span>
    </c:if>
  </div>
  
  <form:form id="submissionForm" data-parsley-validate="" autocomplete="off" acceptCharset="utf-8"></form:form>
  <script>
    jQuery(document).ready(function () {
      FormUtils.createForm('submissionForm', 'save', ${submissionDto}, 'submission', {});
      Utils.ui.updateHelpLink(FormTarget.submission.getUserManualUrl());
    });
  </script>

  <miso:list-section id="list_experiments" name="Experiments" target="experiment" items="${experiments}" config="{ inSubmission: true }"/>
</div>
</div>

<%@ include file="adminsub.jsp" %>
<%@ include file="../footer.jsp" %>
