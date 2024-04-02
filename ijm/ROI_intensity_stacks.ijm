requires("1.50");

inDir = getDirectory("Choose images directory");
list = getFileList(inDir);

setBatchMode(false);

// create output folder
outDir = inDir + "OutPut"+ File.separator();
if (!File.isDirectory(outDir)) {
	File.makeDirectory(outDir);
}
run("Brightness/Contrast...");
run("ROI Manager...");
run("Set Measurements...", "area mean integrated stack redirect=None decimal=3");
for (i = 0; i < list.length; i++) {
      	  if (endsWith(list[i], ".tif")) {	// for all tif files 
				file = inDir + list[i];
				imageName = substring(list[i],0,indexOf(list[i],".tif")); // get file name without extension 
				open(file);
				makeRectangle(1787, 80, 100, 100);
				waitForUser("Please select the ROI. Click OK when done");
				roiManager("multi-measure measure_all one append");
				selectWindow("Results");
				saveAs("Results",outDir+imageName+".xls");
				run("Close");
				close();
		  }
}

				