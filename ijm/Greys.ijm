dir_ch00 = getDirectory("Repertoire contenant ch00");

dir_result = getDirectory("Repertoire de sauvegarde des images 8bits");

list_ch00 = getFileList(dir_ch00);

setBatchMode(true);
for (i=0; i<list_ch00.length; i++) {
	showProgress(i+1, list_ch00.length);
	open(dir_ch00+list_ch00[i]);
	resetMinAndMax();
	run("Grays");
	saveAs("Jpeg", dir_result+list_ch00[i]);
	close();
}


