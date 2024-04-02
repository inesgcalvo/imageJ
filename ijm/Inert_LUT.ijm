{
file1 = getDirectory("INPUT");
list1 = getFileList(file1);
n1 = lengthOf(list1);
file2 = getDirectory("OUTPUT");
list2 = getFileList(file2); 
n2 = lengthOf(list2);
small = n1;

for(i = n2 + 1; i < small; i++) 
{
name = list1[i];
open(file1 + list1[i]);
run("Invert LUT");	
saveAs("TIF", file1 + name);  
run("Close All");
}
}
