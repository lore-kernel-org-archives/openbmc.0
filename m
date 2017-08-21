Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbntH1HrKzDqbZ
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 08:09:58 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7LM8i6j084190
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 18:09:56 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cg3pmbvyj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 18:09:55 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 21 Aug 2017 18:09:55 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 Aug 2017 18:09:54 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7LM9rst32702602; Mon, 21 Aug 2017 22:09:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6D9C112034;
 Mon, 21 Aug 2017 18:09:41 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.0.233])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id C5614112040;
 Mon, 21 Aug 2017 18:09:39 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v4 0/2] hwmon: (ucd9000) Add gpio and debugfs
Date: Mon, 21 Aug 2017 17:09:44 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17082122-0036-0000-0000-0000025C2752
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007587; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00905718; UDB=6.00453884; IPR=6.00685922; 
 BA=6.00005545; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016799; XFM=3.00000015;
 UTC=2017-08-21 22:09:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082122-0037-0000-0000-000041835168
Message-Id: <20170821220946.85617-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-21_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708210343
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
X-List-Received-Date: Mon, 21 Aug 2017 22:09:59 -0000
X-List-Received-Date: Mon, 21 Aug 2017 22:09:59 -0000

Add GPIO chip for user space access of the device's IO.
Add debugfs for register dump of mfr_status and individual gpi faults.
Add sysfs attribute to clear logged faults.

Christopher Bostic (2):
  hwmon: (ucd9000) Add gpio chip interface and clear logged faults
  hwmon: (ucd9000) Add debugfs for mfr_status info

 drivers/hwmon/pmbus/ucd9000.c | 250 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 2 deletions(-)

-- 
1.8.2.2
