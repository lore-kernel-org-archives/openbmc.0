Return-Path: <openbmc+bounces-2160-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C24C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:35:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGQs5gbkz2yfD;
	Sun, 05 Jul 2026 15:35:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783108078;
	cv=none; b=PQSiwujqli6PEdeW/gdSGm83u7JM44FtAYp4PNvfdO6e0Grj/i5cMEQUx5Qbu5JSlkZh3rQG59oVz8rshePBotWVfbvUv4q2klwjdqb4o5c1cEVQqmz6C5BBqh48BiYZyo9L7evCSwSGAyG6UxtKH0+Yu+/ZpXiUXL0X3CKZhoY+UwPayFU2Bc44Vi0qw3ciB+SlPqXfDZBlItk3dFqEoMYN0KbgTdqJGmefvmzBoQeBlPAzD5Ut4pPxc5sV/LhWKOYlok4n8QAqDhy2A+S3+IS9tW30re06LSLVpysyWanEQsoWjqdX+lBRxPmoEAyi7ULPfVlem5mVZFP2oj6ipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783108078; c=relaxed/relaxed;
	bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lrz/EbhsB7FNTRLcxwEZO7MPNLg/bGyYclIRKshAP/dQAb8JMrLESCiOLUFKlAhvmMt7Ao20FsSlmAr4KVexCq1yilAG49gUw8ZapmgaBT6ejmRVPIcd1gVgSJHgwodpmgSYo32V0DjnAGmBaAtpOnnnyKnUwUTkfD2J96o2ebenujPNfJlYk9mZzoMmYtXXChro3ftrdHLRc85YYfhAS+DwCMhnnKGf3H0nKPvaVsbvXRa/Y18fj4RftuK4KPxJGwz7Lj6HCzjAMRYEwduOedV26VpwB92vKwfD7F487xf71OxZQpA/N/Qklx+D02Wdn48w2PPyXLFGReuzO040Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZRbqGsB; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GAOlSoNV; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZRbqGsB;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GAOlSoNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPRx5T1Bz2xC3
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:47:57 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiVdx631517
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xuYKB9E0hzF
	7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=; b=hZRbqGsBRWL/VYFCQeXeHyQYRPi
	GCEQKMaidc29Zyn17PyPi9mLE8M/gFX2q0clAuvqWEMCi5m86/yq0yfMwm66+xQg
	Yof60+ODe2We/1xeDUT/7wgvqLLDAuqKr9nVQmVGU09S2WsL2G0wpZggA032DX2b
	1cZwFSAZJtbX6Yg5dpbk4CTusF2kY8mw+okp6PnErHmqIt9fiWUIYpZW1vkWg8mz
	kdCzNTjJvN1F2Ng4/ZvC/o/W0wBPVJ1xiIAyQ87K1oHGDx6soXMwbve9EDpAugEF
	jr3ipdr+eYULxOuL+KdU7t1704r0d+uX7wy8p3c36wO+CwmF+RyFLO7Y8sg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b039yjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:47:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so1388776a91.2
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108074; x=1783712874; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=GAOlSoNVSR41DNfMVaatlMQ71BX78yiWZpzqZjsZyjFZSzWiSvzmdNMLKl9cwisdEd
         gC2em+jkmsGj4IQVfXKTSJdFchH6NDZSg4Qux4/fzt9CbVV4SrDECYg+YBqSNKP4flpX
         dMGpLRQBFJ1YSHq+cSTpvhsXnQsVFK759si9DnC4RpRftfRh1lSzneaapTUgWyzs0eQ+
         4Ijl+4t+p+oaH3r5nUi7C7Bnoikfn9mdhNyguTo+MLVCEmpM3CaFzyZ3HAe2MSuwQKUc
         QDz86H7GUPlbIu5QBB4B2MN2wQCiVlz+WZBY2joBMfshZTuYJ1TvU7s54sF53qhnVg44
         +ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108074; x=1783712874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xuYKB9E0hzF7S0N0QAKalkDHkk7g7cDoVCzqqk7pGeI=;
        b=fXZtJdx/lDosCq/lZ3ye/4y0kjPD3KQYmR8/hUSdsoS55jbiB/x0qHH4lb9Uru/V+7
         chnN66YDGo37/PJpoqO4aegKAAq7voesoZjafOGh5pQXy0BsJP1M+0rHdE+M2oR/0v4c
         yFUvy2JntpLum9Nns4HPLFAKxYlqTKtQ1wBaOPKsiZNEPhQEdcLEva9wwpnncJlkBm1w
         3SltcuGz/ELpg68gRZcoQOUuCLsZOODNrD8xHM2QjuDMyB6cGAX8aI4GOGhddQ/Z1gI7
         VGMTMM5DuYQgT3FM56jlu7S0pmZUkpfEOBKRTMqEDakzc4/dMZQLozZpqg89/UmEPTpy
         3GYw==
