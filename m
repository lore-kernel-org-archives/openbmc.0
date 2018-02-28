Return-Path: <ivan@de.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=de.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ivan@de.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=de.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zs0yn66K0zF1c1
 for <openbmc@lists.ozlabs.org>; Thu,  1 Mar 2018 03:15:07 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1SGED9r040279
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 11:15:05 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gdx7ed4cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 11:15:04 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Wed, 28 Feb 2018 16:15:03 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 28 Feb 2018 16:15:02 -0000
Received: from us1b3-mail161.a3dr.sjc03.isc4sb.com ([10.160.174.246])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018022816150119-654275 ;
 Wed, 28 Feb 2018 16:15:01 +0000 
In-Reply-To: 
Subject: patches from upstream for fsp2 board
From: "Ivan Mikhaylov1" <ivan@de.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Karlo Petri" <XXPETRI@de.ibm.com>,
 "Bradley W Bishop" <bradleyb@us.ibm.com>
Date: Wed, 28 Feb 2018 16:15:01 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1010) | IBM Domino Build
 SCN1803700_20180206T0029_FP1 February 08, 2018 at 11:43
X-KeepSent: 5EA5B9BB:74B1EB55-00258242:0058C04B;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 22795
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 18022816-8243-0000-0000-00000276A8C0
X-IBM-SpamModules-Scores: BY=0.000007; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.405233; ST=0; TS=0; UL=0; ISC=; MB=0.119942
X-IBM-SpamModules-Versions: BY=3.00008602; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00996376; UDB=6.00506537; IPR=6.00775700; 
 BA=6.00005852; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019779; XFM=3.00000015;
 UTC=2018-02-28 16:15:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-02-28 15:27:11 - 6.00008126
x-cbparentid: 18022816-8244-0000-0000-00006C02AB1C
Message-Id: <OF5EA5B9BB.74B1EB55-ON00258242.0058C04B-00258242.0059444A@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-28_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 02 Mar 2018 11:40:50 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 16:15:14 -0000

we have list of patches which need to be ported if possible into 4.13 openb=
mc/linux branch :

first 4 is for low level setup of board
494d82ceae7f3b9fdb5154b4469e5bb22f56040b
9c4c374676a12db4a452534f3347323d35c32d1a
50f01c57d700cce04a9dc87bc55db2e283f57212
7813043e1bbcea764c86ef2fcf43aeae2b0e240d

it is related to network driver
45d6e545505fd32edb812f085be7de45b6a5c0af
624ca9c33c8a853a4a589836e310d776620f4ab9


if you have any questions or anything to add - ask me.
thanks in advance!
