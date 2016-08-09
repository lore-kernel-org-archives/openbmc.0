Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s89Tz13wJzDqQp
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 09:29:26 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u79NSM1m144735
 for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2016 19:29:24 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24qm9t9wkc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2016 19:29:23 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 9 Aug 2016 17:29:23 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 9 Aug 2016 17:29:22 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D5DC51FF002E
 for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2016 17:29:03 -0600 (MDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u79NTKki63832160
 for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2016 23:29:21 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 095B728041
 for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2016 19:29:21 -0400 (EDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS id E831A2803D
 for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2016 19:29:20 -0400 (EDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 9 Aug 2016 19:29:20 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Tue, 9 Aug 2016 19:29:17 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 9 Aug 2016 23:29:15 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 9 Aug 2016 23:29:14 -0000
X-IBM-Helo: us1a3-smtp02.a3.dal06.isc4sb.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016080923291366-1100564 ;
 Tue, 9 Aug 2016 23:29:13 +0000 
In-Reply-To: 
Subject: discovery of openbmc
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 9 Aug 2016 23:29:14 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 825.3) | IBM Domino Build
 V851SAAS_07182016_FP3 July 18, 2016
X-LLNOutbound: False
X-Disclaimed: 13087
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16080923-0004-0000-0000-0000101A1329
X-IBM-ISS-SpamDetectors: Score=0.415652; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005571; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000178; SDB=6.00742426; UDB=6.00349468; UTC=2016-08-09
 23:29:15
x-cbparentid: 16080923-9718-0000-0000-00000068566C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005571; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000178; SDB=6.00742426; UDB=6.00349468; IPR=6.00514983; 
 BA=6.00004652; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012282; XFM=3.00000011;
 UTC=2016-08-09 23:29:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFB7A77BFE.3A84627D-ON0025800A.0080354A-0025800A.00810503@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=21
 spamscore=21 suspectscore=13
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608090245
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
X-List-Received-Date: Tue, 09 Aug 2016 23:29:27 -0000

 I should know the answer to this but is inarp the only way to programmatic=
ally discover an ip is an OpenBMC system? =20

Any desire for Avahi or something else? =20


Chris Austen
POWER Systems Enablement Manager=20
(512) 286-5184 (T/L: 363-5184)
