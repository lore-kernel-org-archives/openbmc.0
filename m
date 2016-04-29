Return-Path: <anoo@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxMdF18k6zDqB2
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 04:28:00 +1000 (AEST)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 29 Apr 2016 12:27:58 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Apr 2016 12:27:57 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 6F5763E4003B
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 12:27:56 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3TIRu6b44564696
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 11:27:56 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3TIRuNe001184
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 12:27:56 -0600
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3TIRset001118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 12:27:55 -0600
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 29 Apr 2016 14:27:54 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 29 Apr 2016 14:27:52 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 29 Apr 2016 18:27:51 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 29 Apr 2016 18:27:50 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016042918274937-356945 ;
 Fri, 29 Apr 2016 18:27:49 +0000 
In-Reply-To: <201604291804.u3TI40bc019498@d01av05.pok.ibm.com>
To: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
Cc: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH skeleton] Add BMC Flash dbus object to Palmetto
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Fri, 29 Apr 2016 13:27:49 -0500
References: <1461951055-23123-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201604291804.u3TI40bc019498@d01av05.pok.ibm.com>
MIME-Version: 1.0
X-KeepSent: 2B0331DB:AD27AC3A-86257FA4:006531A6;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 53323
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 00656BFB86257FA4_="
x-cbid: 16042918-0021-0000-0000-00004A8239F5
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.067888; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005216; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000162; SDB=6.00695095; UDB=6.00320952; UTC=2016-04-29
 18:27:51
x-cbparentid: 16042918-5938-0000-0000-000003634A62
Message-Id: <OF2B0331DB.AD27AC3A-ON86257FA4.006531A6-86257FA4.00656C6E@notes.na.collabserv.com>
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
X-List-Received-Date: Fri, 29 Apr 2016 18:28:02 -0000


--=_alternative 00656BFB86257FA4_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Just checked and Firestone and Garrison have the bmc=5Fupdate, probably=20
since they were based off Barreleye. I'm assuming there'll be a common=20
file once we move to an MRW framework.=20





From:   Chris Austen/Austin/IBM@IBMUS
To:     "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
Cc:     openbmc <openbmc@lists.ozlabs.org>
Date:   04/29/2016 01:11 PM
Subject:        Re: [PATCH skeleton] Add BMC Flash dbus object to Palmetto
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



This will also be needed f Firestone and garrison.  Is there a concept of=20
a common file?=20

Sent from my iPhone using IBM Verse

On Apr 29, 2016, 12:31:27 PM, openbmc-patches@stwcx.xyz wrote:

From: openbmc-patches@stwcx.xyz
To: openbmc@lists.ozlabs.org
Cc:=20
Date: Apr 29, 2016 12:31:27 PM
Subject: [PATCH skeleton] Add BMC Flash dbus object to Palmetto

