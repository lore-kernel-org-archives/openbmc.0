Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qW4450bHRzDq72
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 22:30:28 +1100 (AEDT)
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 24 Mar 2016 16:50:18 +0530
Received: from d28relay04.in.ibm.com (9.184.220.61)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 24 Mar 2016 16:50:15 +0530
X-IBM-Helo: d28relay04.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2OBJYU432571518
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 16:49:36 +0530
Message-Id: <201603241119.u2OBJYU432571518@d28relay04.in.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 24 Mar 2016 05:20:08 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 24 Mar 2016 05:20:06 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Thu, 24 Mar 2016 11:20:04 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 24 Mar 2016 11:20:02 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016032411200065-139790 ;
 Thu, 24 Mar 2016 11:20:00 +0000 
MIME-Version: 1.0
Subject: Fw: [PATCH skeleton v4 07/13] fix info memory leak
To: OpenBMC_Members@d28relay04.in.ibm.com, openbmc <openbmc@lists.ozlabs.org>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Thu, 24 Mar 2016 16:49:58 +0530
X-KeepSent: 5134F466:BB1F8741-65257F80:003E2852;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 45155
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2"
x-cbid: 16032411-0025-0000-0000-00000ADADFE6
X-IBM-ISS-SpamDetectors: Score=0.38988; BY=0.132435; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.38988; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005074; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000154; SDB=6.00677924; UDB=6.00310717; UTC=2016-03-24
 11:20:03
x-cbparentid: 16032411-5938-0000-0000-000002B2F782
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
X-List-Received-Date: Thu, 24 Mar 2016 11:30:29 -0000

--0__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2
Content-type: multipart/alternative; 
	Boundary="1__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2"


--1__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Resending since my previous mail bounced back...

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------
----- Forwarded by Vishwanatha Subbanna/India/IBM on 24/03/2016 04:48 pm
-----

From:	Vishwanatha Subbanna/India/IBM
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Members
Cc:	openbmc@lists.ozlabs.org, Ken <ken1029@gmail.com>
Date:	23/03/2016 12:45 pm
Subject:	Re: [PATCH skeleton v4 07/13] fix info memory leak


hello,

I wonder if you wanted to say "Fix resource leak" as I don't see any memory
leak getting fixed here. Am I missing anything ?

Also, a close(fd) on open failure may lead to unexpected behavior since the
file is not even opened.

Also, the pattern seems to be multiple error paths with same set of
instructions. Does it make sense to put them in a macro -or- better yet
have fd auto cleaned using the cleanup attribute ?

https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MG2-6F-255 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-46678255
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------



From:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
To:	openbmc@lists.ozlabs.org
Cc:	Ken <ken1029@gmail.com>
Date:	23/03/2016 11:25 am
Subject:	[PATCH skeleton v4 07/13] fix info memory leak
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



From: Ken <ken1029@gmail.com>

---
 objects/info.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/objects/info.c b/objects/info.c
