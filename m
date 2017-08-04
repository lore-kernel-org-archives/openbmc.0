Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNslz732MzDqG5
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 13:26:39 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v743O53C134737
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 23:26:37 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c4ergwjps-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 23:26:37 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 23:26:36 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 23:26:35 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v743QYm827001018; Fri, 4 Aug 2017 03:26:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE07FAC03A;
 Thu,  3 Aug 2017 23:26:49 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.5.232])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 201C0AC03F;
 Thu,  3 Aug 2017 23:26:46 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au, jk@ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2 1/3] dt-bindings: fsi: Add optional property
 no-scan-on-init
Date: Thu,  3 Aug 2017 22:26:20 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170804032622.88674-1-cbostic@linux.vnet.ibm.com>
References: <20170804032622.88674-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080403-0056-0000-0000-000003B185F4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007480; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897252; UDB=6.00448933; IPR=6.00677436; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016525; XFM=3.00000015;
 UTC=2017-08-04 03:26:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080403-0057-0000-0000-000007E7B0C7
Message-Id: <20170804032622.88674-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-04_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708040050
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
X-List-Received-Date: Fri, 04 Aug 2017 03:26:40 -0000

Add an optional FSI master property 'no-scan-on-init.  This
can be specified to indicate that a master should not be
automatically scanned at init time.  This is required in cases
where a scan could interfere with another FSI master on the same
bus.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 Documentation/devicetree/bindings/fsi/fsi.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
index 4eaf488..ab516c6 100644
--- a/Documentation/devicetree/bindings/fsi/fsi.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi.txt
@@ -56,6 +56,13 @@ addresses (link index and slave ID), and no size:
     #address-cells = <2>;
     #size-cells = <0>;
 
+An optional boolean property can be added to indicate that a particular master
+should not scan for connected devices at initialization time.  This is
+necessary in cases where a scan could cause arbitration issues with other
+masters that may be present on the bus.
+
+    no-scan-on-init;
+
 FSI slaves
 ----------
 
-- 
1.8.2.2
