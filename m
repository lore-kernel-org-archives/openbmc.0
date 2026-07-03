Return-Path: <openbmc+bounces-2170-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10EFC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:40:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGYF3XXhz2yjn;
	Sun, 05 Jul 2026 15:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783107715;
	cv=none; b=YZmdqbnQ+bGJQ7cA1u+5LXx3Dn38dvwvyHDJjWvZqNnaverXNnK8JiUBhfGaTzFDhZLzc/KuaJI3gK53OCCzCBd0fQd83j0CPrtVBE3LayywUrGB5+HT+mfGVXR+xdtEycyfNOlLMUqAunN/E7/WSxkUQiMGqIIFicgm9Gz+0WMQ99oSunOarPK7s7pFKKbeYlYIi6o3YAzFPlQA3/CMHsly4Y+JBDrADiouMv02qPru2BCXI5Ec261rmcTsqVp8bc1lhIAKztv7X0NnTwtCVXsTRvo1oIKr0ySEVIcjTEWIUbPULF+1XXzWOP/OScaod9Z8+pvQuMmFZ8zRr1rq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783107715; c=relaxed/relaxed;
	bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/9S5VbdzpMDurjETEzpD+uZ9dOKv2JKC/V4yBcL4AtI2UiMzbm3VS/xiTY25VKI6FysoAwFWthxO1z91MwfqrqC3uaxPuiYNk8qGHg6wTqqAWYia2XIdRnqgivirQEnVTEjWdVtIOlalsNH56nNo/Pkj4RlWVBDQ8OeSjgk91bhjjotVHwLRwDzijZ6t/l2TXhDK7V8f85tgJCkjgdFySQu9dKZwPLtRRXTrmR5XUgnmTU6ILidONm7YEOc7yCZXpGIU195SqNLT9f7PzadnbPuJGRsmKBZCQRhYW5MgiMmifFRZ2aqz4MrWfa6mCBrmwR1N+2qg4mQrqN7+oJ3pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RBbUqtax; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4BDoQ7K; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RBbUqtax;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4BDoQ7K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPJy6DD8z2xC3
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:41:54 +1000 (AEST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiQWr530587
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wgBn60HnIhK
	vMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=; b=RBbUqtax0OnhW8ww+r+abiXC7bl
	aoj2BEWb6XNcMTtnbQ/eZQQJxadf53YUYpMb9HDQFPKsAxYE+WHfUJzjV5P7b4sn
	+Z3ANHcjpYktEAFM1C4CV1k8NP88eUtR7krkUEhWjX0o5ZqGk+Yvz3NJ/D7Kg5gZ
	iLxwHLhK6rE6HW9etExXvSejbzzbzhvlqP05WbAXXc3gJ7C0dwK72SOv94lYCmOv
	5FQ0R2Vsu2aQgsQFeztF5gpUm7zEWsntIJWZB6Bx1yTiQ1unY38c+NcNI6Nd5Sl0
	RQ7JIvskzNJuclWDN805IAwFDfDq911B4kqC6csAGjbvgwL75Gns/PO/jfQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3rxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:41:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1024024a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107711; x=1783712511; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=U4BDoQ7K09EIzyf+NDnWzNN4Q6t0Vb4As5Gz/nENs32i0/sbwiZnzKt6Y8asttH0Vk
         p9Ph5VD0RSTCYzCG9HV7G2UoAo+ZKLAuauL1hwZmqCFKIevRVGCGH93iQug5Cr67xEhe
         YidmBuwhivQKWXgAn5QYK1lotUC/4z3Al7ilLzeYpwcnlIgfi1WUA6amUWDQXd/Dkzci
         Ud5MaI3tOlZYIVZV+jc3/DCder1t6/DF5saXQjYvJPMMQXgvwKR1Ol6kvMYtOPe9jRAN
         x7t2dne6mzgiETFpsJLiEbF9N256JmjQ1t7zYEPqhQ7GeFl6RR1ktoOuKEoto8rcokQ+
         VcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107711; x=1783712511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgBn60HnIhKvMMWvsxdr4oIopDbFr3Yf9yX31PDu3/0=;
        b=j0il69I/CVjecVCunk1tuQJv3d65ooDgkPOv7HoJMkKxQAaMqGXi6w5qSTCnpXJs7H
         9fyZx4zF4xrF6zu46ma17RtoMapERuqsECtYmE2T6FENZcfPVRhdId9jW4elZhRZgP9p
         nqVME/dqVcLikv44czTiW04DLU7GCYDmAQiifFDPo6DdwsS/O4K2oLmHMzBLHzpXiGPU
         zCr7BV59jInDA5uqlySjIbms6j5KIrwU8WDtfmgoXlnA2TzzySXJRltrfrbmBrLFn2bw
         8j2F0S8DTUn/Gs2eL+YkpV9YHbQBUqKyZZJxLR7x/CduPjyY5ieemhQw7yryW3s6qGWG
         +z/A==
X-Forwarded-Encrypted: i=1; AFNElJ/6LXGOCBh2ow7lVLXp34aQ97OxdHmAJftECpnjX0JFLu+vpPZts3V1MG6egv7EuOWK88sqLGc4@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw909YDhKqkOc8rr0AfEEpaGCBpEXtzHqsRGBpdZvl8tDJWIEPB
	3lf2H7YMRMAzXzKOxSWIRV0W1MOYIOovsO+7606+wT/H64fPLtINrSBDb+oa+ikQCLqaWwxwa7i
	ff5kxVmqLqkxWEuS6S+TTUC0YdpcQwOh+kDgCRk9RzrgE23xaXjxY9DEb+EdBQw==
X-Gm-Gg: AfdE7clZMtYeevHrO475ckuGuMcroDZ1zs7YBu/NWF+AgunHXFtmDKHbvKl9z6juSQA
	VpCgN2mAgTOzLrTVxiI9M/gx/ejn77Lg8PZOb5A/3ViiN+Rg0s+3sHeJdd4mQ0WcrQlbtrx9ttM
	B09njSpgExCIbmFTTLWNnrlHn6ozJVbHdgrxVr8EmlJ2XnFLaAC9lP+C87cvUHQMoVIpDd7V3YF
	oAquceecPDYnQSm+LoSmuSgqTcDGhDOLk3+7i2m/s57TNC5R0xrukEBRQOOsNJdyryHgzuDiYBK
	ZAGa1A0W67JsppBKJnTtna9FPryy9WuPtC4AU8jaJM7HKeZvTDD8gax+QGFb2oXTWvWMzyQa/RT
	yW2j5/5VUkmysDsMLK6hOrqRqjxTmj0ZPOXn/yA==
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809475637.30.1783107710469;
        Fri, 03 Jul 2026 12:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:734e:b0:3b3:6db1:5986 with SMTP id adf61e73a8af0-3c01cb9a275mr5809352637.30.1783107709738;
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:49 -0700 (PDT)
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
Subject: [PATCH 06/42] media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:19 +0530
Message-ID: <20260703193855.110619-7-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX7V4lfCte2TJ5
 LY86n3vqVdMh0VUzqY2M794/SAK2hZUnMt6L3fq2HKl2GguUwB6U2qrQhlLhB8OIiOVw3lRaWSG
 IDC3cd+CYDyCV9V5yH8HgkrfsX45HOU=
X-Proofpoint-ORIG-GUID: xpFbx9NRR0XP1xoilHndK7DsTaY-nZ8X
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a481080 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wxxTr_YEz1i4iFEBgi8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: xpFbx9NRR0XP1xoilHndK7DsTaY-nZ8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX1lobeVub2xj5
 YROba3gijs7hVnj+SK32wbg9cuBpVhAuTo4+85Q6kOs5M/Ei6L9GYP6mp+rfIgegAUte8MPYKVH
 KCsDaBmUbik8EvuXI5Tft9U8aSNUs95aqbAE/yX68EJir3wedJAhtUxpHoAdfIC5jF/z6qtazA+
 LT/qBUZCJ3pdFcUDN5KMz1zbNYufEQTSUOCDkG1Ex3aWHMp2YFol7vaExW5i/I7MeIoaSBbZGWZ
 HCPZyh4s8atlPrK3aU3ramm1yistEvMxMdoBVk1jaxoHo/Fh2YwmWx45QHzFMUsNIjlGfe22AeW
 /q48gSPCRvEEXRZx+Znj5AlKZtCP29yT0LY8qjudJgMVDej2JQtSFyW450Gh6pNX3+GWsZdQYuQ
 3tgnbRCbk2zRQYiHDTzFWtDa9m1xj2ZoXPtKG5xa0BTZ6Vjj7HLJtqMiMjLV8N8zMAhPlYwDycQ
 MSBODGJyqoSgl/1CkaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
devres action with devm_of_reserved_mem_device_init(), which handles the
cleanup automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 25f8ca0d6d94..7c6acc6d7e88 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
 	.read = hdmirx_readl,
 };
 
-static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
-{
-	of_reserved_mem_device_release(dev);
-}
-
 static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 {
 	struct device *dev = hdmirx_dev->dev;
@@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (!device_property_read_bool(dev, "hpd-is-active-low"))
 		hdmirx_dev->hpd_trigger_level_high = true;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       devm_hdmirx_of_reserved_mem_device_release,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	return 0;
 }
-- 
2.53.0


