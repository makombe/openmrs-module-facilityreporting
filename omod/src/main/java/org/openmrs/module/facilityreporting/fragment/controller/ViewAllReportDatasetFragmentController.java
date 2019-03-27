package org.openmrs.module.facilityreporting.fragment.controller;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ObjectNode;
import org.openmrs.module.facilityreporting.api.FacilityreportingService;
import org.openmrs.module.facilityreporting.api.models.FacilityReport;
import org.openmrs.module.facilityreporting.api.models.FacilityReportData;
import org.openmrs.module.facilityreporting.api.models.FacilityReportDataset;
import org.openmrs.module.facilityreporting.api.models.FacilityReportIndicator;
import org.openmrs.ui.framework.fragment.FragmentConfiguration;
import org.openmrs.ui.framework.fragment.FragmentModel;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ViewAllReportDatasetFragmentController {
	
	FacilityreportingService service = org.openmrs.api.context.Context.getService(FacilityreportingService.class);
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	public void controller(FragmentConfiguration config, FragmentModel model,
	        @RequestParam("reportId") FacilityReport report, @RequestParam(value = "returnUrl") String returnUrl)
	        throws Exception {
		FacilityreportingService service = org.openmrs.api.context.Context.getService(FacilityreportingService.class);
		
		List<FacilityReportData> datasetConfigurations = service.getReportData(report, df.parse("2018-12-01"),
		    df.parse("2018-12-31"));
		ObjectMapper mapper = new ObjectMapper();
		List<JsonNode> reportData = new ArrayList<JsonNode>();
		for (FacilityReportData dt : datasetConfigurations) {
			JsonNode childNode = mapper.createObjectNode();
			JsonNode jsonNode = mapper.readValue(dt.getValue(), JsonNode.class);
			((ObjectNode) childNode).put("dataNode", jsonNode);
			
			reportData.add(childNode);
		}
		model.put("reportData", reportData);
	}
}
