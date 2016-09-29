Return-Path: <hamzy@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slJZL5B7kzDsgZ
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 01:36:10 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8TFY6fn043615
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:36:07 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25s34uyvxn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:36:07 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hamzy@us.ibm.com>;
 Thu, 29 Sep 2016 11:36:07 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 11:36:05 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: hamzy@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 94C7038C8046
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:36:04 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8TFa0xi6816060
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 15:36:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F834112065
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:36:04 -0400 (EDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id 65F92112064
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:36:04 -0400 (EDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hamzy@us.ibm.com>;
 Thu, 29 Sep 2016 09:36:03 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Thu, 29 Sep 2016 09:36:00 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hamzy@us.ibm.com>;
 Thu, 29 Sep 2016 15:35:59 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 29 Sep 2016 15:35:56 -0000
Received: from us1a3-mail88.a3.dal06.isc4sb.com ([10.146.21.43])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016092915355663-315857 ;
 Thu, 29 Sep 2016 15:35:56 +0000 
To: openbmc@lists.ozlabs.org
Subject: python command line client and library for OpenBMC
From: "Mark Hamzy" <hamzy@us.ibm.com>
Date: Thu, 29 Sep 2016 10:35:56 -0500
MIME-Version: 1.0
X-KeepSent: D56266B4:42478DB4-0025803D:00558964;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 8175
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0055AF7C8625803D_="
x-cbid: 16092915-0056-0000-0000-0000017E6692
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005825; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00762739; UDB=6.00363578; UTC=2016-09-29
 15:35:58
x-cbparentid: 16092915-7094-0000-0000-000001B8A80F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005825; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00762738; UDB=6.00363578; IPR=6.00537864; 
 BA=6.00004771; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012820; XFM=3.00000011;
 UTC=2016-09-29 15:36:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFD56266B4.42478DB4-ON0025803D.00558964-8625803D.0055B012@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-29_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609290272
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
X-List-Received-Date: Thu, 29 Sep 2016 15:36:11 -0000


--=_alternative 0055AF7C8625803D_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

So I created a python command line client and library at=20
https://github.com/hamzy/OpenBMC

What do y'all think about adding it under https://github.com/openbmc ?

--=20
Mark

You must be the change you wish to see in the world. -- Mahatma Gandhi
Never let the future disturb you. You will meet it, if you have to, with=20
the same weapons of reason which today arm you against the present. --=20
Marcus Aurelius


--=_alternative 0055AF7C8625803D_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">So I created a python command line client
and library at </font><a href=3Dhttps://github.com/hamzy/OpenBMC><font size=
=3D2 color=3Dblue face=3D"sans-serif">https://github.com/hamzy/OpenBMC</fon=
t></a><br><br><font size=3D2 face=3D"sans-serif">What do y'all think about =
adding it
under </font><a href=3Dhttps://github.com/openbmc><font size=3D2 color=3Dbl=
ue face=3D"sans-serif">https://github.com/openbmc</font></a><font size=3D2 =
face=3D"sans-serif">?</font><br><br><font size=3D2 face=3D"sans-serif">-- <=
br>Mark<br><br>You must be the change you wish to see in the world. -- Maha=
tma Gandhi<br>Never let the future disturb you. You will meet it, if you ha=
ve to, with
the same weapons of reason which today arm you against the present. --
Marcus Aurelius</font><BR>
--=_alternative 0055AF7C8625803D_=--
