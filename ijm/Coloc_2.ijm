macro "Coloc_2 RED + GREEN in the RED"{
    setBatchMode(true);
    file1 = getDirectory("RED");
    list1 = getFileList(file1);
    n1 = lengthOf(list1);
    file2 = getDirectory("GREEN");
    list2 = getFileList(file2); 
    file3 = getDirectory("OUTPUT");
    //the output folder. When started first the number of files is 0
    list3 = getFileList(file3);
    n2 = lengthOf(list3);
    small = n1;
    //condition for for-loop

    for(i = n2 + 1; i < small; i++) {
      //i will always follow the aborted number of merges, you might not have the problem, 
      //but with small memory and a huge set of images it is useful
      name = list2[i];
      //not to lose your track, though you can change it to anything else
      open(file1 + list1[i]);
      open(file2 + list2[i]);
      run("Coloc 2", "channel_1=[" + list1[i] + "] channel_2=[" + list2[i] + "] roi_or_mask=[" + list1[i] + "] threshold_regression=Costes display_images_in_result display_shuffled_images li_histogram_channel_1 li_histogram_channel_2 li_icq spearman's_rank_correlation manders'_correlation kendall's_tau_rank_correlation 2d_instensity_histogram costes'_significance_test psf=3 costes_randomisations=10");
      selectWindow("Log");
      saveAs("txt", file3 + name);
    }
}
