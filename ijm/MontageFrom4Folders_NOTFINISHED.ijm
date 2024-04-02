macro "batch_merge_channels"{
    setBatchMode(true);
    file1 = getDirectory("RED");
    list1 = getFileList(file1);
    n1 = lengthOf(list1);
    file2 = getDirectory("GREEN");
    list2 = getFileList(file2); 
    file3 = getDirectory("FAR_RED");
    list3 = getFileList(file3); 
    file4 = getDirectory("MERGED");
    list4 = getFileList(file4); 
    file4 = getDirectory("OUTPUT");
    //the output folder. When started first the number of files is 0
    list4 = getFileList(file4);
    n2 = lengthOf(list4);
    small = n1;
    //condition for for-loop

    for(i = n2 + 1; i < small; i++) {
      //i will always follow the aborted number of merges, you might not have the problem, 
      //but with small memory and a huge set of images it is useful
      name = list2[i];
      name = list3[i];
      //not to lose your track, though you can change it to anything else
      open(file1 + list1[i]);
      open(file2 + list2[i]);
      open(file3 + list3[i]);
      open(file4 + list4[i]);
      run("Merge Channels...", "c1=[" + list1[i] + "] c2=[" + list2[i] + "] c3=[" + list3[i] + "] keep");
      saveAs("tiff", file4 + name);
    }
}