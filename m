Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJYpr0s42zDq60
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 08:13:39 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v18L8rWT022964
 for <openbmc@lists.ozlabs.org>; Wed, 8 Feb 2017 16:13:37 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28g801ymbx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 16:13:37 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 8 Feb 2017 14:13:37 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Feb 2017 14:13:34 -0700
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 64EF31FF0027;
 Wed,  8 Feb 2017 14:13:11 -0700 (MST)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v18LDXnC44826810; Wed, 8 Feb 2017 21:13:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 446A52803E;
 Wed,  8 Feb 2017 16:13:33 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id E2A3828048;
 Wed,  8 Feb 2017 16:13:32 -0500 (EST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: i2c fix ports
Date: Wed,  8 Feb 2017 15:13:31 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020821-0028-0000-0000-000006FE7550
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006581; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819108; UDB=6.00400348; IPR=6.00596566; 
 BA=6.00005127; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014226; XFM=3.00000011;
 UTC=2017-02-08 21:13:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020821-0029-0000-0000-0000336977F3
Message-Id: <1486588411-25211-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-08_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702080201
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
X-List-Received-Date: Wed, 08 Feb 2017 21:13:40 -0000

From: "Edward A. James" <eajames@us.ibm.com>

missing a couple of ports

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/iic-fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 1723bc3..28d9624 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -282,7 +282,7 @@ exit:
 	return 0;
 }
 
-#define IIC_FSI_PORTS	0xFFFULL
+#define IIC_FSI_PORTS	0x7FFFULL
 /*
  * Called when an FSI IIC engine is plugged in.  
  * Causes creation of the /dev entry.
-- 
1.8.3.1
