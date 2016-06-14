Return-Path: <anoo@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTCJd586rzDqgM
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 11:50:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5E1nHiX105623
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 21:50:07 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23gemub8vx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 21:50:07 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 13 Jun 2016 21:50:06 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 13 Jun 2016 21:50:04 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 09D356E8041
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 21:49:46 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5E1o4Kb49938596
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 01:50:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A450124037
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 21:50:03 -0400 (EDT)
Received: from d50lp32.co.us.ibm.com (unknown [9.17.249.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS id 3A48F124052
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2016 21:50:03 -0400 (EDT)
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Mon, 13 Jun 2016 19:50:02 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 13 Jun 2016 19:50:00 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Tue, 14 Jun 2016 01:49:59 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 14 Jun 2016 01:49:58 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016061401495817-603408 ;
 Tue, 14 Jun 2016 01:49:58 +0000 
To: openbmc@lists.ozlabs.org
Subject: Authentication for OpenBMC port 3000
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Mon, 13 Jun 2016 20:49:58 -0500
MIME-Version: 1.0
X-KeepSent: 97E67B46:5B644A38-86257FD2:000986B3;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 44163
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 000A10B186257FD2_="
x-cbid: 16061401-0056-0000-0000-00000082BFE2
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.000001; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005378; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00715938; UDB=6.00333540; UTC=2016-06-14
 01:49:59
x-cbparentid: 16061401-9900-0000-0000-0000082BDA19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF97E67B46.5B644A38-ON86257FD2.000986B3-86257FD2.000A1137@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-13_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606140020
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
X-List-Received-Date: Tue, 14 Jun 2016 01:50:10 -0000


--=_alternative 000A10B186257FD2_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Adi brought up the concern that accessing port 3000 doesn't require=20
authentication. Since the OpenBMC UI, which would replace the port 3000,=20
is not close to being delivered yet, and the Barreleye GA build=20
approaches, any thoughts on how to proceed: add authentication to the port =

3000, remove it from the build, other?


--=_alternative 000A10B186257FD2_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Adi brought up the concern that accessing
port 3000 doesn't require authentication. Since the OpenBMC UI, which would
replace the port 3000, is not close to being delivered yet, and the Barrele=
ye
GA build approaches, any thoughts on how to proceed: add authentication
to the port 3000, remove it from the build, other?</font><BR>
--=_alternative 000A10B186257FD2_=--
