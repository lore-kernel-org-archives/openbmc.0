Return-Path: <ojayanth@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wSR3R3FdczDqZJ
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 17:37:06 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4H7Y2pg037335
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 03:36:58 -0400
Received: from e28smtp01.in.ibm.com (e28smtp01.in.ibm.com [125.16.236.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2agf3tg4sa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 03:36:57 -0400
Received: from localhost
 by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Wed, 17 May 2017 13:06:53 +0530
Received: from d28relay10.in.ibm.com (9.184.220.161)
 by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 17 May 2017 13:06:52 +0530
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
 by d28relay10.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4H7ZHSd30015582
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 13:05:17 +0530
Received: from d28av02.in.ibm.com (localhost [127.0.0.1])
 by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v4H7apWQ018330
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 13:06:51 +0530
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v4H7amP3018303
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 13:06:50 +0530
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Wed, 17 May 2017 01:36:48 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 17 May 2017 01:36:44 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ojayanth@in.ibm.com>;
 Wed, 17 May 2017 07:36:43 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 17 May 2017 07:36:41 -0000
Received: from us1a3-mail76.a3.dal09.isc4sb.com ([10.142.3.53])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017051707364131-108007 ;
 Wed, 17 May 2017 07:36:41 +0000 
In-Reply-To: 
Subject: BMC Dump High level Design
From: "Jayanth Othayoth" <ojayanth@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 17 May 2017 07:36:41 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14370-1181 | IBM Domino Build
 SCN_20170424T1816_FP2.2 May 09, 2017 at 09:16
X-LLNOutbound: False
X-Disclaimed: 40495
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17051707-7323-0000-0000-000001050EAB
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.423878;
 ST=0; TS=0; UL=0; ISC=; MB=0.163084
X-IBM-SpamModules-Versions: BY=3.00007076; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00861636; UDB=6.00427379; IPR=6.00641298; 
 BA=6.00005353; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015488; XFM=3.00000015;
 UTC=2017-05-17 07:36:42
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-05-17 06:42:16 - 6.00006754
x-cbparentid: 17051707-3108-0000-0000-00001216F216
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF8B18E4E2.0156BD10-ON00258123.0028B202-00258123.0029CFA1@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-17_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=25
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705170059
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
X-List-Received-Date: Wed, 17 May 2017 07:37:08 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><div>Design goals=
:<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Enable Debug data colle=
ction for user level application failure and user initiated dump. Design sh=
ould be flexible enough to accommodate<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Any future dump use cases<br>&nbsp;&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Open sour=
ce reporting tools</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Assumptions:<br>&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=96=AA&nbsp;&nbsp=
; &nbsp;FFDC partition size is 1MB.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =E2=96=AA&nbsp;&nbsp; &nbsp;Maximum size of a Dum=
p entry is 500K.</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Overview<br>&nbsp;&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=96=AA&nbsp;&nbsp; &nbsp;Dump Manage=
ment contains two processes and a bash script based infrastructure(dReport)=
 for reporting.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83=
&nbsp;&nbsp; &nbsp;phosphor-dump-manager: This is daemon and serves the key=
 Dbus calls related to Dump. Which includes<br>&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =E2=80=A2&nbsp;&nbsp; &nbsp;Manager Class which is responsible for over=
all Dump management.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbs=
p; &nbsp;Entry class is responsible for individual Dump entry level managem=
ent.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;Dbus in=
terfaces ( REST use cases) as part of this process.<br>&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;=
&nbsp; &nbsp;Create(): Start creating new user initiated dump reports and s=
ave in to FFDC partition.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; =
&nbsp;Member in Manager class.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;Delete()=
: Delete all dump reports in FFDC partition.<br>&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Member in Manag=
er class<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;GetDump(): returns Dump data f=
ile for a given Dump ID.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Member in Entry class<br>&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&n=
bsp;&nbsp; &nbsp;DeleteDump(): Delete dumpreport for a given Dump ID. ( Use=
 exiting DBus delete function)<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Member in Entry class<br>&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;ReportDump(Ty=
pe,list of files): Start creating new dump reports using dReport script bas=
ed on type and save in to FFDC partition.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;Member in Manager =
class and&nbsp; Dbus (internal) interface.</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=
=A2&nbsp;&nbsp; List of files includes core file info incase core dump type=
.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&n=
bsp;&nbsp; &nbsp;initiate dReport script for creating dump report.</div>
<div>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbs=
p;Attributes supports.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;Size.<br>&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Membe=
r in Entry class<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=
=80=A2&nbsp;&nbsp; &nbsp;TimeStamp().<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Member in Entry class<=
br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;pho=
sphor-dump-inotify:</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -This is daemon for monitoring for new core f=
iles in the selected core file directory.</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; - For any new core this will read the list of avail=
able cores in the inotify list and&nbsp; call&nbsp; ReportDump(ApplicationC=
rash,list of core files) bus interface to generate new Report.</div>
<div><br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nb=
sp;dReport: Bash script based reporting application, which is used to gener=
ates a compressed tarball of debugging information based on input type and<=
/div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; settings in the bmcdump.config file settings.Details are availa=
ble in dReport Section.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Execution flow for User=
 initiated Dump<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=96=AA&nbsp=
;&nbsp; &nbsp;User request Dump via REST call<br>&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=96=AA&nbsp;&nbsp; &nbsp;Dump Manage=
r gets this request<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Call internal function=
 ReportDump(Type =3D userInitiated) to initiate dump reporting process.<br>=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;=
&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;ReportDump(Type,ErrorlogID)<br>&nbsp;&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Increment Dum=
pID.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp;&nbsp; G=
enerate UUID ( use existing systemD d bus api)<br>&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Creates Entry objects with dumpID,=
 errorlogID and Type.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=
=83&nbsp;&nbsp; &nbsp;call dReport script for reporting dump.<br>&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 =E2=81=83&nbsp;&nbsp; &nbsp;input parameter Type, dumpID, errorlogID,UUID<=
br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &=
nbsp;update Entry object member size with file size info.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Execution flow for Appl=
ication Crash<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=E2=80=A2&nbsp;&nbsp; &nbsp;phosphor-dump-inotify daemon gets notification =
for the new core file.</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =E2=80=A2=
&nbsp;&nbsp; phosphor-dump-inotify daemon reads the list core file from ino=
tify.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp;&nbs=
p; phosphor-dump-inotify call=E2=80=99s internal dBus interface ReportDump(=
Type =3D ApplicationCrash, list of core files).<br>&nbsp;&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&n=
bsp; &nbsp;Create Error log and commit.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Need to follow same steps mentio=
ned above in ReportDump(Type, ErrorlogID)</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;For future usecases<br>=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;Create=
 service file and use internal DBus interface ReportDump(Type,errorlogid) t=
o trigger dump.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Git Repo - phosphor-deb=
ug-collector.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Dump File Name: bmcdump=
[TIMESTAMP][Serial Number][UUID][TYPE].tar.bz2</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Other potential Dump us=
e cases, not considered here<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
=E2=96=AA&nbsp;&nbsp; &nbsp;Kernel panic<br>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;&nbsp; =E2=96=AA&nbsp;&nbsp; &nbsp;Host quiesce state<br>&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;&nbsp; =E2=96=AA&nbsp;&nbsp; &nbsp;Boot Failure<br>&nbsp=
; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; =E2=96=AA&nbsp;&nbsp; &nbsp;BMC Reset</=
div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>dReport:</strong><br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; =
&nbsp;This design approach is adopted from init.d.<br>&nbsp;&nbsp; &nbsp;=
=E2=80=A2&nbsp;&nbsp; &nbsp;=E2=80=9CdReport=E2=80=9D set of bash scripts t=
hat gathers information about system hardware, configuration and debug logs=
. This information can be used for diagnostic purposes</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and debugging. =
This tool is mainly aimed for developers and lab bring-up. Key features<br>=
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp=
;&nbsp; &nbsp;Generates a compressed tarball of debugging information based=
 on user inputs and bmcdump.config file settings.</div>
<div>Design Flow: &nbsp;<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;=
The /etc/bmcdump.conf used to keep all dump specific config and settings</d=
iv>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;All installed&nbsp; Dum=
p collection commands script should store in&nbsp; /usr/share/dump/bmc-base=
.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&=
nbsp; &nbsp;Script command&nbsp; file follows&nbsp; a simple format and set=
 of consistent actions,&nbsp; which includes<br>&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbs=
p;&nbsp; &nbsp;CONFIG [TYPE ..] [priority]&nbsp; - TYPE - 0..6 priority 0..=
99 ( Eg : CONFIG 234 93 =E2=80=94 include this in TYPE 2,3,4 with priority =
93)<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Methods<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;execute()&nbsp;&nbsp; =E2=80=
=94 execute command and save in to temporary file.<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;error()&nbsp;&nbsp;&nbsp;&nbsp;=
 =E2=80=94 handle error.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&=
nbsp;&nbsp; &nbsp;summary()&nbsp;&nbsp; =E2=80=94 Update summary log file w=
ith execution status.</div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Create&nbsp; symbolic l=
inks in /usr/share/dump/bmc-xx (use case specific path) during initializati=
on based on the control comments defined in the beginning of the script.<br=
>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbs=
p; &nbsp;File name Eg:&nbsp;&nbsp; /usr/share/dump/bmc-rc1/b93date&nbsp;&nb=
sp;&nbsp; =E2=80=94 b ( BMC Dump) , 93 - Sequence .Date -command name.<br>&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp; Sequence number in which the programs =
should be started. This can be used optimizing dump incase size exceeded.</=
div>
<div>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Depending on type setti=
ng, the&nbsp; report bash script&nbsp; will execute the programs from one o=
f the following directories.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;0 : Disable Dump&nbsp; /usr/s=
hare/dump/bmc-disable&nbsp; &nbsp;<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;1 : User Initiated&nbsp=
;&nbsp; /usr/share/bmc-userinitiated<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;2 : Application crash&nbsp=
; /usr/share/bmc-appcrash</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp;Example: Subsystems installed in /etc/init.d<br>&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; &nbsp;-bash-4.1$ pwd<br>&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; &nbsp;/etc/init.d<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-bash-4.1$ l=
s -l<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-rwxr-xr-x. 1 root root&nbsp;=
&nbsp;&nbsp;&nbsp; 1288 Jan 23&nbsp; 2013 abrt-ccpp<br>&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;-rwxr-xr-x. 1 root root&nbsp;&nbsp;&nbsp;&nbsp; 1628 Jan =
23&nbsp; 2013 abrtd<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-rwxr-xr-x. 1 =
root root&nbsp;&nbsp;&nbsp;&nbsp; 1642 Jan 23&nbsp; 2013 abrt-oops<br>&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;--rwxr-xr-x. 1 root root&nbsp;&nbsp;&nbsp;=
&nbsp; 2062 Oct&nbsp; 6&nbsp; 2014 atd<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &=
nbsp;-rwxr-xr-x. 1 root root&nbsp;&nbsp;&nbsp;&nbsp; 1041 Jan 16&nbsp; 2014=
 atop<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-rwxr-xr-x. 1 root root&nbsp=
;&nbsp;&nbsp;&nbsp; 3378 Mar 14&nbsp; 2012 auditd</div>
<div>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;/etc/rc.d/rcN.d (N is the runlev=
el indicator)<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;These directories mu=
st contain only special symbolic links to the scripts in /etc/init.d. This =
is how it looks:<br>&nbsp;&nbsp; &nbsp;Example: /etc/rc3.d listing<br>&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-bash-4.1$ pwd<br>&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;/etc/rc3.d<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;-bash-4.1=
$ ls -l<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lrwxrwxrwx. 1 root root 17=
 May&nbsp; 2&nbsp; 2015 K00ipmievd -&gt; ../init.d/ipmievd<br>&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;lrwxrwxrwx. 1 root root 22 May&nbsp; 2&nbsp; 2015 =
K01bmc-watchdog -&gt; ../init.d/bmc-watchdog<br>&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;lrwxrwxrwx. 1 root root 18 May&nbsp; 2&nbsp; 2015 K01collectl -&=
gt; ../init.d/collectl<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lrwxrwxrwx.=
 1 root root 16 May&nbsp; 2&nbsp; 2015 K01smartd -&gt; ../init.d/smartd</di=
v>
<div><br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Dump Manager/comman=
d line can&nbsp; executes /usr/share/dump/dReport bash script , which inclu=
des<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp=
; &nbsp;Check the space available in temporary location (/tmp)<br>&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=
=83&nbsp;&nbsp; &nbsp;Exit script with error code , incase no space availab=
le.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp=
; &nbsp;For any space issue during dump data collection ,dReport should sav=
e the collected info into specified location in the Flash.<br>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Depending on=
 the =E2=80=9Ctype=E2=80=9D, execute the programs from the specified direct=
ories ,. which includes<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Dump Summary=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;copy of=
&nbsp; /usr/share/bmcdump.conf.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Dump=
 Log<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Outputs of the various commands=
 in /usr/share/dump/bmc-rcx<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; =E2=81=83&nbsp;&nbsp; &nbsp;Create log file to keep the Dump collection=
 progress.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbs=
p;&nbsp; &nbsp;Store the data in /tmp/Dump/filename temporarily.<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=
=83&nbsp;&nbsp; &nbsp;Use file move option for core specific debug files in=
case file delete option is enabled for the specific files.<br>&nbsp;&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nb=
sp;&nbsp; &nbsp;Data stores in File format similar to sosreport.<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Check =
the space availability in Permanent location<br>&nbsp;&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbs=
p;Delete the oldest dump incase, the allowed size is less than Dump Max siz=
e if the file delete policy is enabled.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Generate compressed tarball and=
 save into permanent location.<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;Delete lower priority files incase compre=
ssed tar file is great than allowed size<br>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;D=
elete temporary file after successful compression.<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbs=
p; &nbsp;Delete core debug file from core location incase , it is included =
in this dump.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;For any general failure whic=
h cause Dump collection script will exit with an error code</div>
<div>&nbsp;</div>
<div>BMC Dump configuration - /etc/bmcdump.conf.<br>&nbsp;&nbsp; &nbsp;=E2=
=80=A2&nbsp;&nbsp; &nbsp;This need discussion , keep system config only now=
<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Options are set using 'i=
ni'-style name =3D value pairs.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp;=
 &nbsp;Name info<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp=
;&nbsp; &nbsp;filelocationtemp&nbsp;&nbsp;&nbsp; // Temporary file location=
 in RAM<br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &=
nbsp;filelocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // File path in=
 Flash<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &n=
bsp;compression&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Compress=
ion scheme.<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbs=
p; &nbsp;corefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; // Core file path<br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; =E2=
=81=83&nbsp;&nbsp; &nbsp;kerneldebug&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; // Kernel Debug Data path<br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &n=
bsp; =E2=81=83&nbsp;&nbsp; &nbsp;maxsize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Max file size.<br>&nbsp; &nbsp; &n=
bsp; &nbsp;&nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;debug&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Enab=
le Debug option. to print more trace</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&n=
bsp;&nbsp; deletedump&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Delete old dumps inc=
ase not enough storage space.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>Dump Contents:</strong></div>
<div>&nbsp;</div>
<div>0-9: Must to have for all types of Dumps</div>
<div>1. summary.log&nbsp; &nbsp;<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp=
; &nbsp;DumpID<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;UUID<br>&n=
bsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;File Name<br>&nbsp;&nbsp; &nbs=
p;=E2=80=A2&nbsp;&nbsp; &nbsp;The Date<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp=
;&nbsp; &nbsp;System uptime<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nb=
sp;Software release information (Kernel,BMC,Host).<br>&nbsp;&nbsp; &nbsp; &=
nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;cat /etc/version<br>&nbsp;&nbsp; &=
nbsp; &nbsp; &nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;cat /etc/os-release<br>&nbs=
p;&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp; &nbsp;uname -a<br>&nbsp;&nbsp; &nbsp;=
=E2=80=A2&nbsp;&nbsp; &nbsp;State information ( BMC,Chassis,Host )<br>&nbsp=
;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Boot progress<br>&nbsp;&nbsp; &nb=
sp;=E2=80=A2&nbsp;&nbsp; &nbsp;Dump Status summary.</div>
<div>2. dump Log file.</div>
<div>3. Configuration/State Basic:<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nb=
sp; &nbsp;CPUs info&nbsp;&nbsp; (cat /proc/cpuinfo)<br>&nbsp;&nbsp; &nbsp;=
=E2=80=A2&nbsp;&nbsp; &nbsp;Memory info (cat /proc/meminfo)<br>&nbsp;&nbsp;=
 &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;Disk usage&nbsp; (df -hT)&nbsp;&nbsp; &n=
bsp;<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;network basic info (=
 ip link and ip addr)<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;LED=
.<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &nbsp;systemctl status&nbsp; =
- runtime status information<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&nbsp; &n=
bsp;systemctl --all --state=3Dfailed<br>&nbsp;&nbsp; &nbsp;=E2=80=A2&nbsp;&=
nbsp; &nbsp;OS commands<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=80=
=A2&nbsp;&nbsp; &nbsp;top<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;=
 =E2=80=A2&nbsp;&nbsp; &nbsp;free<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; =E2=80=A2&nbsp;&nbsp; &nbsp;ps<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;mount<br>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;ulimit -a</div>
<div>4. Dump Config file.<br>&nbsp; &nbsp;<br>10-99: Use case specific fail=
ures</div>
<div>&nbsp;</div>
<div><strong>=E2=80=A2&nbsp;&nbsp; &nbsp;User initiated:</strong><br>&nbsp;=
&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp; &nbsp;Journal Traces =E2=80=9Cwarning an=
d above. (journalctl -p 4)<br>&nbsp;&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp; &nbs=
p;Error Logs.<br>&nbsp;&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp; &nbsp;systemctl<b=
r>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbs=
p;list-jobs&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; =
To list running Jobs<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=80=A2=
&nbsp;&nbsp; &nbsp;list-units -t service --all&nbsp;&nbsp; &nbsp;To list al=
l available services and their current status<br>&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;list-units -t target --all&nbsp=
;&nbsp; &nbsp;To show all available targets.<br>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;list-timers<br>&nbsp;&nbsp; &nbs=
p;=E2=81=83&nbsp;&nbsp; &nbsp;Inventory dump.<br>&nbsp;&nbsp; &nbsp;=E2=81=
=83&nbsp;&nbsp; &nbsp;Watchdog<br>&nbsp;&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp; =
&nbsp;Settings<br>&nbsp;&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp;&nbsp; Host Senso=
r info<br>&nbsp;&nbsp;&nbsp; =E2=81=83&nbsp;&nbsp; &nbsp;/var/logs<br>&nbsp=
;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;Console:&nb=
sp; /var/log/obmc-console.log<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
=E2=80=A2&nbsp;&nbsp; &nbsp;SystemD:&nbsp; /var/log/messages<br>&nbsp;&nbsp=
; &nbsp;=E2=81=83&nbsp;&nbsp; &nbsp;/proc<br>&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;&nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;/proc/net Network advanced info<br>&=
nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;device =
tree (find /proc/device-tree/ -type f -exec head {} + | less)<br>&nbsp;&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; =E2=80=A2&nbsp;&nbsp; &nbsp;dmesg</div>
<div>&nbsp;</div>
<div><strong>=E2=80=A2&nbsp;&nbsp; &nbsp;Application Crash</strong><br>&nbs=
p;&nbsp; &nbsp;=E2=81=83&nbsp;&nbsp; &nbsp;Core File.</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks &amp; Regards<br><br>Jayanth Othayoth<br>&nbsp;</d=
iv></div><BR>
