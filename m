Return-Path: <ivan@de.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3thzZM051qzDwKs
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 22:43:22 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBJBcj67133820
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 06:43:20 -0500
Received: from e06smtp06.uk.ibm.com (e06smtp06.uk.ibm.com [195.75.94.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27ecg2pn8a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 06:43:19 -0500
Received: from localhost
 by e06smtp06.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Mon, 19 Dec 2016 11:43:17 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp06.uk.ibm.com (192.168.101.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 19 Dec 2016 11:43:14 -0000
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: ivan@de.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 535391B08069
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 11:45:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBJBhEkm19333498
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 11:43:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ECD4A4040
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 10:41:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4BBDA4070
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 10:41:18 +0000 (GMT)
Received: from d50lp03.ny.us.ibm.com (unknown [146.89.104.211])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2016 10:41:18 +0000 (GMT)
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Mon, 19 Dec 2016 06:43:12 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Mon, 19 Dec 2016 06:43:10 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Mon, 19 Dec 2016 11:43:09 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 19 Dec 2016 11:43:07 -0000
Received: from us1a3-mail161.a3.dal06.isc4sb.com ([10.146.71.28])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016121911430741-118619 ;
 Mon, 19 Dec 2016 11:43:07 +0000 
In-Reply-To: 
Subject: about fsp2 board
From: "Ivan Mikhaylov1" <ivan@de.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Karlo Petri" <XXPETRI@de.ibm.com>,
 "Bradley W Bishop" <bradleyb@us.ibm.com>
Date: Mon, 19 Dec 2016 11:43:07 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 892) | IBM Domino Build
 V851SAAS_11282016_FP2.1 December 02, 2016
X-LLNOutbound: False
X-Disclaimed: 48003
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16121911-0024-0000-0000-00000276CA0E
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.000038; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006277; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000198; SDB=6.00795971; UDB=6.00386254; UTC=2016-12-19
 11:43:08
x-cbparentid: 16121911-7582-0000-0000-000002857242
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFAB060B32.380FD18C-ON0025808E.003FDC40-0025808E.00405F91@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612190175
X-Mailman-Approved-At: Tue, 20 Dec 2016 01:59:13 +1100
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
X-List-Received-Date: Mon, 19 Dec 2016 11:43:23 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Hello everyone, so probably everyone knows about fsp2 board existenc=
e that is still using in P and Z systems, what we wanna do in case of Z ser=
ies, we want to do same way as P doing right now with ast2400/2500. So we w=
ant to port fsp2 board into upstream kernel and be a part of openbmc projec=
t.<br>Until now I'm just started to work with it. So if you see any things/=
thougts which we have to talk, pls tell us...<br></font><BR>
