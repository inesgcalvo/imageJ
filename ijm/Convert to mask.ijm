// get image IDs of all open images 

inDir = getDirectory("Choose images directory");
list = getFileList(inDir);

setBatchMode(false);

for (i = 0; i < list.length; i++) {
	if (endsWith(list[i], ".tif")) {
		file = inDir + list[i];
				imageName = substring(list[i],0,indexOf(list[i],".tif")); // get file name without extension 
				open(file);
				run("Convert to Mask");
	}
}