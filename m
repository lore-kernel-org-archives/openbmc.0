Return-Path: <jrey@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4258Wl0YdfzF35x
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 02:37:54 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w85GOjta111906
 for <openbmc@lists.ozlabs.org>; Wed, 5 Sep 2018 12:37:52 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2majgjrwc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Sep 2018 12:37:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <jrey@us.ibm.com>;
 Wed, 5 Sep 2018 16:37:50 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 5 Sep 2018 16:37:04 -0000
Received: from us1a3-mail269.a3.dal06.isc4sb.com ([10.146.127.27])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2018090516370334-926453 ;
 Wed, 5 Sep 2018 16:37:03 +0000 
To: openbmc@lists.ozlabs.org
Subject: Security Work Group meeting
From: "Joseph Reynolds" <jrey@us.ibm.com>
Date: Wed, 5 Sep 2018 11:37:03 -0500
X-KeepSent: 5275607C:6F29B8DF-002582FF:005A55FC;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 43011
X-TNEFEvaluated: 1
x-cbid: 18090516-7581-0000-0000-000008ED6C33
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00009676; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01083966; UDB=6.00559438; IPR=6.00863966; 
 BA=6.00006093; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023130; XFM=3.00000015;
 UTC=2018-09-05 16:37:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-09-05 15:27:44 - 6.00008928
x-cbparentid: 18090516-7582-0000-0000-00001EDB8C28
Message-Id: <OF5275607C.6F29B8DF-ON002582FF.005A55FC-862582FF.005B48C9@notes.na.collabserv.com>
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-05_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Wed, 05 Sep 2018 16:37:55 -0000

The OpenBMC Security Workgroup meets Wednesdays at 10am PDT (noon CST).
The agenda, access information, and minutes are here:=20
https://github.com/openbmc/openbmc/wiki/Security-working-group
Recent topics are: how to implement best practices from selected upstream=20
projects, and how to get started with static code analysis.