X-Forwarded-Encrypted: i=1; AHgh+RqgQ04poCn35duaNVrhdGa2r6lPjSLspRbFAoBbfe8/B8g+exsnC4Y3VcHngr73BMZXRBAF2Kq0@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9/e5VXeK35nkx6TVlFV95+s0tie40vzbL1b+elsjJCJOFzThC
	EAOlnHN4LTsY1tZRIuVIIgFEo1EXIUwiTLctGHVYElAiV0/Z8y9V8DBEAAtUPhzD5U6PPOnO78k
	OhxnWAr3cJS63zTA+S/hFCXKrtLdNhWwL6QQaTGBZQyE1OPOZbEvebSOQ+dllmA==
X-Gm-Gg: AfdE7ckYSPG1xbtzOpCRvXyPlWtBHrij6fzOLGePTKyLiuGxYL1Uws+uMxynGN9Q8so
	0XaJ8FHQD580sPVjpTiVJ20OotzvfTTbyEJvawwc5wevq29/GaP8TTPRWvjHuVFq4le1YxsHWGu
	0y9oiuw9w2sSMJwwrg2cHpW0c7e4vT4oxx4y+7kou5HVRvuUEMptEranZuziKCIiLpOyOQLAfrs
	xB5ijQINVLH9eTvJS01lcjrMS1nu85K/ylPctZbvWZtQMJLE3G0pDvSKEd9aywCMt9rM8BmApm6
	BSMwLgoMvfGNQNlw4L2QXN1mbY6ccpQEsxo6j7acBrfztxxA2P62d6B2AawhI9boBEogI+L1VeQ
	mV4JJ0NOcQNAeP1Hx2STPVkunCIP5IomVSjluCg==
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730848a91.26.1783108074041;
        Fri, 03 Jul 2026 12:47:54 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:37f:9ce2:3489 with SMTP id 98e67ed59e1d1-3829f7ed7ffmr730822a91.26.1783108073506;
        Fri, 03 Jul 2026 12:47:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:47:52 -0700 (PDT)
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
Subject: [PATCH 21/42] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:34 +0530
Message-ID: <20260703193855.110619-22-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXxL2CN2y7QprY
 wtalBE/BhcpDXr5esQfLbX7HMI5erD74xFkO5ZuXLCWsvN/H9hUmlQLZoJBmlqIhggwHqQ5I4ey
 S2ok6MfEsZjyq3F0RUD2pMqDKb2UmOU=
X-Proofpoint-GUID: yA5G1iFVcsDJ0kX5ZthmncMdh3QWE_cL
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a4811eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=NKxwcvIfb8AsFCMGSgUA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX9XyacSS9tfbq
 A13MX7/G9T9ZCpms95+k5gfjEQVdQMP10ddbWyuOyDSLhIXiuPTj9Y0CatI5vguLq/YAu7/rFnE
 GpvTNYEe62ExE8VxG0HTL1adbwpFEeiZFin/CKs+7IdiEwVm82TNUc/WCEWs20Wp8SiDdQhZJ6C
 XS9QHP5PP4wmwC3nAAGbIXa+bt6RylXeHKX8rURvdQYwpvDZOscWqwsoanACMJs0H26zFCu6fwD
 GYjIX+EkBhj3g7panFWyiJVmQySBkWZ3DKGqlax+Gat37jswsW5QlV/zyxUZ3Y5q5WTa+QU+0dI
 p700b3D+fJlqmyJodI0zaTDsXLUX9wBFF+fd5Q3Q8B+Y+MLc4gYbc9spU01Sywb3fvSulIwZXaA
 d2OorVStlw5mfJuJQ43QmBQflUQP8hKGCDYLGl2t1wZ0Jw2aA/D18iis39pnk4Cge4d1Shv0oht
 EmXRy+KLTSD7cewVyWw==
X-Proofpoint-ORIG-GUID: yA5G1iFVcsDJ0kX5ZthmncMdh3QWE_cL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index 94a389b3f833..afbec11f69f8 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -801,14 +801,12 @@ static int mali_c55_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to acquire resets\n");
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
 
 	ret = __mali_c55_power_on(mali_c55);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to power on\n");
-		goto err_release_mem;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to power on\n");
 
 	ret = mali_c55_check_hwcfg(mali_c55);
 	if (ret)
@@ -847,9 +845,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -864,7 +859,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.53.0


