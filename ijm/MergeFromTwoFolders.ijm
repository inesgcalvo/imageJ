macro "merge_channels"{
    setBatchMode(false);
    file1 = getDirectory("RED");
    list1 = getFileList(file1);
    file2 = getDirectory("GREEN");
    list2 = getFileList(file2); 
    file3 = getDirectory("OUTPUT");
    //the output folder. When started first the number of files is 0
    list3 = getFileList(file3);
    n2 = lengthOf(list3);
    small = lengthOf(list1);
    //condition for for-loop

    for(i = 0; i < small; i++) 
    {
    name = list1[i];
    open(file1 + list1[i]);
    open(file2 + list2[i]);
	run("Merge Channels...", "c1=[" + list1[i] + "] c2=[" + list2[i] + "] create");
	selectWindow("Composite");
	saveAs("tiff", file3 + name);
	run("Close All");
	}    
}