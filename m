Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKgsC5sH9zDqBm
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 03:49:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1AGmo7l093749
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 11:49:33 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28hf9xesqh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 11:49:33 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 10 Feb 2017 11:49:32 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 10 Feb 2017 11:49:30 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 37006C90041;
 Fri, 10 Feb 2017 11:49:11 -0500 (EST)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1AGnTWx61997200; Fri, 10 Feb 2017 16:49:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92A6411205E;
 Fri, 10 Feb 2017 11:49:29 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 33B5E112062;
 Fri, 10 Feb 2017 11:49:29 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 v2 2/2] drivers: fsi: i2c fix ports
Date: Fri, 10 Feb 2017 10:49:22 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486745362-7790-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486745362-7790-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021016-0056-0000-0000-000002BAE1BD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006591; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819979; UDB=6.00400871; IPR=6.00597433; 
 BA=6.00005130; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014245; XFM=3.00000011;
 UTC=2017-02-10 16:49:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021016-0057-0000-0000-000006EFF39C
Message-Id: <1486745362-7790-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702100166
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
X-List-Received-Date: Fri, 10 Feb 2017 16:49:36 -0000

From: "Edward A. James" <eajames@us.ibm.com>

missing a couple of ports

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/iic-fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 6d5b045..9c70e38 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -281,7 +281,7 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
 	return 0;
 }
 
-#define IIC_FSI_PORTS	0xFFFULL
+#define IIC_FSI_PORTS	0x7FFFULL
 /*
  * Called when an FSI IIC engine is plugged in.  
  * Causes creation of the /dev entry.
-- 
1.8.3.1
