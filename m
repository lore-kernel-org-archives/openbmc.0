Return-Path: <SRS0=JGev=OK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,WEIRD_QUOTING
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75484C433EF
	for <openbmc@archiver.kernel.org>; Mon, 20 Sep 2021 15:06:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D203160F93
	for <openbmc@archiver.kernel.org>; Mon, 20 Sep 2021 15:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D203160F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCnvk24g5z2ybH
	for <openbmc@archiver.kernel.org>; Tue, 21 Sep 2021 01:06:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dXjI54HV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dXjI54HV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCntv0lgcz2xjR
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 01:05:58 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KEqNWt004936
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 11:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Qs6VEyyJRdg4x0ZZL8Z6YwocBLxWGgEtosUfx40qQ9A=;
 b=dXjI54HVqLRJMndNiFhVRhj/wgl/+cjF6RPZMcBQREEqgs01nRzhVYjccrqQYJ7VNL0B
 CiWUTXJBFWXGOrROTHAKr7i5KcuRqpjBo9lUQKQhVRn9pzlcQAEJNTEy7hZLrlIesv8F
 hHbgnc6lmCKaTNngWoOprC6bSEJxq1+SAh2W0l6Ifm14rzX1m+9i+ZgpFqGLBv6dTWzS
 U990Dl855WU2PxD8DT4M6UjYy8uso5p8EjQXlsTr0MCvw5RvZgwg2auobF/J44oiCORI
 MKTy2xjKEIQsQUfhHuBm8Ls9xgRlUk017aWefHnezOdnm1t1IoryyGB0lrRoHeZf0cMe NA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w69chb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 11:05:55 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KF35ju031881
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 15:05:54 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3b57r9sksk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 15:05:54 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KF5rg110748588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 15:05:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51A9D2805A;
 Mon, 20 Sep 2021 15:05:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19A0228060;
 Mon, 20 Sep 2021 15:05:53 +0000 (GMT)
Received: from xubuntu.austin.rr.com (unknown [9.160.134.25])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 15:05:52 +0000 (GMT)
From: Ben Tyner <bentyner@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 v2 1/3] ARM: dts: rainier: Define name for gpio
 line Q2
Date: Mon, 20 Sep 2021 10:05:47 -0500
Message-Id: <20210920150549.6431-2-bentyner@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920150549.6431-1-bentyner@linux.ibm.com>
References: <20210920150549.6431-1-bentyner@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _96DBgbqftlJrYiHgdC70IoS6bi6L_vM
X-Proofpoint-ORIG-GUID: _96DBgbqftlJrYiHgdC70IoS6bi6L_vM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=871 priorityscore=1501 phishscore=0 clxscore=1011
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109200097
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
Cc: Ben Tyner <ben.tyner@ibm.com>, eajames@linux.ibm.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Ben Tyner <ben.tyner@ibm.com>

gpio-line-names Q2 set to regulator-standby-faulted

Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 9250d9465407..e1227636c0d6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -242,7 +242,7 @@ &gpio0 {
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
 	/*P0-P7*/	"","","","","pcieslot-power","","","",
-	/*Q0-Q7*/	"cfam-reset","","","","","","","",
+	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"","power-chassis-control","power-chassis-good","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
 				"","","","",
-- 
2.25.1

