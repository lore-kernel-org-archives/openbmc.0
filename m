Return-Path: <openbmc+bounces-2174-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8570EC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:41:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGZ26n33z2yks;
	Sun, 05 Jul 2026 15:41:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783108343;
	cv=none; b=aMm5206Wt7b0ULGXiMpClsMAPD+/FhgjlFWrAABnHtBlrusNk6V+kOsE50OTs7S1zVv0PK+yv8C2aLNn0FNTRBzZhZUlzsUVZjrpHic7V7ERW0QFGfETNnNtbLxKet2//ds+jExcjP0n3G3jQZeGu2YYeVGRp/CHMZfAhYTe6ZGKMT9v5EiEPlHpvVCTGozxqfgB9QqrtsgGjaHFYovADwx0SzSD4c5HR9SwPB/dHGFWPWc2JGrqXKUnapCpTR31AzqDynra/lGFxb+qS7WBakSD7zqsoz6Q3/8ZmyO9b4JICKmWKB1bXUaXRHt3JVw7fpvHNRrj9UUwrPxDwb7AZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783108343; c=relaxed/relaxed;
	bh=DVazRrG0aSxY8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLtzwmNr1/GSq2bdVdfoIGhYGzQkDTCZDBs6x64PQPqkJaOJcB/xip6V4HwwX60fCCUPcj9TFh8E0Pg6CO1QoSnyvBfcLDWaS5SAti47dhsAs3Q5hQhpxcgDvGvjhWcPJotecreQGeBGMKb3j/BmCkBvzaibPGZ8t19Sm76pE7GK8DYKUXrEUb2XMHmehE0vTwrJgdo4ItKcQLM02w9LjfzaZ7tgyrl4PKWMIKT4hbGxjwFDQtIzetK2fobQdGRWSfXTygqhAUzUutaI+NoHAbK04yBIglKpf3sjU7Ybekb6d8tCuLnmidvzy0T2L6NQbj5FfCaLT3L1cTsQbg575Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TXRWzJJ2; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+S5NW/E; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TXRWzJJ2;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+S5NW/E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPY26Nh5z2xC3
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:52:22 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiX26675368
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DVazRrG0aSx
	Y8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=; b=TXRWzJJ2mDiAw8ndD7aCyMTUf3i
	qUwQeZ18wqKRvWYaRG7r+U4Zxk17QhXrKV+uyNMifJqDY+dgJJQUE1PxEVafitbL
	/sq5Mw3Xx8o/4twkp24WyE+09HMdwsGNbm1kb8tfUe4hThZERMz+wvsZtyy92Lwb
	nrBIctgsjjqOJkLu+zd2LD45dyuWrZ/mPnBa/MBW3qg8dEJJgHe+i4VpsMo3vRop
	HEkWuF2pAHHoEiQK1DLWavNEjRrtWZLcXJ1zYzjPtBxzPlLbgbJNPMNInXMxnGEF
	qThiaYPMZK+b3IqAmA49y6rMxQqQcVfei0p5lzYtDgpnoThnuaLpXxDP8BQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1hyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:52:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so1482812a91.3
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108339; x=1783713139; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVazRrG0aSxY8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=;
        b=U+S5NW/EpIIcm+R3iW9jHllMzfvv96i/PfT49/1OnroiH756xFUa7cKZtVePJope6a
         V44hYQqB1+bb43Mdf9QE/N600DSWJNyFb8E9C5tbdxVOTDBvtSJCacmkRf2PSPlHbudk
         q6sQFLyOCbNyeQfFKiCWjDyqNcA2tyXveYpl1RPGuUg1S3kUfPq00Q1ZWTXKYVP2S5LU
         eA2M3AQoamvUHSLhNJXgdUG+Qc3wXugOV5597noZEXCMTBl0blnpt8ttbVKXvAA6IX6h
         dMwq91lZhAtXFNIJN0vOdPn0xdm0QoNUusSYlVgbCTWfLG/9GYuzZArQHrlRdaZJA+5e
         1vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108339; x=1783713139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DVazRrG0aSxY8WYlC8x0UHgHkIRBJsYN5YFcXqpwEZE=;
        b=BNOFzSaB7J//MzbjVjTd9pl5dA+9mmXbf2tVoKSnDZ9Q4BhghpuLb/pFoJBXKAa+68
         V6U3DsOLkLYZ2ZcHPgxELohGRflpmyy6gVnO3h4G/Aunbscp3MdQfx7g0KwASnUCEB+g
         fiAvh5Lqu1vlUd3hcwVTsrxXyFSUwGxPgUNacN7WVAcmE5T2uwGwN6eYSP9ryj0PH7mU
         eavmJNd4qcnOOnBEXUmGY2P/MND8Xlh9i/7i29ovFeuhYJWalJMPkBrmBUUTVqoDSEg1
         Oyd37MMHNbyLEkb5vQ97Hu/2/bUlDPC5FkQpnZf7kei764JiojBlIo9k9Iuw5EAh/n7q
         nKhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdyPTxlkLp7fDmMG2Ta6z9601Zr+iczl/6feESWHj6qIxyZx8Bl+jRqBspLoemJEv2GiXEzkYV@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8z8cNVjD8PknV8J//PKUWbZWaZLsLMLeNP+lXFGZOeO0UM/+d
	zt0jclEru9CwCBd/vvtJOy7slk53z244tpx/UpeSFN1/XbM/1/UOJz1qZBbLH+PPGu+CFxLbFbY
	5RIgYua0arQUkCb69isRusOtkT9nwuN3hissUycs1puGOpQEYTFaNOjEKt6IMOA==
