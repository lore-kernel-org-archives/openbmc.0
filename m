Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkH4T0vGtzDqX6
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 06:26:00 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v58KOw4P099989
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jun 2017 16:25:58 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2axyuuee63-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 16:25:58 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 8 Jun 2017 14:25:57 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 8 Jun 2017 14:25:54 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v58KPsIm4719034; Thu, 8 Jun 2017 13:25:54 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48F1FBE038;
 Thu,  8 Jun 2017 14:25:54 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 0515ABE03B;
 Thu,  8 Jun 2017 14:25:53 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 0/2] drivers: hwmon: occ: Fix sensors and add P8
Date: Thu,  8 Jun 2017 15:25:49 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17060820-0008-0000-0000-000007FAB1C6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007196; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872030; UDB=6.00433795; IPR=6.00652040; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015750; XFM=3.00000015;
 UTC=2017-06-08 20:25:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060820-0009-0000-0000-00004287AC90
Message-Id: <1496953551-27567-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706080358
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
X-List-Received-Date: Thu, 08 Jun 2017 20:26:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series refactors the OCC hwmon driver to use versioned sensors. This
allows both the P8 and P9 code paths to use common hwmon attributes and
functions. Only the OCC access code is different.

The series also adds non-hwmon sysfs attributes to represent the status of the
OCC. These are not real sensors and therefor do not belong as hwmon attributes.

The patchset also adds the P8 OCC access code over I2C bus.

Edward A. James (2):
  drivers: hwmon: occ: Add new sensor versions and non-hwmon attributes
  drivers: hwmon: occ: Add P8 OCC access

 drivers/hwmon/Makefile     |   2 +-
 drivers/hwmon/occ/Kconfig  |  19 +-
 drivers/hwmon/occ/Makefile |  12 +-
 drivers/hwmon/occ/common.c | 992 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/common.h |   5 +
 drivers/hwmon/occ/p8_i2c.c | 282 +++++++++++++
 drivers/hwmon/occ/p9.c     | 350 ----------------
 drivers/hwmon/occ/p9.h     |  17 -
 drivers/hwmon/occ/p9_sbe.c |  18 +-
 9 files changed, 1320 insertions(+), 377 deletions(-)
 create mode 100644 drivers/hwmon/occ/p8_i2c.c
 delete mode 100644 drivers/hwmon/occ/p9.c
 delete mode 100644 drivers/hwmon/occ/p9.h

-- 
1.8.3.1
