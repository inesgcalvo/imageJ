macro "batch_merge_channels"

{
    setBatchMode(true);
    file1 = getDirectory("MERGED");
    list1 = getFileList(file1);
    n1 = lengthOf(list1);
    //the output folder. When started first the number of files is 0
    file4 = getDirectory("OUTPUT");
    list4 = getFileList(file4);
    n2 = lengthOf(list4);
    small = n1;
    //condition for for-loop

    for(i = n2 + 1; i < small; i++) {
      name = list1[i];
      open(file1 + list1[i]);
      run("RGB Stack");
	  run("Make Montage...", "columns=3 rows=1 scale=0.25");
      saveAs("tiff", file4 + name);
    }
}