Return-Path: <openbmc+bounces-2523-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C825C624D6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:29:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb0pG6MZtz2yqx;
	Thu, 03 Sep 2026 10:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788379709;
	cv=none; b=oJ6VYhdrvL8y/DISdPHUPSEefeScN2tDwYL4DLDa1FYxFK/p94Sjr3VRcqHiSnwWtCHaFMUnQsNUrKTuSsdbwCVAsjmVOldLZTEPzTLN0HMRYwex6xveI3r/2ySblNNnOHE9OiNuj1cvY3iA46P3Zv7UluURl//Be+1qR1RIrOePbmzPb0U+nxnu8Ei0JcnhnH2gns3yC/NfBJ03ILixe7ZTujt4u+tk6Z/PsmDtktjKsy1lLa1BvlV6sz7o22QYrcMTPsxSCtyqifiK7x+qP5iaN5scKCIU6o+qByf7dBEtpfI+xOo/Hh6bnBHG1V4j1IHzTB9Uj10UsdvD2QoJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788379709; c=relaxed/relaxed;
	bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXDr5RIepXzFeN7BJVchUSJamLTubsRgc4XfaMCNHpXwk5Y5P8z5IS9+G30zjOQSI9uzXzyqzWQSJ6wewClpKFboOVnfSl6NAlGi0Jb8hiLo7Q1a9BY4Dxd5wYKHQxbxtPj8xy+KjCvOz9ZUBbQxeeCUqaNQVdWYtY2lOHCl5GYAoNtPpUpGQtllK3R+q7FD6PNisT0pE2aF41aCLkqbNnZovD83Ax1ID+wFPGeD3fkXhD0uJfw+h9lIPVkx5Lw+gyUiJYQqC5AxgwNP1VthJd+w0/XqP8fATFU+Oojq84vdWvMo4E/wqF55tuUO2J744L46tXhoLYh2TxOv8mhyow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oz/tv1sR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTQLtUh8; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oz/tv1sR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTQLtUh8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZv1S2MlQz2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 06:08:28 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqtOL2209575
	for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2026 20:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a6ghP9glQZI
	jLasHwBOsrO1uiVG300zETw/KSJymUtA=; b=oz/tv1sRl/3WsGWjrvJ22sIWBYb
	EK44Eaj/gx7eSgTeGrFcBt5xotgqCYwj204u2D0Ndd3sEk1CT566XOJaRzl5VqpC
	EbEiiC/Sm70Il6ZcpQ1Ov/NdzUMXu1/Qh5WISHG1p9iAn+cPO5nWSkGhU+MTBev2
	tRFRmXaaICjuberKDCp9omSoB4vhP9evTmwK66S0w45DyWz7Iw8r8xrQISBK1dmi
	fkEIEA2g/dFwWupDcNawXcQpj0E0Wo9XOuag+STbTcUpHqLyXrUTMbOIJszCF5rK
	DtB+rd2+Is6sHEHgkmy94RiOKEOgofNKpIiX38htK6gO7L7l+GjQ7AdMY9A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s3np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:08:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2076954a91.3
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379705; x=1788984505; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=GTQLtUh8pXeLm242m5CgroRgT3J6fcr0nOHuidCcf02taojqR0Yndb1ZyvpG7Klvvp
         AlizSj693tADNTkg82RnSE/lmnxrxfT84SbDCINPS+7REsfP6fmClWpF8A9vPMmlmQ8m
         KVpHB9Zp2vtNcWLqORm5EI3y3KS9M4AmcPle85X+MXbHYiVk2TGH2SdpsPzNEC71YOfH
         ytgC0n6nEm5at3xZmXtoiEQ5u7FjZ0a9li0FwXxrfaNwqUmSiAnlnDGgNc03rJz2OeBK
         D13JDQVX0zWTQbLooc1Nk0neCKc8RCtkKgvT9a1dKoiZD7AK9Qafk5D8QFsfRUlwaeAP
         FCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379705; x=1788984505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6ghP9glQZIjLasHwBOsrO1uiVG300zETw/KSJymUtA=;
        b=Awvp33qbDvK8PTnD53xa6nB1Z4WIyVRlr1CJ7rD48lzqiv9Yydh/PdFD7O11X1VCoN
         ON0/nnHR6B1eX9073x+qrESdiSRQWHUeut/myVGGtIWW6YW5tYwy7dI+nP09Z27akrAW
         JhYfflzD0Qpm4A2fP3fi2ju1SVmx1eb92/l7I+wlIlzysDL7es0TKAZL1AjBwVpaGNwF
         BXoZndut/h8nwZVmye09+WTyMAiU/0C3Ttyo+9t/PjUE2D/oeMImicNFIN8QMIb81qr2
         xYyklG2xPJCq8/DgfO/2gEm/UjLGSjHYeCs1s3Lkeq5pPefxuU23WPBWNu2Mp2rfUlnD
         L++A==
