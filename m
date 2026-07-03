Return-Path: <openbmc+bounces-2175-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C280CC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:42:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGZ34rBWz2ypm;
	Sun, 05 Jul 2026 15:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783108320;
	cv=none; b=ViHGBLWmPTUS8SKRH0NyZeN8QiumoTG4MA7QDGaSoDwdAVDY87EFphj44RiyWe4SNOuaCddK6hP4CTqJLEmLUoOz/bTAcWp2jYNw0LhEcLS06IJMOZdZnvXC7sgBrqF1Gsal3Rfj73qt3Q1CqpO6ASxdZuY3EaD5uRKV3YWiNZ+Aa4/A+gkwQFgeFYaSLkBeXonDi+HTirvQPRmXMOrcT3gyiBXHbFcMTz8LMq3c9A3etJlQJ+4yAZ1fQ1SumU4gBpDOPNFrSwoQM7YEINBHNy69340QLwyOP0dVu4eJSgslvxD0FQUY8FPT2w0HwJouHuhBqxiv1Q13Rokigvk71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783108320; c=relaxed/relaxed;
	bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBAGW8GABfcExu1q1jHvll79qXFtPG/JU93tWEZKOEjzEvjc55Za2CbqvtZOJ/XBff61zLLcmBojIuDEsT4ydWlMVKbVWlnuV6Jn5D9WLM7ItX+Ckrg9Ktq4Nu7z0FGZiAhz5KuD1bTTN4+Ed2CXYikkXo9FO7vkZvJO9IWe7/an8J3PGhaNT8B07QwQck3UBVLe9TUzlFl2rF83LBX4nj4CzZAJb+WmHoJf8hFHqlkJG+L5TR7EaJFmo/rEvY6HZdjMCkTwIqsDlpGebLQjpGh48i02RW6ZlfE1t4Y50hGNuUKR0puYvqPMKd1C2yQDYwjoQw0dYCCQbaIF1C8NCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P4XMHAOo; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HYb5QwhU; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P4XMHAOo;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HYb5QwhU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPXb32rxz2xF8
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:51:59 +1000 (AEST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hid0G676687
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nHoVcIBC9Om
	7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=; b=P4XMHAOoopK+3YamHsJ9mNVAnVc
	ZII9wz0TAH7PLCyGcOHvNPpe8XqRldk+i0My8em5m7NaR8fYEJMOA3TfSO8ebA86
	s1C8rZsx8cpBhmJSifxukuS1eKlnfw+M1GLANC0R6+tDz5sYbHWGfxB1LVE1f45L
	xMO37pCP2ni/j5AxFJWw8vc4pcSLunUSTHMcLNxg1I15ui2AmJ21o0TJBFA3UWLV
	lTNZ09fpqb0hbZNpYHD/mo9UDNSTDfuQ5h3AQpsxCxERdufwt/nWIhySK57UZnCt
	tUZyrGZXbXmF93l53ApgGRVQD9imB0kb5eDmjI0T7vcrptivu9KwnL9SLaw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:51:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso758917a12.1
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108316; x=1783713116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
        b=HYb5QwhUhdbU4CC9oOIZjLP9O2xsnj3Sa9M/aNiFMe+JA+4QMG/YSlW5QhNRN2FJt6
         2MSF+PsqCjsNhHrAQPkMxL4r7AQTomdNyvhk4VsFlUW9ONLu/iB7WbPACauUY3ssI6eS
         NQSgp899vXVH64l/IxpmTp7Z0Ec9c6vpQhTZ/cFayU6K77yVsGT925/3sw9vQAhfJyzO
         XHJTn63BsK/oobAQ2qZCjBabZswvPGui6bM5ns7IitOTi6H3Ffh7ZqcNijUJxkIgv7/Q
         F93tg/yMelhWkzP0z99TfoJf/GtcA14cSADUoy77iIFmqdD0J2sf/aOGvH9IHkr2a3Vg
         VJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108316; x=1783713116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHoVcIBC9Om7j+aiLl/fOkDK1gFavnuStMTUmC5rWu0=;
        b=s/a80lv5Dwr66r0Oy7srfEGaIhdFFPq24oxJrGcGXix1ChqNvUnuT4HAAm3IWogrR+
         dLSHXZ6zuNOsdG+8PQPc+u5CAWnkVxbGrrrS39DOAEODOSMib9VDRuznxoN8Iq6pRa29
         gnL9NNuj2j2CSYVHpFLfmrV3+oMRZT+BUOVlGvRMI6alwUoiKB8L2uURpuHKS1E/FAPf
         SksOTRzeGGWfNFI5a+eQYPEDG52/jQKu084g7v4lmbF8OtnZSc6dPtAiawkFrhNR2JjE
         FxLWTimFjxIWxlRE93OXgmh3imNx8scszuh6pJcRWwNxpgWoYJ9RCb5ieJrmPA/RTR6r
         xP0g==
X-Forwarded-Encrypted: i=1; AFNElJ9v4lmQsH62d1WRW6BpFrHasInMjV2qf/+0zWCiylduNKYFx8PxLpG98dyL3nsRvjifdUZp1J7S@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyivEs5QOkRv/IcG8zZGxe83RkjuGy0UipkDFGR7Dz7YqDG3GOS
	D/bc/qqEeEUJJqqLTXD+ym1xP1efFUfCr20/a5skfgD297uVpHLR8In7zIw/LT2OSRoxVmY589w
	PF53wlruUhhD1H1cLN6n3Jm1VQtdcMAiEJNRb57AcZ49+xOj5XGxlq7+aVRPTFg==
X-Gm-Gg: AfdE7cmCv/0Xo5Dkec0IF6AsDTsO3aW5wH63KZjxIGhseZdYTjgc78CSoH6i/0QmNfF
	q5VxVX+Ioq7hFReJLi3I/yYXvX212G6/lb2+qTVWzjBaBh8RzIMysoi/qwJtPbeVrY2QHK9tKTq
	gQon0s6ADiCITscVE1m31vuHhjpGiDcgb/e5GwMWW1lfBm6eWRVPBrw9EGYZd4zv0w7CcaxmKxz
	KjwU9iMJ1zn9mcwtxU1bsafwIxnxeN8YDlXYw7IvPSfsQQ/UcUEJ4mnj/9vABV5KpHB402ZrG4s
	r+2kQoGf2RRDZK6w8E8dZLhiJ0CY61YzeN11PWcKgvqV7MFWjlm2C0j4WuxbH68p0dgavXxWsf2
	/PBUOQqD2ctm5uHvMAu/qEYqMBy0XWyqbUb+ePA==
X-Received: by 2002:a05:6a21:310c:b0:3bf:6c07:b2f3 with SMTP id adf61e73a8af0-3c03e5af99emr767019637.54.1783108315181;
        Fri, 03 Jul 2026 12:51:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3bf:6c07:b2f3 with SMTP id adf61e73a8af0-3c03e5af99emr766979637.54.1783108314658;
        Fri, 03 Jul 2026 12:51:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 31/42] ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:44 +0530
