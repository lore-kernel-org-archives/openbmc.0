Return-Path: <openbmc+bounces-2520-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9393DC624D4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:20:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb0bS03v2z2ygW;
	Thu, 03 Sep 2026 10:19:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788379688;
	cv=none; b=kIBKxiZhcwbKUwL9Xl5bKbHwJTUOh1NdVT2R9x1P2+z8nkzObvNb0JVLobmhLxrO1/XzNLUyP9YQTwqZGhuD9TBVlujCfS2xvrE17aHsVKsOh0y1WpF6OkF9x4I0O9IBM6e3yMb1R4nKYHgxn6N2QbHhsFADIRHt7/0S8VRYxk/nfIhzmP5bgfFYE0J2YmK7da9SCCDLK9ekA6u0F8xvAWZc0yZrGoBvESKQBr9xbnRFgB9jb8ZNWRsOtJHnEpWm8AAdEZbZS9drWthH7V31H5lCNTPqcosJqb38cEs19YNGm4/yncBle7jt8+u1rxKvRDA7e04p+Fu9wTZOXlJ/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788379688; c=relaxed/relaxed;
	bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWAInx3jilBTsFPolydRCfWZrAWZp50uVmRKTQGOFrol6Q3+LqduVPjf5lUC/tmSUqlQy8hKV7yQ+n39sgsiMp5egRrJZEjEEEB0H7vwXFPVENXNUuOi/RQuwg0t83GnGjAr+PuaIP/hY70wfRlHYvXmBJxS/rE3+GV8OOjx1a3mzer4NROQz4e4qgWjIh6OOwsa81TQy/+jxzuXvWkhEItVcXxqhCDVObGE6w0fguUDDimtNsKL7St6Nj0eC3czfc8ncQttlh1qwnj4GqDmpqeJi9hZdkmM2U3j1j/tK/A99DA2inLVsxpjR7qezvnlibofxZKEMlnLlY2YLQCWRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tz3iT1Z0; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHipRfQZ; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tz3iT1Z0;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHipRfQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZv135ST2z2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 06:08:06 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr38R1586230
	for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2026 20:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V62NrpgUOu9
	gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=; b=Tz3iT1Z08cE3L1Tsg6uwOfDDlUn
	OlK172bribh74PRXIRNSvRLnJcuTmAmGXtzeJq5+oXtGDt24T0SgWNFTKMUvsN2c
	o3xyvGkqECHDErCIEqxM99+VAwarBlIDHogFfV74HBGoCmSh/+CnU44qEFsEgMc0
	LpF2U7coKzkS1YPs0gz7Hbj/JooKnj6bCPL8V1vKhdMaLff6/5fMHjACVdDv2QJu
	tO6X72JpKItRX+1tQrpTgNjGGbGiD905GrptgN/0LH1HTDuNsrLJCjw3enNv9gfP
	TCtWu6AsZWs5xIO4Z0Gu480RmSQw51flp895ecr+MPU1PEDsQtnsH27/A+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01vmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:08:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so25352665ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379684; x=1788984484; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=dHipRfQZdeWPxndHLEnpXsDp8iahRkLRTD2IFRLnxdHptqFGlIsX6HNkZrhPK7BDXt
         j26rIZgnmUNN2ElI/OQ+mPGFNbNIYaH9SbTWr6K8UPNWyMJLLRUEwezrnCXLc9ja+CUs
         MdrZ+40RImhpiX7ug7K9z4G/yCoF8HZQ2TMWtMuv8v41Q+bvDBIpn2twZDZ4y+g4bhz2
         /F8w0u/H9eJxkx+551eTLcnmjrf8vBWr0FgK+cGUsqrQg2PDfGbUQV4ku/3LOoIYEc4t
         p6+5/wy1GSBaSoCJPuZJBXA0/GUxh9bYFnzPEYDbKNr0ErrX7Ne+ZA3BQqUyEYw8GDyY
         RZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379684; x=1788984484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V62NrpgUOu9gE+yVRqH4AGEITpcms2N1p3z2wjAcl1Y=;
        b=QxNLwTJhREF8ZWS047lDCHxz4X1xRl1NGwNopxu0Gg7dPtIcZurYJDENJM2kxhhX89
         EeHbcoB5Og/0iGe1y8Z0XFJngp2VlxWP+VqWo5GoEEOALCo/DmexfxQ6uPLt6myuii1j
         mJ2s61FAeP6z+Ro3YheWENmJcvaomzPRq0kL7UUwt2IG71rERCAv5gYhCqzOG4cha4qB
         /2xXdl+WnLyhCcrJ5uT92DH/wN/96SRW29Oykm/23wrMGuyJheoX8BvybGWmOpZgCdYA
         lUKRDifjglHWLwIsHmwtU779f56E97JwfxiZMvHyBLzSZTGoGmAzFOVhcEViCKwyGms/
         ee3g==
