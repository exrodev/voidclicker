# Void Clicker Lite

insert menu picture here

Void Clicker Lite is an autoclicker made in a single batch file. This was supposed to be a updated version to have new clicker profiles but I quickly losed interest and so I decided to release without those profiles enabled.

---

Void Clicker uses some trickery to run Powershell code in the same file which then runs C# code making it able to simulate a click.

You can join the Discord [here.](https://dsc.gg/voidclicker)

---

## How to use

Type in the name of the profile you would like to load and press enter and it will load that profile. Alternatively, you can just type in the number of the profile and that will also load it.

The key-binds are shown on how to use it from there and they can be edited near the top of the file.

insert file picture here

You can numbers on the right side the of the description, those are the arguments provided to that profile. 

insert rect picture here

If you would like to use custom CPS values for a profile, you can type in the name of the profile, and then corresponding arguments. For all of the default profiles (excluding `ClickPlayer`), the arguments are first minimum CPS and then maximum CPS. An example could be: 
```
OldVoidA 15 19
```
This will load the `OldVoid` profile with a minimum of 15 CPS and maximum of 19 CPS. These values may be a little off due to limitations and it being an old profile.

---

## Click Player

You can record your clicks and play them back using the click player feature. There is a default clicks file already provided which is loaded by default when you select the `ClickPlayer` profile.

You can create your own recordings by opening up the `recorder.bat` and following the steps provided. Once you are done it will tell you how to load your click recording.

---

## Credits
exro - Developer