Return-Path: <openbmc+bounces-2163-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC5CC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:36:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGSH6Q39z2yfS;
	Sun, 05 Jul 2026 15:36:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783108787;
	cv=none; b=YpFFrsRPzD55yZhuxXYwutNJPy/c+3MaqLfHiiBC2zWWXhlX50UdWX99vpEg4zH/uvqmxjyzXoGp7Tbky+Rl3iXhVNAg9ZlZbjFDs24XYX5g4zyYEv2hji7r14gHDQ82S2Dkh4hx7QRf9/p55kmNqjqfdjPUsm65tCEeaxbBvaKH3WeQ2IHebyptagXhfThVtwtSOZDXtou4k1oIUPDCK6VgPVpW3SyDw6Okrh446STkAauqUcHVM1CIlCSohnN+dzBfowxO91T6pNjPyp5As6Rj8kfASJfLdCYRo98EU1VsDmtwj0FtNKrdn9OyaU7HC2sd3SyQSbxI592O66sBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783108787; c=relaxed/relaxed;
	bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5KtCbqTaR5LuSIhgtmewXpZ5V0nE9myhfUdyvJXkPL/Rw8vtifBq+pjIfGz+8Qbn7v+99OFZhebySb8EgtAKKfV9GaAaZpA9f1ux6e6JE6ij0ULknlt9JvkkWmZVKnq26bk0g5UH6kaYXgtBPKgKImbC9iI03hIPdRwRm3zou35PbQNrtKgJv7YYsvs7HP5sOjKsaZ5SGkpxuVp1hkzECKskNWNFehD0N16B1c59DdUVh3ZF9YBn/1ZTqDgTOCTWMzmI8hFAverJk31w5f/ME3nN19y0qNZzdVmB2vNwrCm/At1zt6ISo7Dnq33ZcqeOR4PjSRqPRJES4QRdiFKaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipLHZTm; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyGWPIEN; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HipLHZTm;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZyGWPIEN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPjZ2N6Dz2xC3
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:59:44 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HioY4495393
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PGH0Mfb9t3d
	kT8UvMf5f1wosC3eQeF337EZxodGa2xo=; b=HipLHZTmLwrBQObeVsOGWExITfp
	t7/tVWx4vzKDtDPxgNwrOMMLEYbY4ozBpTauLC1kSTV/W7k1Qm0e12vRO+ogANBW
	NW0APmhU3sAdU2NrCqlWIoHmD0kU4SQGq4ljc6YwuMSM7GFhHObmCpJ+/+rhnKsQ
	INKlcMzloIbYPjrnEN/lLIpHGyWDH5yPXXSi8+KcBgoraO6K/MnRfB3UUkLILky6
	qTPqH4OVJXMwBZsrvWtdNjSsexZaz22Q5jADDCPONMxS+LjIGY3qz0KpGGSr3YaR
	wcrE60nfHX13IMBNYdT4V8pqcZ2+pD+AyngKR10muMKnOdEdCQYuLKpAovQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytkhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:40:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so439173a91.1
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107615; x=1783712415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
        b=ZyGWPIENd4PIUfJ6zR5SI4CzR3x1174iETlVinryevDL010FBcwwkNihWydjJFJ3t1
         XYvjpJPt+7ljY9w89dRS77svrGZMhvatZzcIO3NiDJHYKAnSBYnp2MeoTz7NvDIK2P6e
         Vwnj/8rOpdWOMbl6gW+anEBv855taGG37pknMxZ5ys9ezCQ302gQai2zk6R9Rk4S+SYJ
         cGRJqm7C6Is3vFXASYkWYH3dLdUuXpX5LHwR5PVuAnoQ5qgzOoUih3+/BFcdkZxHK2g4
         lESuFWgg6itLGg/PuJvDi3zSISmB+3ZBk0z/J6/LLCsJPuYUqsV6ew/93yST2Uk7gGhQ
         014g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107615; x=1783712415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGH0Mfb9t3dkT8UvMf5f1wosC3eQeF337EZxodGa2xo=;
        b=byNXJgM256otgENrIsjjlCu9fRBIWugZsqoltbUzdVN/r1tous9GSTpcz33c1qIm3/
         zgyXvWVwR/UTAVh7hueuI5LYXb3/czhaMXfodjK/99cWzFWJwIezcDqJYC9bqhPhVvtH
         t6ankTdB4f71VXl4zPJrprHxIvCYkLEn9A/EpFo0b7k3R3oe56qGJdusMPM9jJAUlOxN
         a0fWWA8QY42IGXZ2QBDmVbCqec3csuZw8CLVTyg/7/UvXu+619ZspxUeDPsY/5YyCLct
         qj+wZ3DQfSy5C0gKgeszi9XKU0Wzcit9lp0WRMX7u01PSmUBdzr+Y1h8Q7ANMaJwh8d5
         N8XA==
