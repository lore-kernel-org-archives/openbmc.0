Return-Path: <openbmc+bounces-2198-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2275C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 23:36:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtkQZ0jCcz3brv;
	Mon, 06 Jul 2026 09:36:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783280475;
	cv=none; b=K3Dwvitj2RRtdRwjnd4aAj3zEnXXH/tMXldbOVIqflEpbA5QiDIEt2PO9rjDZyU9rOylUVbiGQMJl3hqelNUzH+DJ5GyoQuRP1gQP9tL/Cn9fECsAerNRLGlxlu3HQCjlrHuklK4F4gayT/5/Igs8XQrOI9zRHYKf+DGTFWWD1jcuXBxH3a1SOhjrVPIf5raONUzCnrCRsrJ/3WczLiicxDqdY+OZZMduig4uT+VD04LuC4TeQLTWrgeKfnKuOTmBrwj/iq0RWeUGSKZLY8uyOmSq4Tg1McxYpVUwnCK6TU7K5DTeUd9EJwFQcsYjQaLdAYo63xevizFCYEHFddmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783280475; c=relaxed/relaxed;
	bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Im/hBi0HeCZ+0byxQB4M9Ft68JJnl1AAX8AA11LkQjpU/SejbrxhsDC7f3Ndn2m/BzaJy0T+RWeHZrPM4K9czKAJfljcpGHJQ0iIm1tViMqafNJEuijzbAWXxJdYm/k2HDu7CM6KYKMrEQxc0c9vbv/gDDSc89uCt1uhhbRp2d/1yOPIfhCOOP2t3fr4mPyEujTvqWMhQxI5DEY3rwDZ0/6oBgBGLvBD81RRXKQFYP+9fWZuxSt0FQ+EmvaeD8c0w5gy1AA/FWRWTLDOO0z+mQZLJaPEv6mXjRDpXi4ze8OH2703gpRbl9Zn0Re0C+sHjgQciR2A3qXt1DG1Wm3sSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ct1DBvNs; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/y/NNvX; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ct1DBvNs;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/y/NNvX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtdCG2t0Dz2ykX
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 05:41:14 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IShGS2443705
	for <openbmc@lists.ozlabs.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sudvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9667280edeso2775110a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=H/y/NNvXcPPAlhXcXkr74z1dAm2oenSOCdJuNWzh1TwpL/swx7QrPkjpnYOmP2NJmt
         Wz+kYfh/cu1zbMJNJcKAzpsDOYfZA/gWdwgfm2TBUrqRYetCNmUDbFjEn+WN4JJJMQOl
         n9ubNXaGn+S92xA9CGIYfeNA/jjYV5QjZI3LctTGeymajWTHo5eBVcOi5fuMzpub1Gka
         cj0f13pRINnrGI1CDsfX5rAQQp9JFyhUqCKT208i7IjwpE42FMbaOoUIeyBxHRmGuK9z
         4YNdqeEkPGkHmfc2dY5uoIXinZXt5yYFvQCKW5uVU4GdaYGtD8X7Svk8POJTx2t9ZZco
         cymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=J+oqKvcWKZp6kYo/nINiqqJvPrJ6xZcVBYXTcdFtSl0FttEqvz0AAJotkWpiezGIrF
         GPaw9MuX2ST+jDwq2hDZzxIs23KnA9N1Et09RS02pHqjMacclFYQ2xlMIT2wbVqQH/WR
         L/vG0P4Pcyh2Uc+ViA7bn3GHzD3QeHAznSKlt0PcgYJuDnCRMVvErDdlZPuX5A7IVI6u
         P54XLTcjhTzDltmisbEmFAjJq/OBYy22ndeFPgHuVwvD151TJ7jBr8o10GD1JuoTR7Bp
         rtAt5lvzIMdB04OFB2MkvC1+OEUYjZ3P3Q1t8HA9Fy3hxftF97cp6jIUpqyhz5NUWrgx
         qg0g==
X-Forwarded-Encrypted: i=1; AHgh+RqXXlbEUwUU9dUm+HE5HGzNVpHRBlhCf3C8AbsOGfFIFoVlgHcDwsa0YD+SrUph3zT3WwrqAr3C@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyf8ZtoLckbV+CBVy0xMdAykkxz9guxO/59lh3tgG2mCiRi7JOs
	IzzqmTkrwOWfS8z2KQ95jrzk/HYYTj1geomX5QyrKOIYIVTldL790aJ1ubyLHCBiOoQfL6copKp
	I5+edc5PS2/HUm5wq9r13F2iXUuQH/Ow3NAEzLLDIu9u3FsxGjtW4QsvOIjPWKA==
X-Gm-Gg: AfdE7ckMLSz6k9Ncoju4Vjspe8ymf8pWmtvyWnHW/PakeGE782fFHNKKghp3W9w9yo7
	Guy6LRvvV/ZarTmraz8/AZG5cRONdvkApVOeg8yPM3p3DOLssFPrXTw/qtipB5Ex1JO6k82aM3/
	qeCe+CjE/qAI3kiuGpf+jE0DpMGbFR+njWzsEwwCk4Fk0F6EdKjbahh87IzboTJAsrpK5Ez7qiz
	GQp6yE7o1EiH0hbwRJqN42wUy3adhILL0V4J4gA9q1oY83nrFCBCdPM6Wg131FA7QRF8TFWo00D
	Nhz+8wB/RZZDB2GeXRsJYCkRW4AAEe3KrGYy12ZR3QrKTm6aa5PcvVtHO7ZezWQWpdAmj8VwJ+l
	qNau63OSuEwH0NJGZtBn7LnwJRB7A2/mpFEV5UQ==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605449637.10.1783280471651;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX4IuMF5JAGbiu
 xVb43tjmepFTDfMVsycFAUIaDGazdRQJhQRxEzfr/8K3yE+3FNmgZUu4AmvBJ476dbFN4xedEpS
 Wb+jSDh76ZDxrj27UNo76ugZc2bNnY8=
X-Proofpoint-ORIG-GUID: 6a0zfeDBtiIFrnRfVswkiHS8SjpVxfR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3v5LsAE1qJMx
 EoYMt0O+Sa9BQHSMypTAfjiBjFLs62CxjWRsfxCZ5S1E9FBW5SYpah7uf6rZzaxZpvFRJCSfefe
 ZJvHyfPpVsiNrfq4B3zBNcy184cG7dg+Lv7MKZhr59M0rRgrEJDBnXf2G+vBplTTnV5c5IijV7M
 KEpsd1QLGqmkZ3ixYzL2bkTN1Eond+ZFrV04pD81HbrXcMCuZSD9Ko6s/lgLhonUJuw8dxYyh8j
 N/fcrejtMimVEJyHgDX/rNoj4HdQkbeccNwKNpHd9PF55STiOwEaWUX/H05T5HkPuBP8XGHoFil
 l19tct5WsAs5aGIK4pd5p9x5CHvqNP47zQ3M6sBYJuk48SZ0s3kNlp9EhkaN5Zg3C2gPH4t6n2g
 aOV7gRS291TOT8N32Gs14+d5QIsqXOAKcTAXnWfvr7z4LyWtmVGS08q0lQPhOsYYnEumJDRt7Uh
 9xArF7X8GiBM7REriLQ==
X-Proofpoint-GUID: 6a0zfeDBtiIFrnRfVswkiHS8SjpVxfR-
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0


