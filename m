Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNfMh5FXvzDqHq
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 04:53:20 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73InELF104327
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 14:53:17 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c48ekkcws-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 14:53:17 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 14:53:17 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 14:53:15 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73IrFk531785124; Thu, 3 Aug 2017 18:53:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FCA0AE03B;
 Thu,  3 Aug 2017 14:53:29 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.232])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 756EDAE03C;
 Thu,  3 Aug 2017 14:53:27 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 0/2] drivers/fsi: Don't scan hub on probe
Date: Thu,  3 Aug 2017 13:53:04 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17080318-0040-0000-0000-0000038A4112
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007478; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897081; UDB=6.00448831; IPR=6.00677264; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016519; XFM=3.00000015;
 UTC=2017-08-03 18:53:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080318-0041-0000-0000-0000077E6C8D
Message-Id: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030288
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
X-List-Received-Date: Thu, 03 Aug 2017 18:53:21 -0000

Prevent hub master from scanning its devices during probe time. This is
necessary to prevent bus contention issues with hostboot on hub links.

Christopher Bostic (2):
  drivers/fsi: Defer hub master scan on probe
  ARM: dts: fsi: Add hub master no scan on probe attribute


-- 
1.8.2.2
