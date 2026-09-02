Return-Path: <openbmc+bounces-2521-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3EAC624D4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:20:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb0c61fzZz2yqq;
	Thu, 03 Sep 2026 10:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788379651;
	cv=none; b=PjjjsPllYOHTjXBK5SY3k6tLOatq4l1kvyyezxp8xMnDcxrRAUmlNrTPjhpf1IEbSYDwu2XseUvHNFGeSRM1OCF+COrDvd2B5kxMrU/5Cinsg8bMpI2zr5isVkHQLp/WjEVYiCpndGNBWWrcWrJftyUjm4DM3VuVD0TF07g1YIMZq4COBKL0HU+KFDjTnsafnr9ZVzknj2qzny+smB3i8dut3arF+nqD/Nn8y4xX+fMmJV+x1R2JXLCFnoZMmuoYnCHlLY4FwQF+qjsXi6F4a14QpVXTmuKQMDPg3E46b7Jd7ZjsczIP9N4Id9QYMynQF1LcfV9ohYP4Hn8mpV1MeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788379651; c=relaxed/relaxed;
	bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQvCQP7Je25C6O6LWT7f0e0IRZn4neZRqFelUIvQxdMqjDHqAV1UiRmDb+l7ZYCKJuWOr/jVMVF2C5iMPF1ucxXGoiCZhUkVqkcDdVULyk9+Ybw8OYSLFZnAE2pWk3Up10uWgrdDrjT1XJo2HUpUSnKjfsGJs9oAfrvakCuZyimvezmmEu4SWrFzFhEvUA94ydMICSxx7VSl07hbBROWovhFol5ynPae0992Z9TV1TfBpEhHFs2iqpmeHMnXTlW8NCPyad1uiV4KftJJtCMCCNcqFoxvF315kT9kfV3oT0XeLEzqLFdOQIc0RWe5nE0nk51iWrKjLf5xg/80t+z7PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o8qTZHJ9; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WW2Txcah; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o8qTZHJ9;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WW2Txcah;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZv0K5p1Wz2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 06:07:28 +1000 (AEST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqreW1650582
	for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2026 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sqne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399311947f6so2710109a91.0
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379643; x=1788984443; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=WW2Txcahv7dIBH/zbfN6Z1aTD5tv3+Pdo7hEWDIWgLqoTiHdJC2n38RQBVkuHsVmWo
         0hZLz1tm2+7x8XXXv7wu3DrfdBzCZmYYtfzSYl+iyOMUOuhdp/AdDTMSP27PPYi8JmKb
         VlOY7RJxlS0cuG5ia9ewe38s18kjYsgX4kI8fyROCrN07+XdlMIiuhaQAbv2AzQ+B+MY
         XW5qmOPDVelwSCNSp7sQEdmk5J00pY5jRdILtKI145slPKZoiZ25if7BwmitEBMG0UWQ
         LeOVNf1zJ72jAM9D8amm8a4pnaadBzb21Xt7sm9P9aDgvzbUUW8bEQPme6UTp8TbRrOK
         LIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379643; x=1788984443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=EyAsq/0wcJfKepYZvppJSoX9WrMhV5Zv0+sJvQi9x8tEjdMoLl2N7/OCdwY/Qi1VlL
         BGyvuDY8GW4R0K62NtrV725ou7Hcsof2sPlBcbZI6+eRNWtTt2IHsCOjHJ0KGO3Rj1MM
         cXzA1Axf7egew5WFaelPQ5tq5JgLdgsTtGEytnSMdKKu1/QmzRgmzm+UOq8aoUguXUXC
         iN1WnyYbRcqRIrMGhxciCcSgNvYL0w732WNwHZcTYMT1YCdLPF7qJd6tHqL1M8usmE6q
         Gj52zeAIcbH9VF0GsRPfL4g8HnTwS4M3AnXRb/oXqvGiON6+3rDCAnIuUpfw0Z5I15ll
         8ZQQ==
X-Forwarded-Encrypted: i=1; AKwUvByboIRR+lYH8aapp94rPtxA8aAQ7rgEOKSH+qPrKuIF0LPTQEFkC6eayqwksz1k7kYAqXD+LoUg@lists.ozlabs.org
X-Gm-Message-State: AFuF++ngbeN0a3XtqfJ7U4Y7FzWvlJoSZPJEbYKECaD653djqH65T98J
	eABicOTgkDs3AjOOjETQ4Tdw7UX22cNHc4zXLBb8ZuEUX/Ow2iDX5Y8iuhrwdlnTOmaisqiWVLt
	2s0+0D/FRLzBeRJt2jVFpdVCFyWvNYVPMDsiG/qYnQNcwE2KHfFiEtxYjILzTvg==
X-Gm-Gg: AYBFou1tOdIhUv9FjvRyW9eu/wL++A+nDSBd/XojybEB2nY+yhGehxJZGWH+4+8Bx5r
	0zv4Wxemp0XSlXSCWtboTd6Rqj4fl6Y735iSyGELhE6YOUNVZKL6Nr7MkugPhbDTy0uCFuxVHeH
	rVhs8YaB6cHA9Mi+dBXvAw2OR0DK40ZKtrCEz51UiH45DrhHjBfqMUin0l2J8F4nBIPUDNv+cUn
	BlTVXiEN35F+FKz9HCnAr7xqlRKRHXUvOeeyDjiODGKMAbF3euj5KCSPpAVHFqsfqoRNNcV+z2E
	XVxy/9aN4YQrlKftE8FHEQyIyDkno1xmnXk1LSXGqByqBRKLMK/v8szKjWgMK1QSntbjyyDkRMU
	XNcevHFQMKYU0bV3sV+GKBEAzcrY=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604334a91.4.1788379643378;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX5IQrIGKMMtkW
 b3VojgVVBFUGpYVHDYPpXf/ip/ddru9PNzSWk42RcTVBLdgPTd9RhAHnQmJB+N5RiVNF9Am6yX+
 0Xv9cYou/P9jkiWSO5aeTLC5x/i8U0FHTXNiczV+SgajKSV1xUyDGR75smwUkPlRuamDo9Mvx+7
 wt6OOvSN7tae6MdDP3G9l8pszSv+uBbKDbdYULoC33kpaoSM9726LBpIhDZC6MFPn7YPWXI1kIL
 eXHvh6nZAuS1kfOXUPL6+VN2BHA0A/SV1a/vpx5+4JQReq9nMUXxeMzpLij2UPuKgyo49J752Yb
 SlkuxyPxQPIC99z+h3qNuaqKsiI/R3z3xF/Tx929LgaUC9Lz51rtmRyU9WWfvcJ/8dR+Y0cgBXl
 FQOX/OQabHiP6519beZ2vJ8nmJgkZZ89GB/u5IwBKsUXkhpxH4yGmJUYH29KgNMHnYR8PUQ7Shi
 HS7KCBku8TqcyfkpnjQ==
X-Proofpoint-ORIG-GUID: JLX084E_nKPXmD-4b8Ga3B4cCcMzQfjn
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: JLX084E_nKPXmD-4b8Ga3B4cCcMzQfjn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX24/t+bpr9oS2
 LrLfvWc4yOANHOI2JX53SxUngCFCqQqXONwjr+MKzV+lsPWfsb6FE/AxmT+KZYtWQ5r/NVy8Jxc
 nn/fUQdNCT+fjtlohSNlPB3H8cbwoW0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0


