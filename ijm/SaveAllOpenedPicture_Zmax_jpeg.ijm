// get image IDs of all open images 
dir = getDirectory("Choose a Directory"); 
ids=newArray(nImages); 
for (i=0;i<nImages;i++) { 
        selectImage(i+1); 
        title = getTitle; 
        print(title); 
        ids[i]=getImageID; 
		run("Z Project...", "projection=[Max Intensity]");
        saveAs("jpeg", dir+title); 
}