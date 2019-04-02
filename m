Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YD5Y6rcDzDqKg
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 13:42:41 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x322YEbE069500
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 22:42:40 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rkxc6a0qf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 22:42:39 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 2 Apr 2019 03:42:38 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 03:42:36 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x322gZfD31719580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 02:42:36 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6DF86E050;
 Tue,  2 Apr 2019 02:42:35 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786AB6E04C;
 Tue,  2 Apr 2019 02:42:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Apr 2019 02:42:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, jae.hyun.yoo@linux.intel.com
Subject: [PATCH dev-5.0 v4 3/7] media: dt-bindings: aspeed-video: Add missing
 memory-region property
Date: Tue,  2 Apr 2019 02:42:26 +0000
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
References: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19040202-0036-0000-0000-00000AA337BB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010858; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01183052; UDB=6.00619336; IPR=6.00963797; 
 MB=3.00026252; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-02 02:42:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040202-0037-0000-0000-00004B3D542E
Message-Id: <1554172950-2072-4-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020017
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 02:42:42 -0000

Missed documenting this property in the initial commit.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/media/aspeed-video.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
index 78b464a..346c2d3 100644
--- a/Documentation/devicetree/bindings/media/aspeed-video.txt
+++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
@@ -14,6 +14,11 @@ Required properties:
 			the VE
  - interrupts:		the interrupt associated with the VE on this platform
 
+Optional properties:
+ - memory-region:
+	phandle to a memory region to allocate from, as defined in
+	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
 Example:
 
 video-engine@1e700000 {
@@ -23,4 +28,5 @@ video-engine@1e700000 {
     clock-names = "vclk", "eclk";
     resets = <&syscon ASPEED_RESET_VIDEO>;
     interrupts = <7>;
+    memory-region = <&video_engine_memory>
 };
-- 
1.8.3.1
