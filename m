Return-Path: <openbmc+bounces-2158-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED42C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:34:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGPr3q8gz2xrC;
	Sun, 05 Jul 2026 15:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783108175;
	cv=none; b=Fn5C0P44vVtDOEgPm3j+m+4qHjrcjBhcO9M7iZWEItfojdlJka54mgS3r1IWK7wjEnPEtPo8cCCQp0Cj0CLXRcmUhcJLOYsWPVKbEgWkdQV6bs7kii6GRGeTANescMXIJuCKHOi6MFMSdMwPxIMVkrGmhlkNT1731T2yKxU0LyfNm2nTtQ7xGG1fglE0YkeRg6BrXTaNPi1WpkLqNZ2L817Nk57lWjrS5SBDKfvrcjK2Z864FHpu4SOs9oRIpSlOndNMVl21ROpQyLnS0GmPZN4Au9kaghn3MzFwhBAHA1Gw0fh9essNR2JO379Ugjh4SLL1oTNQKx1oc5Aato9eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783108175; c=relaxed/relaxed;
	bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK0i5RRgSa0X4rxKyNo7PMYHj/4tA3X014COARLKeUVLIOjcd4Bfi+RSVQE6A1xsbqUy6lTbyrGkS5fQTRWRI1WIDLL/tZeeHae6rAIzV+vecdssq/AaAkdNuhSh9RvJVr9jPwHU4UyoywcDqE75RLcHCaixczmA6ECPMVCoYMieUr+S36DwLp8fcdMBG4/qAElFlDhqTBXWBIhRBqNvrSQ1kmgulS5dgccmajzPnUlS5TvrGsLTtkM8wkDA8auW3c3Scp10Om597bBPFJthiGWlY10M4/Qip8x0OQ+O32iAaUDOeGaj3Px6lqhgTotX76TdPaso5vj/0NwX31y/Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VajOTEl2; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WaU078Nt; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VajOTEl2;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WaU078Nt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPTp2lJkz2xwM
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:49:34 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiFv0546495
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bLJLzW0Ww/O
	JpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=; b=VajOTEl2TqBXAzf2tW1fvyDEAof
	9pqqcBlSU62EYwWLpDFmE6KAFEoz5uiKJuh+GfK7Z/gEmbv6rL7owtce51KVrHWS
	JDymszVAl+JjH8r7PIxzJLHMEkSnc7yjmsPmk7pAahjhtd2M4qefochsF+rT/gVG
	ymuReay3qNZujq/djOXQyHwF++lReEZxvq9V8nIMVjysMUzobb2Tl/pAeuyAvNHP
	OVlKy+p/dk8e+WhhAZf3UxXXfkFHQmzYjl8bGzPEXc6vmdf9bd8GGxa8EwgR3/Sa
	Uj0HGeKXNOzg2T4bRw+GMMXPNRHWYI07wNNJ5EUOGHg+gXB1H0cEWmzY9rQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02w89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:49:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84622d6102dso875144b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108172; x=1783712972; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=WaU078NtrtCJsYlszNCKl1ihbcTk8yHAIqA3sEcYQjZDqo3mYNRIo47g0sO4cY7cao
         B7g1V+1sBCUFpQrmmGo6AkMmi2VMT4WHvqvOyv5YrX8FZ+Ap4oOs51XisDuaEGhL059l
         kTWBOg4OhGCrx/xvSk3VlIs9BCsqfgth66+Ew83lPu9Htcb3e/rZaaDaj/vpZlmvsLET
         5ov9vKjNmRh4UmmYT5PkKfkLTglHqCNpK8pYYQUyjG1bXoSKJYHZzFgnufMjeeNher71
         QBxlC05BuqroWJVtLMk08XMBkPRSQmdGnx+kNEw2LB7IJRYW+Uyvql4OXnXwFukOq0Nr
         m0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108172; x=1783712972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLJLzW0Ww/OJpUAPE76+PE5bHA+09Oh2VnK/3GiAE2E=;
        b=CriJP1uy5xnS4NdSB7ZtRBXW6zaeF5KgjGV/cx5r4KOCCGzyGhOwGvgwQzvxqXHCQi
         gVUSryElItUryrvW11jKUmH4taGPLWrHei7ZX9GfBmgPeMpjLtfZF3erZEhhgv6RabNW
         j+MrHuUyVc2yiqtjbalzp1vLNVIUUfXGuaAY946w1XSve108vLzwGyXe1aebfpR0Sj2o
         TWeKJ5NnX7nYmEBTU637TNoRBD6YbOzX5d6W4AMqQk/ZIMWnBMLSs+7aQGv/XauPBE/y
         Y+Qh0rHY6rCe/xufFwwMe/6C3Kz3XqOSTJTWJkpRI8gvhxfK+8ynEqBa0HUCxLkfvZGQ
         QX6A==
