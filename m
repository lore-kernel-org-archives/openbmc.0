Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=47.43.20.26; helo=impout002.msg.chrl.nc.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
X-Greylist: delayed 340 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Oct 2018 12:24:54 AEST
Received: from impout002.msg.chrl.nc.charter.net
 (impout002aa.msg.chrl.nc.charter.net [47.43.20.26])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QcD64nxxzF36s
 for <openbmc@lists.ozlabs.org>; Thu,  4 Oct 2018 12:24:53 +1000 (AEST)
Received: from [192.168.2.7] ([97.86.254.207]) by cmsmtp with ESMTPA
 id 7tCOgRNJkv4rp7tCsgTX0w; Thu, 04 Oct 2018 02:17:38 +0000
Authentication-Results: charter.net; none
X-Authority-Analysis: v=2.3 cv=KKLu82No c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=x7bEGLp0ZPQA:10 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8
 a=NEAV23lmAAAA:8 a=8pif782wAAAA:8 a=enL2CNXqAAAA:8 a=mNJNSIhLVml0yPhIm9wA:9
 a=6EB7x6VdRA40xxlY:21 a=Ji1K9wa-eZTekEZR:21 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
Subject: Re: NEW GUI Design work group starts Wed, Oct 17
To: openbmc@lists.ozlabs.org
References: <mailman.2947.1538599401.866.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <5792cd88-a8b4-6b5b-b852-5ffd0e573150@charter.net>
Date: Wed, 3 Oct 2018 21:17:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.2947.1538599401.866.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfDuiFZhXn6qE2vBqVyNiM0SFJ/o+0CQR8yCGB/WUizy+3HfzrxhEPdE+v19xoSFMr08BTP6BEeB+6nHRyzfkbnFLOTzODdoax1p8dN1ibWcOhuf+yXcO
 t/ihzoUCLbaoX7UAKEXwKMMjX5UlruvXxkT/aeOxBppGV36JAPT2OCCP7Q3rXdT1eDI+iH642QZigA==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2018 02:24:55 -0000


> Message: 1
> Date: Wed, 3 Oct 2018 13:01:52 -0500
> From: susan jasinski <susantjasinski@gmail.com>
> To: openbmc@lists.ozlabs.org
> Subject: NEW GUI Design work group starts Wed, Oct 17
> Message-ID:
> 	<CANT4Nr+UGpw7j7BpBOmxLxMzgW10Uk=1t6sg1frnwuS2Kq9j2A@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
>
> Hello everyone.
>
> My name is Susan Jasinski, and I am the UX Design Lead for the IBM OpenBMC
> GUI. Alissa Lee and I will be hosting a new bi-monthly OpenBMC work group
> for reviewing new GUI designs. It will be held on the first and third
> Wednesdays of the month.

Welcome!  And thank you for taking on this work.

> Generally, my team will request feedback on GUI designs BEFORE they are
> coded. This could include wireframes, high-fidelity mockups, interactive
> prototypes, and panel flows. If others have pre-code designs they would
> like to share with the community, feel free to add yourself to the agenda.
>
> However, during this first meeting I'd like to discuss how to openly and
> consistently share mockups, provide feedback and track revisions.
>
> Access to the web conference link and the agenda can be found in the
> openbmc-openbmc wiki (just above the Weekly Community Telecon wiki link) .
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>
> Links to mockups will be sent via email and IRC prior to the meeting.
> Please join the conversation even if you did not have time to review
> designs before-hand.

I followed the wiki to the invisionapp site, and found a sequence of 
images which show firmware update, login, etc.  Creating a free acount 
so could add comments was quick and painless.  I can see this working as 
a way to communicate complex visual design.

However, I'm confused about your intention for this batch of images.  Is 
this intended as a sample of the invisionapp review process?  If so, I 
left a comment on page 1 of 66.  Or do these images represent your first 
designs?  If so, it would help me if you give the purpose for the design 
and then walk through some scenarios.

Example purpose: The "webui/firmware update" (images 1-19) is for system 
administrators who have a firmware image either {on their workstation, 
reachable from the BMC's TFTP server, or already on the BMC} and need a 
GUI to upload and re-configure their server's installed firmware (as in 
https://en.wikipedia.org/wiki/Software_configuration_management from the 
system administrators point of view).

Example scenario "webui/firmware update/error uploading image":
  * Link to starting image: 
https://ibm.invisionapp.com/share/YSNTBXAJGUC#/screens/318858591
  * Covers images 1-4
  - When signed into the webui at the "firmware" tab,
  - with the "Upload image file from workstation" button selected,
  - enter "file.png" in the "Choose file" text entry field (where the 
file exists and is not a valid firmware image)
  - and click the "Upload firmware" button.
  - The "Upload in progress" bar will appear while the file is being 
uploaded, then disappears and
  - the "Error uploading image" dialog box appears.
  - Clicking its "Close" button makes the box go away and does not 
change the "Choose file" field.

Please note that my example scenario makes a number of assumptions which 
should be explicit in the design.  Examples: Does the "Choose file" 
button bring up a file selector box?  Is the filename next to it 
editable?  On image 4, does the filename really change to "image_file.png"?
(Also, I don't know if the link to will work for everyone.)  :-)

I hope you understand that I am not trying to pick on you, but to 
elevate the level of documentation for the overall OpenBMC project. I 
believe writing scenarios like this will help draw more participation to 
your review which will foster better shared understanding and create 
better results.  Not just for webui, but for all of OpenBMC's functional 
areas. </soapbox>

> I am looking forward to seeing you all next week.
>
> -- Susan Jasinski (IBM Lead Designer and User Experience designer)
