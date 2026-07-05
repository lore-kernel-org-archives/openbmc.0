Return-Path: <openbmc+bounces-2196-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F3C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 23:36:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtkQM1bpfz3brB;
	Mon, 06 Jul 2026 09:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783280487;
	cv=none; b=fsbfsi+uqUxRMwILwL43b5nCGMON4LGNGxMPNrdMNtyKgCxQG0GTf/Zo7miy9ZPnRbhG6sfSs8CxO1iOH4ylV5CJHgtXYgw1Kes2VxUELGTLKktixUwQFphJ1tQBGl6lvoiE3Mx4lY4kde0Ol2eR4M8wGVI9KFSLcD29wbQ9YaTrWuxhFNHk0nR20TAYZ4E1ANlZxOTYXJcNiqcg1n0BtKAzS8M0YJhRqvBybkbENx+Oe4RFTC8T+1dLXG5kD72uHApwTc3T0NQD9f9Vt5dWB12DdBUq/4Y5Iuu91BM0aKCtcn3zGWypZaBE8TNZTvSl8vWdMJj55sKYAYlYx1m6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783280487; c=relaxed/relaxed;
	bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFEW8F3dc+Fl8s14lf+F8TRWB1DrKc8bhzTx20ezMoes2YLK01gItK7Z48Gy1YDJ8RDuebFrE5dUMHhXfAe2gSJxP+mbjptYiS1gt7qIx5e5TRFCoCYVclbWPhUNLTUMb1oJJA+QGDHBmJ4folAvv45LjxBMBzIa52yHSYUG0EYD5okOE8+1ddVWOkRLC2ThoDdBIPPXjB4DYFWVH5qFBowKWX0sGJ35s9QM8UtWmBPPD7akVubQt0kDCNlT/YTnf/LD07EHG4DKOnGEghKhiG4iwYUX8zRD0R26dtACa/lKXEk66R5oNr314lIzkPBAcx239HoFs26Clj6n9ZmDkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLn6zhut; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fDpS3Srb; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLn6zhut;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fDpS3Srb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtdCW1yRPz2yr4
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 05:41:27 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hx78F2162565
	for <openbmc@lists.ozlabs.org>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so1526549a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=fDpS3SrbMv4PBw7portVoyeCch6KGrLT3jH5sd2eYazQUS7jCuOnwIW/deKieU8gmB
         BWhLqQiXxOUeSL0p7UeVuU8okHGGA8ZqWRrt4hM10+idwsUTm8h15Oop83coNF1Ivzm4
         ah/hGRijzA1k6doVCgLvrj4SasC9NS3tkKjMgAlCRtnmslxxHSO92MrEAyIL2JZG3PhK
         DxUyNoYV0T6G+/o1p/vNl7bdh8wjhELuN49BCGnC/kNG0DvUUCdBGUGbw+q1duDTr7gy
         MiPgfSxwLfTb4lVacNPEUIWwTrCcrBunNrbSWpT8zlljgILOwiqy37S2YCQrZWzP5w24
         Bshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=POwfVclh50f59BpQr0DBfCYwvwolo6SVn1b48MdNr5oBCh8Y2h30HA8nsVhb0lnMuZ
         XW7BpCVtXJKJusZmHpIga21I0lC9XvXfqgxBVWqRxNbNsl3U5elO3zYH31Ki/DSxE8g5
         Kvw1XDqw/mtTCw2DX5OaIWTxDoyfaIcqekhE/RlzXUf7wP7V3nLUV6sll42nnlsTiF/8
         4YS+gNkBnQL2rtCKDT+dkziWIQ8Mmb8P6v57hrhuwZwsXupz0DsHX22vb4c1wC2aJK7z
         ZpU2IHqRLEjZBIVr5LINv6ceSwVV1Xn9XPvtirij8Vj0/YbPASioADBVX/UM8STovEBP
         XK8g==
X-Forwarded-Encrypted: i=1; AHgh+Rpqvd8ELm2XdwFEZj1P2vWrMsSh+ZEyZ6aFJcgTuJ9Y8CkgHHVkO6GJlThuY73IDFQIKM6NGoYI@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQ8URZVnZ9dVE0Og9oms9b6xP4+oFNEycZHCOu2T1TY5I57ypc
	jTwZ5WqAVnbEYupsBnP46tsHG/MeQlp+fKRvEAupVXQ0An3yXkUazZnhqDY0wc/cfgQGkFCiHHT
	wfHcTas+lV5Uq90Ti5mErUCZLYtOv7cxk+KwPiACEzkSSTNNfULvnXpGi4RL6vA==
X-Gm-Gg: AfdE7cmcX6Xkpc6u5r+4i065OGDriV8kcSXSeWqIpKsOTf4RcxLVcmFT5rGrKRNil89
	SCZrH1Y/dgiLm/l6qGePf26KGtkA3wEtBkIhWNyicUP7zD97UE/lD3Jxf5gwDKL8EDFUGaogowC
	qGS/bZW27AjhebFNnkgp79k5tD+r7D0uEP/nydixIAAR9GD3PqglesAiClSlMPGkQEtjRb+T7ae
	/YhKOTup3XdKCYe5L5ql3s7Og/U8M659mNGus1ZXRNTj+2yaSbt8coPtz81K0DVx9tEA4jrE+Pj
	US6uBA5boL+MR15GPLlRqSE+Rc/9bJunTKnol+3cEYCnsOwzBORRSoJLDUUMFAD4Fc9seFezAWj
	UeXWl3jC5p0wE+u2zT9UvwkwbaKJqBPIipAX0Yg==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745238637.15.1783280484469;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX6yU/+ravdxsd
 wpB39k+fB4sz2Z7l4GXEIm3aLbZ91G7MXMt2zZUBG21MHWereld9AOmIODWlHTWIeI0aeN3DRej
 WaZWN9gtEonbvDgZQ+AyYB+IiYgeEIM=
X-Proofpoint-ORIG-GUID: Pa9C01tWuTSWp2npXutSplcaZyrAbpM_
X-Proofpoint-GUID: Pa9C01tWuTSWp2npXutSplcaZyrAbpM_
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9GutMAdUQti5
 n1ChncXRS0U6s4o5ByfQpPBOfM2VqW51aEs1pVC0j1YtslIFRdk+EZ3IBFXEiQln0G6cXFRpoo5
 fOgZrgwljzuNmjhnxjYUMahWz72MCu5bGacwkn5fs9J61JmQTygztbrCbPOpYPFwFicOzCR5oFZ
 Uvn/YV2aByjB2Sz7+C63Eb5Un/vTFKj4EqIjes80GAWdfmftppHUd8/IiEeYf0hwHuXeog9jICP
 br3f603khpfSrkgcyJw2gF2y8MdMynw3jwd5rX8IADmUKodxAkjGpvbDKcHoskgSvnHJlJjzQcd
 YRIbXLB4Oq/6B+W8tY7BSeoRyItazVMGB+e2oLaqrp8J1X6y3xil1A8oaFqlJdJdOMjkaCfc4X0
 7L4OxcKVusacXuTZOnOn4eye9Tzm6kO3MOpvnt0krwLsTjGEq23LpmklXVahqh/PFCoNUTSUlH7
 T3w+IYUY9Oh5TjeXlyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0


