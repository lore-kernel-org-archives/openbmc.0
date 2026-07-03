Return-Path: <openbmc+bounces-2168-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B219C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:39:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGXH6SNxz2yh4;
	Sun, 05 Jul 2026 15:39:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783107809;
	cv=none; b=HNdJvqMJA+oGXp0GJvz/w0y7lNheuaB5WsI7sA+wtiq8FZEtXYMB9OchK0VgxNRf+sYU5SG+PdCLeEyB4kVs4WBJht22TI71LggLwRvrtiiilubODFPIiphno7FCu9G2Wc+Xc7T80qst+Nu1hXvWCANfXR9JVGnv/gfQK3GPZEQ8tcU1xKZkUyNsT6sztmocSoD/5fuEEtgB6FrZjSUuofKk9u4nOq9a3hEIQ25E9DHC8mhL6vrURL86FW3w+y2UKMu5lWMPgi1lEn2G8u0XFrOt1zSMEt8Jo9LyizQcdxnumK2St+hvC1Gzxdii5rXeg98x13YNCthrZHvBdmEzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783107809; c=relaxed/relaxed;
	bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vq9ih7oknhbGVkIUumxIiXNjQjsxNmsLkV5uKkIl5ZIJC6/2wbA8ySJCXYP/smZBHOUZxz0bUxNvwpkygNGb4NCgtiFOrrlCwEg4us3GI9NXc/DJQDv8WoR0sBndN937oGW4Cg/M4Qz1y8c09qu+efpk3uRr366IYaTjL1j467fj53bY4CVkLVda7+ZKtar3Du7wgkCi5WszGcGDsNmH5rVN3jqJGx0kIxfLyqurK5bB0/U7q2d1gFF/d6p0sHwcaVABItwsuZqXCjSkpbTSscBDdo03BUKwT2qs7dVnIWdnwDkevoj0Ip2AKuIjHLygd1qfnvbmcrx9JXdilDVXdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nOeTG4ty; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z83/vpu+; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nOeTG4ty;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z83/vpu+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPLn2FXkz2xC3
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:43:28 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiV1v695783
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bn4n8Ensq4b
	2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=; b=nOeTG4ty30vKw+ttbYanSVJ6ILE
	BTAP2O4+nJPij6iXWRyXJ6gBds/5MB5tBMGqFWh+/u8gKduK/0McbMFjobNCnuzN
	1y+6/ZZnKyZ62+pPM/DEC4Iylg8Krq0wAPqD6KdtuGk+Zdk4DKUeyMhiXbzJYdVL
	bIj/QJM7hN5BtusgbHD8m9xNThogT6wHKhQIkdOp/hbQypKE27fZgHchGeO+1BTT
	VPUpeh/bBZI59ScXYRgw65wzTgoMMnoJmFsZzRgRsYFyWaGGYCwKpfq4lPUztwV7
	wVHDf06/SCOxR42J2Z9vbHr4UhAdTAjtbJeXNkQiLE7+wIkknP7olxo/NEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a5es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:43:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so895008a91.1
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107806; x=1783712606; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
        b=Z83/vpu+fbTb0YhEHD3ymCTAYNMcbOUMvQqrMjnDWp1MHHUIOT8t2cAX9BN6R2fLS3
         34ty9dLKNPeII38n/uuJ3ZoiRbOkHuUlrUzCU0JhymxIuxhqCrdMUcWYQpJS5ctzTbom
         l4ZNu4PUzuDDipXbAnVaLWQw97VBQmLf/8xoQjiQgdu/nUPLwTO25QEyQkaJEtIxbuCn
         4Lpc8vg9fhrdQx2mIx4UA6j4vfgrC6KUNl5REia2/yk83csQY/L/zG0DAabazrB0qI+1
         uE985Hx//d4TRaJyqhtZQ/jB28es36UTAxGeC4e+Fm1swJxbHRSpKCEIKZnjxfDYsWT5
         nZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107806; x=1783712606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
        b=d3jctzxrWsk6VsJGCEleDr+obSSv8QIsACXGD2B22cPBerVKRpFceFriwJUT8reIhg
         d6Xwq1b7PO1dgHI5NsWLTViT4MalAvCudG7QpyNRzu5JaP50Kqb+boTVXUoJUnInxhoo
         vDf9fpR09WWiAbIiMlbaQjihvh4/YVQRSIEbVV74KUVYjRdEKw4rB9N+S5Le8htiNoYs
         BvcDC43uALcH7ufyMDz/L1faE6n8GMKLB/vfndD9C4Z+eMBr3IimZ7AfaOuxLqjQnpLx
         NpY8afzrYNg7DaHRRNFJke+zxSf31+QRHvLCRb4o6yoDlyZev0eaCfdEHVlhYvrsnbIg
         u17A==
