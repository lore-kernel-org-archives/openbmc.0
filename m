Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wZD8q0X87zDqVL
 for <openbmc@lists.ozlabs.org>; Sat, 27 May 2017 03:46:50 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4QHhroS098886
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:40 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2apkh9esff-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:40 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 May 2017 13:46:39 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 May 2017 13:46:37 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4QHkaPR55771172; Fri, 26 May 2017 17:46:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE406112040;
 Fri, 26 May 2017 13:46:38 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 3EF3C11204B;
 Fri, 26 May 2017 13:46:38 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 0/3] drivers: hwmon: Add OCC driver
Date: Fri, 26 May 2017 12:46:30 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17052617-2213-0000-0000-000001C6A622
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007122; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865931; UDB=6.00430071; IPR=6.00645792; 
 BA=6.00005375; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015597; XFM=3.00000015;
 UTC=2017-05-26 17:46:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052617-2214-0000-0000-00005643E66C
Message-Id: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-26_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705260316
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
X-List-Received-Date: Fri, 26 May 2017 17:46:52 -0000
X-List-Received-Date: Fri, 26 May 2017 17:46:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon driver for the POWER9 OCC (haven't tested for P8 yet).
The driver obtains the OCC poll response and exports all the sensor data as
hwmon attributes. This driver is intended to operate on a service processor.

For the POWER9 application, the driver communicates with the OCC from a service
processor using the SBE engine. The low-level transfer protocol details,
however, are contained in the OCC "fifo" driver, in order to arbitrate accesses
from different users on the service processor.

Edward A. James (3):
  drivers: hwmon: Add P9 OCC driver
  drivers: hwmon: OCC: Add common functionality and SBE access
  drivers: hwmon: OCC: Add P9 sensors, hwmon attributes, and device
    setup

 drivers/hwmon/Kconfig      |   2 +
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/occ/Kconfig  |  24 ++++
 drivers/hwmon/occ/Makefile |   7 +
 drivers/hwmon/occ/common.c | 110 ++++++++++++++
 drivers/hwmon/occ/common.h | 124 ++++++++++++++++
 drivers/hwmon/occ/p9.c     | 350 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/p9.h     |  17 +++
 drivers/hwmon/occ/p9_sbe.c | 195 +++++++++++++++++++++++++
 9 files changed, 830 insertions(+)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/common.c
 create mode 100644 drivers/hwmon/occ/common.h
 create mode 100644 drivers/hwmon/occ/p9.c
 create mode 100644 drivers/hwmon/occ/p9.h
 create mode 100644 drivers/hwmon/occ/p9_sbe.c

-- 
1.8.3.1
