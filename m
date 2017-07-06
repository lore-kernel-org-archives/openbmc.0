Return-Path: <sivas.srr@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x35yC02xczDqkF
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 15:33:54 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v665Sflv015340
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 01:33:52 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bgvqkmg4d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 01:33:51 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Thu, 6 Jul 2017 15:33:46 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 15:33:41 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v665XW7F7668002
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 15:33:40 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v665X7qA010673
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 15:33:07 +1000
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v665X5Qm010387
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 15:33:06 +1000
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Wed, 5 Jul 2017 23:32:57 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 5 Jul 2017 23:32:55 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Thu, 6 Jul 2017 05:32:54 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 6 Jul 2017 05:32:52 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.23])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017070605325131-52487 ;
 Thu, 6 Jul 2017 05:32:51 +0000 
Subject: Re: [PATCH v6] pflash option to retrieve PNOR partition flags
In-Reply-To: <20170705191603.33311-1-mtritz@us.ibm.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: "Michael Tritz" <mtritz@us.ibm.com>
Cc: cyrilbur@gmail.com, "Michael Tritz" <mtritz@us.ibm.com>,
 openbmc@lists.ozlabs.org, skiboot@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Date: Thu, 6 Jul 2017 05:32:51 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20170705191603.33311-1-mtritz@us.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14672-1213 | IBM Domino Build
 SCN17164_20170613T0029_FP2 June 21, 2017 at 16:30
X-LLNOutbound: False
X-Disclaimed: 15947
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
x-cbid: 17070605-0040-0000-0000-0000033F68A2
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.373977;
 ST=0; TS=0; UL=0; ISC=; MB=0.242050
X-IBM-SpamModules-Versions: BY=3.00007328; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883521; UDB=6.00440769; IPR=6.00663708; 
 BA=6.00005454; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016105; XFM=3.00000015;
 UTC=2017-07-06 05:32:54
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-07-06 02:59:21 - 6.00006980
x-cbparentid: 17070605-1800-0000-0000-00001972C63E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF3159A207.F3097B82-ON00258155.001E57BA-00258155.001E7947@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=6
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060092
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jul 2017 05:33:55 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Good. Thank you M=
ike.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Btw, Can we use pflash any time of host state, right. ?</=
div>
<div dir=3D"ltr" >Or is there any restriction there?&nbsp; ( We were told t=
hat pflash may go away ).</div>
<div dir=3D"ltr" >&nbsp;
<div><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Ari=
al;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=
=3D"font-family:Arial;font-size:10.5pt" ><div class=3D"socmaildefaultfont" =
dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div class=3D"soc=
maildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" >=
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"margin-top: 20px;" ><div style=
=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; color: #7C=
7C5F;" >Sivas R. S</div>
<div style=3D"font-size: 8pt; font-family: sans-serif; margin-top: 10px;" >=
<div><span style=3D"font-weight: bold; color: #336699;" >E-mail: </span><a =
href=3D"mailto:sivas.srr@in.ibm.com" style=3D"color: #555" >sivas.srr@in.ib=
m.com</a></div>
<div>E2E FSP Test Architecture, OpenBMC Test Lead, Lab Management</div>
<div>Automation is good, Identifying Defect earlier is better always</div>
<div>9902233500</div>
<div>08046678273</div></div></div></div></div></div></div></div></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Michael Tritz &lt;mtritz@us.ib=
m.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.srr=3Din.ibm.com@=
lists.ozlabs.org&gt;<br>To: skiboot@lists.ozlabs.org, openbmc@lists.ozlabs.=
org<br>Cc: stewart@linux.vnet.ibm.com, Michael Tritz &lt;mtritz@us.ibm.com&=
gt;, cyrilbur@gmail.com<br>Subject: [PATCH v6] pflash option to retrieve PN=
OR partition flags<br>Date: Thu, Jul 6, 2017 12:47 AM<br>&nbsp;<br><tt><fon=
t size=3D"3" face=3D"" >This commit extends pflash with an option to retrie=
ve and print</font></tt><br><tt><font size=3D"3" face=3D"" >information for=
 a particular partition, including the content from</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >"pflash -i" and a verbose list of set miscellaneous=
 flags. -i option</font></tt><br><tt><font size=3D"3" face=3D"" >is also up=
dated to print a short list of flags in addition to the</font></tt><br><tt>=
<font size=3D"3" face=3D"" >ECC flag, with one character per flag. A test o=
f the new option is</font></tt><br><tt><font size=3D"3" face=3D"" >included=
 in libflash/test.</font></tt><br><br><tt><font size=3D"3" face=3D"" >V6: R=
everted change to has=5Fecc() to avoid breaking libffs</font></tt><br><br><=
tt><font size=3D"3" face=3D"" >Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8=
fbe25258</font></tt><br><tt><font size=3D"3" face=3D"" >Signed-off-by: Mich=
ael Tritz &lt;mtritz@us.ibm.com&gt;</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >---</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >external/pflash/pflash.c &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;| 134 ++++++++++++++++++++++++++++++++++----</f=
ont></tt><br>        <tt><font size=3D"3" face=3D"" >libflash/libffs.c &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;11 +++-</font><=
/tt><br>        <tt><font size=3D"3" face=3D"" >libflash/libffs.h &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 4 ++</font></tt><br=
>        <tt><font size=3D"3" face=3D"" >libflash/test/Makefile.check &nbsp=
; &nbsp; &nbsp;| &nbsp; 5 +-</font></tt><br>        <tt><font size=3D"3" fa=
ce=3D"" >libflash/test/test-miscprint.pnor | 103 ++++++++++++++++++++++++++=
+++</font></tt><br>        <tt><font size=3D"3" face=3D"" >libflash/test/te=
st-miscprint.sh &nbsp; | &nbsp;27 ++++++++</font></tt><br>        <tt><font=
 size=3D"3" face=3D"" >6 files changed, 269 insertions(+), 15 deletions(-)<=