X-Forwarded-Encrypted: i=1; AHgh+Rp58wvOt0ArCx5YoVjv6rQw17oDosl8uOu5BGoDkcOpmQql36b1nkBFcjpXhtHi6/O1qFmjMscQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTtHKE/7HO74W4nNFjuWN/kY3bLIcAG9fXtsFKWXD9zhXHSPiF
	8iBGGnloA420Ik6iOkQCtouBDx0WQNimk60l/iUpA78+gYamCCNfw8IV+se1oLxLTEOptM0tbWD
	JuTPHNz4ghxaEmEAwCMFaxbiVCqg+mEm/qq1Jw50S5t/Ld9rCtpSScnL+cJ1gCw==
X-Gm-Gg: AfdE7cnsnSZAZjV++5dBHq9jdJhkT4b9KWqR13JUo9TniLAoenPBLEhSMc9XvZOs13o
	LhuBwjEzi6AoO3gssMk6vri/LbDM16r5ebPVk4CdXFEA+TCeJ8n1WvA/j8gIDIncXYCDxJy9wDC
	8qJlHSCEZhguP3mlF37zxQF2/T9zjF4RR5KWm5GxepFhyyza9Tw4ozUAnuh08b6QA0mTzEKytRM
	vz2xeFMQMWOEZR+a+2fbCo5DMolVO0XuLhqnkawJrkRehp+6jALU62LjtCYXatLVDXBirqmdN2Y
	zcaVEDPL3zu8IklWcnnWWF6pBIRFHgj61u24fLWOCPxeOWg1z10z0pM85XvZxOWkXcYoXl9RE4k
	8lnjDLa7+pA+E2585boyXw21KNUVsnI/oPLztbg==
X-Received: by 2002:a17:90b:48c6:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38280e98cfamr772985a91.15.1783107806449;
        Fri, 03 Jul 2026 12:43:26 -0700 (PDT)
X-Received: by 2002:a17:90b:48c6:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38280e98cfamr772970a91.15.1783107805852;
        Fri, 03 Jul 2026 12:43:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:25 -0700 (PDT)
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
Subject: [PATCH 10/42] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:23 +0530
Message-ID: <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2fINj8hyXyGO3nyweCJJNUplPOo7F004
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX+eQrfrpseKr8
 ICk1RIyRYc1TgV7bTQBkwESxyLdbpCLKlb0/py+Or4C1qUDMy7HYzxhDtZwYAACM+fUH8txkVEU
 BADuaAGapkNVTpnCFpwRzhyAKoPAW6k=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a4810df cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ih0ztwYHz3j8HjU85xEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXzdhwIUCZ3R8X
 4A7vMqrMs7i5rw0lc4egqvVoH6OPxvmlFc9zxV0Q9h3HThkhqEO8gMc+zOFjzSG8LQIjrzeMath
 fFsi+Z0B6vNv2u+tOJ13wTY4gn1SyJyULBt1CiirvRMOc5j7ueonesC1iM3WLKiJcqPA7JSpAdY
 WtcS3zpvNk6Xq/DwHioDxqtOcVJBQnpM+ZEQ3XWTl+csLRDBDu6xj/5wg1ylac5Sts6SIoMv3/l
 UhwXw3a5du27pDQy+KcBGeP4LQQi3EHu6kPoXyIpqjilRHo2kqYTiTc3Ce3gLsLvHhzSEqczNLM
 TCTmu53zaGH7u1/Arf8OjBojZS6oouoK9E0BUsQCbPudbN1EgSGoO9RrAwIYpnqj4Z1HEktRYvI
 5/2bnm3B6qHn/RJ9QePh0zYQg51juB1MHE0b2O8geLEb/5EtXeL503b571Ah4DkNaXToTWy50YI
 YWVX9nISkbVHjuyCF1A==
X-Proofpoint-ORIG-GUID: 2fINj8hyXyGO3nyweCJJNUplPOo7F004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..25ce37a4e8bf 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -254,7 +254,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -313,7 +313,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -329,7 +328,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.53.0


