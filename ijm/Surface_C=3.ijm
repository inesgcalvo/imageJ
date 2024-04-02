// open tif images ask for line for each channel save plotprofile
requires("1.50");

inDir = getDirectory("Choose images directory");
list = getFileList(inDir);

setBatchMode(true);

// create output folder
outDir = inDir + "OutPut"+ File.separator();
if (!File.isDirectory(outDir)) {
	File.makeDirectory(outDir);
}
run("Set Measurements...", "area mean limit redirect=None decimal=4");
for (i = 0; i < list.length; i++) {
      	  if (endsWith(list[i], ".tif")) {	// for all tif files 
				file = inDir + list[i];
				imageName = substring(list[i],0,indexOf(list[i],".tif")); // get file name without extension 
				open(file);
				run("Gaussian Blur...", "sigma=2 stack");
				for (c = 3; c <= nSlices; c++) {
					setSlice(c);			// set 1 channel
					setThreshold(10, 3000);
					run("Measure");
					setResult("Image", 0, imageName);
				}
				selectWindow("Results");
				saveAs("Results",outDir+imageName+".xls");
				run("Close");
				run("Convert to Mask", "method=Otsu background=Dark calculate");
				saveAs("Tiff..",outDir+imageName+"Mask.tif");
				close();
		  }
}