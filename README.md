# fixFilepath

Install via Github: 
`remotes::install_github('https://github.com/cpilat97/fixFilepath')`

### Overview: 
The idea of this package is to make life a little easier when dealing with copying 
a file path from Windows File Explorer into an RScript. Generally, when you open 
windows file explorer and copy to file path, it contains single forward slashes. 

When you paste these file paths into an Rscript, you'll genearlly receive an error
because a single forward-slash is used as an escape character (this is particularly
important when using regex's in string arguments). But we're not looking to do any 
regex here....we just want to be able to copy a file path to an excel to load!!! 

So, when you copy a file path from Windows, you'll probably get something like this: 

`"C:\Users\cpilat97\Desktop\my_r_script\raw_dat.xlsx"` and when you go to use that
you get this error: 

```
cpilat>file_path_to_data <- "C:\Users\cpilat97\Desktop\my_r_script\raw_dat.xlsx"
Error: '\U' used without hex digits in character string starting ""C:\U"
```


So what to do? Well you could go through and change all the single forward slashes
to double forward slashes (this would be called "escaping"): 

`"C:\Users\cpilat97\Desktop\my_r_script\raw_dat.xlsx"` **becomes** 
`"C:\\Users\\cpilat97\\Desktop\\my_r_script\\raw_dat.xlsx"`

And this won't throw an error! **But** that creates another issue...you can't use that
escaped file path in the file explorer on windows. It creates an error!!!! So you can send that 
file path to a colleague without changing all the double forward slashes back to single. 

Another option is to change all the single forward slashes to a single backslash: 
`"C:\Users\cpilat97\Desktop\my_r_script\raw_dat.xlsx"` **becomes**
`"C:/Users/cpilat97/Desktop/my_r_script/raw_dat.xlsx"`

This file path works for both R scripts and plugging into a windows file explorer. But that's a
lot of manual changes to make....and creates the issue of you accidentally change or modifying 
a character in the file path. 

This small package hopes to solve all of this by automatically reading the copied filepath 
from your clipboard and changing all those forward slashes to backslashes for you!

## Main Uses: 

There are two main uses to this: 
1. You can use the function in an R script to paste it right in. For example, say you 
copy `"C:\Users\cpilat97\Desktop\my_r_script\raw_dat.xlsx"` you can use: 
```r
data_path <- fixFilepath::fix_filepath()
print(data_path)
"C:/Users/cpilat97/Desktop/my_r_script/raw_dat.xlsx"
```
The **main issue** above is if you don't save the printed out data_path, this doesn't become to 
reproducible later on. So be sure to copy & save the new/updated file path. 

So what this looks like is the following: 

![An image showing a code snippet of the above description. I'm writting a file path to the 
clipboard via clipr::write_clip, and then fixing it with the fix_filepath function, but 
also showing it's limits with reproducibility](/tools/images/using_file_func.png)



2. The other option is to use the add-in tool. In RStudio, on the top bar, go to "Addins", 
fixFilepath, and that will paste your corrected file path right in the RScript where your 
cursor is. You can also assign this to a short key to eliminate a few steps for you. 



