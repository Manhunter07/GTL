# GTL
***Generic Type Library*** - *An RTL consisting of useful or or improved generic types*

## What's the idea behind this?
Not only are there many useful generic types missing in Delphi, it's also often a mess working with them. Either because they work somehow awkward and pretty different from how you expect them to work, or they have flaws in their design. It's also often the case that they do not support certain features that you want/need from them.
Whatever is the case, this library offers many classes that allow you to implement endless kinds of different features through the use of generics. May it be tuples, nullables, lists, dictionaries or array helpers.
The easy-to-use pre-designed and often also ready-to-use comparers are a valuable alternative to those included in the later Delphi versions, with anything available you might need, but in less classes and far more intuitive to use.

## How can I use this library?
It's simple: Just clone (or, if you don't wish this, download) this library and put it into some location in your documents where you'd like it to be. I recommend a place where the current use has writing permissions, so that you can edit or update the library if you wish to.
Once done, start Delphi, go to *Tools* > *Options...* > *Language* > *Delphi options* > *Library* > *Library path* and add the *Source* folder of this library to your library paths. If you want to use pre-compiled DCUs in your projects, you may also add the DCUs folder to your browsing paths.
When writing your code, simply link the units in your `uses` clause. The classes are then available in your source code.

## Are there samples available?
Unfortunarly, as of now, there are no samples available. That's because I was actually never planning to publish it and only did so because a hell lot of people asked me to do so. Therefore, you will sometimes need to look at the code to see what a method or type does. However, since this library is designed to be as simple and easy-to-use as possible, I doubt it will be necessary that often.

## Where can I find the lists, dictionaries, array helpers, ...?
As of right now, these units are not included in the library, yet. Simply, because they are not ready for use. But I am working on them and I hope to release them into this library over the next weeks/months. I am sorry about this, but I can promise you: They are worth the waiting!

## Am I permitted to edit or re-publish the files?
Yes, you can basically do anything with this library. This library is available under the *Mozilla Public License* (short: *MPL*) 2.0 and may be redistributed under it. However, please follow the license terms written in the license and do not claim copyright for work you haven't done. You do not have to credit me or anything, but it would of course still be a gentleman job if you do.
In case you want to fork the repository and want me to merge it, please stick to the formatting and code design conventions I was using allover the project.

## Feature X is missing/buggy/needless, what can I do?
In case you have an own contribution to this library, feel free to either fork it, or create an issue. I will then decide whether or not it should be moved into the main branch.
Please try to understand that I work on this as a side-project and will not be able to spend several hours a day on it. If you think there is something really important missing or if you found a bug, and there is nothing you can do about it or you do not know how how to get it done, just create an issue and I will try to look into it as soon as possible. Please do **not** create more than one issue for the same problem!
