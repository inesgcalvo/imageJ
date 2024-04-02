// open tif images ask for line for each channel save plotprofile
requires("1.50");

inDir = getDirectory("Choose images directory");
list = getFileList(inDir);

setBatchMode(false);

// create output folder
outDir = inDir + "OutPut"+ File.separator();
if (!File.isDirectory(outDir)) {
	File.makeDirectory(outDir);
}
n = 0;
run("Set Measurements...", "area mean min integrated stack limit redirect=None decimal=4");
for (i = 0; i < list.length; i++) {
      	  if (endsWith(list[i], ".tif")) {	// for all tif files 
				n ++;
      	  	  	file = inDir + list[i];
				imageName = substring(list[i],0,indexOf(list[i],".tif")); // get file name without extension 
				open(file);
				if (n == 1) {
					run("Threshold...");
					waitForUser("select Threshold");
				}
				setBatchMode("hide");
				for (c = 1; c <= nSlices; c++) {
					setThreshold(144, 65535);
					setSlice(c);			// set 1 channel
					run("Measure");
					setResult("Image", 0, imageName);
				}
				selectWindow("Results");
				saveAs("Results",outDir+imageName+".xls");
				run("Close");
				close();
		  }
}
