Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcXZK68H5zDqlj
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:12:25 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5Q094TC131131
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:24 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23sn8tgqc6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:23 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 20:12:22 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 25 Jun 2016 20:12:19 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 3C9706E803C
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:01 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5Q0CJs658785958
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 00:12:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E166AC03A
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:19 -0400 (EDT)
Received: from d50lp03.ny.us.ibm.com (unknown [146.89.104.211])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS id 294B9AC03C
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:19 -0400 (EDT)
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 20:12:19 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Sat, 25 Jun 2016 20:12:17 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 26 Jun 2016 00:12:16 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Jun 2016 00:12:14 -0000
X-IBM-Helo: us1a3-smtp03.a3.dal06.isc4sb.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016062600121378-187834 ;
 Sun, 26 Jun 2016 00:12:13 +0000 
In-Reply-To: <1466658760.23740.53.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 10/18] initfs: update: add option to perform
 checks but skip actual update
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Sun, 26 Jun 2016 00:12:14 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1466658760.23740.53.camel@aj.id.au>,
 <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-11-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3.1 June 14, 2016
X-LLNOutbound: False
X-Disclaimed: 50519
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16062600-0044-0000-0000-0000007FA56F
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.000745; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005430; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00721549; UDB=6.00336905; UTC=2016-06-26
 00:12:15
x-cbparentid: 16062600-6060-0000-0000-0000005B9C6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF12C99966.56C574DE-ON00257FDC.007B50A4-00257FDE.00011EC8@notes.na.collabserv.com>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:12:26 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">On  06/23/2016 around 12:12AM in some timezone, Andrew Jeffery wrote=
:<br>&gt;&gt; From: "Milton D. Miller II" &lt;<a target=3D"=5Fblank" href=
=3D"mailto:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&=
gt;&gt; Provide a way to check if update is likely to succeed without<br>&g=
t;&gt; attempting actual updates.<br>&gt;&gt; <br>&gt;&gt; This will check =
the image names correspond to mtd partition names,<br>&gt;&gt; and will be =
enhanced with additional checking for file size and<br>&gt;&gt; individual =
partition mounts.<br>&gt;&gt; <br>&gt;&gt; This is not called --dry-run bec=
ause it will still do file save<br>&gt;&gt; and restore if those are enable=
d.<br>&gt;<br>&gt;Is save/restore useful if nothing's going to change - as =
in, why not<br>&gt;make it a true dry-run? Or are you concerned about addin=
g more logic<br>&gt;to<br>&gt;prevent the save/restore from happening?<br>&=
gt;<br><br>Yes, because one option is to save and restore to current mounte=
d <br>file system (eg tmpfs), and another use case is the clear flash for e=
mpty <br>file system like the init script does for the clear-rwfs-filesyste=
m option <br>(and that actually does the save and restore in separate invoc=
ations).<br><br>milton<br></font><BR>
