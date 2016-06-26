Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcXYT6Q9qzDqlj
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:11:40 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5Q08wfE115740
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:11:37 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23sp4xfj3x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:11:37 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 18:11:37 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 25 Jun 2016 18:11:35 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 7E7413E4003E
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:11:34 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5Q0BYF451708044
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 17:11:34 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FCA178041
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:11:34 -0600 (MDT)
Received: from e39.co.us.ibm.com (unknown [9.17.249.49])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id 48A6378038
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:11:34 -0600 (MDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 18:11:34 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 25 Jun 2016 18:11:32 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 26 Jun 2016 00:11:31 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Jun 2016 00:11:29 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016062600112815-189600 ;
 Sun, 26 Jun 2016 00:11:28 +0000 
In-Reply-To: 
Subject: Re: [PATCH openbmc v6 00/18] Update flash update to be useable at
 runtime.
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Sun, 26 Jun 2016 00:11:28 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3.1 June 14, 2016
X-LLNOutbound: False
X-Disclaimed: 3435
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16062600-0008-0000-0000-000004E8D8EA
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005430; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00721549; UDB=6.00336905; UTC=2016-06-26
 00:11:30
x-cbparentid: 16062600-4778-0000-0000-00000704F8AC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFFD1E82FE.3580CF0C-ON00257FDB.00595EC1-00257FDE.00010CCD@notes.na.collabserv.com>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:11:42 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On Date: 06/22/2016 around 10:50PM, Andrew Jeffery wrote:<br>...=
<br>&gt;&gt; <br>&gt;&gt; <a target=3D"=5Fblank" href=3D"https://github.com=
/openbmc/openbmc/pull/297">https://github.com/openbmc/openbmc/pull/297</a><=
br>&gt;&gt; <br>&gt;&gt; Brad Bishop (3):<br>&gt;&gt; &nbsp; Add pflash par=
allel build fix patch<br>&gt;&gt; &nbsp; Remove unnecessary skeleton depend=
encies<br>&gt;&gt; &nbsp; Removed unused host-ipmid-bt application<br><br>T=
hese should not have been included.<br><br>&gt;&gt; <br>&gt;&gt; Milton D. =
Miller II (9):<br>&gt;...<br>&gt;&gt; Milton Miller (6):<br>&gt;<br>&gt;Nit=
 pick: Probably worth reconfiguring git to use a consistent<br>&gt;user.nam=
e.<br><br>I did that last week.&nbsp; I just hadn't reset the author on the=
 older commits.<br>Now done.<br><br>Other accepted comments in the series:<=
br><br><font face=3D"Default Monospace,Courier New,Courier,monospace" size=
=3D"2">[PATCH openbmc v6 04/18] image=5Ftypes=5Fuboot: Don't truncate when =
assembling flash<br>&gt; Would be good to keep the option ordering consiste=
nt here (conv=3Dnotrunc<br></font><font face=3D"Default Monospace,Courier N=
ew,Courier,monospace" size=3D"2"><font face=3D"Default Monospace,Courier Ne=
w,Courier,monospace" size=3D"2">&gt; </font>is after bs=3D1k on the remaini=
ng dd invocations). That's a minor issue<br></font><font face=3D"Default Mo=
nospace,Courier New,Courier,monospace" size=3D"2"><font face=3D"Default Mon=
ospace,Courier New,Courier,monospace" size=3D"2">&gt; </font>though and thi=
s is a good catch, so:<br></font><br>Good catch, fixed<br><br>[PATCH openbm=
c v6 07/18] initfs: update: Don't exec sh or sulogin on error just exit 1<b=
r>&gt; hindrance<br><br>... not noticed by checkpatch , so ran logs though =
gedit and also found<br><br>decompreses -&gt; decompresses, Sanitze -&gt; S=
anitize, penality -&gt; penalty.<br><br><br><br><font face=3D"Default Monos=
pace,Courier New,Courier,monospace" size=3D"2">[PATCH openbmc v6 09/18] ini=
tfs: update: Consistently add ERROR: and print to stderr<br>&gt; Maybe we s=
hould lift the calls out to a shell function</font><br><br>Ok, although I c=
alled it echoerr and quoted&nbsp; "$@".<br><br><br>Re: [PATCH openbmc v6 17=
/18] initfs: update: Sanitze whitelist directory entries<br>&gt; quote path=
 bits<br>[in changelog] done.<br><br><br>I have separate replies to 7, 10, =
11, 16, and 17 with discussion.<br><br>milton<br></font><BR>
