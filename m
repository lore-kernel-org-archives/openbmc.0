Return-Path: <openbmc+bounces-2182-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA64FC43602
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:46:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGgm03vhz2ynT;
	Sun, 05 Jul 2026 15:46:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783107931;
	cv=none; b=cP010gupHGRz2CQDb4j/FQ+PDQsMkjpthVkoYECLxQiI5MPBRDXNK009nFfrBrbuJDW5nT3MqoDHHaSdYuFGeC5h4Z0hDTiSHpc8dHsyKjuRt37Z1FZzZ5mubbKqxetNRDNtqSpTk9JJxYZT/FxrQeQ84RyXwAsleDE9SA3kFce81UpFgIt0TlZB5ToDN0/JbAr8rv6bui5AQ3dyYgSPKm7V197LF4t7reNF4YOCqzYBSGDaKpesnlMlB4t95toZqjOMuQIOzozX01XkbLSilOBusB2YV/R/PeZ+lnFLrOAQ/l40ARppVlgqMtSb42KcDy0/DMgrK0XIkISqXq4LDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783107931; c=relaxed/relaxed;
	bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3KoagKUKO19wrEI7hq/U1+sUv3bsnVKNA/uFjqgIvZWeL9suGRDHZdw4TFcuaiNG33hJ00I+2+mgWgFtA0oPh25iE8bdBpD0p6V2Kh6uBgwfCCLGVdY/jExAP6R1lncTEoZLTk27S8jvQnlsVmcPfQSFy7u/yc/zirGt+KNtjkTAM9qmDDFxea/g89LYz0G5xJdoXh3zo677Qm5tpDa8GiwGKUQtYj8mXB2V++o+DoLLUxu3XHbqBi1fvuTkMM1X9xxdzYu/JhY7kjWjZzkQCMuIOG+euh/KvM3pXs7IhwXLTAHc+Lq/kNtzPiB5dyGlAA42Ho2sL+2lxMwdIS0wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+uAJn+X; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwZrLxI5; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+uAJn+X;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwZrLxI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPP70LKBz2xC3
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:45:30 +1000 (AEST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjBH3546854
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQ4/br+RH95
	hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=; b=U+uAJn+XBGdMb+GnChTd4WXzIGt
	21mHhuEBOT3UPMVRFSnaUfgff0p/MLIjrIDZBWyr2ioHNXcJIJuNHwRCxza8nzx2
	o9BU3TUQivd3BsDI+F/Xt1HhgcFBA46i6EG9Y/VKlHlq0xDKl1Q5EPjAF08z1PnI
	N8t0srPzLC3Kd6GWPYmf/TCHQ/ySQ0/hUoM0qzlNv/jaaMZt/hRDr70A5UNnlQ7Y
	sCLDAvCv6zIhx6R3hl2Yx7uA5YiLPndDBfBUeutebe8Oyr3UvI/DqN5c2OwMqCtk
	o63F+mp7gBY0t3VC+xOOXXf2vjJKujUIMvoVs+xyURl5hGazRpjC8TarFyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btra7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:45:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso852867a91.2
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107928; x=1783712728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
        b=ZwZrLxI5t+pr55vqJQsaz1BJfPPxiLnbomeICMcWxDe3poI/Gr6V+g4CTCCDkuZOG/
         Kgu5Gg9+4c5ibIuPcnxFOZnxpjPly97yUupQ85XB4EGwuR/xBuCk+fQcM395Bn1j1z/i
         lfVWuQGjFsD2bp4aUxjT2mZM1RMznTPuWouL2cASiUuLg8McjjuBHhYvzgxT/Wj3lB6s
         y2mjIMM8OfqxMNKFWcBj4+YcedmUJuq7YxNqzej9+RwCcSLTGCkO16n7BPL7dDQIpzB+
         4LcA1f+Wh+zhDs8gp86abEvbk7UvQAY7YSmpkC4pIDHuYfRtMKEufjjDp3jnhlzirY6L
         j+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107928; x=1783712728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQ4/br+RH95hBDshcqs6fwTHt9vF0L65RhVTnJb/EIU=;
        b=pMuAtaDyMqIKQYaCcchqmr0ZJp3UjrDNRMJjuzBziqy6vuAj5mztTXuTFcYE8KJUSG
         5PqT6jsUJbSToVYcBK5ejPuw9EloB6gWMNi6H6TXzCfxJnxlX5/7TRyBvzbBav+kihOQ
         QwkKCp3g30W/OGapCvAHy+Nlmxzc4cpUv1/u4puZ1etq9lZjVsmoNyB6VhiN5yD9GXun
         tom/YDSM2hVL4iPWPkQof0tfvBIT5g6EzubjabiV7URZUJVpDQnjNIvOSbBbZGED7wkE
         w2YJT9vOXv3bs5wKE0WyGAwBqxbLO1Q0eWbOSata1V9fpwi/gWEiIKaOrfpti1lPdWQz
         4IkA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3kwsCEMFxS2//c6VWKc+Hx0ygXQAZAUYZV0VuewZFrnZ1MI2iHIO4ZDmi0vWKiYzFPYVr5VrR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzR9S3AKHhfZrtJFgbA3VA80l9szAfM9tM/S9rdOhgTitakfTR
	iCajxtJSvPoNOEfDwy+QdlhxlPkACoNnmk4M4UmOkHrkJYdG8n6aKFLO9JZ/r4ZW34GzabniJd9
	Jc2bCJbxFvZxv5n+kZ0l8qmsmjsnH84gCMzxOYD2InhmmvN60mQMS6/GBxxndvA==
X-Gm-Gg: AfdE7cmfjzHn0PW0JKs1idEUnar1tHjXd7h4RuEUu6d8ClLcuhU1oRFCXv9+f35XcFZ
	uFKORosEalyQnZ+pqb1JnfAcAKQhc9BCT6EU5shB78FuSU245QycQ4qJTq2km2SY3YP0ET6EJb0
	o/JZ57LOshqIDTTL7xTnAQsyry8zYRDdGMFhmBGsy/SJoZSuUvvCxhjnxS+4+SEHbsxBxeLvVO3
	Zi1gC9y4x3D4mLAxd0VtW77ObIsAqdjrFqXRq0HR6UzWlvX+vPqiNgCOoAFIiszM/5JngR0o+jR
	S2YyVKLbHcPcyru1AX09JVdU/bfm31iKtgEXP8ezyP1py5LGK47VWa/2iKxbrEMSdJf8IciCCPy
	dOPasM8QXWkxBb0ee98HHSt9eadz3k/ZzYmJZDA==
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr636856a91.30.1783107927691;
        Fri, 03 Jul 2026 12:45:27 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr636834a91.30.1783107927089;
        Fri, 03 Jul 2026 12:45:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:45:26 -0700 (PDT)
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
Subject: [PATCH 15/42] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:28 +0530
Message-ID: <20260703193855.110619-16-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX5jF80euVCkl8
 l+xuDPlCwIyMDoxvf4TQWi6SsmgzR+y+EbaCZ27kRmwN1vKUCkvvxUnhpL4OaaEF5aq/jD5xtrE
 kQL4YPtDw1msV0qONXs86nWkWNb2136AEW+iqXGmYsxrBa0X2Wp/9plEkjz5i8Kcc3N4YJoTXLO
 eXW3IOPQpTFwXmBnTw3CgIR98g0Xgp1gFRtVPRtvR1whruUB4ZVqL67S/YMjgPKdN4QAcqp8h1q
 A/WjaUqyjcxGPO4qRd8xm6fxJAgz+/PclndKOrb+vLUnKo42rxUudnox2Ajn+8ko8X3wW0tH01j
 DxeHZswCEy1MXt1SihCijNx+xRHWf5150mmtKc8NqkCyfcES0Gyl5qHywXxyZ/AyfCM2+b9a63q
 sIkVtkBzQ5SwM+8RbASAh2VQKO+4AzLe555OaLBJ8m3ekCp7S3ve21zvSQPcMHcURb7INUUJaWm
 IFVwimvUFgtS1I2t2fw==
X-Proofpoint-ORIG-GUID: N8p9ssfdMQWV2XRxMjKFDS3-0hb3EGDc
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a481158 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8sfNmL5Et35J21XlSqYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX+c1vSBGY1EEA
 ufGaU8lsiihKIRb599bgkCf52I8X8JiQiUM9CHXsWdXRtubPMNUEKoIu6iGqe3JDhzY6ekQfgk2
 edpKRglJ+FGKgqfcqyg6WGI2ZrF5gNY=
X-Proofpoint-GUID: N8p9ssfdMQWV2XRxMjKFDS3-0hb3EGDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.53.0


