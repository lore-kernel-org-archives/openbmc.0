Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhfpF3cNFzDqG3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 06:08:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7TK5I56107616
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 16:08:18 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cnd15wunm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 16:08:18 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 29 Aug 2017 16:08:16 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 29 Aug 2017 16:08:14 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7TK8EQm30801946; Tue, 29 Aug 2017 20:08:14 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D03D128057;
 Tue, 29 Aug 2017 16:08:07 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 9048628048;
 Tue, 29 Aug 2017 16:08:07 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v5 0/2] Add user space accessibility for
 ucd9000 stats
Date: Tue, 29 Aug 2017 15:08:11 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17082920-0024-0000-0000-000002C73ED7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007633; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909392; UDB=6.00456087; IPR=6.00689676; 
 BA=6.00005560; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016921; XFM=3.00000015;
 UTC=2017-08-29 20:08:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082920-0025-0000-0000-000045409B1C
Message-Id: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-29_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708290304
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
X-List-Received-Date: Tue, 29 Aug 2017 20:08:22 -0000
X-List-Received-Date: Tue, 29 Aug 2017 20:08:22 -0000

This set provides means to allow user space to access various properties of the
ucd9000 type chips.

patch 0001 Adds gpio_chip interface for user to access various GPIO pin states
via the /sys/class/gpio interface.

Patch 0002 adds a debugfs for mfr_status information so user space can gain
visibility of gpi type faults. Note that there are limitations on type of devices
that debugfs supports.  Presently only ucd90160 is supported.  Any assumptions made
as to formatting of data is commented inline in the code.  Any expansion to other
ucd9000 types will need to take this into consideration.

Christopher Bostic (2):
  hwmon: (ucd9000) Add gpio chip interface and clear logged faults
  hwmon: (ucd9000) Add debugfs for mfr_status info

 drivers/hwmon/pmbus/ucd9000.c | 404 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 402 insertions(+), 2 deletions(-)

-- 
1.8.2.2
