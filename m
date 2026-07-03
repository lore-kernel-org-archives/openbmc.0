Return-Path: <openbmc+bounces-2166-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D22C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:39:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGWm5mFmz2yh4;
	Sun, 05 Jul 2026 15:39:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783107859;
	cv=none; b=jK/EK+ZurQA3ObJS0Oa7e6y+k4ShhADJoPB4RozsJu1VV/qJNeuxpn3x0TS7PmVALEy8Swe29Ev4GiXJZsU+/3L9wdo2Zbjhhl8JCUSAWmKmVSyB8V4kk3ST7VVWSABRdSpz0n22P8xXz2FxSDjbqf39zO+WvtHv/FtDXiGx+B6E2PKXendEH/2yDqziH6McrwEwEJ2Vws1sLqwxQ9mcvlwXvbtlK5/1778QouBLPK1HpNSM9ZkzH5awscA4rmYz3dprjAP7HwcJSEKZKBorJlAIhaNI67fgWLo0XOSq3Wgw3ETV4vz95pTW9yZG80jODTWe/foqlzS9RyiifTxmug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783107859; c=relaxed/relaxed;
	bh=kb1iTkUxuam8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuNQMPCbscZQAUXrmJCWTnqsEPpssslxhaGoanwZVxZWRl/9k+GQ7bFFA0qTnF9cTagjUmwL37YFqiOIezuHPp/HPt3sZD4l7bpEZIrPHxNM42HZfPJu5isJpCDnoy/Tmtdl44MARnIZpbjUqNdd5VOeoQNg71ZZH4SBNPlpkMDzm46b+tucPF8icXvoLoJYf7mx9s9tKqX5dDybBlIwClpYQs8stBbsRTnRfW/I18nOnXXLvX2i1slwtYmAeATd6Au4egp4l+sOdfeGgF4IlrJfT07QAhKWem/GCUJenZazazFpoOw8sh1I3/htzK6CUS0IrnOl62mWtEg/NQy3kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ePMugh; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hy61ugea; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5ePMugh;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hy61ugea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPMj73yfz2xwM
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:44:17 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj6Ex679223
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kb1iTkUxuam
	8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=; b=S5ePMughZWi7SvoZxYwP0onh31h
	eU4cwfBRx3ahw1LCRcXlkaJIXcfIMfCLwR7z/4iUWQKtrflPoO+2yG9bbv2cGOaI
	eUNir+DbQs4W6XkGR/ALtoBJhumLuXvMRvK0mYA6QVyCAnLjKHYfbljJLKY5PKxa
	tajy4e6gizpYUJdNjXNdCBgeIrKnfYLrf4vI3VCgDRtFCFh7PKsQ/HI/9bT++lwS
	r1cCfbVyFKrL3qO0imObXuw8ZZKequ0xSPmvOeGpkhmMbSWbkgyFk8Oy3q7PR/Kz
	4ENgssi0FTweX0znGsCWiiajLsQk1YuBOQeQNyxOeVbk+7xzCdP0FWyGR5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32jpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:44:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso768394a91.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107855; x=1783712655; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb1iTkUxuam8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=;
        b=Hy61ugeasfM6PwokuQT4c0k0V9y+0Lu7qJJHZuMxzNOUSm/pcSgIFeYOv8sVZqP1S9
         3DroTp4Ho1M+bXpp9ZvfF9YjN3Jr8u1DC9fFka4U6qmdJvBZw3mxEaYVut2gSVgTtcxG
         ppkFV8w40SzQeo/wFPaWBmCqnyJlQlh6BLF+k3txqqtulm/dndJIDXmXJ4CxBxKHZ922
         nSIJ08S6vTWER2HSJesPGBtYJOdUsNZ6+p6osICWdnb9b+TXmdEfNJYee9EhfO11C1nL
         DTLNkqvfQHzK7i3MZ7JQen0km1Ng0nVETatFLeOM8W0pZDD9mMfAd5NtnZ26ORKdi3B0
         ZEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107855; x=1783712655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kb1iTkUxuam8tAkzwKjCMRd26ZQOwOz+Yg5JpRpyt18=;
        b=VuOrOsuLC7+ELcXXNRES1G6R7XIWivtk6EXLYUu59dB2k63bAWOZyCxWxjUcadO0FS
         N6llpKAqJDa+9yVHAoj4wr+s6ApLhfkr9H2FS7YC5khxv9n/E+bxQUIMmQtVu/9WzMwj
         1vhRYOMFtdjGtkbS/FZTfmxYYhgiMyi6slA46JQVEAjB8//M7aUL4tBktQAVarXMBkRI
         iYpoO31uXcY+wnwniYXwR+qkiViBwgk7WLjhjXE/K/fhraIkSLrxaf7Uh731Nio4Zrw9
         LLWlLfHXrhpiEBm8FVJK77VaPkRw7EkGvXMpwfQ+xb9UmT7dzRLV0bD2oaKlppzcRs2O
         4juw==
