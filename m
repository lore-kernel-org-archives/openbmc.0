Return-Path: <ojayanth@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wC2MM1TwJzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 22:19:26 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3PCJ3iv115392
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 08:19:13 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2a244mp62x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 08:19:12 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Tue, 25 Apr 2017 22:19:06 +1000
Received: from d23relay10.au.ibm.com (202.81.31.229)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 25 Apr 2017 22:19:04 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3PCItop55705756
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 22:19:03 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v3PCIU8d016573
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 22:18:30 +1000
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v3PCISvk016160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 22:18:30 +1000
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Tue, 25 Apr 2017 08:18:20 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.75)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Tue, 25 Apr 2017 08:18:17 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Tue, 25 Apr 2017 12:18:16 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 25 Apr 2017 12:18:14 -0000
Received: from us1a3-mail76.a3.dal09.isc4sb.com ([10.142.3.53])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2017042512181333-129412 ;
 Tue, 25 Apr 2017 12:18:13 +0000 
In-Reply-To: 
Subject: OpenBMC Debug data collection tool evaluation updates
From: "Jayanth Othayoth" <ojayanth@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 25 Apr 2017 12:18:13 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14114-1129 | IBM Domino Build
 SCN_20170403T2153_FP6.1 April 19, 2017 at 09:53
X-LLNOutbound: False
X-Disclaimed: 10295
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17042512-0048-0000-0000-000002236608
X-IBM-SpamModules-Scores: BY=0.287053; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.439231; ST=0; TS=0; UL=0; ISC=; MB=0.162951
X-IBM-SpamModules-Versions: BY=3.00006971; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00852235; UDB=6.00421237; IPR=6.00631072; 
 BA=6.00005312; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015168; XFM=3.00000013;
 UTC=2017-04-25 12:18:14
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-04-25 10:00:59 - 6.00006648
x-cbparentid: 17042512-3816-0000-0000-00000F17830B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF887D4BA6.3DF1614A-ON0025810D.004324D1-0025810D.0043964E@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-25_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704250223
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
X-List-Received-Date: Tue, 25 Apr 2017 12:19:27 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><div>Goal : Colle=
ct BMC failure analysis and Debug data within size limit 1MB ( Max size per=
 entry 500K).<br>&nbsp;<br>Evaluation Scope:<br>&nbsp;&nbsp; &nbsp;=E2=80=
=A2&nbsp;&nbsp; &nbsp;Identify industry standard open Source tool that can =
be used for BMC Debug Data monitoring, packaging and reporting.<br>&nbsp;<b=
r>Tools considered for this evaluation :<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nb=
sp;&nbsp; &nbsp;SOSREPORT:&nbsp; Failure Debug data Packaging<br>&nbsp;&nbs=
p; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;ABRT: Failure Monitoring and Debug Dat=
a Packaging and reporting</div>
<div>Packaging:&nbsp;&nbsp; SOSREPORT<br><a href=3D"http://github.com/sosre=
port/sos" >http://github.com/sosreport/sos</a><br>&nbsp;<br>What is sosrepo=
rt ?<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;It generates a compr=
essed tar archive of diagnostic information from the running system. The ar=
chive may be stored locally or centrally for&nbsp; recording or tracking pu=
rposes or may be sent to technical support representatives, developers or s=
ystem&nbsp; administrators&nbsp; to&nbsp; assist&nbsp; with technical fault=
-finding and debugging.<br>&nbsp;<br>Technologies used:<br>&nbsp;&nbsp; &nb=
sp;=E2=80=A2&nbsp;&nbsp; &nbsp;Python<br>&nbsp;<br>Pros:<br>&nbsp;&nbsp; &n=
bsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Sos is modular in design and is able to col=
lect data from a wide range of subsystems and packages that may be installe=
d.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;XML or HTML report sum=
mary support.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Provides ea=
sy way to control the contents.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp;=
 &nbsp;Widely used in Linux community which has active support forums<br>&n=
bsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Used in Open Power.<br>Cons:<b=
r>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Package size is not suitab=
le for Storage constrained embedded platforms.<br>&nbsp;<br>Base SOS Packag=
e with minimal plugin size: 360K (based on Fedora distribution)<br>&nbsp;<b=
r>&nbsp;<br>Reporting:&nbsp;&nbsp; ABRT&nbsp; (Automatic Bug Reporting Tool=
)<br><a href=3D"https://github.com/abrt/abrt" >https://github.com/abrt/abrt=
</a><br>&nbsp;<br>What is abrt?<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp;=
 &nbsp;A set of tools to help users detect and report application crashes.<=
br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Its main purpose is to ea=
se the process of reporting an issue and finding a solution.<br>&nbsp;<br>T=
echnologies:<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;libreport - =
Problem data format, reporting<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; =
&nbsp;satyr backtrace processing, microreports.<br>&nbsp;&nbsp; &nbsp;=E2=
=80=A2&nbsp;&nbsp; &nbsp;Python3<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp=
; &nbsp;Glib2<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Gtk3<br>&nb=
sp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;D-Bus<br>&nbsp;&nbsp; &nbsp;=E2=
=80=A2&nbsp;&nbsp; &nbsp;SELinux<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp=
; &nbsp;systemd<br>&nbsp;<br>Pros:<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nb=
sp; &nbsp;Modular, with plugin for different languages (C, C++,Python),diff=
erent reporters, databases for crash reports.<br>&nbsp;&nbsp; &nbsp;=E2=80=
=A2&nbsp;&nbsp; &nbsp;Provide detailed information about kernel, package, m=
achine environment.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Nice =
cli and GUI for report management.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nb=
sp; &nbsp;Provide Automatic reporting option.<br>&nbsp;&nbsp; &nbsp;<br>Con=
s:<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Needs separate package=
s for C/C++/Python problem analyzer.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&=
nbsp; &nbsp;Heavy Executable's code size footprint<br>&nbsp;&nbsp; &nbsp;=
=E2=80=A2&nbsp;&nbsp; &nbsp;~2.65MB Disk space required for Base applicatio=
n.<br>&nbsp;<br>Base Package size: 2.65MB (based on Fedora distribution)<br=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Byte=
s.<br>abrt &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2519822&nbsp;&nbsp; -- The AB=
RT daemon which runs under the root user as a background service.<br>abrt-c=
li &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 0<br>abrt-addon-=
pstoreoops &nbsp;&nbsp;&nbsp; &nbsp;14497&nbsp;&nbsp;&nbsp;&nbsp; -- Collec=
ting Kernel oopses from pstore storage.<br>abrt-addon-python3 &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18386&nbsp;&nbsp;&nbsp;&nbsp; -- Pytho=
n hook and anlyzer for handling uncaught exception in python program.<br>ab=
rt-tui &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; 24928&nbsp;&nbsp;&nbsp;&nbsp; -- abrt command line i=
nterface.<br>abrt-addon-coredump-helper 35098&nbsp;&nbsp;&nbsp;&nbsp; -- Ho=
ok for C/C++ crashed programs.<br>abrt-addon-vmcore &nbsp;&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 44498&nbsp;&nbsp;&nbsp;&nbsp; --=
 Extracts oops message from the kernel core and install Kernel debuginfo if=
 needed.<br>abrt-addon-xorg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 51445&nbsp;&nb=
sp;&nbsp;&nbsp; -- (NA) Extract Xorg crashes from systemd-journal.<br>abrt-=
libs &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&=
nbsp; 71026&nbsp;&nbsp;&nbsp;&nbsp; --<br>abrt-addon-kerneloops &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp; 73981&nbsp;&nbsp;&nbsp;&nbsp; -- Collecting Kernel Cra=
sh and reporter plugin<br>abrt-python3 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 85040&nbsp;&nbsp;&=
nbsp;&nbsp; -- High level API for querying,creating and manipulating proble=
ms handled in Python3</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Overall Conclusion: Preferably not to use these tools( ABRT,SOSREPORT)=
 for BMC debug data collection features mainly due to&nbsp; Flash size limi=
tation.<br><br>Note: I will be sending separate note on BMC Dump design whi=
ch provides more details on the current approach.</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks &amp; Regards<br><br>Jayanth Othayoth<br>mailto:oj=
ayanth@in.ibm.com</div></div><BR>