/font></tt><br>        <tt><font size=3D"3" face=3D"" >create mode 100644 l=
ibflash/test/test-miscprint.pnor</font></tt><br>        <tt><font size=3D"3=
" face=3D"" >create mode 100644 libflash/test/test-miscprint.sh</font></tt>=
</li></ul><tt><font size=3D"3" face=3D"" >diff --git a/external/pflash/pfla=
sh.c b/external/pflash/pflash.c</font></tt><br><tt><font size=3D"3" face=3D=
"" >index a344987e..9d57feea 100644</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >--- a/external/pflash/pflash.c</font></tt><br><tt><font size=3D"3" =
face=3D"" >+++ b/external/pflash/pflash.c</font></tt><br><tt><font size=3D"=
3" face=3D"" >@@ -14,6 +14,8 @@</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >* limitations under the Licens=
e.</font></tt><br>        <tt><font size=3D"3" face=3D"" >*/</font></tt></l=
i></ul><tt><font size=3D"3" face=3D"" >+#define =5FGNU=5FSOURCE</font></tt>=
<br><tt><font size=3D"3" face=3D"" >+</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >#include &lt;stdio.h&gt;</font>=
</tt><br>        <tt><font size=3D"3" face=3D"" >#include &lt;stdlib.h&gt;<=
/font></tt><br>        <tt><font size=3D"3" face=3D"" >#include &lt;string.=
h&gt;</font></tt></li></ul><tt><font size=3D"3" face=3D"" >@@ -90,6 +92,7 @=
@ static void print=5Fffs=5Finfo(uint32=5Ft toc=5Foffset)</font></tt><br><t=
t><font size=3D"3" face=3D"" >{</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >struct ffs=5Fhandle *ffs=5Fhan=
dle;</font></tt><br>        <tt><font size=3D"3" face=3D"" >uint32=5Ft othe=
r=5Fside=5Foffset =3D 0;</font></tt></li></ul><tt><font size=3D"3" face=3D"=
" >+ struct ffs=5Fentry *ent;</font></tt><br><tt><font size=3D"3" face=3D""=
 >int rc;</font></tt><br><tt><font size=3D"3" face=3D"" >uint32=5Ft i;</fon=
t></tt><br><br><tt><font size=3D"3" face=3D"" >@@ -103,25 +106,40 @@ static=
 void print=5Fffs=5Finfo(uint32=5Ft toc=5Foffset)</font></tt><br><tt><font =
size=3D"3" face=3D"" >return;</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >}</font></tt></li></ul><tt><fo=
nt size=3D"3" face=3D"" >- for (i =3D 0;; i++) {</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >+ for (i =3D 0; rc =3D=3D 0; i++) {</font></tt><br><tt=
><font size=3D"3" face=3D"" >uint32=5Ft start, size, act, end;</font></tt><=
br><tt><font size=3D"3" face=3D"" >- bool ecc;</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >- char *name;</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ char *name =3D NULL, *flags;</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >+ int l;</font></tt><br><br><tt><font size=3D"3" face=3D"" >- rc =
=3D ffs=5Fpart=5Finfo(ffs=5Fhandle, i, &amp;name, &amp;start, &amp;size, &a=
mp;act, &amp;ecc);</font></tt><br><tt><font size=3D"3" face=3D"" >+ rc =3D =
ffs=5Fpart=5Finfo(ffs=5Fhandle, i, &amp;name, &amp;start, &amp;size, &amp;a=
ct, NULL);</font></tt>
<ul style=3D"padding-left: 18pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >if (rc =3D=3D FFS=5FERR=5FPART=
=5FNOT=5FFOUND)</font></tt><br>        <tt><font size=3D"3" face=3D"" >brea=
k;</font></tt></li></ul><tt><font size=3D"3" face=3D"" >- if (rc) {</font><=
/tt><br><tt><font size=3D"3" face=3D"" >- fprintf(stderr, "Error %d scannin=
g partitions\n", rc);</font></tt><br><tt><font size=3D"3" face=3D"" >- brea=
k;</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ ent =3D ffs=5Fentry=5Fget(ffs=5Fhandle, i);</font=
></tt><br><tt><font size=3D"3" face=3D"" >+ if (rc || !ent) {</font></tt><b=
r><tt><font size=3D"3" face=3D"" >+ fprintf(stderr, "Error %d scanning part=
itions\n",</font></tt><br><tt><font size=3D"3" face=3D"" >+ !ent ? FFS=5FER=
R=5FPART=5FNOT=5FFOUND : rc);</font></tt><br><tt><font size=3D"3" face=3D""=
 >+ &nbsp; &nbsp;goto out;</font></tt><br><tt><font size=3D"3" face=3D"" >}=
</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt><br><tt><font =
size=3D"3" face=3D"" >+ l =3D asprintf(&amp;flags, "[%c%c%c%c%c]",</font></=
tt><br><tt><font size=3D"3" face=3D"" >+ has=5Fecc(ent) ? 'E' : '-',</font>=
</tt><br><tt><font size=3D"3" face=3D"" >+ has=5Fflag(ent, FFS=5FMISCFLAGS=
=5FPRESERVED) ? 'P' : '-',</font></tt><br><tt><font size=3D"3" face=3D"" >+=
 has=5Fflag(ent, FFS=5FMISCFLAGS=5FREADONLY) ? 'R' : '-',</font></tt><br><t=
t><font size=3D"3" face=3D"" >+ has=5Fflag(ent, FFS=5FMISCFLAGS=5FBACKUP) ?=
 'B' : '-',</font></tt><br><tt><font size=3D"3" face=3D"" >+ has=5Fflag(ent=
, FFS=5FMISCFLAGS=5FREPROVISION) ? 'F' : '-');</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >+ if (l &lt; 0)</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ goto out;</font></tt><br><tt><font size=3D"3" face=3D"" >+</font><=
/tt>
<ul style=3D"padding-left: 18pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >end =3D start + size;</font></=
tt><br>        <tt><font size=3D"3" face=3D"" >printf("ID=3D%02d %15s %08x.=
.%08x (actual=3D%08x) %s\n",</font></tt></li></ul><tt><font size=3D"3" face=
=3D"" >- &nbsp; &nbsp; &nbsp; i, name, start, end, act, ecc ? "[ECC]" : "")=
;</font></tt><br><tt><font size=3D"3" face=3D"" >+ i, name, start, end, act=
, flags);</font></tt>
<ul style=3D"padding-left: 18pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >if (strcmp(name, "OTHER=5FSIDE=
") =3D=3D 0)</font></tt><br>        <tt><font size=3D"3" face=3D"" >other=
=5Fside=5Foffset =3D start;</font></tt></li></ul><tt><font size=3D"3" face=
=3D"" >+ free(flags);</font></tt><br><tt><font size=3D"3" face=3D"" >+out:<=
/font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >free(name);</font></tt><br>   =
     <tt><font size=3D"3" face=3D"" >}</font></tt></li></ul><tt><font size=
=3D"3" face=3D"" >@@ -413,6 +431,81 @@ static void disable=5F4B=5Faddresses=
(void)</font></tt><br><tt><font size=3D"3" face=3D"" >}</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >}</font></tt></li></ul><tt><fon=
t size=3D"3" face=3D"" >+static void print=5Fpartition=5Fdetail(uint32=5Ft =
toc=5Foffset, uint32=5Ft part=5Fid, char *name)</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >+{</font></tt><br><tt><font size=3D"3" face=3D"" >+ uin=
t32=5Ft start, size, act, end;</font></tt><br><tt><font size=3D"3" face=3D"=
" >+ struct ffs=5Fhandle *ffs=5Fhandle;</font></tt><br><tt><font size=3D"3"=
 face=3D"" >+ char *ent=5Fname =3D NULL, *flags;</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >+ struct ffs=5Fentry *ent;</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >+ int rc, l;</font></tt><br><tt><font size=3D"3" face=
=3D"" >+</font></tt><br><tt><font size=3D"3" face=3D"" >+ rc =3D ffs=5Finit=
(toc=5Foffset, fl=5Ftotal=5Fsize, bl, &amp;ffs=5Fhandle, 0);</font></tt><br=
><tt><font size=3D"3" face=3D"" >+ if (rc) {</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ fprintf(stderr, "Error %d opening ffs !\n", rc);</font>=
</tt><br><tt><font size=3D"3" face=3D"" >+ return;</font></tt><br><tt><font=
 size=3D"3" face=3D"" >+ }</font></tt><br><tt><font size=3D"3" face=3D"" >+=
</font></tt><br><tt><font size=3D"3" face=3D"" >+ if (name) {</font></tt><b=
r><tt><font size=3D"3" face=3D"" >+ uint32=5Ft i;</font></tt><br><tt><font =
size=3D"3" face=3D"" >+</font></tt><br><tt><font size=3D"3" face=3D"" >+ fo=
r (i =3D 0;;i++) {</font></tt><br><tt><font size=3D"3" face=3D"" >+ rc =3D =
ffs=5Fpart=5Finfo(ffs=5Fhandle, i, &amp;ent=5Fname, &amp;start, &amp;size, =
&amp;act,</font></tt><br><tt><font size=3D"3" face=3D"" >+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; NULL);</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ if (rc =3D=3D FFS=5FERR=5FPART=5FNOT=5FFOUND) {</font></tt><br><tt=
><font size=3D"3" face=3D"" >+ fprintf(stderr, "Partition with name %s does=
n't exist within TOC at 0x%08x\n", name, toc=5Foffset);</font></tt><br><tt>=
<font size=3D"3" face=3D"" >+ goto out;</font></tt><br><tt><font size=3D"3"=
 face=3D"" >+ }</font></tt><br><tt><font size=3D"3" face=3D"" >+ if (rc || =
strncmp(ent=5Fname, name, FFS=5FPART=5FNAME=5FMAX) =3D=3D 0) {</font></tt><=
br><tt><font size=3D"3" face=3D"" >+ part=5Fid =3D i;</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >+ break;</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ }</font></tt><br><tt><font size=3D"3" face=3D"" >+ free(ent=5Fname=
);</font></tt><br><tt><font size=3D"3" face=3D"" >+ ent=5Fname =3D NULL;</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+ }</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >+ } else {</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ rc =3D ffs=5Fpart=5Finfo(ffs=5Fhandle, part=5Fid, &amp;ent=5Fname, &a=
mp;start, &amp;size, &amp;act,</font></tt><br><tt><font size=3D"3" face=3D"=
" >+ NULL);</font></tt><br><tt><font size=3D"3" face=3D"" >+ if (rc =3D=3D =
FFS=5FERR=5FPART=5FNOT=5FFOUND) {</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ fprintf(stderr, "Partition with ID %d doesn't exist within TOC at =
0x%08x\n",</font></tt><br><tt><font size=3D"3" face=3D"" >+ part=5Fid, toc=
=5Foffset);</font></tt><br><tt><font size=3D"3" face=3D"" >+ goto out;</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >+ }</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >+ }</font></tt><br><tt><font size=3D"3" face=3D"" >+ ent=
 =3D ffs=5Fentry=5Fget(ffs=5Fhandle, part=5Fid);</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >+ if (rc || !ent) {</font></tt><br><tt><font size=3D"3=
" face=3D"" >+ fprintf(stderr, "Error %d scanning partitions\n", !ent ?</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >+ FFS=5FERR=5FPART=5FNOT=5FFOUN=
D : rc);</font></tt><br><tt><font size=3D"3" face=3D"" >+ goto out;</font><=
/tt><br><tt><font size=3D"3" face=3D"" >+ }</font></tt><br><tt><font size=
=3D"3" face=3D"" >+</font></tt><br><tt><font size=3D"3" face=3D"" >+ printf=
("Detailed partition information\n");</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >+ end =3D start + size;</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ printf("Name:\n");</font></tt><br><tt><font size=3D"3" face=3D"" >=
+ printf("%s (ID=3D%02d)\n\n", ent=5Fname, part=5Fid);</font></tt><br><tt><=
font size=3D"3" face=3D"" >+ printf("%-10s &nbsp;%-10s &nbsp;%-10s\n", "Sta=
rt", "End", "Actual");</font></tt><br><tt><font size=3D"3" face=3D"" >+ pri=
ntf("0x%08x &nbsp;0x%08x &nbsp;0x%08x\n\n", start, end, act);</font></tt><b=
r><tt><font size=3D"3" face=3D"" >+</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >+ printf("Flags:\n");</font></tt><br><tt><font size=3D"3" face=3D""=
 >+</font></tt><br><tt><font size=3D"3" face=3D"" >+ l =3D asprintf(&amp;fl=
ags, "%s%s%s%s%s", has=5Fecc(ent) ? "ECC [E]\n" : "",</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >+ has=5Fflag(ent, FFS=5FMISCFLAGS=5FPRESERVED) ? =
"PRESERVED [P]\n" : "",</font></tt><br><tt><font size=3D"3" face=3D"" >+ ha=
s=5Fflag(ent, FFS=5FMISCFLAGS=5FREADONLY) ? "READONLY [R]\n" : "",</font></=
tt><br><tt><font size=3D"3" face=3D"" >+ has=5Fflag(ent, FFS=5FMISCFLAGS=5F=
BACKUP) ? "BACKUP [B]\n" : "",</font></tt><br><tt><font size=3D"3" face=3D"=
" >+ has=5Fflag(ent, FFS=5FMISCFLAGS=5FREPROVISION) ?</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >+ "REPROVISION [F]\n" : "");</font></tt><br><tt><=
font size=3D"3" face=3D"" >+ if (l &lt; 0) {</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ fprintf(stderr, "Memory allocation failure printing fla=
gs!\n");</font></tt><br><tt><font size=3D"3" face=3D"" >+ goto out;</font><=
/tt><br><tt><font size=3D"3" face=3D"" >+ }</font></tt><br><tt><font size=
=3D"3" face=3D"" >+</font></tt><br><tt><font size=3D"3" face=3D"" >+ printf=
("%s", flags);</font></tt><br><tt><font size=3D"3" face=3D"" >+ free(flags)=
;</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt><br><tt><font=
 size=3D"3" face=3D"" >+out:</font></tt><br><tt><font size=3D"3" face=3D"" =
>+ ffs=5Fclose(ffs=5Fhandle);</font></tt><br><tt><font size=3D"3" face=3D""=
 >+ free(ent=5Fname);</font></tt><br><tt><font size=3D"3" face=3D"" >+}</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >static void print=5Fversion(voi=
d)</font></tt><br>        <tt><font size=3D"3" face=3D"" >{</font></tt></li=
></ul><tt><font size=3D"3" face=3D"" >printf("Open-Power Flash tool %s\n", =
version);</font></tt><br><tt><font size=3D"3" face=3D"" >@@ -494,6 +587,10 =
@@ static void print=5Fhelp(const char *pname)</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >printf("\t\tpartition and then=
 set all the ECC bits as they should be\n\n");</font></tt><br>        <tt><=
font size=3D"3" face=3D"" >printf("\t-i, --info\n");</font></tt><br>       =
 <tt><font size=3D"3" face=3D"" >printf("\t\tDisplay some information about=
 the flash.\n\n");</font></tt></li></ul><tt><font size=3D"3" face=3D"" >+ p=
rintf("\t--detail\n");</font></tt><br><tt><font size=3D"3" face=3D"" >+ pri=
ntf("\t\tDisplays detailed info about a particular partition.\n");</font></=
tt><br><tt><font size=3D"3" face=3D"" >+ printf("\t\tAccepts a numeric part=
ition or can be used in conjuction\n");</font></tt><br><tt><font size=3D"3"=
 face=3D"" >+ printf("\t\twith the -P flag.\n\n");</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >printf("\t-h, --help\n");</fon=
t></tt><br>        <tt><font size=3D"3" face=3D"" >printf("\t\tThis message=
.\n\n");</font></tt></li></ul><tt><font size=3D"3" face=3D"" >}</font></tt>=
<br><tt><font size=3D"3" face=3D"" >@@ -508,7 +605,7 @@ void exiting(void)<=
/font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >int main(int argc, char *argv[]=
)</font></tt><br>        <tt><font size=3D"3" face=3D"" >{</font></tt></li>=
</ul><tt><font size=3D"3" face=3D"" >const char *pname =3D argv[0];</font><=
/tt><br><tt><font size=3D"3" face=3D"" >- uint32=5Ft address =3D 0, read=5F=
size =3D 0, write=5Fsize =3D 0;</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ uint32=5Ft address =3D 0, read=5Fsize =3D 0, write=5Fsize =3D 0, deta=
il=5Fid =3D UINT=5FMAX;</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >uint32=5Ft erase=5Fstart =3D 0=
, erase=5Fsize =3D 0;</font></tt><br>        <tt><font size=3D"3" face=3D""=
 >bool erase =3D false, do=5Fclear =3D false;</font></tt><br>        <tt><f=
ont size=3D"3" face=3D"" >bool program =3D false, erase=5Fall =3D false, in=
fo =3D false, do=5Fread =3D false;</font></tt></li></ul><tt><font size=3D"3=
" face=3D"" >@@ -516,7 +613,7 @@ int main(int argc, char *argv[])</font></t=
t><br><tt><font size=3D"3" face=3D"" >bool show=5Fhelp =3D false, show=5Fve=
rsion =3D false;</font></tt><br><tt><font size=3D"3" face=3D"" >bool no=5Fa=
ction =3D false, tune =3D false;</font></tt><br><tt><font size=3D"3" face=
=3D"" >char *write=5Ffile =3D NULL, *read=5Ffile =3D NULL, *part=5Fname =3D=
 NULL;</font></tt><br><tt><font size=3D"3" face=3D"" >- bool ffs=5Ftoc=5Fse=
en =3D false, direct =3D false;</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ bool ffs=5Ftoc=5Fseen =3D false, direct =3D false, print=5Fdetail =3D=
 false;</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >int rc;</font></tt></li></ul><=
tt><font size=3D"3" face=3D"" >while(1) {</font></tt><br><tt><font size=3D"=
3" face=3D"" >@@ -535,6 +632,7 @@ int main(int argc, char *argv[])</font></=
tt>
<ul style=3D"padding-left: 24pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >{"force", no=5Fargument, NULL,=
 'f'},</font></tt><br>        <tt><font size=3D"3" face=3D"" >{"flash-file"=
, required=5Fargument, NULL, 'F'},</font></tt><br>        <tt><font size=3D=
"3" face=3D"" >{"info", no=5Fargument, NULL, 'i'},</font></tt></li></ul><tt=
><font size=3D"3" face=3D"" >+ {"detail", &nbsp;optional=5Fargument, &nbsp;=
NULL, &nbsp; 'm'},</font></tt><br><tt><font size=3D"3" face=3D"" >{"tune", =
no=5Fargument, NULL, 't'},</font></tt><br><tt><font size=3D"3" face=3D"" >{=
"dummy", no=5Fargument, NULL, 'd'},</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >{"help", no=5Fargument, NULL, 'h'},</font></tt><br><tt><font size=
=3D"3" face=3D"" >@@ -622,6 +720,11 @@ int main(int argc, char *argv[])</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >case 'c':</font></tt>
<ul style=3D"padding-left: 24pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >do=5Fclear =3D true;</font></t=
t><br>        <tt><font size=3D"3" face=3D"" >break;</font></tt></li></ul><=
tt><font size=3D"3" face=3D"" >+ case 'm':</font></tt><br><tt><font size=3D=
"3" face=3D"" >+ print=5Fdetail =3D true;</font></tt><br><tt><font size=3D"=
3" face=3D"" >+ if (optarg)</font></tt><br><tt><font size=3D"3" face=3D"" >=
+ detail=5Fid =3D strtoul(optarg, NULL, 0);</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ break;</font></tt>
<ul style=3D"padding-left: 18pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >case ':':</font></tt><br>     =
   <tt><font size=3D"3" face=3D"" >fprintf(stderr, "Unrecognised option \"%=
s\" to '%c'\n", optarg, optopt);</font></tt><br>        <tt><font size=3D"3=
" face=3D"" >no=5Faction =3D true;</font></tt></li></ul><tt><font size=3D"3=
" face=3D"" >@@ -651,7 +754,7 @@ int main(int argc, char *argv[])</font></t=
t><br><tt><font size=3D"3" face=3D"" >* also tune them as a side effect</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >*/</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >no=5Faction =3D no=5Faction || (!erase &amp;&amp; !progr=
am &amp;&amp; !info &amp;&amp; !do=5Fread &amp;&amp;</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >- !enable=5F4B &amp;&amp; !disable=5F4B &amp;&amp;=
 !tune &amp;&amp; !do=5Fclear);</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ !enable=5F4B &amp;&amp; !disable=5F4B &amp;&amp; !tune &amp;&amp; !do=
=5Fclear &amp;&amp; !print=5Fdetail);</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >/* Nothing to do, if we didn't=
 already, print usage */</font></tt><br>        <tt><font size=3D"3" face=
=3D"" >if (no=5Faction &amp;&amp; !show=5Fversion)</font></tt></li></ul><tt=
><font size=3D"3" face=3D"" >@@ -684,6 +787,12 @@ int main(int argc, char *=
argv[])</font></tt><br><tt><font size=3D"3" face=3D"" >exit(1);</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >}</font></tt></li></ul><tt><fo=
nt size=3D"3" face=3D"" >+ if (print=5Fdetail &amp;&amp; ((detail=5Fid =3D=
=3D UINT=5FMAX &amp;&amp; !part=5Fname)</font></tt><br><tt><font size=3D"3"=
 face=3D"" >+ || (detail=5Fid !=3D UINT=5FMAX &amp;&amp; part=5Fname))) {</=
font></tt><br><tt><font size=3D"3" face=3D"" >+ fprintf(stderr, "--detail r=
equires either a partition id or\n");</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >+ fprintf(stderr, "a partition name with -P\n");</font></tt><br><=
tt><font size=3D"3" face=3D"" >+ }</font></tt><br><tt><font size=3D"3" face=
=3D"" >+</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >/* part-name and erase-all mak=
e no sense together */</font></tt><br>        <tt><font size=3D"3" face=3D"=
" >if (part=5Fname &amp;&amp; erase=5Fall) {</font></tt></li></ul><tt><font=
 size=3D"3" face=3D"" >fprintf(stderr, "--partition and --erase-all are mut=
ually"</font></tt><br><tt><font size=3D"3" face=3D"" >@@ -872,6 +981,9 @@ i=
nt main(int argc, char *argv[])</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >print=5Fflash=5Finfo(flash=5Fs=
ide ? 0 : ffs=5Ftoc);</font></tt><br>        <tt><font size=3D"3" face=3D""=
 >}</font></tt></li></ul><tt><font size=3D"3" face=3D"" >+ if (print=5Fdeta=
il)</font></tt><br><tt><font size=3D"3" face=3D"" >+ print=5Fpartition=5Fde=
tail(flash=5Fside ? 0 : ffs=5Ftoc, detail=5Fid, part=5Fname);</font></tt><b=
r><tt><font size=3D"3" face=3D"" >+</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >/* Unlock flash (PNOR only) */=
</font></tt><br>        <tt><font size=3D"3" face=3D"" >if ((erase || progr=
am || do=5Fclear) &amp;&amp; !bmc=5Fflash &amp;&amp; !flashfilename) {</fon=
t></tt></li></ul><tt><font size=3D"3" face=3D"" >need=5Frelock =3D arch=5Ff=
lash=5Fset=5Fwrprotect(bl, false);</font></tt><br><tt><font size=3D"3" face=
=3D"" >diff --git a/libflash/libffs.c b/libflash/libffs.c</font></tt><br><t=
t><font size=3D"3" face=3D"" >index 763e061c..daa62da6 100644</font></tt><b=
r><tt><font size=3D"3" face=3D"" >--- a/libflash/libffs.c</font></tt><br><t=
t><font size=3D"3" face=3D"" >+++ b/libflash/libffs.c</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >@@ -180,7 +180,12 @@ static int ffs=5Fentry=5Fto=
=5Fcpu(struct ffs=5Fhdr *hdr,</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >return rc;</font></tt><br>     =
   <tt><font size=3D"3" face=3D"" >}</font></tt></li></ul><tt><font size=3D=
"3" face=3D"" >-static struct ffs=5Fentry *ffs=5Fget=5Fpart(struct ffs=5Fha=
ndle *ffs, uint32=5Ft index)</font></tt><br><tt><font size=3D"3" face=3D"" =
>+bool has=5Fflag(struct ffs=5Fentry *ent, uint16=5Ft flag)</font></tt><br>=
<tt><font size=3D"3" face=3D"" >+{</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ return ((ent-&gt;user.miscflags &amp; flag) !=3D 0);</font></tt><b=
r><tt><font size=3D"3" face=3D"" >+}</font></tt><br><tt><font size=3D"3" fa=
ce=3D"" >+</font></tt><br><tt><font size=3D"3" face=3D"" >+struct ffs=5Fent=
ry *ffs=5Fentry=5Fget(struct ffs=5Fhandle *ffs, uint32=5Ft index)</font></t=
t>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >{</font></tt><br>        <tt><f=
ont size=3D"3" face=3D"" >int i =3D 0;</font></tt><br>        <tt><font siz=
e=3D"3" face=3D"" >struct ffs=5Fentry *ent =3D NULL;</font></tt></li></ul><=
tt><font size=3D"3" face=3D"" >@@ -369,7 +374,7 @@ int ffs=5Fpart=5Finfo(st=
ruct ffs=5Fhandle *ffs, uint32=5Ft part=5Fidx,</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >struct ffs=5Fentry *ent;</font></tt><br><tt><font size=
=3D"3" face=3D"" >char *n;</font></tt><br><br><tt><font size=3D"3" face=3D"=
" >- ent =3D ffs=5Fget=5Fpart(ffs, part=5Fidx);</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >+ ent =3D ffs=5Fentry=5Fget(ffs, part=5Fidx);</font></t=
t>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >if (!ent)</font></tt><br>     =
   <tt><font size=3D"3" face=3D"" >return FFS=5FERR=5FPART=5FNOT=5FFOUND;</=
font></tt></li></ul><tt><font size=3D"3" face=3D"" >@@ -776,7 +781,7 @@ int=
 ffs=5Fupdate=5Fact=5Fsize(struct ffs=5Fhandle *ffs, uint32=5Ft part=5Fidx,=
</font></tt><br><tt><font size=3D"3" face=3D"" >uint32=5Ft offset;</font></=
tt><br><tt><font size=3D"3" face=3D"" >int rc;</font></tt><br><br><tt><font=
 size=3D"3" face=3D"" >- ent =3D ffs=5Fget=5Fpart(ffs, part=5Fidx);</font><=
/tt><br><tt><font size=3D"3" face=3D"" >+ ent =3D ffs=5Fentry=5Fget(ffs, pa=
rt=5Fidx);</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >if (!ent) {</font></tt><br>   =
     <tt><font size=3D"3" face=3D"" >FL=5FDBG("FFS: Entry not found\n");</f=
ont></tt><br>        <tt><font size=3D"3" face=3D"" >return FFS=5FERR=5FPAR=
T=5FNOT=5FFOUND;</font></tt></li></ul><tt><font size=3D"3" face=3D"" >diff =
--git a/libflash/libffs.h b/libflash/libffs.h</font></tt><br><tt><font size=
=3D"3" face=3D"" >index 2c1fbd83..a86c698f 100644</font></tt><br><tt><font =
size=3D"3" face=3D"" >--- a/libflash/libffs.h</font></tt><br><tt><font size=
=3D"3" face=3D"" >+++ b/libflash/libffs.h</font></tt><br><tt><font size=3D"=
3" face=3D"" >@@ -92,6 +92,8 @@ struct ffs=5Fentry=5Fuser {</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >bool has=5Fecc(struct ffs=5Fent=
ry *ent);</font></tt></li></ul><tt><font size=3D"3" face=3D"" >+bool has=5F=
flag(struct ffs=5Fentry *ent, uint16=5Ft flag);</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >+</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >/* Init */</font></tt></li></ul=
><tt><font size=3D"3" face=3D"" >int ffs=5Finit(uint32=5Ft offset, uint32=
=5Ft max=5Fsize, struct blocklevel=5Fdevice *bl,</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >@@ -126,6 +128,8 @@ int ffs=5Fpart=5Finfo(struct ffs=
=5Fhandle *ffs, uint32=5Ft part=5Fidx,</font></tt>
<ul style=3D"padding-left: 30pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >char **name, uint32=5Ft *start=
,</font></tt><br>        <tt><font size=3D"3" face=3D"" >uint32=5Ft *total=
=5Fsize, uint32=5Ft *act=5Fsize, bool *ecc);</font></tt></li></ul><tt><font=
 size=3D"3" face=3D"" >+struct ffs=5Fentry *ffs=5Fentry=5Fget(struct ffs=5F=
handle *ffs, uint32=5Ft index);</font></tt><br><tt><font size=3D"3" face=3D=
"" >+</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >int ffs=5Fupdate=5Fact=5Fsize(s=
truct ffs=5Fhandle *ffs, uint32=5Ft part=5Fidx,</font></tt><br>        <tt>=
<font size=3D"3" face=3D"" >uint32=5Ft act=5Fsize);</font></tt></li></ul><t=
t><font size=3D"3" face=3D"" >diff --git a/libflash/test/Makefile.check b/l=
ibflash/test/Makefile.check</font></tt><br><tt><font size=3D"3" face=3D"" >=
index 1f92b9d2..419a50a9 100644</font></tt><br><tt><font size=3D"3" face=3D=
"" >--- a/libflash/test/Makefile.check</font></tt><br><tt><font size=3D"3" =
face=3D"" >+++ b/libflash/test/Makefile.check</font></tt><br><tt><font size=
=3D"3" face=3D"" >@@ -4,7 +4,7 @@ LIBFLASH=5FTEST :=3D libflash/test/test-f=
lash libflash/test/test-ecc libflash/test/t</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >LCOV=5FEXCLUDE +=3D $(LIBFLASH=
=5FTEST:%=3D%.c)</font></tt></li></ul><tt><font size=3D"3" face=3D"" >.PHON=
Y : libflash-check libc-coverage</font></tt><br><tt><font size=3D"3" face=
=3D"" >-libflash-check: $(LIBFLASH=5FTEST:%=3D%-check) $(CORE=5FTEST:%=3D%-=
gcov-run)</font></tt><br><tt><font size=3D"3" face=3D"" >+libflash-check: $=
(LIBFLASH=5FTEST:%=3D%-check) libflash/test/test-miscprint $(CORE=5FTEST:%=
=3D%-gcov-run)</font></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >libflash-coverage: $(LIBFLASH=
=5FTEST:%=3D%-gcov-run)</font></tt></li></ul><tt><font size=3D"3" face=3D""=
 >check: libflash-check libc-coverage</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >@@ -16,6 +16,9 @@ $(LIBFLASH=5FTEST:%=3D%-gcov-run) : %-run: %</f=
ont></tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >$(LIBFLASH=5FTEST:%=3D%-check) =
: %-check: %</font></tt><br>        <tt><font size=3D"3" face=3D"" >$(call =
QTEST, RUN-TEST ,$(VALGRIND) $&lt;, $&lt;)</font></tt></li></ul><tt><font s=
ize=3D"3" face=3D"" >+libflash/test/test-miscprint:</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ $(call Q, RUN-TEST , ./libflash/test/test-miscpri=
nt.sh , &nbsp;$@)</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></=
tt>
<ul style=3D"padding-left: 6pt; margin-left: 0px; list-style-type: none;" >=
        <li><tt><font size=3D"3" face=3D"" >libflash/test/stubs.o: libflash=
/test/stubs.c</font></tt><br>        <tt><font size=3D"3" face=3D"" >$(call=
 Q, HOSTCC ,$(HOSTCC) $(HOSTCFLAGS) -g -c -o $@ $&lt;, $&lt;)</font></tt></=
li></ul><tt><font size=3D"3" face=3D"" >diff --git a/libflash/test/test-mis=
cprint.pnor b/libflash/test/test-miscprint.pnor</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >new file mode 100644</font></tt><br><tt><font size=3D"3=
" face=3D"" >index 00000000..e3f3d355</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >--- /dev/null</font></tt><br><tt><font size=3D"3" face=3D"" >+++ =
b/libflash/test/test-miscprint.pnor</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >@@ -0,0 +1,103 @@</font></tt><br><tt><font size=3D"3" face=3D"" >+5=
04152540000000100000001000000800000000500000300000000040000</font></tt><br>=
<tt><font size=3D"3" face=3D"" >+0000000000000000000000000000504151d5706172=
740000000000000000</font></tt><br><tt><font size=3D"3" face=3D"" >+00000000=
0000000000000001ffffffff0000000100000003000000010000</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >+0300000000000000000000000000000000000000000000000=
00000000000</font></tt><br><tt><font size=3D"3" face=3D"" >+000000000000000=
000000000000000000000000000000000000000000000</font></tt><br><tt><font size=
=3D"3" face=3D"" >+000000000000000000000000000000000000000000008f9e8e895052=
4553</font></tt><br><tt><font size=3D"3" face=3D"" >+4552564544000000000000=
000000000100000000ffffffff000000020000</font></tt><br><tt><font size=3D"3" =
face=3D"" >+000100000000000001000000000000000000000000000000000000000000</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+00800000000000000000000000000=
0000000000000000000000000000000</font></tt><br><tt><font size=3D"3" face=3D=
"" >+000000000000000000000000000000000000000000000000000000000000</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ae7fedeb524541444f4e4c59000000000000=
00000000000100000000ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ff00000003000000010000000000000100000000000000000000000000</font></tt><br><=
tt><font size=3D"3" face=3D"" >+0000000000000000004000000000000000000000000=
00000000000000000</font></tt><br><tt><font size=3D"3" face=3D"" >+000000000=
000000000000000000000000000000000000000000000000000</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+0000000000000000e2b4f3e1524550524f564953494f4e0000=
0000000000</font></tt><br><tt><font size=3D"3" face=3D"" >+000100000000ffff=
ffff0000000400000001000000000000010000000000</font></tt><br><tt><font size=
=3D"3" face=3D"" >+00000000000000000000000000000000001000000000000000000000=
0000</font></tt><br><tt><font size=3D"3" face=3D"" >+0000000000000000000000=
00000000000000000000000000000000000000</font></tt><br><tt><font size=3D"3" =
face=3D"" >+00000000000000000000000000000000abb3a9fa4241434b555000000000</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+0000000000000000000200000000f=
fffffff000000050000000100000000</font></tt><br><tt><font size=3D"3" face=3D=
"" >+000001000000000000000000000000000000000000000000002000000000</font></t=
t><br><tt><font size=3D"3" face=3D"" >+000000000000000000000000000000000000=
000000000000000000000000</font></tt><br><tt><font size=3D"3" face=3D"" >+00=
0000000000000000000000000000000000000000000000e8cebdb2ffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffff=
ffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffff=
ffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=
=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffff=
ffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" =
face=3D"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffff=
fffffffffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D=
"" >+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></t=
t><br><tt><font size=3D"3" face=3D"" >+ffffffffffffffffffffffffffffffffffff=
ffffffffffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+ff=
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><=
tt><font size=3D"3" face=3D"" >+fffffffffffffffffffffffffffffffffffffffffff=
fffffffffffffffff</font></tt><br><tt><font size=3D"3" face=3D"" >+fffffffff=
fffffffffffffffffffffffffffffffffffffffffffffffffff</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >+ffffffffffffffffffffffff</font></tt><br><tt><font =
size=3D"3" face=3D"" >diff --git a/libflash/test/test-miscprint.sh b/libfla=
sh/test/test-miscprint.sh</font></tt><br><tt><font size=3D"3" face=3D"" >ne=
w file mode 100644</font></tt><br><tt><font size=3D"3" face=3D"" >index 000=
00000..224328be</font></tt><br><tt><font size=3D"3" face=3D"" >--- /dev/nul=
l</font></tt><br><tt><font size=3D"3" face=3D"" >+++ b/libflash/test/test-m=
iscprint.sh</font></tt><br><tt><font size=3D"3" face=3D"" >@@ -0,0 +1,27 @@=
</font></tt><br><tt><font size=3D"3" face=3D"" >+#!/bin/bash</font></tt><br=
><tt><font size=3D"3" face=3D"" >+</font></tt><br><tt><font size=3D"3" face=
=3D"" >+# test-miscprint.pnor is constructed as follows:</font></tt><br><tt=
><font size=3D"3" face=3D"" >+# PRESERVED,0x00000300,0x00000100,P,/dev/zero=
</font></tt><br><tt><font size=3D"3" face=3D"" >+# READONLY,0x00000400,0x00=
000100,R,/dev/zero</font></tt><br><tt><font size=3D"3" face=3D"" >+# REPROV=
ISION,0x00000500,0x00000100,F,/dev/zero</font></tt><br><tt><font size=3D"3"=
 face=3D"" >+# BACKUP,0x00000600,0x00000100,B,/dev/zero</font></tt><br><tt>=
<font size=3D"3" face=3D"" >+</font></tt><br><tt><font size=3D"3" face=3D""=
 >+wd=3D$(dirname -- "$0")</font></tt><br><tt><font size=3D"3" face=3D"" >+=
</font></tt><br><tt><font size=3D"3" face=3D"" >+{</font></tt><br><tt><font=
 size=3D"3" face=3D"" >+ xxd -p -r "$wd/test-miscprint.pnor" &gt;&nbsp;"$wd=
/temp.pnor"</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt><br=
><tt><font size=3D"3" face=3D"" >+ output1=3D$(pflash --detail=3D1 -F "$wd/=
temp.pnor" | grep "\[P\]")</font></tt><br><tt><font size=3D"3" face=3D"" >+=
 output2=3D$(pflash --detail=3D2 -F "$wd/temp.pnor" | grep "\[R\]")</font><=
/tt><br><tt><font size=3D"3" face=3D"" >+ output3=3D$(pflash --detail=3D3 -=
F "$wd/temp.pnor" | grep "\[F\]")</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ output4=3D$(pflash --detail=3D4 -F "$wd/temp.pnor" | grep "\[B\]")=
</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt><br><tt><font =
size=3D"3" face=3D"" >+ if [[ $output1 =3D=3D "PRESERVED [P]" &amp;&amp; $o=
utput2 =3D=3D "READONLY [R]" &amp;&amp;</font></tt><br><tt><font size=3D"3"=
 face=3D"" >+ &nbsp; &nbsp; &nbsp;$output3 =3D=3D "REPROVISION [F]" &amp;&a=
mp; $output4 =3D=3D "BACKUP [B]" ]]; then</font></tt><br><tt><font size=3D"=
3" face=3D"" >+ &nbsp; &nbsp;echo "Test passed!"</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >+ else</font></tt><br><tt><font size=3D"3" face=3D"" >=
+ &nbsp; &nbsp;echo "Test failed!"</font></tt><br><tt><font size=3D"3" face=
=3D"" >+ fi</font></tt><br><tt><font size=3D"3" face=3D"" >+</font></tt><br=
><tt><font size=3D"3" face=3D"" >+ rm "$wd/temp.pnor"</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >+} &gt;&nbsp;"$wd/test-miscprint.o"</font></tt><b=
r><tt><font size=3D"3" face=3D"" >--</font></tt><br><tt><font size=3D"3" fa=
ce=3D"" >2.11.0 (Apple Git-81)</font></tt></blockquote>
<div>&nbsp;</div></div></div><BR>
