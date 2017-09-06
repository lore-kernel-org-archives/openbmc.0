Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnbb575n2zDqZv
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 07:00:49 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v86KxOkC009042
 for <openbmc@lists.ozlabs.org>; Wed, 6 Sep 2017 17:00:47 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ctj63nxu0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 17:00:47 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 6 Sep 2017 17:00:46 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 6 Sep 2017 17:00:43 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v86L0hxM30736570; Wed, 6 Sep 2017 21:00:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 036C111204B;
 Wed,  6 Sep 2017 17:00:27 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id B0007112034;
 Wed,  6 Sep 2017 17:00:26 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v7 0/2] Add user space accessibility for
 ucd9000 stats
Date: Wed,  6 Sep 2017 16:00:39 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17090621-0036-0000-0000-000002652AD9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007679; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913237; UDB=6.00458332; IPR=6.00693500; 
 BA=6.00005574; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017039; XFM=3.00000015;
 UTC=2017-09-06 21:00:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090621-0037-0000-0000-000041ADC4B6
Message-Id: <20170906210041.22533-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709060299
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
X-List-Received-Date: Wed, 06 Sep 2017 21:00:50 -0000

This set provides means to allow user space to access various properties of the
ucd9000 type chips.

patch 0001 Adds gpio_chip interface for user to access various GPIO pin states
via the /sys/class/gpio interface.

Patch 0002 adds a debugfs for mfr_status information so user space can gain
visibility of gpi type faults. Note that there are limitations on type of devices
that debugfs supports.  Presently only ucd90160 is supported.  Any assumptions made
as to formatting of data is commented inline in the code.  Any expansion to other
ucd9000 types will need to take this into consideration.

Note also that no pinmux support is provided at this point.  The ucd9000 devs do
have mux capability so this should be added.

v6 patch 0001 which covers the addition of a 'clear logged faults' sysfs file is
now gone.   There are a few open questions in terms of requirements.
Specifically, why clear when no one reads the faults out?  This was pointed out
by Guenter Roeck.  Consequently v6 patch 0002 is now v7 patch 0001,  v6 patch
0003 is v7 patch 0002.

Christopher Bostic (2):
  hwmon: (ucd9000) Add gpio chip interface
  hwmon: (ucd9000) Add debugfs to list mfr_status info

 drivers/hwmon/pmbus/ucd9000.c | 372 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 371 insertions(+), 1 deletion(-)

-- 
1.8.2.2