X-Forwarded-Encrypted: i=1; AHgh+Ros3XXclSWJdgEBKJ8pRTgbWzRH1tw9vPvM59fchtJhRbtHUsBqN6aDl+1a01dkMC46eyKGglk7@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSVBVaQZepYeLP4RNpE6zu7yOkbiJv6GHr0nFdNiNWxD+bKIzG
	NCaPrSD4pytPmJr49vJAw8ipR01fDnMcDKEijy9d7djs/O6pbcRzP3A8TmiAdKJnEajInGFDqiF
	eEx4PM5HSyF03DWB1rTlsEh9yCn9fFUsK/t5BQ7KqKQCiYQePUowoNmjo2cN0GQ==
X-Gm-Gg: AfdE7cmlO3PaTyKXpUOImIX4szgaB+GeyNeE3r5cjbqQFUn+cjyeAuA0R9GE+XnGnsb
	ACemVvFKMd/ywfolvg4yZEw6kgYNwomrNxxE0sD1AyC2BHBuyeUBCcgCLvXYGLkC3eGhrgoL2uk
	5m/shW9Dte4Nm5MRdgxq922W1+CTWhNpWZGvlpiwbHFdWb+wkAMvRg4De/TcxrzpuJyU6q7xdcJ
	VXj1QKFVOY/vTrMtvGGQdmk8M8M9oitUCPTYL4gZ2G88iS3BMT9D+DiSkYiNkF7isXG71OzpYF0
	qMtYEAk20yJin79N7e+qwMaplIcSjf8JeM2mJCla1Olzc9KDuXs15rOftABEeHM7sDlM8tE6YEY
	vTffO1a694mSyVdy/f5WVfPt2Zm2IoH0RGKIOdA==
X-Received: by 2002:a17:90b:4fd1:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-3829f0054e1mr764437a91.21.1783107614362;
        Fri, 03 Jul 2026 12:40:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-3829f0054e1mr764330a91.21.1783107613641;
        Fri, 03 Jul 2026 12:40:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:40:13 -0700 (PDT)
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
Subject: [PATCH 02/42] of: reserved_mem: Add devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:15 +0530
Message-ID: <20260703193855.110619-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX8XAVVewdi3RB
 oB6nklDyxUHH6Upc8cIYl6s1xkekQ/NszLsGvHnAruB+UrVjmihlJeHKGkLK2jCzQtsxvYfA6wz
 SgX/aAH3VB/zt8yO2s/G2q2m4jfMohc98kb0OYektFg77aRR+WQzwykDcTjULmwmNm5P3jKvj94
 ruR/bce57h0n8aAFalboIdn7N65DfJDwVa/3qjmQGZLfqkseQ2D3qPl1c740qmsyd4Plv6sj2MZ
 9uwWO345+2w6DJb8MsxsgHym0hu66W8Tcy3Zx4BVX8DEaWhbU8cdl/M/9jpTibDsw97Q+oS1KPz
 ls9eerKEbAp2B2+kx6mvxFP1ZgI86C9XOk7cAqcVgvtTnTG0DP1qSHhZhLD17VCie3p8qZM482K
 nKDrdb6hYMdWQ2vX7xZF0e4FJcM0FpVDUm2OQg92o+lvUrKyR7yy7jwnlcy+JUe0tWTTv/tEXRK
 keKyT/tQ4Xda/mfxRag==
X-Proofpoint-GUID: T8qpUTAhAcwvoJz7oqJyRBuVr1CCh20O
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a48101f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=K3bnyJ_z4bF7bLuR74EA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: T8qpUTAhAcwvoJz7oqJyRBuVr1CCh20O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX52XnD8rzo4Ss
 BSerqLCCGRAL/BGmWR26t6XMDAjVqSmj7LTr8WoE4axHvQbTwD/qCowatQuPIzOUYVePVvFegY2
 tIOdOVmoAkyoFHiOd3lVYrgjJDa8ga8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Add a resource managed inline wrapper for
of_reserved_mem_device_init_by_name() to complement the existing
devm_of_reserved_mem_device_init_by_idx() and
devm_of_reserved_mem_device_init() helpers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/of_reserved_mem.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index b9fd78123d77..52aacdbf432c 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -133,4 +133,25 @@ static inline int devm_of_reserved_mem_device_init(struct device *dev)
 	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
 }
 
+/**
+ * devm_of_reserved_mem_device_init_by_name() - Resource managed of_reserved_mem_device_init_by_name
+ * @dev:	Pointer to the device to configure
+ * @np:		Pointer to the device node with 'memory-region' property
+ * @name:	Name of the selected memory region
+ *
+ * This is a resource managed version of of_reserved_mem_device_init_by_name().
+ * The reserved memory region will be released automatically when the device
+ * is unbound.
+ *
+ * Returns error code or zero on success.
+ */
+static inline int devm_of_reserved_mem_device_init_by_name(struct device *dev,
+							   struct device_node *np,
+							   const char *name)
+{
+	int idx = of_property_match_string(np, "memory-region-names", name);
+
+	return devm_of_reserved_mem_device_init_by_idx(dev, np, idx);
+}
+
 #endif /* __OF_RESERVED_MEM_H */
-- 
2.53.0


