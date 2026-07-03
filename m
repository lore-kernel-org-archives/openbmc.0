Return-Path: <openbmc+bounces-2185-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F76C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:46:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGgq4qcPz2yrC;
	Sun, 05 Jul 2026 15:46:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783107908;
	cv=none; b=Ltp3l3b4p2Hps4yHyUfHtskrXu4Gd97drC3Jj2gWO3VuVVeHxIfj4qEpinP2YdZ2U9wCmv2zz4lvSbTjbzlh2VAnqtcu8NaskatT9ZmNtGOl/w/QEbm97nX7lk7xGS+gUNPPy1ef++k9LHVe4vC1I48uQdgsk3WzlN3oqhz1gBQMOtadH3H9C2jYM3ezWIGEwPQxKBeR9NCE5QLOkDflcY8FRJt09fXfh3or6Y+ugbkIFdzV93iN/N9QKgSSpVIFPqMOAVht1Lf/qNKqbh7qZ6/DMNAHKrNSzAkjj4s3o6bfmK755s/ning2cFdbzsd52FKoI7VVYHb3HwrQmlaCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783107908; c=relaxed/relaxed;
	bh=wV2jvG58Lj5Bs1ZlVjSXOSGXHXpRQv1KBOONp4Qs7fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJN4GRXcpHCLlPZeocUWio7OuEHfiK2ogf+vjHfmFyvN71d/KWyR8fLKZ7eGXb9E0JItvKzZZNstt3rWbaKp/4LVybNGTBx0Wncic+dhuykhtyk6L9B5obVPa+1Nqvn/zAYvFRYgWNQBZOa3V/sEq08q6bulF7L0/hMnsUCzs2moiu14DvQgzVcVQ0AHy3rMiaPpCJxc0d94i+FwPgQv+Y6fVa7q1FU+4q9vVPU4YckvBFov4Gy9sRr5fX7Xs6B3tF5pYRyU/JdUlixqalq/zKBHLTNhjiMTmq59uER7Q8vWJQrys4bxQT5bYSvnhrKGzTHrL3DZH7uiXGRArVPuug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4lGk2E5; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTExg8ux; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I4lGk2E5;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTExg8ux;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsPNg1qTnz2xwM
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 05:45:06 +1000 (AEST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hj9in664140
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 19:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wV2jvG58Lj5
	Bs1ZlVjSXOSGXHXpRQv1KBOONp4Qs7fI=; b=I4lGk2E5mZ7Li8Ro5GPM2C07N9d
	b+pOUkiWJ+kt9dhiSiaU2EHDkbsvQyYnnmoK13NsOVmKzOUfpseFpxEEZMgop1sf
	V4Us6vaVFq4s2wpZA40NshGb0oPMAvVKkWnl+29Iw4tnYF6iVledRkC4P6hYTIWJ
	aIU87KPTR3fAYuK3eRfa+Jysa7aefGL/V7kSoHfrq7ZA5YmkgmN3YgJtDbXU04e5
	XDiArJTWpNNC4h/1ik6zSYXTca60q5JuJiycl0z2+a6YO2+ERe+AcUdLChE29gz3
	UssOdQ8699J8ukEPuMOk83jonBFYC42ozd39SRdIY6OCsowsNfKJ65bCjNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycf9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 19:45:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38112fd8b48so978759a91.2
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 12:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107904; x=1783712704; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV2jvG58Lj5Bs1ZlVjSXOSGXHXpRQv1KBOONp4Qs7fI=;
        b=FTExg8uxHGeXBqcM1oKW0Szrb+zgQ3ZcSrWx2SFElDMoPLA+VlZ/DlCMvPhxD5t/2X
         DuQm14y9zFYaqOz6QtdkhgJjpGfAXV0MPcEk7fbyYNbEY6KE+5bug+vgSqgHvMY/QYL9
         UwESTAj38b2fgNvU76d8blw9sPWswMo3GyCuY5nvjw1iG6jdpQhObFtcM2GRAWuNxVrh
         Q5OtAjUs+oBWqVQ9VfX6d4I7bodUazokmCaGw9L1D8yvbP4jQe2aUIj54hIyAjNKOiE7
         qGhbRhaCY2z2c4txsZazOhsTNVWzfWR4oCrrG6lkopxyLWCH3Fbjg5JnKtvpFKXXzwZk
         3gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107904; x=1783712704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wV2jvG58Lj5Bs1ZlVjSXOSGXHXpRQv1KBOONp4Qs7fI=;
        b=jA8aPAzNQld0pOULzn5K/Z+ga3gqbsgOpGaEVy9anJbiLgoLJW3UHqG9tqFwEnE+qa
         KG2dM+XsDj11UcI4xF0HWO1WV6gfwrDsL3J/d7bPeJRH8LLrVmPTethvw8fSNXMAB5pl
         AmJp+FpPY/l3QnN4ES5PR9bzNuU3+GTWGFamLqLw7nUQnICSe2KsgKtIysWJg23mNHHo
         uzEDn7UbImWYwQqmNueENutrQxUw7OROK/KO+20viWWmD5DMWy55IqY3iWTeTxsY+Fdb
         Tqo6TDkh5lkbIKd6js9S0Ub034Od8M/5c49UVdp1TDbrxtb21vkDPjRekI0NCVpGnAuI
         2ORw==
X-Forwarded-Encrypted: i=1; AHgh+RrwEQ/nLnzZDsdOrkjUqrDiJ5XYaOdxDMfdFtkJTKKMDBf4f09lr7jnoI8klksg1J6NivyyVAu6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCYJqDRuoJ0hD+RtOSpsfCAZ9VKlGcGD6ahf6coh1kvTEadM3Y
	Oq5xiMHVbQTYSJlNyHInRTmXyEzY/dEGwhEOZ+zddtGNNEBMx0ZyDYQtxIBaS6/WHH2OfwwtqPf
	TC5W97V70O/cGBBmSJLvK8V8eQ4Nqwf5mg//gK9U3fktMrw4fK+FJ3ccNHrvfpA==
X-Gm-Gg: AfdE7cn2mZ2i+Evy4vt/I5UCZMgch3odkbBPZlQnk7/FZgpC9y5qtVTEpb7KfwmW3xL
	e68N3t3GvGlCvBdNc48up/BVLNb6/AMukxBxnfRIJFhWhXnm984aBGvs/EvYwsSPyLJSnhrLZ3W
	6djp/jc7LbDmTulDTD2CYlXwPJWAxSf2y380Yz+G2cerawjbeTZyJmi17cRsGqg1Ig1F2Vqf0N+
	IRJNGrYy4DEe6n5EocL0tysKkx2mtL+5QlHDTliUXUWPOtkWuxJuhYZCWLZvDjUmCMhTzK/uRXc
	uSg2jKULmxq8qMROGy6VNOwYFlf6L4qE2H2pz8xH7yWeVDJd6tbcPvd30Karn+JLSo4L3FQppoE
	5f8SEO4xJvlmXAcGXrq30DWIsvBic4wMy3PFeTw==
X-Received: by 2002:a17:90b:1d51:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3835a16be4bmr383615a91.16.1783107903411;
        Fri, 03 Jul 2026 12:45:03 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3835a16be4bmr383511a91.16.1783107902725;
        Fri, 03 Jul 2026 12:45:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:45:02 -0700 (PDT)
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
Subject: [PATCH 14/42] memory: tegra210-emc: Use devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:27 +0530
Message-ID: <20260703193855.110619-15-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX8IDrhR/4dO1o
 rWk812swCUJsqnjnoqZ0qcTqdBDbQaI5KlO1zqbrQZtP5c8BiXpssGtDWIUlz9lPam7D1vyeDGb
 rlH1iPbzsbARCyHt9ReZJkn5jARMghb+/Kf8x4wTr0dR9yF7D3j04v2qaV0IQGcglv+kszGuKTo
 8A9LRpG5Qi1bXiLs04DjpFiNdqokSssNxDM97iELwgt/bIMjxgyg7+MEHrgubfz586MNpLZJxIG
 Gd9c4aFlBU+DTglCr3iE9e7TFQX8CUcDTGb/5Gu/cnwbS1usTOUtShcNA3qH90hdFzvKT1uApx1
 7WK0jufLqjSpux7jj5t8MsvLuX9EIuA4EMuwU/Vak+fAvQajXMvVCBbE33cbRHU3YvAH2JvmidO
 41DQrilarHwSWAgfbBswJ7hvFodci7ZVWe4Z+SiSxvxhEy02lUCUgz7/wBGgSNLSrlWD3elWs87
 Kl2jrk55QuinrwgPmog==
X-Proofpoint-GUID: 4PIBdKPCX3pYfypxLQkr1k5PMRU38qg3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXxkbuhOzpwklI
 N1BRuqIVLlnlwqIgmToIxbcfGHA18oxagMNpsbrtvAMdi3l4EAR32AhlLMAo7f2GdSLh28BmyHg
 zvDxIVP3lxLvq7m1lwSBeAVX98p12Rk=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a481140 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0pCqoRa_c3HA8O-7yLQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 4PIBdKPCX3pYfypxLQkr1k5PMRU38qg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to the new devm_of_reserved_mem_device_init_by_name() for both
the nominal and derated reserved memory regions so they are released
automatically on probe failure or device removal.

All six goto release paths in the probe function precede clock attach
and debugfs initialization, so they become plain return statements.
The release: label and its explicit of_reserved_mem_device_release()
calls in both the probe error path and tegra210_emc_remove() are
removed.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/memory/tegra/tegra210-emc-core.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index e8d4cd8fdec2..07c7654dac63 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1847,16 +1847,16 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 	np = pdev->dev.of_node;
 
 	/* attach to the nominal and (optional) derated tables */
-	err = of_reserved_mem_device_init_by_name(emc->dev, np, "nominal");
+	err = devm_of_reserved_mem_device_init_by_name(emc->dev, np, "nominal");
 	if (err < 0) {
 		dev_err(emc->dev, "failed to get nominal EMC table: %d\n", err);
 		return err;
 	}
 
-	err = of_reserved_mem_device_init_by_name(emc->dev, np, "derated");
+	err = devm_of_reserved_mem_device_init_by_name(emc->dev, np, "derated");
 	if (err < 0 && err != -ENODEV) {
 		dev_err(emc->dev, "failed to get derated EMC table: %d\n", err);
-		goto release;
+		return err;
 	}
 
 	/* validate the tables */
@@ -1864,14 +1864,14 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 		err = tegra210_emc_validate_timings(emc, emc->nominal,
 						    emc->num_timings);
 		if (err < 0)
-			goto release;
+			return err;
 	}
 
 	if (emc->derated) {
 		err = tegra210_emc_validate_timings(emc, emc->derated,
 						    emc->num_timings);
 		if (err < 0)
-			goto release;
+			return err;
 	}
 
 	/* default to the nominal table */
