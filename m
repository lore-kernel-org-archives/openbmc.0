Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sCgFD0bZgzDr3S
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 02:00:31 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7FFs4cX104572
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 12:00:29 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24svehx0aw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 12:00:29 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 15 Aug 2016 10:00:29 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 15 Aug 2016 10:00:27 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 144311FF001E
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 10:00:09 -0600 (MDT)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7FG0BcL16712166
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 16:00:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 426099A007
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 12:00:26 -0400 (EDT)
Received: from d50lp03.ny.us.ibm.com (unknown [146.89.104.211])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id 376EF5E008
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 12:00:26 -0400 (EDT)
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 15 Aug 2016 12:00:26 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Mon, 15 Aug 2016 12:00:24 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 15 Aug 2016 16:00:23 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 15 Aug 2016 16:00:21 -0000
X-IBM-Helo: us1a3-smtp05.a3.dal06.isc4sb.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016081516002125-247452 ;
 Mon, 15 Aug 2016 16:00:21 +0000 
In-Reply-To: <3743F858-80C3-457F-9B3B-86ED896FA16F@linux.vnet.ibm.com>
Subject: Re: Power button behavior
From: "Chris Austen" <austenc@us.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 15 Aug 2016 16:00:20 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <3743F858-80C3-457F-9B3B-86ED896FA16F@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 818.2) | IBM Domino Build
 V851SAAS_07182016_FP2 July 18, 2016
X-LLNOutbound: False
X-Disclaimed: 43871
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16081516-0024-0000-0000-0000145443F3
X-IBM-ISS-SpamDetectors: Score=0.404685; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.404685; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005598; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000181; SDB=6.00745015; UDB=6.00351065; UTC=2016-08-15
 16:00:22
x-cbparentid: 16081516-5102-0000-0000-0000010E0638
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005598; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000181; SDB=6.00745015; UDB=6.00351065; IPR=6.00517567; 
 BA=6.00004662; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012339; XFM=3.00000011;
 UTC=2016-08-15 16:00:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF4836B2E9.9E723D7F-ON00258010.0057EC23-00258010.0057EC27@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608150175
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
X-List-Received-Date: Mon, 15 Aug 2016 16:00:32 -0000

Following the industry norm of "Short press triggers a soft power off, long=
 press triggers a hard power off" makes sense to me. =20
I vote for Master
Will need to get an opinion from the users of Stable in their product chang=
e there=20



Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)

-----"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----
To: openbmc@lists.ozlabs.org
From: Adriana Kobylak=20
Sent by: "openbmc"=20
Date: 08/15/2016 09:14AM
Subject: Power button behavior

Hello community,

The current openBMC behavior for the power buttion is:
Short press triggers a hard power off, long press reboots the host (power o=
ff->power on).

The default behavior for P8 OpenPower systems / x86 is:
Short press triggers a soft power off, long press triggers a hard power off.

The proposal is to change the openBMC behavior to the default P8/x86 one fo=
r master and the stable branch supported on Barreleye, any thoughts or obje=
ctions?=20
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc
