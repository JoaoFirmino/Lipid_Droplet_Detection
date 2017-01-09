/*
 * Check ROIs for certain criteria and analyze only if conditions are met
 olivier dot burri at epfl dot ch
 */

min_ratio = 0.85;


n_rois = roiManager("Count");

for(i=0; i<n_rois; i++) {
	roiManager("Select", i);
	List.setMeasurements;
	//Roundness
	roundness = List.getValue("Round");
	major = List.getValue("Major");
	minor = List.getValue("Minor");
	ratio =  minor / major;
	print(ratio);

	if (ratio > min_ratio) {
		countCells();
	}
	
}

/*
 * countCells should have the code for measuring the cells
 */
function countCells() {
	// This should count the cells inside the selected region of interest
	roi_name = Roi.getName();
	run("Properties... ", "stroke=blue");
	roiManager("Update");
	print("ROI "+roi_name+" measured");
	
}