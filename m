Return-Path: <jiangyu@cn.ibm.com>
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 79B851A0075
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 03:38:41 +1100 (AEDT)
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jiangyu@cn.ibm.com>;
 Tue, 1 Dec 2015 02:38:39 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 1 Dec 2015 02:38:38 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: jiangyu@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id AB5CB2CE8050
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 03:38:37 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAUGcCDl19202132
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 03:38:20 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAUGc5jP027172
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 03:38:05 +1100
Received: from d50lp01.ny.us.ibm.com ([146.89.104.207])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAUGc2tS026066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 03:38:04 +1100
Message-Id: <201511301638.tAUGc2tS026066@d23av01.au.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jiangyu@cn.ibm.com>;
 Mon, 30 Nov 2015 11:36:57 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 30 Nov 2015 11:36:43 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <jiangyu@cn.ibm.com>;
 Mon, 30 Nov 2015 16:36:34 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 30 Nov 2015 16:36:31 -0000
Received: from us1a3-mail123.a3.dal06.isc4sb.com ([10.146.45.250])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2015113016374384-418667 ;
 Mon, 30 Nov 2015 16:37:43 +0000 
In-Reply-To: 
Subject: Boot options definition
From: "Frank J Yu" <jiangyu@cn.ibm.com>
To: "Adriana Kobylak" <anoo@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 30 Nov 2015 16:36:29 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_11092015_FP2 November 12, 2015
X-LLNOutbound: False
X-Disclaimed: 14175
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15113016-0005-0000-0000-000002D8AF7F
X-IBM-ISS-SpamDetectors: Score=0.380009; BY=0.046372; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.380009; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004626; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00624645; UDB=6.00278203; UTC=2015-11-30
 16:36:32
x-cbparentid: 15113016-9900-0000-0000-0000051D5943
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
X-List-Received-Date: Mon, 30 Nov 2015 16:38:41 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"> <span>Hi, Adriana, <br><br>In OPAL, the code related to boot option=
s is in petitboot/discover/platform-powerpc.c. I posted it here. <br><br>Yo=
u could see the OPAL only cares about the following things now:<br>1) "boot=
 flags valid" in "boot flags" (bit 7 in boot flags' data 1)<br>2) "options =
persistent" in </span><span><span>"boot flags" (bit 6 in boot flags' data 1=
)<br>3) "boot device selector" in "boot flags" (bit 2-bit 5 in boot flags' =
data 2) <br><br>Maybe we could define these three properties first.&nbsp; <=
br><br><b>Jeremy,</b>&nbsp; If I am wrong, please kindly point it out. Than=
ks!<br><br></span>static int get=5Fipmi=5Fbootdev=5Fipmi(struct platform=5F=
powerpc *platform,<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; uint8=5Ft *boot=
dev, bool *persistent)<br>{<br>&nbsp;&nbsp;&nbsp; uint16=5Ft resp=5Flen;<br=
>&nbsp;&nbsp;&nbsp; uint8=5Ft resp[8];<br>&nbsp;&nbsp;&nbsp; int rc;<br>&nb=
sp;&nbsp;&nbsp; uint8=5Ft req[] =3D {<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; 0x05, /* parameter selector: boot flags */<br>&nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; 0x00, /* no set selector */<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; 0x00, /* no block selector */<br>&nbsp;&nbsp;&nbsp; };<br><br>&nbsp;=
&nbsp;&nbsp; resp=5Flen =3D sizeof(resp);<br>&nbsp;&nbsp;&nbsp; rc =3D ipmi=
=5Ftransaction(platform-&gt;ipmi, IPMI=5FNETFN=5FCHASSIS,<br>&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; IPMI=5FCMD=5FCHASSIS=5FGET=5FSYS=
TEM=5FBOOT=5FOPTIONS,<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; req, sizeof(req),<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; resp, &amp;resp=5Flen,<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; ipmi=5Ftimeout);<br>&nbsp;&nbsp;&nbsp; if (rc) {<br>&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; pb=5Flog("platform: error reading IPMI boo=
t options\n");<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return -1;<br>&nbsp=
;&nbsp;&nbsp; }<br><br>&nbsp;&nbsp;&nbsp; if (resp=5Flen !=3D sizeof(resp))=
 {<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; pb=5Flog("platform: unexpected =
length (%d) in "<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; "boot options response\n", resp=5Flen);<br>&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; return -1;<br>&nbsp;&nbsp;&nbsp; }<br><br>&nbsp;=
&nbsp;&nbsp; if (resp[0] !=3D 0) {<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 pb=5Flog("platform: non-zero completion code %d from IPMI req\n",<br>&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; resp=
[0]);<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return -1;<br>&nbsp;&nbsp;&n=
bsp; }<br><br>&nbsp;&nbsp;&nbsp; /* check for correct parameter version */<=
br>&nbsp;&nbsp;&nbsp; if ((resp[1] &amp; 0xf) !=3D 0x1) {<br>&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; pb=5Flog("platform: unexpected version (0x%x) in "<=
br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; "boot options response\n", resp[0]);<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; return -1;<br>&nbsp;&nbsp;&nbsp; }<br><br>&nbsp;&nbsp;&nbsp; /* chec=
k for valid paramters */<br>&nbsp;&nbsp;&nbsp; if (resp[2] &amp; 0x80) {<br=
>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; pb=5Fdebug("platform: boot options a=
re invalid/locked\n");<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return -1;<=
br>&nbsp;&nbsp;&nbsp; }<br><br>&nbsp;&nbsp;&nbsp; *persistent =3D false;<br=
><br>&nbsp;<font color=3D"#0000ff">&nbsp;&nbsp; /* check for valid flags */=
<br>&nbsp;&nbsp;&nbsp; if (!(resp[3] &amp; 0x80)) {<br>&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; pb=5Fdebug("platform: boot flags are invalid, ignoring\n"=
);<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return 0;<br>&nbsp;&nbsp;&nbsp;=
 }<br><br>&nbsp;&nbsp;&nbsp; *persistent =3D resp[3] &amp; 0x40;<br>&nbsp;&=
nbsp;&nbsp; *bootdev =3D (resp[4] &gt;&gt; 2) &amp; 0x0f;</font><br>&nbsp;&=
nbsp;&nbsp; return 0;<br>}<br><br>Regards,<br><br>=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94<br>Dr. Jiang Yu (=E4=BD=99=E6=B1=9F) PMP=C2=
=AE<br>OpenPower Application Engineer<br>IBM GCG Systems &amp; Technology G=
roup Lab<br><br>Tel: (86-21)6092-2872<br>T/L:&nbsp;&nbsp;11-90-22872<br>Fax=
:&nbsp;&nbsp;86-21-60922200<br>E-Mail: <a href=3D"mailto:jiangyu@cn.ibm.com=
">jiangyu@cn.ibm.com</a></span></font><BR>