X-Forwarded-Encrypted: i=1; AKwUvByrR8jEGyKbtxIf3mibts1EqF4csjs+lohINJksTripIQbMgWB33SLpf9F4ndohDRATGnVjTkrt@lists.ozlabs.org
X-Gm-Message-State: AFuF++mCa8prP/3XaNg0onQTfjKrRrodOLXla3GyM3ROSN4N8pMXYYKA
	bwmUZZcPR6D+1Ou+DQWJogzliNfWOgqgR0YzQCck0ay9dgcmq6ibhCj2sC8pICXxwER/GjMPM1E
	z+6QE4O2tP3kF0LhGM4pdU+AUA9gZgGP23tODZ/DBe3YOQZ4cRxjb5qLPRftCYw==
X-Gm-Gg: AYBFou1RziqjZoNuWqUB6nNBXVw+VfD/ywtWMFHXvq1EhSoRVKKfPMy4GtPC+6BOLZi
	WBa2RX8qrRWlNoHh3lszImzVDif1n6HdItlQyQzNFZNe3ExP7uR0SVh0xxWU5mjr5X41TIst2Dj
	5MmWD9V0mdpEa4CSJoaUJDhP3iDnRYYRolYPmcoFbKjwYy5EW8louP4WpQ7mkIGXvUkh6WZpVnR
	X0MwHmNGlq/QmT3oUgUgBqpkkOChE54yIVeaHpSy8N8s5cBc4STNWx2dN+ZybuZrVuaz/2kwoPm
	JhjN/yCJx+J7Fv3Py00zu3i9U42GoGcj61dF3Wh9oNLZJLlOvLlbXjcYyux4lo8GQsa7ACWJumd
	5oR2EXGXRvoNbguVTOBdckD6uYWs=
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293364a91.7.1788379704630;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39aedf7733emr11293267a91.7.1788379704103;
        Wed, 02 Sep 2026 13:08:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:23 -0700 (PDT)
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
Subject: [PATCH v2 6/6] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:03 +0530
Message-ID: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988239 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mTAD4mZO0xO8FHYJIeoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: F9oadjNECBk1hao5EfEVD5kTgW5B6L2P
X-Proofpoint-ORIG-GUID: F9oadjNECBk1hao5EfEVD5kTgW5B6L2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8IRJsilX2XiB
 TdsV1VYkLJTRLeJJQOvnAabkWZJXnSoSejml0IiJXiHwb7zIVWMPtB/76DmSsbfGuDOLPRrVBHj
 9T/KE5mW3+pBh/ABof6Sgc8CbmdOySUgu9uI4WA7z+3FijMzltudt5uYPD3TvIVbzphijKNGTBl
 l5OLrApEBV5g8azlZun9TRNrb+Uf8aEw6nOmQ1rSXnlPgWeaRJDskeuk0tye5ii5tAU1YZz6Xi4
 CvGnsm+uDltY8sMfVubDKWdg9Rr8yp1Pkc+RGV/Fpef9Us7B6vVmnl9bS+eex1gLiDmmnLigIfc
 4iFSP8CB9Hs7zIW5qt9udcAqgFgXrAkhfNaUcJ54Gmpk8NtbbMtH3lJya6bk35TPoBF1rNyMcZq
 SPryS5qfqwKlZZ/flEcWr+3Fd5fbzPoqruHunkQhSY4zjommeQfCQ9aCrAEooemx3FdJnfD95dy
 58WfWwvAAnk0IKs5XFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX+nwNwVG8yca4
 9mcQTXqgfnZBcIJHZrv5yOk/ShpAF8LmcjwB5DPq5ADWNiX2Iznsb4oHRnr7XBxL7sb9+Iwp/Bj
 Venx446K7YglBefyDhc/RwHCvGTNyFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..4a15f45ad077 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -277,7 +277,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	if (ret) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
-		goto err_mem;
+		return ret;
 	}
 
 	dev->ahb_clk = devm_clk_get(dev->dev, "ahb");
@@ -340,9 +340,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	pm_runtime_disable(dev->dev);
 err_sram:
 	sunxi_sram_release(dev->dev);
-err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +350,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.55.0


