Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcXYq2B3SzDqlj
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:11:59 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5Q08viD115706
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:11:57 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23sp4xfj8u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:11:57 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 18:11:56 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 25 Jun 2016 18:11:53 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 7D12E19D8026
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:11:31 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5Q0BrcA54919358
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 17:11:53 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BADB78038
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:11:53 -0600 (MDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id D3D6578037
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:11:52 -0600 (MDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 20:11:52 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 25 Jun 2016 20:11:49 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 26 Jun 2016 00:11:48 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Jun 2016 00:11:46 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016062600114550-189641 ;
 Sun, 26 Jun 2016 00:11:45 +0000 
In-Reply-To: 
Subject: Re: [PATCH openbmc v6 07/18] initfs: update: Don't exec sh or sulogin
 on error just exit 1
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Sun, 26 Jun 2016 00:11:45 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3.1 June 14, 2016
X-LLNOutbound: False
X-Disclaimed: 45335
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16062600-0004-0000-0000-00000FC5BA31
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.057602; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005430; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00721549; UDB=6.00336905; UTC=2016-06-26
 00:11:47
x-cbparentid: 16062600-4778-0000-0000-00000704F8BD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF6F416665.54BFE71E-ON00257FDB.00728045-00257FDE.00011391@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-25_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606260001
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2016 00:11:59 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 06/22/2016 around 11:58PM, Andrew Jeffery wrote:<br>&gt;On We=
d, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:<br>&gt;&gt; From: "Mil=
ton D. Miller II" &lt;<a target=3D"=5Fblank" href=3D"mailto:miltonm@us.ibm.=
com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&gt;&gt; When update was wr=
itten it was exec'd from the shutdown script<br>&gt;&gt; and hence took ove=
r pid 1.&nbsp;&nbsp;Since exiting in that environment was<br>&gt;&gt; a pan=
ic situation, the script instead started a rescue shell with<br>&gt;&gt; it=
s output presumably on the console.<br>&gt;&gt; <br>&gt;&gt; The calling co=
nvention was updated to be a simple invocation in<br>&gt;&gt; commit dbacf1=
04885c ("obmc-initfs: run update as a sub-script")<br>&gt;&gt; but the erro=
r handling was not updated.&nbsp;&nbsp;That error handling is<br>&gt;&gt; n=
ow becoming a hinderance<br>&gt;<br>&gt;hindrance<br><br>fixed<br><br>&gt;&=
gt; &nbsp;findmtd() {<br>&gt;&gt; &nbsp;        m=3D$(grep -xl "$1" /sys/cl=
ass/mtd/*/name)<br>&gt;&gt; @@ -130,7 +127,7 @@ do<br>&gt;&gt; &nbsp;      =
  if test -z "$m"<br>&gt;&gt; &nbsp;        then<br>&gt;&gt; &nbsp;        =
        echo 1&gt;&amp;2&nbsp;&nbsp;"Unable to find mtd partiton for ${f##*=
/}."<br>&gt;&gt; -                exec /bin/sh<br>&gt;&gt; +               =
 exit 1<br>&gt;<br>&gt;Is there any value differentiating between the failu=
re cases? I.e.<br>&gt;could we `exit 2` here instead?<br><br>The problem wi=
th differentiated exit codes is knowing what they <br>mean and keeping the =
callers updated with new codes.&nbsp; After this <br>series we can recogniz=
e the following exceptional conditions (1) <br>unrecognized options (but st=
ops checking on the first argument <br>without a leading hyphen, additional=
 arguments are accepted and <br>ignored), (2) can't match image suffix to a=
 mtd label (3) image too <br>big for partition (4) mtd or a sub-mtd partiti=
on is in /proc/self/mounts (5) <br>unknown error from flash=5Fcp (could be =
a erase, write, or verify <br>error, or its size check) (6) trying to resto=
re without any saved files (7) <br>bad entry in whitelist  (8) trying to fl=
ash with no images.&nbsp;&nbsp; Of these, <br>(7) and (8) print a message t=
o stdout, (5) and (6) are totally silent, <br>while (1), (2), (3), and (4) =
exit 1 on first encounter stopping further <br>checks.&nbsp; I have some ra=
tional for the choices, mostly I want to flash <br>as much as possible if t=
he set of images passed a first scan to <br>plausible success (and the arg =
parsing is to allow future extension <br>to pass the files to flash) and no=
t caring between whitelist didn't <br>match anything vs whitelist entries a=
re bad when flashing is the <br>primary function.&nbsp; Unknown error (5) i=
s silent because I already had <br>remove on success and didn't bother to a=
dd code to remember the <br>error while wanting as much success as possible=
.<br><br>I could see differentiating between unrecognized options (1), imag=
e <br>file doesn't have an mtd or is too big for the mtd (2 or 3), and flas=
h <br>update error (5), but what would be the use case?&nbsp; If from a use=
r they <br>would run --help or read the error message and correct, and hope=
fully <br>calls from REST would return the error.&nbsp; The bad whitelist (=
7) and no <br>files saved before trying to restore or copy files (6) will b=
e debugged <br>when someone notices the contents not there after an upgrade=
 (the <br>default is currently to save and restore).&nbsp; The check for a =
busy <br>mount (4) vs check for size and name (3) can be handled by calling=
 <br>again with --ignore-mount if the script wants to know if deferred upda=
te <br>is likely to work.<br><br>So for now I will stay with one error and =
only report when checks fail.&nbsp; <br>Let me know if you think an exit co=
de for (8) is important and I'll add <br>that.&nbsp; I suppose a --verfy-wh=
itelist could complain if any entry doesn't <br>match a file or directory b=
ut that seems low priority.<br><br>Unfortunately the check for mounted devi=
ce (4) is easy to defeat (by calling <br>umount) and I can't see how to rec=
ognize that the mtd partiton is busy.&nbsp; The <br>block layer has sysfs h=
olders and slaves that show block device references <br>but jffs2 uses mtd =
directly.&nbsp; UBI has exclusive open but MTD does not.&nbsp; <br>Perhaps =
I should propose a patch to the Linux kernel.<br><br>milton<br></font><BR>