X-Forwarded-Encrypted: i=1; AHgh+RqNxzOf6vhTHUkx7QywG9wkAm18Rc/m5DjgUI9cnoK8Pz7ANdhX81xp4KSea18Atj0zhk/X/MVF@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3z+VpeijMBS7y2tyI7Lv9Ul5hCv40dpuNvRAFaC1zZypkQ8ZD
	KBzXpD5+Kz6vneSPvl8EeXFwirdKETrfwzaHjMYh3zgKutClk360f43LduP8t+e50B45efh3+Bq
	3BWauHjrbbQGnM4yYqEUjbjY67/4MZCOQBx7h8aFTUuTJQdyfXhKKwozgXVAmDg==
X-Gm-Gg: AfdE7cmyP10KSLlIlSuoW4vky2k7ujx8m8B40lBTKmyanHce+9i1mMRZOvUuDlGkJav
	SXUqXEv79X6hGioZNIhJS8QhfIwu9pKK1bxh3mn+gVQX00/ElZPeE99W86SwDP2imgMAhETA9RC
	iCb9BYURUiAUwB5D3UomMEKnwwXoeJs0LlRl41Nq4CI4vWUA6uL/jOk0mIwblsbLLZ5e2v3LTcX
	AKf/0Q911MfbYLJBB4aH5V39xXYsfsm1R4UAl+9uiXGveVz8DFFKcHaJy+w8+jTdF3SPyH8JBmY
	nGStdYpiI6U/Q6MPwzcM4xFvN+E4f3gm9WYMiMRdbgJV+okb+WNx9dIVK7Zs7DX9fCcSNDIu1Li
	OyZedN8Y0sS+aF+JvWY1vBX+HK4mqjRl28mMGVw==
X-Received: by 2002:a17:90b:5550:b0:380:540:d49a with SMTP id 98e67ed59e1d1-382802bcb77mr736225a91.7.1783107854556;
        Fri, 03 Jul 2026 12:44:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5550:b0:380:540:d49a with SMTP id 98e67ed59e1d1-382802bcb77mr736159a91.7.1783107853911;
        Fri, 03 Jul 2026 12:44:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:44:13 -0700 (PDT)
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
Subject: [PATCH 12/42] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:25 +0530
Message-ID: <20260703193855.110619-13-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: Wp0KKuyNKvXehxD8QrsuE-q6rfSasNN3
X-Proofpoint-ORIG-GUID: Wp0KKuyNKvXehxD8QrsuE-q6rfSasNN3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX6FEgtHqbS4ce
 WLhwMPv/ss2KhQy+7ce5L3w/G4esS9JPBSDLD/4tNM7TS0OpMPirfeqrWaMs5kj57FJ0KCXzRcE
 bNVZGWrwlGUi1Rz101ud7rbHKPX6wR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXx2obumFX/MvD
 9BOuQnkc/XW8q6jgcYbsuCg3wTggk+qmj2QG9ETpmKcamRhnWrrggCfSh958KtTKSUU2UHYMjgk
 HOS7NnNTDTV8xOt+lubP381pOOWzEAYRwiJuQQe71iQ6CP9y3muDj7SA3GnUTRY3Wz1xxsWRy5d
 rAz2tBiiY5GXSAUMl1byh//s5zseY3Ku3TjkRw48HdtFy1pCK6gMVnVkaZSlbWmXGLWEczRiJQL
 76tYTxZB+R61IKZAojNjmoqkDVBRgS7xM//WojYumt/SwUHtpuJ/GwbVIke3DFCaOp0QAR5Em8O
 fQpcro/MsG56FTutuayZ4G03qVfegV9UYsyi7J2OO5RKpSlbH3RkunJy+XDpG0KhFaZh9puvN2R
 8u0JXVinkHAC3BnJpt3sM9ijxzYB+dAquwJF7BHSnRsjxKWyiseJ4evdCRsv6wl313Tqaq3dPYH
 bOfC+4nJQxzhxkuRttg==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a48110f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..7ba9314fdbd2 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 	if (rc)
 		goto err_unprepare_eclk;
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
 		rc = -ENOMEM;
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 	dev_info(video->dev, "alloc mem size(%d) at %pad for jpeg header\n",
 		 VE_JPEG_HEADER_SIZE, &video->jpeg.dma);
@@ -2288,8 +2288,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	return 0;
 
-err_release_reserved_mem:
-	of_reserved_mem_device_release(dev);
+err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
 	clk_unprepare(video->eclk);
@@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
-		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
@@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 
 	aspeed_video_free_buf(video, &video->jpeg);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static struct platform_driver aspeed_video_driver = {
-- 
2.53.0


