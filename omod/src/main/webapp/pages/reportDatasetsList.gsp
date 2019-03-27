<%
    ui.decorateWith("kenyaemr", "standardPage", [layout: "sidebar" ])
    def back = ui.pageLink("facilityreporting", "facilityReportingHome", [ returnUrl: ui.thisUrl()])
    def menuItems = [
            [ label: "Back to home", iconProvider: "kenyaui", icon: "buttons/back.png", label: "Back to Reports", href: back ]
    ]
    ui.includeCss("facilityreporting", "table_formatter.css")

    ui.includeJavascript("uicommons", "angular.min.js")
    ui.includeJavascript("uicommons", "angular-app.js")
    ui.includeJavascript("uicommons", "angular-resource.min.js")
    ui.includeJavascript("uicommons", "angular-common.js")
    ui.includeJavascript("uicommons", "angular-ui/ui-bootstrap-tpls-0.11.2.js")
    ui.includeJavascript("uicommons", "ngDialog/ngDialog.js")
    ui.includeJavascript("uicommons", "ngDialog/ngDialog.js")
    ui.includeJavascript("facilityreporting", "bootstrap.min.js")
    ui.includeJavascript("facilityreporting", "facilityDataset.js")


    ui.includeCss("uicommons", "ngDialog/ngDialog.min.css")
    ui.includeCss("uicommons", "styleguide/jquery-ui-1.9.2.custom.min.css")
    ui.includeCss("facilityreporting", "index.css")
    ui.includeCss("facilityreporting", "facilityReporting.css")

    ui.includeCss("facilityreporting", "bootstrap.min.css")
    def startFieldName = ""
    def endFieldName = ""

%>
<script type="text/javascript">

</script>

<div class="ke-page-sidebar">
    <div class="ke-panel-frame">
        ${ ui.includeFragment("kenyaui", "widget/panelMenu", [ heading: "Navigation", items: menuItems ]) }
    </div>
</div>

<div class="ke-page-content">
        <h2>Datasets for ${report.name} Report (${report.description})</h2>
        <div class="clear"></div>

        <% if (datasets) { %>
        <table class="simple-table">
            <tr>
                <th align="left">Dataset Name</th>
                <th align="left">Description</th>
                <th align="left">Mapping</th>
                <th align="left">Actions</th>
            </tr>
        <% datasets.each { ds -> %>

        <tr>
                <td>${ds.name}</td>

                <td>${ds.description ?: ""}</td>

                <td>${ds.mapping ?: ""}</td>
                <td>
                    <button
                            onclick="ui.navigate('${ ui.pageLink("facilityreporting", "reportIndicatorsList", [datasetId: ds.id, returnUrl: ui.thisUrl() ])}')">
                        <img src="${ui.resourceLink("kenyaui", "images/glyphs/view.png")}"/> View Indicators
                    </button>
                    <button type="button"
                            onclick="ui.navigate('${ ui.pageLink("facilityreporting", "reportSingleDatasetEntryForm", [ reportId: report.id, datasetId: ds.id, returnUrl: ui.thisUrl() ])}')">Enter Data</button>
                    <button type="button" class="fa fa-edit fa-1x"
                            onclick="ui.navigate('${ ui.pageLink("facilityreporting", "showListDataset", [ reportId: report.id, datasetId: ds.id, returnUrl: ui.thisUrl() ])}')">
                        Reporting history</button>
                </td>
        </tr>
        <% } %>
        </table>
        <% } else { %>

        <div>No Datasets defined</div>
        <% } %>
    <div>

</div>
    <div>
        New Table configurations
        <table class="table table-striped tables">
          <tr>
          <th>Report</th>
           <th>Start Date</th>
           <th>End Date</th>
           <th>Actions</th>
           </tr>
            <tr>
                <td >
                    MOH 731
                </td>
                <td >
                    Jan 1st

                </td>
                <td>
                    Jan 31st
                </td>
                <td>
                    <button class="addConfiguration" name="addConfiguration" type="button"
                            onclick="ui.navigate('${ ui.pageLink("facilityreporting", "facilityDatasetEntryForm", [reportId: report.id,  returnUrl: ui.thisUrl() ])}')">
                        <img src="${ui.resourceLink("kenyaui", "images/glyphs/add.png")}"/> Enter Data
                    </button>
                    <button type="button"
                            onclick="ui.navigate('${ ui.pageLink("facilityreporting", "viewAllReportData", [reportId: report.id,  returnUrl: ui.thisUrl() ])}')">
                        <img src="${ui.resourceLink("kenyaui", "images/glyphs/view.png")}"/>View Data
                    </button>
                    <button type="button">

                        <img src="${ui.resourceLink("kenyaui", "images/glyphs/edit.png")}"/>   Edit</button>
                </td>
            </tr>
        </table>
    </div>
    <div>
            <button class="addConfiguration" name="addConfiguration" type="button"
                    onclick="ui.navigate('${ ui.pageLink("facilityreporting", "newReportDatasetForm", [reportId: report.id, returnUrl: ui.pageLink("facilityreporting", "reportDatasetList", [reportId: report.id, returnUrl:ui.pageLink("facilityreporting", "facilityReportingHome")]) ])}')">
                <img src="${ui.resourceLink("kenyaui", "images/glyphs/add.png")}"/> Add Dataset
            </button>
        <button class="addConfiguration" name="addConfiguration" type="button"
                onclick="ui.navigate('${ ui.pageLink("facilityreporting", "facilityDatasetEntryForm", [reportId: report.id,  returnUrl: ui.thisUrl() ])}')">
            <img src="${ui.resourceLink("kenyaui", "images/glyphs/add.png")}"/> Enter all Dataset
        </button>


    </div>

</div>
