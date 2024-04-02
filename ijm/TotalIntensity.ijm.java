requires("1.50");

dir = getDirectory("Choose Directory Containing tif Files");
list = getFileList(dir);
setBatchMode(true);

fileResults = File.open(dir+"results.xls");
print(fileResults, "Image\tArea\tMean\tIntDen\n");
run("Set Measurements...", "area mean integrated redirect=None decimal=2");
for (i = 0; i <list.length; i++) {
	if (endsWith(list[i], ".tif")) {
		path = dir + list[i];
		fileName = substring(list[i],0,indexOf(list[i],".tif")); // get file name without extension
          	open(path);
          	getDimensions(width,height,channels,slices,frames);
			run("Median...", "radius=1");
			setAutoThreshold("Otsu dark");
			setOption("BlackBackground", false);
			run("Convert to Mask");
			run("Close");
			run("Set Measurements...", "area mean integrated redirect=None decimal=2");
			run("Measure");
			for (n = 0; n < nResults; n++) {
				print(fileResults,fileName+"\t"+getResult("Area",n)+"\t"+getResult("Mean",n)+"\t"+getResult("IntDen",n)+"\n");
			}
			close();
	}
}
File.close(fileResults);
showStatus("Process done...");