@@ -1891,7 +1891,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 		dev_err(emc->dev, "no EMC table entry found for %lu kHz\n",
 			current_rate);
 		err = -ENOENT;
-		goto release;
+		return err;
 	}
 
 	/* pick a compatible clock change sequence for the EMC table */
@@ -1909,7 +1909,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "sequence %u not supported\n",
 			emc->timings[0].revision);
 		err = -ENOTSUPP;
-		goto release;
+		return err;
 	}
 
 	emc->offsets = &tegra210_emc_table_register_offsets;
@@ -1924,7 +1924,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 					     GFP_KERNEL);
 	if (!emc->provider.configs) {
 		err = -ENOMEM;
-		goto release;
+		return err;
 	}
 
 	emc->provider.num_configs = emc->num_timings;
@@ -1949,7 +1949,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 	err = tegra210_clk_emc_attach(emc->clk, &emc->provider);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to attach to EMC clock: %d\n", err);
-		goto release;
+		return err;
 	}
 
 	emc->clkchange_delay = 100;
@@ -1979,8 +1979,6 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 detach:
 	debugfs_remove_recursive(emc->debugfs.root);
 	tegra210_clk_emc_detach(emc->clk);
-release:
-	of_reserved_mem_device_release(emc->dev);
 
 	return err;
 }
@@ -1991,7 +1989,6 @@ static void tegra210_emc_remove(struct platform_device *pdev)
 
 	debugfs_remove_recursive(emc->debugfs.root);
 	tegra210_clk_emc_detach(emc->clk);
-	of_reserved_mem_device_release(emc->dev);
 }
 
 static int __maybe_unused tegra210_emc_suspend(struct device *dev)
-- 
2.53.0


