Return-Path: <openbmc+bounces-2184-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07FAC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:46:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGgp6XPQz2yr0;
	Sun, 05 Jul 2026 15:46:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783107980;
	cv=none; b=h7xKMIuPJptoUnPFipwfj/ADypxAg1eGtQ3gU5/q/Bgra0VqY1Ejm9XATxLJ2j2/Yl6xwM3GWR9hek4SMHl9s+Us9tqOceoU/rork1OZqfC+eDb1QMj21hy9vZQt52+kc/DohdPe5c+mvWsi4agiAjXydSMDRzO3MW/B+FyancfKRcy5P2tOl55gNIsrsChP1KPvMFRZB1AeFYudygYwXzkCAYk5dtIttW9OavT+YCUzLmp876haqYlZVyFkW1cLNXBF2l4M1X07riOT36Fo7MAZ0vL7cVOCUFefBvyBk743Jaq+1y5qOBrxitIomLT8cJmvG6DdmbKgtK0y98Hk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783107980; c=relaxed/relaxed;
	bh=cv8Z70k8ciR2WfmKiPLW243jrDjjieLnK77w7rwJLZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh8ZcK13y0vjTFBjes4oNiFFtHp6O6Dc38uZnYps1AOveTWpS56sS1Ex+gp6hKwlsnWoGyvXIUhPp1pgGfNrxLFBkhTcoFUO+zcA1lgk5FClWIPUheVji4k4Gw7qEc1LT0nwxHteqRvT0ml1gP06uULkFRW/cOyycQTaR18Mjq8hKtpNEeY/MdyZ+MZyqcGPx0KyaQqxrz26IYJv/KQ2VxZM9rYblkraLu69j5XLtGgaE/daDcByTdGcei+9KHTZkxCWV6xJaEMo6xzByN8MPRKOCesmirADr6ag1gHf8yt56XFurcRanU6uXdZMvERk/xde8gEsLuu/vmL1OURGMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sb1uIwnv; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoDrvnWk; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sb1uIwnv;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoDrvnWk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPQ336F5z2xwM
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:46:19 +1000 (AEST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiUL4545604
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cv8Z70k8ciR
	2WfmKiPLW243jrDjjieLnK77w7rwJLZ0=; b=Sb1uIwnvYj2uETwfHvteOGjSG6K
	JXew0PFUKn64Jx+BTzBOG9vyluIa46v09u3diiZJGxx2REwMh5MVVEQCdko2m1m2
	X3WTpN60KDEWQ7NHz0ELskiwfWEnv1CVkF9EDUiQoaFGnl9iOqG+PwASCsZanogx
	3Pk4bq/g8TllNFlKP7Jc9oBfx17JufnApzflD4ZLqzWUrCXaUXLhncmsjwRdgVCL
	ZDSXeCpRVtlczU6Szn4CjO5K1A4lLTNZunSigmk3ttg1AiKNmcK08JevFSjUTgmc
	N84jDNimEarl0/409TEhjBc7JaEnERPmAY8QmUuTT7AsNwk9w6mSewmHG6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btrdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:46:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so753000a91.3
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107977; x=1783712777; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv8Z70k8ciR2WfmKiPLW243jrDjjieLnK77w7rwJLZ0=;
        b=RoDrvnWkoY0HqTLIXq4JfHX5axt2qvL+vUABAs3yFJSf1vrCuUrmUkMe58ddl2hgqM
         SRpyrIAF0ugjdNh68IHuGmCiTCy7cnqrJoJok6KzdHreWTZ15ZGEKYbcztPgTeIIYKj4
         5mYbINCu8XRXpQsnSZ4wxuRaYy26wQe/fH3LO0QE3JF0pF+0WRk7/gPpAxQTynYojsgf
         SBPtI+aBxUo/4Tji7FyJHGyk4h1h+J6tuhyDUnOrAS1CTBK17K6zAm5n3qAFwLbH0dmj
         GtPxcO4J9f7QwTpJSV9zEaHy9H8HnD/crGfXb95oMZqVcbF4HJE62ALv2R1r6qPG1m7u
         3dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107977; x=1783712777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cv8Z70k8ciR2WfmKiPLW243jrDjjieLnK77w7rwJLZ0=;
        b=dHrAhMJSHdq0Kf+mZkl+afLOWPjia7rGrH3IkaL9/6gfhi8nZAp2TPpMxhc3i91F26
         ubFV11O5uCfWlr/EpUTX6o04XZ8KXWUPXITIOFXsGFa3p3/gLuZvFRkbOHvUnci/4t55
         yf0iwbb2uIn9h7dJ4s2dko3/i0gkEDFdYXlRLMiawZHGBWA0icvVkCUtwczH6IWGVcwq
         MAb/FwT6OdtTdPTqvKPjBWS5xYz5a55ixQrWFaFepuWrx7bkg70ySnyoTztlwHFDm36o
         S86dYwQm6sb9byaCcO++AkFR4GxLAMLBJ/wHCZGESdzSKSfiLTzHJb9smSoe5hy7qI6h
         IOvQ==
X-Forwarded-Encrypted: i=1; AHgh+RosP726WWSqhZj8P+WBMCItcVWzSytQRwCCG9txaUd8yBlVeeJwssfUn1HBHwKyX7NpWk3Ee3aS@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywa4X93F8Mku536W+N8mRBpn8pu0TwpMCxLcxUCflv9DryPik4b
	5DslTtbrSKbFbsxZEuWAw5QvgxEwkayYH4UvkG/JaFXPRNvGPsdxkScfJoOpKJIwOWdB3sfG2GX
	o/YjPAyRg1Pz20JS92zrhjNHzX1T5enTI64W8xQveNlVgG6luRp5aWvW6Z5VQBQ==
X-Gm-Gg: AfdE7ckkShwtbobIB4B6FHBtvNc2kXp70sXGmzeaOOMcVlsvfNWLEpczDGFoDByjs6j
	lR9Bq1e48B3CBNFjyU+h+uL7l/C/pt/F949OC9QL3kqQUfXZqQafVsTcMWiD+UDoR4Zse0SInoL
	MnK3YLg36gzjHcHOYPlHXZypYrEzipMHDe1Q+9FAhkZlYK+EIbyppk3P2EQ/GG5sWrDsGVIoJ59
	MxylzZ2ObJtalppDMVGUozi+G0EN2UCqFC53PFSNuzcy9ZvXLWEh2pyb9XQal0paOptyfDBzSX5
	exZQyvtQ3vZ4skWTVudQoMRbuiCPbfMXKhvUj7KSYrA25dsR0lWk9U8DLpML/lnIcePyWWTco7n
	ehyB39ave7wn480mqrEsBmkHxYYO5xx8hDsDV/g==
X-Received: by 2002:a17:90b:1c81:b0:37f:9cdf:f03a with SMTP id 98e67ed59e1d1-3829f4e8836mr700644a91.29.1783107976430;
        Fri, 03 Jul 2026 12:46:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c81:b0:37f:9cdf:f03a with SMTP id 98e67ed59e1d1-3829f4e8836mr700565a91.29.1783107975869;
        Fri, 03 Jul 2026 12:46:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:46:15 -0700 (PDT)
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
Subject: [PATCH 17/42] drm: ingenic: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:30 +0530
Message-ID: <20260703193855.110619-18-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX7PracilbIPyN
 /AuQJKsqiFz93l0Yq/rBasTFgu90FH08bIlK4hv9eyh/TmGoa5qaBBalkZFyI7gk6uwKwcPxTl5
 2OXW/UmjEBkx3U3V+4fLYMcKFDGg+LHSIRmCWtPGr48EMCUbgE3I4u7pRoVWM8kXV3J0fzzSi7m
 CFTEHGGR/+Uvk9JswZD2SN9MQtg3aBmacJApm/kAhfhQQADhp6Oa+NBdumKes5s2Eezjj8o27NO
 xQDWo2PKdVPvIULg0Fmf36JZRqRSILjyqZFtLy+KwXKQFxD9hnNBHW69rtndv22n0nloV5agq5E
 UsFpB7gsaMs/BsiFxh4AY3CnH5N+edZvFJbGLE2XhBZRh8PlmF4LRT7GTBzdvTG/6DaA7XURtd4
 0UcrlHtFQYL67NuRu3+Njd/e3eVZ9YH4m5lXaJFKjSjr8uT0ZcpWZDen9jzEuAxB73T/iPCqIa3
 M7U/t7euBZXA6zssa1g==
X-Proofpoint-ORIG-GUID: XRi0oyulRhelQndeoViOyBEknZJR93h5
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a481189 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iWCwWg-Lr60CcT_aNAIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX2951PWUWOEE1
 j6dq5Ek7RdbmY3ymJeNV9Cp8k6VGF9BTEVijn6LJjb3jAsyxPSCq8pn97lqS5jUb+oobISR93I8
 votHsuPTa+Kj0bzCpyN7ZpgGmJmYJtg=
X-Proofpoint-GUID: XRi0oyulRhelQndeoViOyBEknZJR93h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Replace the hand-rolled devm wrapper (ingenic_drm_release_rmem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 7e569af22391..990c3b4625fa 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1060,11 +1060,6 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
-static void __maybe_unused ingenic_drm_release_rmem(void *d)
-{
-	of_reserved_mem_device_release(d);
-}
-
 static void ingenic_drm_configure_hwdesc(struct ingenic_drm *priv,
 					 unsigned int hwdesc,
 					 unsigned int next_hwdesc, u32 id)
@@ -1127,16 +1122,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 
 		if (ret && ret != -ENODEV)
 			dev_warn(dev, "Failed to get reserved memory: %d\n", ret);
-
-		if (!ret) {
-			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
-			if (ret)
-				return ret;
-		}
 	}
 
 	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
-- 
2.53.0


