Return-Path: <SRS0=CX8f=LR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DF0C48BC2
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 19:57:28 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8946115A
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 19:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F8946115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9DZG4csHz30Hk
	for <openbmc@archiver.kernel.org>; Thu, 24 Jun 2021 05:57:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rguzGv0m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rguzGv0m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9DYk43ycz303h
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 05:56:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NJXaMX011852; Wed, 23 Jun 2021 15:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=fz92x7/scA6B50ZcqxJGIuEWvZ1dH08e3UEuKMSxbbk=;
 b=rguzGv0mcJzRgn+ahlg4FFnpBsabNziL9uKMRgTcHl9YyQaUmuE3KipKDDBTq+9+AILb
 HLz6lvNAFtPRC4e8yy3cMl3jF8Z4rReA0pi/yClaPacfzItHRYmS7wm7e4IW5FwAXWR4
 TigV6mJ7AQQTMmUItr414W6WMJSzAhxwQIeKKika2Jqx5jZaJ1XDDoSKRcIrs6/xrlVR
 4Cp4y3pzjG3KaT9p4Q5cegoO6zkWmz4pLD5xagGFnFPE9PvstB529ttBPaSLC7/G3UZH
 PFvPwaHfLE+i/Z8ZPfSe/5KLBZhwK/fs+YNmnDP2I1aOZ87v606G04KXFwbEWkCF6jEO OA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c5np4whc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 15:56:52 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15NJm3vE010128;
 Wed, 23 Jun 2021 19:56:51 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 39987932uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 19:56:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15NJumh833161690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 19:56:48 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE134C6059;
 Wed, 23 Jun 2021 19:56:48 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E816C605A;
 Wed, 23 Jun 2021 19:56:48 +0000 (GMT)
Received: from fstone01p1.aus.stglabs.ibm.com (unknown [9.3.116.196])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 19:56:48 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] configs: aspeed-common: Add
 redundant env for mmc
Date: Wed, 23 Jun 2021 19:56:46 +0000
Message-Id: <20210623195646.2639822-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DwJUNe7hnwRKftkWpz2taVCqS0XkErss
X-Proofpoint-ORIG-GUID: DwJUNe7hnwRKftkWpz2taVCqS0XkErss
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_12:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230113
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
Cc: Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

If the env is in MMC, specify the location of the redundant environment.
Per the ast2600_openbmc_spl_emmc_defconfig, the environment is located
at byte offset 0x5000 in the user data partition, and is sized at
0x10000. The redundant environment follows it immediately and is the
same size.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 include/configs/aspeed-common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
index 8f404570b1..62570cea47 100644
--- a/include/configs/aspeed-common.h
+++ b/include/configs/aspeed-common.h
@@ -83,6 +83,7 @@
 #ifdef CONFIG_ENV_IS_IN_MMC
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		0
+#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 #endif	/* __ASPEED_COMMON_CONFIG_H */
-- 
2.25.1

