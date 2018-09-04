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
 by lists.ozlabs.org (Postfix) with ESMTPS id 424Qmz1FnszF3G2
 for <openbmc@lists.ozlabs.org>; Tue,  4 Sep 2018 22:16:46 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w84CE4Nx119869
 for <openbmc@lists.ozlabs.org>; Tue, 4 Sep 2018 08:16:44 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m9quvdu4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 08:16:44 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Tue, 4 Sep 2018 12:16:44 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 4 Sep 2018 12:16:40 -0000
Received: from us1b3-mail161.a3dr.sjc03.isc4sb.com ([10.160.174.246])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018090412164003-440596 ;
 Tue, 4 Sep 2018 12:16:40 +0000 
In-Reply-To: 
Subject: ibm/emac network fix
From: "Ivan Mikhaylov1" <ivan@de.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Karlo Petri" <XXPETRI@de.ibm.com>,
 "Bradley W Bishop" <bradleyb@us.ibm.com>
Date: Tue, 4 Sep 2018 12:16:40 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1011.1) | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-KeepSent: 2DC40903:0A08BE06-002582FE:004353A3;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 31871
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18090412-6371-0000-0000-000004192F9C
X-IBM-SpamModules-Scores: BY=0.00001; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.384396; ST=0; TS=0; UL=0; ISC=; MB=0.000010
X-IBM-SpamModules-Versions: BY=3.00009668; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01083400; UDB=6.00559098; IPR=6.00863399; 
 BA=6.00006092; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023105; XFM=3.00000015;
 UTC=2018-09-04 12:16:42
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-09-04 10:39:56 - 6.00008923
x-cbparentid: 18090412-6372-0000-0000-00004F9E301B
Message-Id: <OF2DC40903.0A08BE06-ON002582FE.004353A3-002582FE.004371D0@notes.na.collabserv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-04_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 10 Sep 2018 10:12:07 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2018 12:16:51 -0000

is it possible to port into openbmc/linux dev branch that fix?

https://lkml.org/lkml/2018/9/3/183

thanks in advance!
