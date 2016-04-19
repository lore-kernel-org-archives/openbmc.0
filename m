Return-Path: <austenc@us.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqHTm219DzDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 07:00:27 +1000 (AEST)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 19 Apr 2016 15:00:25 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Apr 2016 15:00:21 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 5C01C19D8096
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:48:06 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3JL0FQ641156742
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:00:15 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3JL0E13001683
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 15:00:14 -0600
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3JL0ERU001593
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 15:00:14 -0600
Message-Id: <201604192100.u3JL0ERU001593@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 19 Apr 2016 17:00:14 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 19 Apr 2016 17:00:11 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 19 Apr 2016 21:00:10 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 19 Apr 2016 21:00:07 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016041921000716-490463 ;
 Tue, 19 Apr 2016 21:00:07 +0000 
In-Reply-To: <201604191645.u3JGj1BD018480@d03av04.boulder.ibm.com>
Subject: Re: Several general questions
From: "Chris Austen" <austenc@us.ibm.com>
To: "Norman James" <njames@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, shays@mellanox.com
Date: Tue, 19 Apr 2016 21:00:06 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04042016_FP6 April 15, 2016
X-LLNOutbound: False
X-Disclaimed: 59607
X-TNEFEvaluated: 1
Content-Type: multipart/related; boundary="=_related 00735DE900257F9A_="
x-cbid: 16041921-8236-0000-0000-0000264A00C0
X-IBM-ISS-SpamDetectors: Score=0.410169; BY=0.020197; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410169; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005177; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000159; SDB=6.00690468; UDB=6.00318164; UTC=2016-04-19
 21:00:08
x-cbparentid: 16041921-9588-0000-0000-0000031D0CF6
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 21:00:28 -0000


--=_related 00735DE900257F9A_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>I semi answered the rest.&nbsp; Hoping Teddy or othe=
rs can really address #5</div>
<div>&nbsp;</div>
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px;=
 direction:ltr; margin-right:0px" >----- Original message -----<br>From: No=
rman James/Austin/IBM@IBMUS<br>Sent by: "openbmc" &lt;openbmc-bounces+auste=
nc=3Dus.ibm.com@lists.ozlabs.org&gt;<br>To: Shay Slobodkin &lt;shays@mellan=
ox.com&gt;<br>Cc: "openbmc@lists.ozlabs.org" &lt;openbmc@lists.ozlabs.org&g=
t;<br>Subject: Re: Several general questions<br>Date: Tue, Apr 19, 2016 11:=
45 AM<br>&nbsp;
<p>I answered 1, 3, and 6<br><br><br>Regards,<br>Norman James<br>IBM - POWE=
R Systems Architect<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: n=
james@us.ibm.com<br><br><br><img  alt=3D"Inactive hide details for Shay Slo=
bodkin ---04/19/2016 10:12:49 AM---Hi, We have some general questions from =
our latest experie" src=3D"cid:1=5F=5F=3D09BBF509DFCB9B178f9e8a93df93869091=
8c09B@" height=3D"16" border=3D"0" width=3D"16" ><font color=3D"#424282" >S=
hay Slobodkin ---04/19/2016 10:12:49 AM---Hi, We have some general question=
s from our latest experience with the project:</font><br><br><font color=3D=
"#5F5F5F" size=3D"2" >From: </font><font size=3D"2" >Shay Slobodkin &lt;sha=
ys@mellanox.com&gt;</font><br><font color=3D"#5F5F5F" size=3D"2" >To: </fon=
t><font size=3D"2" >"openbmc@lists.ozlabs.org" &lt;openbmc@lists.ozlabs.org=
&gt;</font><br><font color=3D"#5F5F5F" size=3D"2" >Date: </font><font size=
=3D"2" >04/19/2016 10:12 AM</font><br><font color=3D"#5F5F5F" size=3D"2" >S=
ubject: </font><font size=3D"2" >Several general questions</font><br><font =
color=3D"#5F5F5F" size=3D"2" >Sent by: </font><font size=3D"2" >"openbmc" &=
lt;openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org&gt;</font></p>
<hr style=3D"color:#8091A5; " align=3D"left" size=3D"2" width=3D"100%" ><br=
><br><br><font face=3D"Calibri" >Hi,</font><br><br><font face=3D"Calibri" >=
We have some general questions from our latest experience with the project:=
</font><br><br><font face=3D"Calibri" >1. We saw some corresponding about o=
ut of the box experience and we were wondering how does the BMC should be b=
urnt for the first time in production. Currently we have limited speed of d=
ebug UART on AST2520, also Aspeed recommend to use this interface for debug=
 purpose only. We also faced a problem to burn BMC using Abatron BDI3000, d=