Message-ID: <20260703193855.110619-32-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXxgdKIrRGQldU
 zIcE1vtnOjZfotawLOJ3VVYWwIe535CUuBf5oQ15dZ/HbAG2LuDaBhFWxoH/wIMjci72dHsgfWg
 xkNeOQlOO8r3+k/RtENN1Idl50iIojLrTXyzUxuD+53SX5BGUsLi7l4TxQk1F/2kW4MHRUOJL5Y
 Vtylcq+D+S65D9eHRxLI+Vez/7H5fji0F/cZLS0FTLOmPIURHS5iAb9T+UVIbo3Rty+paTpLW/Y
 ncr2r3i+SVcREEXlEubRrDM1TAjDtNLVT9TERB2K5eh4Hc2EUr23XO87Fzuml3gud3TSgZ3mHu+
 3X3mT5GtX1EQVPcRIwl1g23kt9cceQ7JenObe+6pbhFoGnIQApCKiWSqEbhN9tVTQEBZQPrrPoN
 Rs4kU6/3ZDQzwFqoJT/7IyQRMWAglXXdd/peO95mROBDcp5oUOIow2VdONKhMXp8JXUxd5WylN5
 UJkfWsHRqiumsJ4wacg==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a4812dc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iqpFDo2SwQq5gjaSpEAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SPppuSJu4F38SfdCKqZ1JcWJFjsFLN2K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX9r/tIWc8oGrz
 LNSWdGWPPhcv/vsUgsQjohQcvRVil76e1yduHhJXcrulEZVBYrFYfaLwYV4APnJh741r7mljMM2
 fMOeWPubqqyDybSYzDumygn1k5eII1U=
X-Proofpoint-GUID: SPppuSJu4F38SfdCKqZ1JcWJFjsFLN2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/hda/controllers/cix-ipbloq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..815932e5c58b 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
 
-	err = of_reserved_mem_device_init(hda->dev);
+	err = devm_of_reserved_mem_device_init(hda->dev);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(hda->dev,
 			"failed to init reserved mem for DMA, err = %d\n", err);
-- 
2.53.0


