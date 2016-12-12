Return-Path: <eajames@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcz2Y5XMQzDw0l
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 10:05:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBCMxLbm024993
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 18:05:23 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27a3vvu9vj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 18:05:23 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Mon, 12 Dec 2016 16:05:22 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 12 Dec 2016 16:05:20 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: eajames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 80BC43E4003E
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:05:19 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBCN5Jqf2032050
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:05:19 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F5413603C
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:05:19 -0700 (MST)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS id 49320136046
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:05:19 -0700 (MST)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Mon, 12 Dec 2016 16:05:19 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Mon, 12 Dec 2016 16:05:16 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Mon, 12 Dec 2016 23:05:15 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 12 Dec 2016 23:05:11 -0000
Received: from us1a3-mail68.a3.dal09.isc4sb.com ([10.142.3.220])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2016121223051131-298572 ;
 Mon, 12 Dec 2016 23:05:11 +0000 
Subject: Re: [RFC linux 1/2] drivers: fsi: Add SBE client device driver
In-Reply-To: <20161212225215.GA5150@heinlein.lan>
From: "Edward James" <eajames@us.ibm.com>
To: patrick@stwcx.xyz
Cc: christopher.lee.bostic@gmail.com, eajames.ibm@gmail.com, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Date: Mon, 12 Dec 2016 23:05:11 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20161212225215.GA5150@heinlein.lan>,
 <1481064330-20757-1-git-send-email-eajames.ibm@gmail.com>
 <CACPK8Xcwk-ctKv-G-RdOo2xcwb3PHfDVfBJa=r4qkm5Ncbuoqw@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 12812-924 | IBM Domino Build V851SAAS_11282016_FP2
 December 02, 2016
X-LLNOutbound: False
X-Disclaimed: 24443
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16121223-0028-0000-0000-0000063DBB85
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0.0214; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006238; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000196; SDB=6.00792962; UDB=6.00384395; UTC=2016-12-12
 23:05:14
x-cbparentid: 16121223-9718-0000-0000-000002296008
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006238; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000196; SDB=6.00792962; UDB=6.00384395; IPR=6.00570763; 
 BA=6.00004959; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013612; XFM=3.00000011;
 UTC=2016-12-12 23:05:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF3D3B8518.26AA2AD8-ON00258087.007EAF40-00258087.007ED179@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-12_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612120334
X-Mailman-Approved-At: Tue, 13 Dec 2016 10:27:31 +1100
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
X-List-Received-Date: Mon, 12 Dec 2016 23:05:26 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Yes, the OCC driver will depend on the SBE driver for P9.=
 I suppose the OCC driver could handle all the SBE register access over FSI=
 itself... but not sure if that's a good approach.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I'll be&nbsp;on the call this evening.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Eddie</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Patrick Williams &=
lt;patrick@stwcx.xyz&gt;<br>To: Joel Stanley &lt;joel@jms.id.au&gt;<br>Cc: =
eajames.ibm@gmail.com, OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;, C=
hristopher Bostic &lt;christopher.lee.bostic@gmail.com&gt;, Edward James/Au=
stin/IBM@IBMUS<br>Subject: Re: [RFC linux 1/2] drivers: fsi: Add SBE client=
 device driver<br>Date: Mon, Dec 12, 2016 4:52 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Mon, Dec 12, 2016 at 03:26:46PM +1100, Joel Stanley wrote:<br>&gt; =
Lets have a discussion abut what client drivers we will need to have<br>&gt=
; in the kernel for FSI.<br>&gt;<br>&gt; We should consider only creating k=
ernel drivers when the code cannot<br>&gt; live in userspace. This would me=
an situations where exclusive access<br>&gt; to some part of the address sp=
ace is required (SCOMs), when the<br>&gt; sequence of reads/writes are timi=
ng critical, or when there are IRQs<br>&gt; involved.<br>&gt;<br>&gt; For c=
ases where we're simply writing or reading values to the register<br>&gt; C=
FAM address space, writing userspace code should be sufficient.<br>&gt;<br>=
&gt; What do you think about this approach?<br><br>I'm pretty sure there is=
 some layering going on here. &nbsp;SBE driver uses<br>FSI, OCC driver (on =
P9) uses SBE. &nbsp;We can't get an hwmon OCC driver<br>without this SBE dr=
iver.<br><br>Eddie, can you confirm?<br><br>--<br>Patrick Williams</font></=
div>
<div id=3D"MIMEAttachInfoDiv" style=3D"display:none" title=3D"pgp-signature=
|signature.asc" >&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