X-Forwarded-Encrypted: i=1; AKwUvBwjvMCMejyuoapFiIgLWeCYwVZ6M2CaPaIgP9R4mq3WuSXB+bnGft78T3s3neNfipbMaLVjdx/J@lists.ozlabs.org
X-Gm-Message-State: AFuF++lDjMY+SmPNtjw5UVsU40JXataaG9XicEt6jsY1nvoDaEZIrHZT
	pw8to8HJWF0pXOSJrPpZg0oObIWM9Eph6DknIhBspLK0pDGsgbxzZxKMkdkmKARVTV2kM9wPmeJ
	FF/eRTPbQj6sfvD3kTFKgA/RQlmgRNelfSvsWqJVC/8Qo1DB8/Wf+xQIlePtOdg==
X-Gm-Gg: AYBFou3/y1pCoe0oYRDsgfCL5DwCX8gqNde/ecJ4toBgBcoRT0IC3JTwnBzyj+vYEKp
	DxqIMK3XyaTU1CuAtGHu1C6ipHk/hlksvXz0lkDI964uiic9gfKuRVbfd7KUainsZpYwD500vK9
	0sJF9lnKMknhmpq0JDNx+9KrO/tIMrQMrns72Y1LD4tCvJV/aJZDObPt6LjgrO37bGpCOLCypBM
	/Dv9CkwE0A7JKRspYIsFr9P28eDtC6Py8UMu/rS9QSDLHBiJs/Vuh9Txzer6lQovS/ErgGe3G9f
	1eL1r86BtTBx61MN9g+u7qSPOJT9YUCi+dDarDQnsvS5sB2cBPpWeFWs3WKi/zVB0cl4nqLk0Xj
	ToE3hasXBl52dQxKETuzbAeQ3GnQ=
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445835ad.4.1788379683910;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2daec5ad515mr80445245ad.4.1788379683366;
        Wed, 02 Sep 2026 13:08:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:08:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:01 +0530
Message-ID: <20260902200703.2016410-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: GQN7kIHmWhTC_DSCATT_5JW3cY9Gafb-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX7XxkB+D1IQyb
 EmfWuXy96IDK1mVHSW7gj8Ob6FvHBqcXDPwR2JX+k49CK3pVV6bWS1o5gqW7rqkwDvAkeWGQ7MW
 O3yZPX98hFytXHxDcp93PjbnAzNoem0nbNezowIMjzzDtaalGtlAo9ixqFMPSVu8qHTR6UzXGdS
 oXScxaVK0iiq7g3Ypp0Yy/8lUiYesC4QDuWFUAWuzEC1jtt0DLDHMZrO5vJzgPUIIyQqpMs88b1
 gF4VGWRmxeJR3TvDes+snxeM6XKb75KUAhcFWjue2P51h3nU17Ir6Iu0BJGDyZObfTYnCwHnFUW
 yZXv/y839+vX4rfLAidTTk2j4eq6LnJNlJUBLfHUcoXCq/z1SX/i2dzeIv4stSKH97ANxeh/9cD
 3sCvWiAgz2y4mByURRFqo46GDmxUn9fWC17ZsPgZHWAlDP5H8A0hoqewZIfaMCkBbAgs0xe3LYz
 nRt8h70WEb77BdsO8OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXyNKHJCbk2QkT
 Yh9PYTd9QSObzv3U/oxJC2WFjLOvFbxHxHQUquHDvL+Q5n4lVmfoua53ere8kVH3ocVcB9FWdpX
 nVbjbsSKgt8GBiJ3dBWKc/ndrWZfEVg=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a988224 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YVK2hjuZJVh9DdmUNrMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GQN7kIHmWhTC_DSCATT_5JW3cY9Gafb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f28e9f4354ac..3d37cd446583 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -803,14 +803,12 @@ static int mali_c55_probe(struct platform_device *pdev)
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
@@ -849,9 +847,6 @@ static int mali_c55_probe(struct platform_device *pdev)
 	kfree(mali_c55->context.registers);
 err_power_off:
 	__mali_c55_power_off(mali_c55);
-err_release_mem:
-	of_reserved_mem_device_release(dev);
-
 	return ret;
 }
 
@@ -866,7 +861,6 @@ static void mali_c55_remove(struct platform_device *pdev)
 	}
 	pm_runtime_disable(&pdev->dev);
 	kfree(mali_c55->context.registers);
-	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id mali_c55_of_match[] = {
-- 
2.55.0


