Return-Path: <openbmc+bounces-2199-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD625C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 23:37:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtkQm6VXvz3bsM;
	Mon, 06 Jul 2026 09:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783280469;
	cv=none; b=o1qRIEVdyZ7FjfACwXJH7Ibsz/AcvtTBQrJGVXAgL9KFbpc16LQ4F2dFdRj6EnZO+Tr3ay4wErvZQEn5d3Z6OG3kW1fyCUsVXoE9G7Nos12IY75Z36gjDlL2TgFVIj5HRXLjwp5xWhaIRIMPgPBxkNREno/LFtvC7EVVhZmcc04ezMcTbI+QXVML2DnyxJCmeX8Bw9qqY/Ezrm/P2GkjzMi6E23o9ZQCDPaoGOS0nttPvrpODRxEc/5Vd91eusfLlSDRodFm+t1xyFp2kWFfo6HKw0C+Wpo+jIfgOV87G5STgNXplUf/4EOuelbWC7swSc3X3pXgVtDUlfeEiQZwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783280469; c=relaxed/relaxed;
	bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB+96ozmCMsnO5cYnZz6hOl5xN9BtaXfNM83bikR6sGP7YqCcZgl7+BdapJ5duSb9KMU0p1Dbw8L+GcMVNatsPlEtuXG5Urvqe49khScTS02HnL/xhM5vkKASA6lBKdNqLiI1+6q547msHYLzCQ+8mFdNYN0abFRChtKvkXsgWNcY4UkMcHoejVvyU2kGykYSryPC1pJBhc57gl/Hw6FHP1kg4RaFYqHQ/zEEdpUn8OpvVY13bDadZgUG5lB7V/iSaI+L+kDrwWqWLUUiY5mhe8jLTAnG7BPKGdv9qVSzcgiAytTCJn4Qg4DPftuI4dQjW49js17DV+QBCqsm7xfig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gu2AUpMP; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hdd++mhf; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gu2AUpMP;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hdd++mhf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtdC8572Sz2yft
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 05:41:08 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi3eQ2132253
	for <openbmc@lists.ozlabs.org>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 19:41:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c8018f11fbso24015245ad.3
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=Hdd++mhfami/rVLDOCpTZ66anA/s7HTnejgsrMi7j+CphJRhzW9IcyVeCnfme+2vhk
         cNLvZK5bVyanXLWy+CfPvhYLHtT3jVkgOpm4QNmSuj2Y+sGPb2CJxc6dv81HU/iiZ0Ls
         DEjc4ozJ63IMrBilKirIJygLtVmLapboYgvotSeRx9YfcEVXIOl0QV+3tZB2lLuxaCgp
         3mRDe/0quhGEue1qb8M36nilD4p/AY8F9kNYU0g9ZttxWzbprOqj78oF6sHF6NrxtrIT
         hXsO4/gc0LPAarJNnp11M58nj/hM8paZ5yAtsC0V6K/ZD2sBmsiyVJC+S3udW1ONHiB4
         wWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=CvT/npHrFqq7/Kfb0GgLlFrzbLDkg7iA1tljXP2Gxwkhr4qye/qfbpkaOz7MgR8wb/
         EKud+jsFPYnboEaif/YUShlYItoDZFPjca7Ovo9wVuBY0nzUa1Ifjitw/EV0Ji4T53ya
         lX+4fqlGZ0jUipwB3W9H2Qhizhs40dOU7U5kXV7wVBFUz5MiQOHf3qo2+d90zSSAeMPo
         ZxcyCJ95ldp7smJ+DyeGGOWGbQ7YrEq0uGPq83QGmy1MI5TC+uvvOVwAV8DMd6hlBEYK
         v4m7kVM9fJsV5hN3GnCVN6nzy/nhSYmyKYSEIJWCjQME7tJxTnSF9W0BQH8iyDx8s69u
         aNeg==
X-Forwarded-Encrypted: i=1; AHgh+RoE+qqXsIqAatYd+VeNMIGDydtlGGo4rYGqy/ynHKb5Sz9CLy1ddHpI8IWxcLhuj0qY6C8ssIXW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnjZnHxnIGKVP2CGTBdKD7+qa87jpBbw5i/9WBAwWOECQZU+ot
	jNaXL0pfSlLmUaqLID9znZJ9bxfnyqjuJhEdgWbeZCnfjdEc65K2enIj61k2JNpGIBQpN7u4C/j
	RdMRfmZieheb+wSJ5jzgiNY0Xcg1hcuXQjdTq+p27DFhEHmlJa5R/18kep8sLkA==
X-Gm-Gg: AfdE7clsV30D3oJpUX5AEgoMW1TsptDCmvJLX0GgjFKD9Ojc9QSnr2EowazJ+GyyY8C
	sU7A/CptW+dpZCcs9eSIXfaRkqdk7saR7tfGcTIkRXDOL54w8Dwrd0RftcbqxA+JqQtHuEwx4iQ
	To3Rwq3sKVwH/waiLapH2rnCDPBcKI8wCQub8oo0VOIHl2cAewN4R2J3GMXMrGcQZYeMBK2e4bL
	DjIC079Hv8ySNMk8NISmdAflPrpa5/N0ui8OffUT7iYjP/EBt3kx1Aj4WYo5kcP1vosEMRcvW0+
	YVVleEYB+sPUyFZWjVGoRLZJnfDwwVJVZBNXLzERm1+SWe5F+MizjuofQCS76IRuln8FNVJ827T
	WaFbkJWvsKuxWze2tZsXPvWSOx0F5c8t5tZV31g==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673745ad.17.1783280465203;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
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
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7yEae2T5QvoH
 H1Fv34u1pCN7swcCxsowWfQFG+7Kyp20hHcI9hgi7GVeXNw9Fw0PhBLfL3sLWzQFUBlSWLPgoi0
 nGemEVO7VV70KM7eSyEpz/DExAA+kSU=
X-Proofpoint-ORIG-GUID: 9A8Jdy20mFd4O0LPdA4WEj1q_KMXr46b
X-Proofpoint-GUID: 9A8Jdy20mFd4O0LPdA4WEj1q_KMXr46b
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab352 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwzze14oWMPEc
 f4fNMUoLL9bR+frZ4b2UiwLNfX+iTPh1CWwgc0J0Epnwe0lA1JNMno0czQiPHw2leqMedI+3ZC7
 rz15kVYWTsQSfKJXVn/fzJQr/7FpcqACKhh2AM3PkkN6G8UXZMwPJ+nqroBSM7c580Vuhp7wEWe
 GnGGArer+K8K2zd/Y4Wyb08n4EjMuteMchB2Y+3+0zLnCnB61vBqb+kc8HbIky8aeOirwE2qwZF
 iq8+OVEk2EvWLFaHHMJi5KTZcSa/tmPZfjeoY0ATazLPgTOz8Q/WRsfiM9gauLFijsxyfO1os2w
 PrclaDAOhFUI0xh5SAXyjxmzEqcGHF7IbhHPA2AP3jCzPiTu7Cu6VFJ7z0MsZqJL84Q68/MRR1k
 RhqODk/77umMmSeN8a2rTLbE8nT0apvi5YXTTlXAHKocfj+zyoQxsUvMWGkTxOuFjACl7bnpHT1
 XlWkBHY8/UyEay/7/Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
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


