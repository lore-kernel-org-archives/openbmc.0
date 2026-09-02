Return-Path: <openbmc+bounces-2519-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4E4C61DD6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:19:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb0bG3zKwz2y2M;
	Thu, 03 Sep 2026 10:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788379698;
	cv=none; b=e7iM/dIGuURqklBV88obtoU1TFuW8m6y3sUEiitgTHdZvYUu8+xdAK5kwSsuidibC1eKi/5DlsK+dK7UZzDADRNZNjXJ+7YijzzwmPmP33f4Mb7USUtdjqjWYqBtqskphWNj2U71ToWrMqc+4Nv7TsDqT2VYGTBj6AFRIZxsqZpDFMMhp9As9fBsFyGTwwj02cErRLAzcOycxRsq2D1yla3sIRF6cN2CpyeOXVrK98mm7W1XcHAiYOmeb4w4VWj7Bm6qFzSa06mQbg1EUkWmF9l9KMjDb8dQDGkSVrzLdNqsjZOcNLdXOtUrljdEXX3sgJyYM8/gLwStWuaYDUvf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788379698; c=relaxed/relaxed;
	bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wyvuqg6dFLHjkLbsw2ViayiRNHTQZPSHqzhGZE1NVdw+cfasqRit+0OsmQQPjRAHYh2hfN1D//hZbxvaAsHloSLAXm8re6ku7ustpMBY4dBiiZTSQEzQPwcqXHUBOE7z9lzhgq+6FLDg1+T9ogSJBx5nTmJ+Gp1urxmWL32r8ZHHxyWpfuQ2OWYpBVTQB82hCEb5JvdiVCc3b63je8blvtzrOevb0eyuA3ijeoMIqieIP40+PP9RusZ8Vho5rt1g0IeTWaV1iMEK571MC4SS35525EuwW//yBR79BAGRpf2TAYYfDHROEmB2QWXwH3SX2+887TxhJcC3Z4/LixLDcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+qVvV11; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQDA1omR; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+qVvV11;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQDA1omR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZv1F61Zkz2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 06:08:17 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsKq02732015
	for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2026 20:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iYuD0uDqzSw
	HU/LAQJijWaTr64DX3VL/giE1/pE1aNo=; b=M+qVvV11pixl6KhVG9hStD56ULl
	HhKND36J+s25d8SnWLfEnCsAY3W2C+ZhwEZvtp7qAul1VrhtgDfrrq4DaqJ3ZzU1
	z1zZQu9vbVN44CrHCtmJU+rAK+B1f0vMgFdTAr7FwMGklBBSqneXiL8iZGWwEqXh
	UKPvlcpUK9dyrnYdJkNRcw7esBUv8iKEk/AQRSCskMJq0bPHgq21fdTbJ32poy2+
	nMQeKmQOL7itoHtqWbqTWimQkXWx/kGoao7+tLDMxjUAW76/aGKeVdqzanROnKgS
	lo+j+Cfv5Cx+MfNlIJRB/dUJu9xj5DWvLtvOl+rDuVSDntH2ZqBUk0bbQfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2s79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:08:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so2182313a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379694; x=1788984494; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=CQDA1omRURtp6TmFYoacgGJ4FJpL0SMmkO5YuQFK5L1QEIXPG4eeEHvB1XwolkYgRi
         llFUtnB1FoOhzVKLjBUo9VOjnEmqKdtono7LHh56q5Ma9VJhOutM0yZL2I/h1Zw+PiDm
         /+GgN/YV0KtNJR8Ashno6jYRm1kv9Uo9EvDqpWlUmYxV33AtBlvjTTUr0fq95utoj8/Q
         wVXZd5+95YYS5VUI1tsDeAHQRysnOO0VxEJL0VhTUkaONgtPmrvtRJOXa8KOoKBQ0Ej0
         frz9r+JCkRcGyDHDwK2c2Uj8gQCLyIWAZNVhUrj1m/mYn4Smeg9knJJbnfQNiNyb/tnG
         R4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379694; x=1788984494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iYuD0uDqzSwHU/LAQJijWaTr64DX3VL/giE1/pE1aNo=;
        b=aqLmquee42oyfQrKlBQQjcNeMPFqcLE7OXDnUewz8SxhGxw3QRmx3UWrnjtIocLC5u
         uNj9hCuKdFA57AV9ZqwY2wJFzzBHcAFUxsW6g1KHXzGPp76sUryIHj51MhKgzW/lwYec
         d0QOhptshwD+HWbi0ML3JlX4Br6ub8ueTXmJi368biSEAliKDe6OAH3BMAIBL87Ka6S7
         bs4TWg169cJbH0YBeKgfdjf+B7J7OKUnraPASBW44+9x0xDbQ4Snm/p2dldArZaNoNAn
         MS846a9goBcSvIv5iclx2E4PGeiOCLvoKtM41UcEnOouiCpNed5QtrC0u376ZoazCrD5
         gDgA==