X-Forwarded-Encrypted: i=1; AFNElJ+07iB6SQTS8lgxxTDHRKzVMCBy9mGt7EhODmYgRMhcU/NZQznLh76eQ2LxrwwcFGzkMHJ3cdZ3@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKm3LrQnz/LKQSJtQCzLcD5gp0DiKG2GkvZNGK+DVMZzEvZ7qW
	PnuaqfTVrN6fJ/L5cEAk4XSjMH2JFfc5vzWk1LIKqpzHXA1gGqz4IUy8DFQXhDUHMCkaTmfNA5A
	GrUPiZeTqLGWg9Fp2BwMAwSPR1EWbEt5oHH8rinlkUMtwv/sl7Y9kploADjpyNA==
X-Gm-Gg: AfdE7cnw0c5jlZ6xCIke2erZ3m+TdQ0JHvZ+WL1KK9zSwz4Rswpdi6mlKlojg8/tS3M
	4jYRq8ZWnIu7algu0hwE4nkNbICQbG32jaGH5xSHKwvaquRSwWnxRP5KxbcaCqD+jX0d+Qzg0r8
	dec+hFDqmuPjPbZH2yZMLtolEGhGOusrAEdiGmuMgPXD+wcSVcYhB3nBBGyrDsBNlzeaCeN1y3t
	NSvq+fAdDzfIeA3pO6OpltZMKz+fQqqRaeW2rSoqqd8oK9HJXSAS+QO0vX1XPiCDg8chfRIPkg/
	fEF8BNuoziXx61blANAZ7PvF6L7imsmKd34hqPJeWpxY1/n6/vGKkmuJIC2tDVv8ZqrmTG8d71Q
	Z3Y6yFzuIK8mwD7Gy/R1INvF3YFfqEwPlnxdcBw==
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761455637.12.1783108171095;
        Fri, 03 Jul 2026 12:49:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr761349637.12.1783108170517;
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:49:30 -0700 (PDT)
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
Subject: [PATCH 25/42] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:38 +0530
Message-ID: <20260703193855.110619-26-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: NLckixXpJnYLpmCDy5OxLnUbY0sYJBN3
X-Proofpoint-ORIG-GUID: NLckixXpJnYLpmCDy5OxLnUbY0sYJBN3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXwzVHABbB+OeW
 7GIsvhw2bxh2gsNXCVpOWJ2ezGhogSMX/37WdJv8hrvbopol+Wjk/7E8X0ORbH0RJ1w1FHx0hXE
 nles61c2HwKPi5HJ7WXn6RBvQSWDzSE=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a48124c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Cg4emjn-6EWHYnEhqz4A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXx0GZhmMXUplx
 x6I9pLHx/Mjwst4kQCaiX/crvOIXZlk4cTmit3UOF/Qyq79epOLY4UtmnO8TbE03vmIwcmSeH92
 pYFfxO4/kQ2aeDf8FxlyMntthCPkxin5hVTEmODSLJODVqdSs/iV0zpiRZuUpJP8+lwj1EaYypw
 3Qn0OPN6p6xt7+hQ6a8pg/ehrJW2xS8oCY65UqVdGH85CkMq8RwJdqeQ+oecC5NYsFhvBVV+zwb
 eKO50QuIyzhrAZGtI3y6jGtj3ZEFIWANU/4GsBOeGUOPVVcGS9XH6/Da/hRl1HtEX86C14kfe/O
 76PyJvo6o/zzHiH7SXV9Yl3YqYGAeb7hhSvD7pBs5L+CkWMrLeY7t23I4TRy20Q2ym30Gd0idiN
 p8Ea/yg6pe8W350Ii6loI1y4i6uwesZOh87cZxHI97xwedQYo9tTA6NRzYqITJ0rFLHpLWhpY7X
 bJg7sha4mPH3j8F5avw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.53.0


