Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjK1D4GLgzDqNY
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 07:50:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7ULo6Gk132948
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 17:50:06 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cp4be4515-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 17:50:06 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 17:50:04 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 17:50:02 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7ULo1X031064160; Wed, 30 Aug 2017 21:50:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD3EAAE03C;
 Wed, 30 Aug 2017 17:50:25 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id BF711AE034;
 Wed, 30 Aug 2017 17:50:23 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v6 0/3] Add user space accessibility for
 ucd9000 stats
Date: Wed, 30 Aug 2017 16:49:50 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17083021-0048-0000-0000-000001DBEFA3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007638; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909906; UDB=6.00456396; IPR=6.00690190; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016932; XFM=3.00000015;
 UTC=2017-08-30 21:50:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083021-0049-0000-0000-00004266BF88
Message-Id: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708300333
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
X-List-Received-Date: Wed, 30 Aug 2017 21:50:09 -0000

This set provides means to allow user space to access various properties of the
ucd9000 type chips.

Patch 0001 Adds a user space means of clearing logged faults.  This ability is
useful in cases where one wants to start with a clean slate during each system
power on.

patch 0002 Adds gpio_chip interface for user to access various GPIO pin states
via the /sys/class/gpio interface.

Patch 0003 adds a debugfs for mfr_status information so user space can gain
visibility of gpi type faults. Note that there are limitations on type of devices
that debugfs supports.  Presently only ucd90160 is supported.  Any assumptions made
as to formatting of data is commented inline in the code.  Any expansion to other
ucd9000 types will need to take this into consideration.

Note also that no pinmux support is provided at this point.  The ucd9000 devs do
have mux capability so this should be added.

Patch 0003 (was patch v5-0002... previously) has been reviewed by Andrew Jeffery,
I did, however, add some small updates to this one:

* Remove ida in bad and unbind paths.
* Remove type ucd90160 check when adding debugfs. Add for all ucd9000 devs.
  Results in cleaner ida code in the remove path.

Christopher Bostic (3):
  hwmon: (ucd9000) Add interface to clear logged faults.
  hwmon: (ucd9000) Add gpio chip interface
  hwmon: (ucd9000) Add debugfs to list mfr_status info

 drivers/hwmon/pmbus/ucd9000.c | 415 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 413 insertions(+), 2 deletions(-)

-- 
1.8.2.2
