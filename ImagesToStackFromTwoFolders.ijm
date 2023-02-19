macro "batch_merge_channels"{
    setBatchMode(false);
    file1 = getDirectory("RED");
    list1 = getFileList(file1);
    n1 = lengthOf(list1);
    file2 = getDirectory("GREEN");
    list2 = getFileList(file2); 
    file3 = getDirectory("OUTPUT");
    //the output folder. When started first the number of files is 0
    list3 = getFileList(file3);
    n2 = lengthOf(list3);
    small = n2;
    //condition for for-loop

    for(i = n2; i < small; i++) {
      //i will always follow the aborted number of merges, you might not have the problem, 
      //but with small memory and a huge set of images it is useful
      name = list1[i];
      open(file1 + list1[i]);
      open(file2 + list2[i]);
	  run("Images to Stack", "name=[] title=[] keep");
      saveAs("tiff", file3 + name);
	  run("Close All");
    }
}