index ab2d98c..d872c3f 100644
--- a/objects/info.c
+++ b/objects/info.c
@@ -42,6 +42,7 @@ static int i2c=5Fopen() {
   fd =3D open(fn, O=5FRDWR);
   if (fd =3D=3D -1) {
     LOG=5FERR(errno, "Failed to open i2c device %s", fn);
+    close(fd);
     return -1;
   }

@@ -108,6 +109,7 @@ static int i2c=5Fio(int fd) {
   rc =3D ioctl(fd, I2C=5FRDWR, &data);
   if (rc < 0) {
     LOG=5FERR(errno, "Failed to do raw io");
+    close(fd);
     return -1;
   }

@@ -126,6 +128,7 @@ int get=5Fhdd=5Fstatus(void)
   }

   if (i2c=5Fio(fd) < 0) {
+    close(fd);
     return -1;
   }

@@ -145,7 +148,7 @@ int get=5Fhdd=5Fstatus(void)

     g=5Fread=5Ftmp[2]=3Dg=5Fread=5Fbytes[2];
     g=5Fread=5Ftmp[3]=3Dg=5Fread=5Fbytes[3];
-
+    close(fd);
 }

 int send=5Fesel=5Fto=5Fdbus(const char *desc, const char *sev, const char
*details, uint8=5Ft *debug, size=5Ft debuglen) {
--
2.7.1


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc




--1__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Resending since my previous mail bounced back...<br><br>Than=
ks<br><br>-----------------------------------------------------------------=
--------------------<br>Thanks and Regards,<br>Vishwanath.<br>Advisory Soft=
ware Engineer,<br>Power Firmware Development, <br>Systems &amp;Technology L=
ab,<br>MG2-6F-255 , Manyata Embassy Business Park, <br>Bangalore , KA , 560=
045<br>Ph: +91-80-46678255<br>E-mail: vishwanath@in.ibm.com<br>------------=
----------------------------------------------------------------------<br><=
font size=3D"2" color=3D"#800080">----- Forwarded by Vishwanatha Subbanna/I=
ndia/IBM</font><font size=3D"2" color=3D"#800080"> on 24/03/2016 04:48 pm</=
font><font size=3D"2" color=3D"#800080"> -----</font><br><br><font size=3D"=
2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Vishwanatha Subba=
nna/India/IBM</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </fon=
t><font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;, OpenB=
MC Members</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><=
font size=3D"2">openbmc@lists.ozlabs.org, Ken &lt;ken1029@gmail.com&gt;</fo=
nt><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D=
"2">23/03/2016 12:45 pm</font><br><font size=3D"2" color=3D"#5F5F5F">Subjec=
t:        </font><font size=3D"2">Re: [PATCH skeleton v4 07/13] fix info me=
mory leak</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade st=
yle=3D"color:#8091A5; "><br><br>hello,<br><br>I wonder if you wanted to say=
 &quot;Fix resource leak&quot; as I don't see any memory leak getting fixed=
 here. Am I missing anything ?<br><br>Also, a close(fd) on open failure may=
 lead to unexpected behavior since the file is not even opened.<br><br>Also=
, the pattern seems to be multiple error paths with same set of instruction=
s. Does it make sense to put them in a macro -or- better yet have fd auto c=
leaned using the cleanup attribute ?<br><br><a href=3D"https://gcc.gnu.org/=
onlinedocs/gcc/Common-Variable-Attributes.html">https://gcc.gnu.org/onlined=
ocs/gcc/Common-Variable-Attributes.html</a><br><br>Thanks<br><br>----------=
---------------------------------------------------------------------------=
<br>Thanks and Regards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Po=
wer Firmware Development, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , =
Manyata Embassy Business Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46=
678255<br>E-mail: vishwanath@in.ibm.com<br>--------------------------------=
--------------------------------------------------<br><br><img width=3D"16"=
 height=3D"16" src=3D"cid:1=5F=5F=3DEABBF513DFADAEC28f9e8a93df938690918cEAB=
@" border=3D"0" alt=3D"Inactive hide details for OpenBMC Patches ---23/03/2=
016 11:25:19 am---From: Ken &lt;ken1029@gmail.com&gt; ---"><font color=3D"#=
424282">OpenBMC Patches ---23/03/2016 11:25:19 am---From: Ken &lt;ken1029@g=
mail.com&gt; ---</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:    =
    </font><font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&g=
t;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font siz=
e=3D"2">openbmc@lists.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5=
F">Cc:        </font><font size=3D"2">Ken &lt;ken1029@gmail.com&gt;</font><=
br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">=
23/03/2016 11:25 am</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:  =
      </font><font size=3D"2">[PATCH skeleton v4 07/13] fix info memory lea=
k</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font=
 size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com=
@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left=
" noshade style=3D"color:#8091A5; "><br><br><br><tt>From: Ken &lt;ken1029@g=
mail.com&gt;<br><br>---<br> objects/info.c | 5 ++++-<br> 1 file changed, 4 =
insertions(+), 1 deletion(-)<br><br>diff --git a/objects/info.c b/objects/i=
nfo.c<br>index ab2d98c..d872c3f 100644<br>--- a/objects/info.c<br>+++ b/obj=
ects/info.c<br>@@ -42,6 +42,7 @@ static int i2c=5Fopen() {<br> &nbsp; fd =
=3D open(fn, O=5FRDWR);<br> &nbsp; if (fd =3D=3D -1) {<br> &nbsp; &nbsp; LO=
G=5FERR(errno, &quot;Failed to open i2c device %s&quot;, fn);<br>+ &nbsp; &=
nbsp;close(fd);<br> &nbsp; &nbsp; return -1;<br> &nbsp; }<br> <br>@@ -108,6=
 +109,7 @@ static int i2c=5Fio(int fd) {<br> &nbsp; rc =3D ioctl(fd, I2C=5F=
RDWR, &amp;data);<br> &nbsp; if (rc &lt; 0) {<br> &nbsp; &nbsp; LOG=5FERR(e=
rrno, &quot;Failed to do raw io&quot;);<br>+ &nbsp; &nbsp;close(fd);<br> &n=
bsp; &nbsp; return -1;<br> &nbsp; }<br> <br>@@ -126,6 +128,7 @@ int get=5Fh=
dd=5Fstatus(void)<br> &nbsp; }<br> <br> &nbsp; if (i2c=5Fio(fd) &lt; 0) {<b=
r>+ &nbsp; &nbsp;close(fd);<br> &nbsp; &nbsp; return -1;<br> &nbsp; }<br> <=
br>@@ -145,7 +148,7 @@ int get=5Fhdd=5Fstatus(void)<br> <br> &nbsp; &nbsp; =
g=5Fread=5Ftmp[2]=3Dg=5Fread=5Fbytes[2];<br> &nbsp; &nbsp; g=5Fread=5Ftmp[3=
]=3Dg=5Fread=5Fbytes[3];<br>-<br>+ &nbsp; &nbsp;close(fd);<br> }<br> <br> i=
nt send=5Fesel=5Fto=5Fdbus(const char *desc, const char *sev, const char *d=
etails, uint8=5Ft *debug, size=5Ft debuglen) {<br>-- <br>2.7.1<br><br><br>=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openb=
mc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://=
lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbm=
c</a></tt><tt><br></tt><br><br><br><BR>
</body></html>

--1__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2--


--0__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF513DFADAEC28f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF513DFADAEC28f9e8a93df938690918cEABBF513DFADAEC2--