From: Adriana Kobylak=20
Add the BMC Flash dbus object to Palmetto.py to expose interfaces
to flash the BMC. Without it, there are no interfaces to flash BMC
from REST. This change is already in Barreleye, just porting to Palmetto.
---
bin/Palmetto.py | 6 ++++++
1 file changed, 6 insertions(+)
diff --git a/bin/Palmetto.py b/bin/Palmetto.py
index 7172364..512a2ca 100755
--- a/bin/Palmetto.py
+++ b/bin/Palmetto.py
@@ -123,6 +123,12 @@ APPS =3D {
'monitor=5Fprocess' : True,
'process=5Fname'    : 'flash=5Fbios.exe',
},
+ 'bmc=5Fflash=5Fcontrol' : {
+ 'system=5Fstate'    : 'BMC=5FSTARTING',
+ 'start=5Fprocess'   : True,
+ 'monitor=5Fprocess' : True,
+ 'process=5Fname'    : 'bmc=5Fupdate.py',
+ },
'download=5Fmanager' : {
'system=5Fstate'    : 'BMC=5FSTARTING',
'start=5Fprocess'   : True,
--=20
2.8.1
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc





--=_alternative 00656BFB86257FA4_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Just checked and Firestone and Garrison
have the bmc=5Fupdate, probably since they were based off Barreleye. I'm
assuming there'll be a common file once we move to an MRW framework. </font=
><br><br><br><br><br><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif"=
>From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Chris Austen/Austin/IBM@IBM=
US</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">To: &nbsp; =
&nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;OpenBMC Patches&quot;
&lt;openbmc-patches@stwcx.xyz&gt;</font><br><font size=3D1 color=3D#5f5f5f =
face=3D"sans-serif">Cc: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">openbmc &lt;openbmc@lists.o=
zlabs.org&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">=
Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">04/29/2016 01:11 PM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: [PATCH skeleton]
Add BMC Flash dbus object to Palmetto</font><br><font size=3D1 color=3D#5f5=
f5f face=3D"sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><font size=3D3 face=3D"Helvetica">This will also be neede=
d f Firestone
and garrison. &nbsp;Is there a concept of a common file? &nbsp; <br><br>Sen=
t from my iPhone using IBM Verse<br><br></font><hr><font size=3D3 face=3D"H=
elvetica">On Apr 29, 2016, 12:31:27 PM, openbmc-patches@stwcx.xyz
wrote:<br><br>From: openbmc-patches@stwcx.xyz<br>To: openbmc@lists.ozlabs.o=
rg<br>Cc: <br>Date: Apr 29, 2016 12:31:27 PM<br>Subject: [PATCH skeleton] A=
dd BMC Flash dbus object to Palmetto<br></font><br><font size=3D3 face=3D"H=
elvetica">From: Adriana Kobylak <br>Add the BMC Flash dbus object to Palmet=
to.py to expose interfaces<br>to flash the BMC. Without it, there are no in=
terfaces to flash BMC<br>from REST. This change is already in Barreleye, ju=
st porting to Palmetto.<br>---<br>bin/Palmetto.py | 6 ++++++<br>1 file chan=
ged, 6 insertions(+)<br>diff --git a/bin/Palmetto.py b/bin/Palmetto.py<br>i=
ndex </font><a href=3Dtel:7172364><font size=3D3 color=3Dblue face=3D"Helve=
tica"><u>7172364</u></font></a><font size=3D3 face=3D"Helvetica">..512a2ca
100755<br>--- a/bin/Palmetto.py<br>+++ b/bin/Palmetto.py<br>@@ -123,6 +123,=
12 @@ APPS =3D {<br>'monitor=5Fprocess' : True,<br>'process=5Fname' &nbsp; =
&nbsp;: 'flash=5Fbios.exe',<br>},<br>+ 'bmc=5Fflash=5Fcontrol' : {<br>+ 'sy=
stem=5Fstate' &nbsp; &nbsp;: 'BMC=5FSTARTING',<br>+ 'start=5Fprocess' &nbsp=
; : True,<br>+ 'monitor=5Fprocess' : True,<br>+ 'process=5Fname' &nbsp; &nb=
sp;: 'bmc=5Fupdate.py',<br>+ },<br>'download=5Fmanager' : {<br>'system=5Fst=
ate' &nbsp; &nbsp;: 'BMC=5FSTARTING',<br>'start=5Fprocess' &nbsp; : True,<b=
r>-- <br>2.8.1<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></font><a =
href=3Dhttps://lists.ozlabs.org/listinfo/openbmc><font size=3D3 face=3D"Hel=
vetica">https://lists.ozlabs.org/listinfo/openbmc</font></a><br><tt><font s=
ize=3D2>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></font></tt><a href=
=3Dhttps://lists.ozlabs.org/listinfo/openbmc><tt><font size=3D2>https://lis=
ts.ozlabs.org/listinfo/openbmc</font></tt></a><tt><font size=3D2><br></font=
></tt><br><br><BR>
--=_alternative 00656BFB86257FA4_=--
