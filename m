Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVLTh0yXpzDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 18:16:39 +1100 (AEDT)
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 23 Mar 2016 12:46:36 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 23 Mar 2016 12:46:34 +0530
X-IBM-Helo: d28relay01.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2N7GWjj35782680
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 12:46:33 +0530
Message-Id: <201603230716.u2N7GWjj35782680@d28relay01.in.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 23 Mar 2016 03:15:12 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 23 Mar 2016 03:15:11 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 23 Mar 2016 07:15:10 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 23 Mar 2016 07:15:09 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016032307150819-60319 ;
 Wed, 23 Mar 2016 07:15:08 +0000 
MIME-Version: 1.0
In-Reply-To: <1458712259-5454-8-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH skeleton v4 07/13] fix info memory leak
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC_Members@d28relay01.in.ibm.com
Cc: openbmc@lists.ozlabs.org, Ken <ken1029@gmail.com>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Wed, 23 Mar 2016 12:45:07 +0530
References: <1458712259-5454-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1458712259-5454-8-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: 4B7B3C06:7A1349A6-65257F7F:00273CDE;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 2267
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E"
x-cbid: 16032307-0021-0000-0000-00000B078E02
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132434; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005070; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000153; SDB=6.00677368; UDB=6.00310388; UTC=2016-03-23
 07:15:09
x-cbparentid: 16032307-9900-0000-0000-000006CB230B
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
X-List-Received-Date: Wed, 23 Mar 2016 07:16:40 -0000

--0__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E"


--1__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


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



--1__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hello,<br><br>I wonder if you wanted to say &quot;Fix resour=
ce leak&quot; as I don't see any memory leak getting fixed here. Am I missi=
ng anything ?<br><br>Also, a close(fd) on open failure may lead to unexpect=
ed behavior since the file is not even opened.<br><br>Also, the pattern see=
ms to be multiple error paths with same set of instructions. Does it make s=
ense to put them in a macro -or- better yet have fd auto cleaned using the =
cleanup attribute ?<br><br><a href=3D"https://gcc.gnu.org/onlinedocs/gcc/Co=
mmon-Variable-Attributes.html">https://gcc.gnu.org/onlinedocs/gcc/Common-Va=
riable-Attributes.html</a><br><br>Thanks<br><br>---------------------------=
----------------------------------------------------------<br>Thanks and Re=
gards,<br>Vishwanath.<br>Advisory Software Engineer,<br>Power Firmware Deve=
lopment, <br>Systems &amp;Technology Lab,<br>MG2-6F-255 , Manyata Embassy B=
usiness Park, <br>Bangalore , KA , 560045<br>Ph: +91-80-46678255<br>E-mail:=
 vishwanath@in.ibm.com<br>-------------------------------------------------=
---------------------------------<br><br><img width=3D"16" height=3D"16" sr=
c=3D"cid:1=5F=5F=3DEABBF5ECDFB4BA4E8f9e8a93df938690918cEAB@" border=3D"0" a=
lt=3D"Inactive hide details for OpenBMC Patches ---23/03/2016 11:25:19 am--=
-From: Ken &lt;ken1029@gmail.com&gt; ---"><font color=3D"#424282">OpenBMC P=
atches ---23/03/2016 11:25:19 am---From: Ken &lt;ken1029@gmail.com&gt; ---<=
/font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font =
size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br><fon=
t size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">openbmc@l=
ists.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </f=
ont><font size=3D"2">Ken &lt;ken1029@gmail.com&gt;</font><br><font size=3D"=
2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">23/03/2016 11:25 =
am</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><fon=
t size=3D"2">[PATCH skeleton v4 07/13] fix info memory leak</font><br><font=
 size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot=
;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org=
&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=
=3D"color:#8091A5; "><br><br><br><tt>From: Ken &lt;ken1029@gmail.com&gt;<br=
><br>---<br> objects/info.c | 5 ++++-<br> 1 file changed, 4 insertions(+), =
1 deletion(-)<br><br>diff --git a/objects/info.c b/objects/info.c<br>index =
ab2d98c..d872c3f 100644<br>--- a/objects/info.c<br>+++ b/objects/info.c<br>=
@@ -42,6 +42,7 @@ static int i2c=5Fopen() {<br> &nbsp; fd =3D open(fn, O=5F=
RDWR);<br> &nbsp; if (fd =3D=3D -1) {<br> &nbsp; &nbsp; LOG=5FERR(errno, &q=
uot;Failed to open i2c device %s&quot;, fn);<br>+ &nbsp; &nbsp;close(fd);<b=
r> &nbsp; &nbsp; return -1;<br> &nbsp; }<br> <br>@@ -108,6 +109,7 @@ static=
 int i2c=5Fio(int fd) {<br> &nbsp; rc =3D ioctl(fd, I2C=5FRDWR, &amp;data);=
<br> &nbsp; if (rc &lt; 0) {<br> &nbsp; &nbsp; LOG=5FERR(errno, &quot;Faile=
d to do raw io&quot;);<br>+ &nbsp; &nbsp;close(fd);<br> &nbsp; &nbsp; retur=
n -1;<br> &nbsp; }<br> <br>@@ -126,6 +128,7 @@ int get=5Fhdd=5Fstatus(void)=
<br> &nbsp; }<br> <br> &nbsp; if (i2c=5Fio(fd) &lt; 0) {<br>+ &nbsp; &nbsp;=
close(fd);<br> &nbsp; &nbsp; return -1;<br> &nbsp; }<br> <br>@@ -145,7 +148=
,7 @@ int get=5Fhdd=5Fstatus(void)<br> <br> &nbsp; &nbsp; g=5Fread=5Ftmp[2]=
=3Dg=5Fread=5Fbytes[2];<br> &nbsp; &nbsp; g=5Fread=5Ftmp[3]=3Dg=5Fread=5Fby=
tes[3];<br>-<br>+ &nbsp; &nbsp;close(fd);<br> }<br> <br> int send=5Fesel=5F=
to=5Fdbus(const char *desc, const char *sev, const char *details, uint8=5Ft=
 *debug, size=5Ft debuglen) {<br>-- <br>2.7.1<br><br><br>=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br=
>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/l=
istinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br>=
</tt><br><br><BR>
</body></html>

--1__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E--


--0__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5ECDFB4BA4E8f9e8a93df938690918cEABBF5ECDFB4BA4E--