X-Gm-Gg: AfdE7cmXfQ/jiL1SjrIa9kpXAeV9aL5vs94b6hBg60P95r6VsuzO+HbRr8ZblTKJFzT
	cDke+YurS7ZObeclBSzYIAjB4nCML54ZFBJLFMS6w3aRTNpvLuRQCSkP6ceqxeA9/1NiGvfVbwB
	OEPFxxv/2KM1JEHyodd0LLC9OXT0fZw64LyM/0DQRA923HvL090Iyd4c65JooRpnPHyRHx8TMw4
	u1qHwms+jMpQO9xCH5zHQ+60Poe2JbziSpSAMDcbV137TItBLhMsQUPFrqN+vj7vf6tOOx+JKlm
	H+043I907y35tlynyxNf9B4ikjv9EJsnZhVtI0M1UIPwXVXxzgcVxejGuMqR2fPzJON/o9y4JGM
	cX88QAK3L1QMo4t9TMSO3RMHmHJLs91YMJQr6bw==
X-Received: by 2002:a17:90b:2d07:b0:37e:1bc4:b6ae with SMTP id 98e67ed59e1d1-382808b20c0mr790773a91.8.1783108339145;
        Fri, 03 Jul 2026 12:52:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:37e:1bc4:b6ae with SMTP id 98e67ed59e1d1-382808b20c0mr790679a91.8.1783108338648;
        Fri, 03 Jul 2026 12:52:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:52:18 -0700 (PDT)
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
Subject: [PATCH 32/42] drm: aspeed: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:45 +0530
Message-ID: <20260703193855.110619-33-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1WcXQqQDjwL6
 bhvfKIatfhGpPLJ6gpfkiQwncPIxrzCxH5e13uUV+AhKh38phU2TR72bTEo48PP4YtHzzS90S5V
 jogu0OlIEjmQk5UmDKfppMTye0pVEsI=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4812f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6plcyOuweDzw_Xx0vPLzRfCNukJ2d3tr
X-Proofpoint-GUID: 6plcyOuweDzw_Xx0vPLzRfCNukJ2d3tr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX2so4K3CQocW4
 fQgbVtZKlObNDOxzOfK3fivqSQFSr4D2diBUifvbz/j9IaNBmJhz069jCXjK9X1macL3R4gbs3Q
 m82twByPs5QYr0EBSR0JyBC9qZ5TSKH8ChW27No2f/unrMO91D82TWzDPJ12b2vi/R2JJfEeZBZ
 QVZgSsCFSEJpLYq6P/hKgl48Yk/xEs53ROSrAALxk3i3BSinShKGMat2V1dod/72KBp50vhFu75
 5TLYv/Y3sLIAVTDG3hHgDEMeUV/L1JPrGOtVAgpFW1bEmspw16Qs6EHkLguc6pa1cY4KfdGl3CX
 dlFt3UWVSZ3evFzAaE3/kRJWL0t9xAPDWzXkcl0K6Fvn4PpcY/qFmKGghYmTzM2p80Z+KgfQMNe
 KbZdetSSScoRnKfn4l6KkzAnOiMz6jLKNntYLYE02Qfkwfx+RiNJjYmtGULu7AvvsA1O6ZYaHWu
 KXDEws8+f1kQu7+HyhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a1f0..2c7e54fc35d9 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -168,7 +168,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 		}
 	}
 
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to initialize reserved mem: %d\n", ret);
-- 
2.53.0


