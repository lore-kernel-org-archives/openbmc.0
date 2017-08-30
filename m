Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjF8H0vm8zDqN4
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 04:55:58 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7UIsW0V069818
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:55:56 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cp0gjgfep-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:55:56 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 14:55:55 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 14:55:53 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7UItqFQ25821388; Wed, 30 Aug 2017 18:55:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6B89AE03C;
 Wed, 30 Aug 2017 14:56:16 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 635B2AE03B;
 Wed, 30 Aug 2017 14:56:11 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] hwmon: (ucd9000) Add support for clearing logged faults
 via sysfs
Date: Wed, 30 Aug 2017 13:55:35 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
References: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17083018-0052-0000-0000-000002582AFB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007637; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909848; UDB=6.00456361; IPR=6.00690132; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016931; XFM=3.00000015;
 UTC=2017-08-30 18:55:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083018-0053-0000-0000-000051D6B2B8
Message-Id: <20170830185536.71307-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 30 Aug 2017 18:56:01 -0000

Create an attribute to allow clearing of logged faults.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 Documentation/hwmon/ucd9000 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/hwmon/ucd9000 b/Documentation/hwmon/ucd9000
index 262e713..de7f7f23 100644
--- a/Documentation/hwmon/ucd9000
+++ b/Documentation/hwmon/ucd9000
@@ -116,3 +116,5 @@ fan[1-4]_fault		Fan fault.
 			created only for enabled fans.
 			Note that even though UCD90910 supports up to 10 fans,
 			only up to four fans are currently supported.
+
+clear_logged_faults	Write only.  Echo any value to clear logged faults.
-- 
1.8.2.2
