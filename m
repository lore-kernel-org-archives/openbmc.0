Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421bLt0DGRzF37D
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 07:32:53 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7ULUEkk137538
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 17:32:51 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2m6p0vnnfj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 17:32:51 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 30 Aug 2018 17:32:50 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 Aug 2018 17:32:47 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7ULWkLT46727178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Aug 2018 21:32:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B90B9124055;
 Thu, 30 Aug 2018 18:33:23 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D135E124052;
 Thu, 30 Aug 2018 18:33:22 -0400 (EDT)
Received: from oc6728276242.ibm.com (unknown [9.85.221.248])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 30 Aug 2018 18:33:22 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com,
 linux@roeck-us.net, joel@jms.id.au, benh@kernel.crashing.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device documentation
Date: Thu, 30 Aug 2018 16:32:32 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18083021-2213-0000-0000-000002E5BD8C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009640; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01081201; UDB=6.00557772; IPR=6.00861186; 
 MB=3.00023023; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-30 21:32:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18083021-2214-0000-0000-00005B630C4D
Message-Id: <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=874 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808300216
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 21:32:54 -0000
X-List-Received-Date: Thu, 30 Aug 2018 21:32:54 -0000
X-List-Received-Date: Thu, 30 Aug 2018 21:32:54 -0000

Document the bindings for the FSI-attached POWER9 On-Chip Controller.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..46372f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,15 @@
+Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
+---------------------------------------------------------------------
+
+This is the binding for the P9 On-Chip Controller accessed over FSI from a
+service processor. See fsi.txt for details on bindings for FSI slave and CFAM
+nodes.
+
+Required properties:
+ - compatible = "ibm,p9-occ"
+
+Examples:
+
+    occ {
+        compatible = "ibm,p9-occ";
+    };
-- 
1.8.3.1
