---
layout: post
title: ScanSnap S510M on Snow Leopard
published: true
---

**Update**: Fujitsu has posted an update on their website that addresses this issue. I'l leave this here for posterity.

For anyone looking to use the Fujitsu Scansnap S510M on Snow Leopard, you're probably tired of the error

> The file blahblahblah.pdf is not created by ScanSnap.  FineReader for ScanSnap can only process PDF files created by ScanSnap.

The problem is that FineReader is checking the PDF's creator code, and the creator code is different in 10.6 than it is in 10.5.  There's no really easy way to fix this.

But I have a fix.

Go into Terminal (/Applications/Utilities/Terminal.app) and type the following commands:

    wget http://static.ganon.com/pdftk
    sudo mkdir -p /usr/local/bin
    sudo mv pdftk /usr/local/bin/pdftk
    sudo chown root:wheel /usr/local/bin/pdftk
    sudo chmod a+x /usr/local/bin/pdftk

You'll be asked for your administrator password after the second command.  This downloads a pre-compiled [pdftk](http://www.accesspdf.com/pdftk/) binary and installs it on your system.

Now download [this automator workflow](http://static.ganon.com/FixPDF.workflow.tar.gz) and double-click it.  It will unzip the file and will produce a file called *FixPDF.workflow*.  Double-click on *that* and Autommator will open.  Click Save As and enter the name "Fix PDF".

You will now be able to right-click on a PDF file in Finder and select "Fix PDF" from the context menu.  This will fix the file and rename it adding "-fixed" at end of the file name.  The fixed file can be opened with FineReader.

