Return-Path: <openbmc+bounces-2758-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC2CCA464
	for <openbmc@archiver.kernel.org>; Thu, 15 Oct 2026 17:25:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5FMZ0NJ9z2xb9;
	Fri, 16 Oct 2026 04:25:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792085129;
	cv=none; b=hwcfpmG122BRb+1f1qiCU9ruL//NeswVaTLzJoNA79z8Pviz7UP9XHrSSckt3KMlXqv3zLKlJNcjT37QOfXyVbFXPvDdz/mqIpFZnWNI3wNNK6ib68a1O/fJxJiIJq7JKsu96Wr4jPtoruUogynuKZTCWBd6PTJFFiX9498oVNyteMl/PkZoIhbC0/suUftptUKrg1xYe4SrowwJqsCSEoVieeoVqXZVNYAPP0Z2O83HtSSSbll45fo19FZxVCzaLyyp1TTRMCLc2AWZQMCKyF1q1PpkX3+IhWS2pnasLUkcSipnhPO6jbKbWwRhiWFpdtyu2bGV4XFwWdWbwkTadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792085129; c=relaxed/relaxed;
	bh=EaOh9FY4FewwBYcZkV/3wLo9RqpMxip/oydn3YTdgeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcMUPfOSvV9aXoa4t9zBo6w4g36P1ZrA/KWdg5MUylzxoiC+V9LduJqVRWvK0ETipjHE2eaBikZm8mMR//P2N7Ro2EcStEpvzVeOlmFqrXm70zEifv1CftH3LG5uCMgQLzzqURkwwEvHkT2CUz205VTEqOVp0RxT7zmFoEMGe8RoZFfK/MMOnippxKdIoziGCG4NcNeabOauFPokaUyt0gad+iY1Wzl09zsiyaH+z5NhAUm583CTyhJtwN8wpKU7vb/WCA0Wzb6AXcjja75Ym2lCtiA3hg6y1nLll0g1CQNpPv4C0SowoNwCxPwXcoI4ykLgK/dB5DmhLe+LBh62Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qC8qxQqK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qC8qxQqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j5FMX6y6Cz2xRv
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 04:25:28 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kDG03000591;
	Thu, 15 Oct 2026 17:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=EaOh9FY4FewwBYcZkV/3wLo9RqpMxip/oydn3YTdg
	eE=; b=qC8qxQqKFZAh7KqlsY2BraQF8EsgdUR6AEVrbBrGlf7wOKRmZbHVICkfS
	0OQ6L4Z0gmH2AwKvSu1XyZAzrDjYZQ2mTSEfsxedoi5b4lm1Bmn4dNR7thcwEiZf
	+wSZgiggHb4tN4UTU1QQxrXhH4Jb8114S+gN0igFttsS1d74pFLDM7pviG7YAL/u
	FV50dSsw+QKXi1zejan57DPc/bMoMjVEpgy+MfpQ085AI73NhnW9pOG60TRogUPo
	waeLlCTcqP3Fa8GQg0V9eNwEpicVChsuTHf0qyAFCWVCHhlBrrvsmBK+/gOSg0rE
	4p95qEi5quTt2SoU8uuLiLJ6IUbGw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhu9dk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 17:25:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69FF89P02057775;
	Thu, 15 Oct 2026 17:25:16 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hawqwsbh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 17:25:16 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69FHPEEZ48759266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2026 17:25:14 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C5E25805A;
	Thu, 15 Oct 2026 17:25:14 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C5D05803F;
	Thu, 15 Oct 2026 17:25:14 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Oct 2026 17:25:14 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH linux dev-6.12 v1] eeprom: at25: fix read_poll_timeout() arg order
Date: Thu, 15 Oct 2026 12:24:59 -0500
Message-ID: <20261015172509.2577073-1-ninad@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2OCBTYWx0ZWRfX/u29WarVHblJ
 UTpSO7GnwhKBoio30IkmwQsPEI+CQ3Ej9LVTQ3zxMaWkvo5VSOBMdyrYHuKHd2Zw+cyueBPwjEk
 gwE5/fK0Y1Vyv9lmZ2eEtcYzAtXq738=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2OCBTYWx0ZWRfX9KfDO1OcGA+b
 te0DgUBny79eJF6a/EM1Hu4eyEPc3fREPGYld1CYP656T5qDZVO2Gft+Inc8YsO97gp7Fr4ktvL
 0j34H+nWr/k1uAPGS2wjRC83GzIM4/DDtoVTdT1R5YdbNvRt4dEt/3DmNgNnoIXLaKkHgpLxUe7
 vjqTw++D/bUCXj+XJ4Y/GDytmV0fC7g0+K+xbR0d8efr7uGwoOa20YFD9MvQAkcUeICaV49kDVS
 A2i1wMkFCGmsZ+BLUhAKaipUuMwqYIv4IUnUaaXqreGtr6mVPUgMw/C/flz6UikOK60+CZy2ArM
 6r86nQr/vdjyfYLppwvZGRAcIzUaFOBMuQVCwbbSKzkUp9H5WyX0bzgZez0DC704mg0LBrR9rBN
 y3XL14RboXeIJkMVOXs7fFKsGqOZrigF7MFnxPDnUPxtBDZq8tvup/E30zqsg/roJd9BNmjIq/5
 Oiisd8bWY3UlkVKmxJQ==
X-Proofpoint-GUID: nwo7d_RxIvFwDHM9EP71d6p7oyYzaN55
X-Authority-Analysis: v=2.4 cv=RoFQvymK c=1 sm=1 tr=0 ts=6ad10c7d cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=iTqx8yHObMYv1iS9beYA:9
X-Proofpoint-ORIG-GUID: nwo7d_RxIvFwDHM9EP71d6p7oyYzaN55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150068

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


