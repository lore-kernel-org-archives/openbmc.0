Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xp8N739mvzDrWp
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 04:38:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v87IaLkN145222
 for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2017 14:38:12 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cu6n7g0cy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 14:38:11 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 7 Sep 2017 14:38:10 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 7 Sep 2017 14:38:08 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v87Ic7gr56950940; Thu, 7 Sep 2017 18:38:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E0252803A;
 Thu,  7 Sep 2017 14:38:01 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.167])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 320482803E;
 Thu,  7 Sep 2017 14:37:58 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v8 0/2] Add user space accessibility for
 ucd9000 stats
Date: Thu,  7 Sep 2017 13:37:59 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17090718-0044-0000-0000-0000038AF59B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007684; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913670; UDB=6.00458591; IPR=6.00693928; 
 BA=6.00005576; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017054; XFM=3.00000015;
 UTC=2017-09-07 18:38:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090718-0045-0000-0000-000007B9F5CB
Message-Id: <20170907183801.36535-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709070275
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
X-List-Received-Date: Thu, 07 Sep 2017 18:38:16 -0000
X-List-Received-Date: Thu, 07 Sep 2017 18:38:16 -0000

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
by Guenter Roeck.  Consequently v6 patch 0002 is now v7/v8 patch 0001,  v6 patch
0003 is v7/v8 patch 0002.

Christopher Bostic (2):
  hwmon: (ucd9000) Add gpio chip interface
  hwmon: (ucd9000) Add debugfs to list mfr_status info

 drivers/hwmon/pmbus/ucd9000.c | 369 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 368 insertions(+), 1 deletion(-)

-- 
1.8.2.2
