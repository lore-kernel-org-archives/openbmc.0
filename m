Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjF89455czDqN4
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 04:55:53 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7UItSpi143661
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:55:50 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cnxcr28u4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:55:50 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 14:55:49 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 14:55:46 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7UItkjt26411230; Wed, 30 Aug 2017 18:55:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75509AE04E;
 Wed, 30 Aug 2017 14:56:10 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id E05A4AE03C;
 Wed, 30 Aug 2017 14:56:05 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] hwmon: (ucd9000) Add sysfs interface to clear logged
 faults
Date: Wed, 30 Aug 2017 13:55:34 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17083018-0044-0000-0000-0000038563CA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007637; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909848; UDB=6.00456361; IPR=6.00690132; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016931; XFM=3.00000015;
 UTC=2017-08-30 18:55:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083018-0045-0000-0000-000007B37C9A
Message-Id: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708300288
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
X-List-Received-Date: Wed, 30 Aug 2017 18:55:54 -0000
X-List-Received-Date: Wed, 30 Aug 2017 18:55:54 -0000

This set covers changes required to allow user space to clear logged faults
on ucd9000 type devices via sysfs.   A write to this new file with any value
will perform the clear operation.

Patch 1: Document new sysfs file.
Patch 2: Implementation of new file and clear process.

Christopher Bostic (2):
  hwmon: (ucd9000) Add support for clearing logged faults via sysfs
  hwmon: (ucd9000) Add sysfs attribute to clear logged faults

 Documentation/hwmon/ucd9000   |  2 ++
 drivers/hwmon/pmbus/ucd9000.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
1.8.2.2