X-Forwarded-Encrypted: i=1; AKwUvBz3osa2o6T45fC+yPLAAarKAXzg8q6NcM8+EqyRbk7L13XKtQn76CWGoDR2Tfmgv6KdPSakhRUZ@lists.ozlabs.org
X-Gm-Message-State: AFuF++kKZogBxpQldjce7/NgKJ60GNCIRJiaukE6eSETk9nS5M7t3Ti4
	ydjAJyRfm4sHJkJfOgJddioIZP4wikZNVJ67yavb0/0B6ws0DKojXMdbRJXVXVvYCJ6O0aki3xO
	gakjDu3mDuq6+knK/tmfNHNVt2UE3bMFwrUlYm7UD4dapFVjwcKpJF2wiUFJV4GhgyAK0Ug==
X-Gm-Gg: AYBFou1feK9oQ6O2MOLwlc69tC9KzBIcEk3PzWaer/BhjSpkjWjZOTKOIVzjoQSDYw6
	lP313ov0PyAeGUZPfRIH5HmExYNcTEgvohiMcxIl3LKUCbaQLA1LX7utp80gttTExpG857HDI8S
	CQmai/LcfTl+gNUQUk3qEHqkpg++OH4NPCQL2cdLTJfC2foTmYOXp+CeyqL+fy8kiVrzW072Sfb
	QISNgBw+M8uUVd6Mjcpy0vRmTo0o62T2YJTHko+MJnIR/xmVuo+ACROTW+7JvFMp/VoneXQSbVj
	AsZtSEM0+g38Uw1+VVD6gY4XvEpEG6Ack7Z4Ua/MXr2J0QBhzxgZr6OiunT1gMtt4rekiIAZv0X
	3pfFDK9aD+gU/sK1kODYhwsDbmOI=
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811258a91.3.1788379694197;
        Wed, 02 Sep 2026 13:08:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr10811125a91.3.1788379693552;
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 5/6] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:02 +0530
Message-ID: <20260902200703.2016410-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a98822f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8QUFPe4thnvzBP9U5Yc8_09gFDfTLFCS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX95L6foMovG+E
 nrgpH+7g2QxPaS2WUmIsgfDwpmkZQn/xgEFsIw9CKm763b2mYgNMdO0CR/QXfIkELfa6Qwz1jqz
 D0o6JxEYdRb2gTsecBXfbKPPKYm0l34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX/HOdmUr+JLLC
 zmbE3g/K1SG/UDKdypk7vbLV94/2tGAykNIOAe8Mq5sdPPDLJ+J0p2MHv8bIPGly+aHHPKr6MDU
 HzZqrDlugSyaOEXwrszCd75nVeRIdVkG0K1IlPZT+v2OsQqosK0+xE+vTY/DgFyTZJojlkxW4Ya
 l21ZqJhO8arPkKbwCvz+oChPV9X/yCVEw0HopYu6xCuT7Vto7h0njePOC/sqaGvkbvi5DZuQFGP
 +qnStILx/jBvGNXlrvtnJfkceCTmC46e3mpI+zkRflSNOW8hHTgUmv8yit8eYo9ztweK4x5V1cI
 KZXLXFlzjmK2kKv7V4Akv2RlnBdjgE/aUUfdSvHm6B6Md0sojES6MeGNODKdf6XW6i6EFCFn0Nn
 92zjc/S5ErpdgqB+9bqxACk/Nb3knKKqfm1qWJ7hUeuM04FfHyHOKtQh1VCWa5f/BqwRt8MYiNU
 hifytuW9VKajX+5MaRw==
X-Proofpoint-ORIG-GUID: 8QUFPe4thnvzBP9U5Yc8_09gFDfTLFCS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.55.0


