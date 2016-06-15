Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVBcn47dvzDqmt
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 02:22:33 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5FGJgDC027560
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 12:22:30 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23jj0f04f7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 12:22:30 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 15 Jun 2016 10:22:29 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 15 Jun 2016 10:22:27 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 3100E1FF0023
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 10:22:11 -0600 (MDT)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5FGMPdu47448286
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 09:22:27 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 118FBBE040
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 10:22:27 -0600 (MDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS id D436ABE039
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 10:22:26 -0600 (MDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 15 Jun 2016 12:22:26 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 15 Jun 2016 12:22:24 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 15 Jun 2016 16:22:23 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 15 Jun 2016 16:22:18 -0000
X-IBM-Helo: us1a3-smtp03.a3.dal06.isc4sb.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: joel@jms.id.au; openbmc@lists.ozlabs.org; xow@google.com;
 patrick@stwcx.xyz
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016061516221731-409773 ;
 Wed, 15 Jun 2016 16:22:17 +0000 
In-Reply-To: <20160615152735.GZ19968@asimov.austin.ibm.com>
Subject: Re: [PATCH] aspeed/ast-g5: Simplify default bootargs
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Xo Wang <xow@google.com>, "Milton Miller II" <miltonm@us.ibm.com>
Date: Wed, 15 Jun 2016 16:22:17 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20160615152735.GZ19968@asimov.austin.ibm.com>,
 <1465932059-5531-1-git-send-email-raltherr@google.com>
 <CACPK8Xfe+pVLwniWd9Nm3pemfrnVTZpS1twttN-aUGjQdPG-aA@mail.gmail.com>
X-Mailer: Lotus Domino Web Server Build V851SAAS_05232016_FP5.1 June 03, 2016
X-LLNOutbound: False
X-Disclaimed: 19947
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16061516-0004-0000-0000-00000FB0F209
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005386; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00716699; UDB=6.00333999; UTC=2016-06-15
 16:22:22
x-cbparentid: 16061516-6060-0000-0000-000000209B37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFA6A9795A.29B720C5-ON00257FD3.0059EE82-00257FD3.0059EE87@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-15_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606150174
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
X-List-Received-Date: Wed, 15 Jun 2016 16:22:34 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">On 06/15/2016 around 10:28AM, Patrick Williams wrote:<br>&gt;On Wed,=
 Jun 15, 2016 at 01:49:12PM +1000, Joel Stanley wrote:<br>&gt;&gt; &gt; New=
 arguments set default console for DEBUG=5FUART on the EVB and<br>&gt;allow=
<br>&gt;&gt; &gt; the kernel to choose init path, root/overlay, and memory =
size.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Change-Id: I919f7e4027968ad000c4283=
f8bd80cca1b17e2eb<br>&gt;&gt; <br>&gt;&gt; I normally ask submissions to no=
t include links to internal<br>&gt;bugzillas<br>&gt;&gt; when submitting pa=
tches. Do you think that's a reasonable rule for<br>&gt;&gt; gerrit tags as=
 well?<br>&gt;&gt; <br>&gt;<br>&gt;I don't have a preference personally, bu=
t...<br>&gt;<br>&gt;Neither upstream Linux kernel nor u-boot trees seem to =
require Gerrit<br>&gt;Change-Id tags to be removed.<br>&gt;<br><br>The Linu=
x kernel scripts/checkpatch.pl reports an error if it finds a<br>Change-id =
tag.&nbsp; The discussion is usually based on the change log<br>should be s=
elf contained, and other infrastructure may go missing <br>over time.&nbsp;=
 Most maintainers require identified issues to be fixed<br>before patch app=
lication.<br><br>They added a linux-kernel mailing list archive reference s=
ervice to <br>their kernel.org servers for adding references to discussions=
 that <br>redirects to third party archives to address this long term viabi=
lity<br>of URLs and identifiers.<br><br>I haven't read the Das U-Boot lists=
 enough to know their policies.<br>Their version does not appear to have th=
e check.&nbsp; The kernel <br>added their check in April 2014 in 3.15.&nbsp=
; Das U-Boot did a sync<br>to v3.14-rc4 and only picked up 2 bug fixes sinc=
e then of over<br>140 changes.<br><br>milton<br></font><BR>
