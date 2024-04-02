requires("1.50");

inDir = getDirectory("Choose images directory");
list = getFileList(inDir);

setBatchMode(false);

// create output folder
outDir = inDir + "OutPut"+ File.separator();
if (!File.isDirectory(outDir)) {
	File.makeDirectory(outDir);
}
for (i = 0; i < list.length; i++) {
      	  if (endsWith(list[i], ".tif")) {	// for all tif files 
				file = inDir + list[i];
				imageName = substring(list[i],0,indexOf(list[i],".tif")); // get file name without extension 
				open(file);
				run("Z Project...", "projection=[Max Intensity]");
				saveAs("jpg", imageName); 
				close();
		  }
}

				