oes anyone have experience working with it?</font><br><br><font face=3D"Cal=
ibri" >&gt;&gt; For the first time flash, an external SPI flash programmer =
is usually used. The DediProg SF100 works with no issues.</font><br><br><br=
><font face=3D"Calibri" >2. Several u-boot versions were mentioned this wee=
k at mailing list, we currently use u-boot based on 2013.7 with porting AST=
2520 stuff from Aspeed EVB u-boot. Can you suggest a u-boot version to merg=
e with?</font></blockquote>
<blockquote class=3D"history-quote-1461098550345" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" style=3D"border-left:solid #aaaaaa 2=
px; margin-left:5px; padding-left:5px; direction:ltr; margin-right:0px" >&g=
t;&gt; CA: Stay with the Teddy/Joel talk as it seems like they are just a c=
ouple of weeks away from getting us up to 2016.03.</blockquote>
<blockquote class=3D"history-quote-1461098550345" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" style=3D"border-left:solid #aaaaaa 2=
px; margin-left:5px; padding-left:5px; direction:ltr; margin-right:0px" ><b=
r><font face=3D"Calibri" >3. Is there some standard method performing BMC u=
pgrade on site from host CPU? Is there a best practice of upgrade granulari=
ty? Meaning, do you suggest to upgrade whole image or maybe just specific p=
artition (only DTB for example)?</font><br><br><font face=3D"Calibri" >&gt;=
&gt; When flashing from the host, we do no currently support a partial upgr=
ade. We boot the BMC into a mode where it doesn't use the flash filesystem =
and then use SOCFlash from Aspeed. You can reboot the BMC into this special=
 mode with ipmitool from host CPU. Through REST, we do support upgrades of =
kernel, readonly filesystem, rw filesystem, and uboot separately. In the de=
ploy directory, the image-* files are for this and packaged up in the tar. =
</font><br><br><font face=3D"Calibri" >4. We saw that most openbmc systems =
are using jffs2 file system. We thought to use ubifs as it has some advanta=
ges over jffs2. Can you share the motivation of using jffs2 for BMC project=
 and is there special reason for doing so?</font></blockquote>
<blockquote class=3D"history-quote-1461098550345" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" style=3D"border-left:solid #aaaaaa 2=
px; margin-left:5px; padding-left:5px; direction:ltr; margin-right:0px" ><f=
ont face=3D"Calibri" >&gt;&gt; CA: simply because jffs2 was designed for fl=
ash file systems, it was known, we knew how to work with it.&nbsp; Ubifs ha=
s some nice wear leveling support and that was not something we needed to b=
e concerned about with our use of PNOR flash.&nbsp; We did not perform any =
review of ubifs, so it seems reasonable to think (barring flash image size)=
 that ubifs could be used</font><br><br><font face=3D"Calibri" >5. Some Asp=
eed EVB drivers such as USB, PWM were not ported to openbmc kernel tree yet=
. We were planning to port them and wonder if there is any special reason t=
hey weren=E2=80=99t ported yet.</font></blockquote>
<blockquote class=3D"history-quote-1461098550345" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" style=3D"border-left:solid #aaaaaa 2=
px; margin-left:5px; padding-left:5px; direction:ltr; margin-right:0px" ><f=
ont face=3D"Calibri" >&gt;&gt; CA: The only reason why they were not on the=
 AST2400 was because we never used them.&nbsp; I suspect another company on=
 this distro does already have versions of the USB (and maybe PWM?) for the=
 4.1</font> kernel.&nbsp; Joel is working to get the AST2500 Kernel up to 4=
.4 however the priority for USB and PWM is likely lower.&nbsp; If you are p=
ushing towards support for them on the 4.4 Kernel work with Teddy and his g=
roup for the design beyond basic operations.&nbsp;</blockquote>
<blockquote class=3D"history-quote-1461098550345" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" style=3D"border-left:solid #aaaaaa 2=
px; margin-left:5px; padding-left:5px; direction:ltr; margin-right:0px" ><b=
r><font face=3D"Calibri" >6. Building the project yields a lot of files und=
er the =E2=80=9Cdeploy=E2=80=9D folder of build. We were wondering which fi=
les to use for simply flashing a system (using flashcp?) and which should b=
e used for production.</font><br><br><font face=3D"Calibri" >&gt;&gt; flash=
-[system=5Fname] can be directly flashed with the a programmer, SOCFlash, o=
r flashcp. </font><br><br><font face=3D"Calibri" >Thank you for your assist=
ance,</font><br><font face=3D"Calibri" >Shay</font><br><tt>=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list=
<br>openbmc@lists.ozlabs.org</tt><br><tt><a href=3D"https://lists.ozlabs.or=
g/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.org/listinfo/=
openbmc</a></tt><br><br><br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.o=
rg/listinfo/openbmc</a></font></div></blockquote></div></div></div></div>
<BR>
--=_related 00735DE900257F9A_=
Content-Type: image/gif; name="Image.1__=09BBF509DFCB9B178f9e8a93df938690918c09B@.gif"
Content-Disposition: inline; filename="Image.1__=09BBF509DFCB9B178f9e8a93df938690918c09B@.gif"
Content-ID: <1__=09BBF509DFCB9B178f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--=_related 00735DE900257F9A_=
Content-Type: image/gif; name="Image.1__=09BBF509DFCB9B178f9e8a93df938690918c09B@.gif"
Content-Disposition: inline; filename="Image.1__=09BBF509DFCB9B178f9e8a93df938690918c09B@.gif"
Content-ID: <1__=09BBF509DFCB9B178f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--=_related 00735DE900257F9A_=--
