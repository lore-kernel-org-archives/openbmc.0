Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT2wM14pWzDr0G
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:33:22 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AMTwMG033522
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:33:20 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c8ssk2d7n-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:33:19 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 16:33:19 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 16:33:17 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AMXH3q59572472; Thu, 10 Aug 2017 15:33:17 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B490136043;
 Thu, 10 Aug 2017 16:33:17 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id D1F8D136040;
 Thu, 10 Aug 2017 16:33:16 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 0/4] hwmon: (pmbus): Core extension for
 STATUS_WORD and debugfs
Date: Thu, 10 Aug 2017 17:33:11 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17081022-0028-0000-0000-0000082AEB55
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900484; UDB=6.00450826; IPR=6.00680685; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:33:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081022-0029-0000-0000-000037126ACF
Message-Id: <1502404395-22900-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100351
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
X-List-Received-Date: Thu, 10 Aug 2017 22:33:23 -0000
X-List-Received-Date: Thu, 10 Aug 2017 22:33:23 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds some functionality to the pmbus core.

The first two patches provide support for the STATUS_WORD register. This allows
more default alarm attributes to be used, as the upper byte of the status
register is available. The third patch then uses the STATUS_INPUT bit of the
status register to setup boolean attributes for input voltage and input power
attributes.

The fourth patch provides support for raw reads of pmbus status registers
through the debugfs interface. These can be very useful for hardware
diagnostics, especially on multi-page pmbus devices, as user-space access of
the i2c space could corrupt the pmbus page accounting.

Edward A. James (4):
  hwmon: (pmbus): Switch status registers to 16 bit
  hwmon: (pmbus): Access word data for STATUS_WORD
  hwmon: (pmbus): Add generic alarm bit for iin and pin
  hwmon: (pmbus): Add debugfs for status registers

 drivers/hwmon/pmbus/pmbus.h      |   6 +
 drivers/hwmon/pmbus/pmbus_core.c | 279 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 263 insertions(+), 22 deletions(-)

-- 
1.8.3.1
