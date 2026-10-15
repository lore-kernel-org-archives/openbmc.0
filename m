Return-Path: <openbmc+bounces-2759-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446DACC6B38
	for <openbmc@archiver.kernel.org>; Thu, 15 Oct 2026 17:27:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5FPY452Tz2xcB;
	Fri, 16 Oct 2026 04:27:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792085233;
	cv=none; b=N+cd80UYzBRePGnS1Cs6PbAaGxT50Vqz1+rfJqpRxe1UWCK7Oa8rCmTNhY3dbPaSElOmcKz4CYNEKDspRHNrI7CEqTblQ3mf7oD1Bu8Q1WEiG1RksbZAmuR6x5wAcO3zzRK0j4WJEhGoye8fi0zQAg1skxmVdNqhGQpUsRpJt0Ial/xxpOfHP6Irq2f3+j4AGmSoCdOpEtwkbb9VqTJXZ/1iDSre9eI16DWFXV318pDm0oZbmVoluR0OCMrXvqO6Z2LbBRyGUd+eaQd+FF8kt8SITtdf/xI81ho/3oxGOv7sn5cOgJ/0iD76DF6wf1kXE3hyNtX0WlbsnGohIVf3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792085233; c=relaxed/relaxed;
	bh=EaOh9FY4FewwBYcZkV/3wLo9RqpMxip/oydn3YTdgeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bevxHZ2TXnPv6Ray3j6iLq+WovBXZJ0Ce4TLosPdNpTigFraEBc999vcN7l/4Hs2HZuumZLCI342UbXvKNorPbpsomkjur+FVr8CKKuJcLDsI0u/FRazugKL1XPNP04rUG/Up7uRxOpHFUYPXalKoxn34mZJSRBwkFZD7OfLXD7+vymgJP/of4hfl6HZh5Si7pPXGbE+P4h3OKy+oNaAdhR2oEPqPzWPXVvi+m/dhuOkScQHlgtzyGVgNjGvbf6MwzsUwhvLGdwPAcagfrg0m+tlBLTEexRRjVQZLyGW9Ie/Iuj3R7QL1ivkqC0qBlsshpSSTI8OsHoiUTYK4Nxe6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+TfFTIK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+TfFTIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j5FPX3RPVz2xSZ
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 04:27:12 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kRDI575429;
	Thu, 15 Oct 2026 17:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=EaOh9FY4FewwBYcZkV/3wLo9RqpMxip/oydn3YTdg
	eE=; b=G+TfFTIKOs06MCbfsMYzyPmquyRNaYrurpLHktDdiXDKkw6ASoeop6n4o
	Gcv9uELxgUju5HDmdNPCrj9GOe2o707BjHa1OzhpaBcVT/X3ZmaLvs5XNg1BEVo+
	cpBMv/pCfQcv6UpEdfMTfspAc4PSMLetBXIG2c0q6wkxPVHc8isFhrKemwmllk49
	FB8YFBDu+RSGpIde/158A6MWs2uZEeWeNOw13K2qQ6DVkd71/Nv0gSkAVwH+G5Cs
	9OPhy8B4BYWgfa4+6h9Yq6ab6d6LA0zleYryiqshPkTqrhyFUZ2mKU5Edt/5QSFv
	f9EFCchMIiEhHmo6xCxH1550pixXw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7e1wjkus-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 17:27:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69FE4Ztl1927475;
	Thu, 15 Oct 2026 17:27:00 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4h9ypq7xd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 17:27:00 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69FHQwBv34472452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2026 17:26:58 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AA8A5805A;
	Thu, 15 Oct 2026 17:26:58 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8CF758061;
	Thu, 15 Oct 2026 17:26:57 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Oct 2026 17:26:57 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH linux dev-6.18 v1] eeprom: at25: fix read_poll_timeout() arg order
Date: Thu, 15 Oct 2026 12:26:55 -0500
Message-ID: <20261015172656.2586295-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2OCBTYWx0ZWRfX90Z8EUtDszia
 kAbTYWXZ95paMrsyKtzq+WmnezZydmI/tVb45RUcEpbioIxmdg2q8SoQVOXdGas51XnoizjSzmv
 lEWIW8r5t5eRnCeNckJCLVIS7PtVPEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2OCBTYWx0ZWRfXyKssZfprtZ6H
 HUXloszyZ6G+SAojVW/ydMRF/GWuNFuOQd9M97eQS/wydSdqg1a53DyaYI7j2DmSZeueO7eEm11
 hxF/IL+Sk+rvcdlniJ30RY3bgc47SlIxPINYhSTFkyvG176Rr6kW7Sdjr6QA9YNrMp5pg1CmpQC
 w6XJiBSIgtIJtSVC6W21YmNWNRWsJQ7TucuHzhFOYU4VfivADhvGHoKxfosn4ayRyKDiIuy7TbS
 7xmgZnc93gTvE+bTFVIa9wniIMWcp3VXjJJFMpmh6mJLepOrcf3jWMlqXdv9ZtlAPatSzQIWsrl
 xgRWD6KaG8PG2E9oqOmBCWTxhZFSbDH35dx+U2zDkMdnKy7qJQ6qq3pag6sZrDLWPwtrySFQ1aw
 zxhlpdDXLK5lX88JDzFcgqyyhQ+d1a4v2zuYKVZenRG6/CZ4tD4o8HNiCxzf6x3+++XEXrJc4b6
 toyUe78zVAs17DYvEag==
X-Authority-Analysis: v=2.4 cv=E6pYNqdl c=1 sm=1 tr=0 ts=6ad10ce4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=iTqx8yHObMYv1iS9beYA:9
X-Proofpoint-ORIG-GUID: 0_GZofMrlMBf20Tp3WjIUbL_2qxGod5I
X-Proofpoint-GUID: 0_GZofMrlMBf20Tp3WjIUbL_2qxGod5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150068

The arguments to read_poll_timeout() in at25_wait_ready() are in the
wrong order. "false" is passed as sleep_us, while the macro expects
sleep_us, timeout_us and sleep_before_read in that order.

This makes the loop busy-poll instead of sleeping 1 ms between reads,
and shortens the timeout from EE_TIMEOUT ms to 1 ms, so the wait can
fail early.

Pass USEC_PER_MSEC as sleep_us, USEC_PER_MSEC * EE_TIMEOUT as
timeout_us, and false as sleep_before_read.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/misc/eeprom/at25.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index e2868f7bdb03..df8daa40b0e1 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -209,9 +209,9 @@ static int at25_wait_ready(struct at25_data *at25)
 					   SPI_MEM_OP_DATA_IN(1, bounce, 1));
 
 	read_poll_timeout(spi_mem_exec_op, status,
-			  status || !(bounce[0] & AT25_SR_nRDY), false,
+			  status || !(bounce[0] & AT25_SR_nRDY),
 			  USEC_PER_MSEC, USEC_PER_MSEC * EE_TIMEOUT,
-			  at25->spimem, &op);
+			  false, at25->spimem, &op);
 	if (status < 0)
 		return status;
 	if (!(bounce[0] & AT25_SR_nRDY))
-- 
2.53.0


