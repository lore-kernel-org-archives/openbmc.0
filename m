Return-Path: <openbmc+bounces-2529-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A505C624DA
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:39:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb11r4PBCz2yth;
	Thu, 03 Sep 2026 10:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788379667;
	cv=none; b=K+fB8iGdWt0NedPOyZfb6ESWp7T3pU9ZUJEJ+xBGLhUVqHeEEMu7kByK8YaNih+4sOFhMiYbtsQGwRpr4r4LDAkKtwlx4PM478FuCSjG9SbpVRPeXq0v+i4Spyqm5CTPlJhtaNfbBkbyPtaMGRqZ+T6jVHOVpuVq/99bu8+xUINuuL/WtX8K7vdLZ4jz2ZXTP6HArH+7+Cq5XKk8HoaV72u5wokpCsqO9hJ6nFIHUU8DM6pZXG2nzB2xb2YnLQrWEA6E/eUc6d01aSaw4ApPVxKQ4ohP9Ix/pQGnlFOfczWtLvYB+IaVCp7iW/gfNZ6XI4AI6l4wAvan5kxQXsKcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788379667; c=relaxed/relaxed;
	bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNegXo7Xdd9pPLC3coTwEdU3sOTO55Umx4MYRO9eYC1QpMoltcqb323fl2pBBavgyK+RPP8OvCEqqcxqlAZoX/6RJN7ejWkubZMkzAUAak3c4JVfBY2Bd5WF6W5w9Bdoyxzw++6rs9tCSoK9u4VHNKrKb/zPRWtO6Jj1Vm1yrSBYzY/QGpCIZZf85cMrPlArdukOUgRbQTn8lef0gGLczqsK4461d8MTt85pGcRHfcDXkYHIdnV9eVFP2kxpu7m66aOK7Oh9qubXXV13AyBO2tBGBAhbMxcgZRaiQa48qECmVH4Dx9tZbZlPskWQvKWw7WTNoReoDSqsN7O6EHd/Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P64iHGeU; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SkQ7OBvp; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P64iHGeU;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SkQ7OBvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZv0g0bS0z2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 06:07:46 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqwCb2975258
	for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2026 20:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J9W8P08UQPf
	Jw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=P64iHGeU+wqitnO2yOTz85CPPMC
	Nh9EN3gs+0SkmrParjRLd3P0cOTDHlUIuwGLTuKjTJxj2CRNpFTYEG6MPoVkvEoN
	KRHTCcUMHiCjR48T3RBTIkIlHfwEfHUJn8w9LZX6cIPl6V72APy3F7KN8w5EZhOh
	JmIfKfn1M9o8qLLLslSCCHkih+JlFWsLs5eIut+RLMcZtwCohJ/vch0JdGhdKGlx
	05ci71hJL1xR4/y/O1dq2OyMXjVfwO3NqnxZVBv4QnG1GPIFy2RU34XcrhpbqbY2
	dqXpMxp8akRJCDdTl+S71BL///ZwoRsnXT5kuM5vJcaDjuDRWHNG9Ls4ndQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8q0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:07:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc435388657so1075573a12.3
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379664; x=1788984464; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=SkQ7OBvpfrqc7OyHy5AsSkCYDNuvoY0X5RBhzxOLuqDNiafJDlAH3AyWtP1HVSMbvh
         XMYaYfDPba4pyng5bGCKb1tU/KDIq3i5LfHUMNc9MH/xjy/IPE5tlC1QoQwTGWbFd2Tc
         QnzFsedL9PHQ2kxu7qg35Ukf+yKD0rk4JmHLraCHy5JWuXFGDWs/VxniS6imY77e4w/K
         4Z8HaO7s2ux4YbRFzmiPM0J6q9UaC3irq3Z6IMnRkGqw2ZSgGwwt2hFh+2A9KM9v00lQ
         CilIqg0HfBhpKYC6LvF6FQjKx+gVwHeZwROBppD2dAuwCEm3TxJrRTSIUWImG7Cil1WM
         0k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379664; x=1788984464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=s97oX1Tx9UTNq9bMTLJMi8fQjbWea37PDt0RneTQDVyveAk/Nvj+FSlMBHUrkLP6rM
         ow8bmV2XmWk4NikicyhyJyvtID6Di1RsTHmpEIuFinBVqezJB18c4/DNHpurgdTNOQq5
         ETsH7uaKbvJHISjIDdPO5wWbCxn1ias0rMnsc88diuYoIKWzMxjaSCrwBF6B5i7fa/vH
         8/o2NyyEDzFJ6C/5w8bYUJNRD9hRk/hX5fRTTF8KhPjAfoKdVzuyzNVB7oYzP14cFiu3
         mbRFoozyigYQvBCEDNz49bqaVY7O/EXPcOh9tKSxmeTXehFTPJKJp4tAsPilkoha8NgC
         w86A==
X-Forwarded-Encrypted: i=1; AKwUvBxiBdmc1UM0apG8j+Wy7vm+tYfnwyoIYPRi6/btAPSBO/npcArd8MSTZmRIvZR12CpxFhg5LgAx@lists.ozlabs.org
X-Gm-Message-State: AFuF++nucy2FZqCJuRiETFJl9rdzUg6223oIwfkxVo3Yb8QqhTJ3J2Mh
	7EHgfvmpNBjvCqtwU5lkGSKFODO2n9KL6PLDgnML9TDvqAoBw9QuZChDGRjfjNJJvT/FlnbCJZ+
	iHIdpwBhkWw2t8Lvi6KL1YPkna9qU04/bnGYAbQDioVpnqdCE4Ak2pjmyXo7w3Q==
X-Gm-Gg: AYBFou31ZCHqDiYVLlk7msnO50YczkLZ11xl/VM61uiBENqboO+38Cw4DnfSrm1XHrg
	j1/DnOI5sZ8gqvzEH7P1uH2aQ55XZBfWsGaIcsnzUD2GWcPpSrfToa2mmnbCNiF2wDoHGLdD8tz
	cKdiaM3FFnDZ2NQLdtBaNJcyaV4h18v4sFtvsKTDPO1eIZLf+t0VXaus3WCwKHu/rWT0ujf7Yq3
	gJtACMykq1L5BTWTO1u+z43xFaZRRGu61aQjnNr4GXj90kww7F9oXFv2aWVB+5P5yvY5XaIqJ1o
	rRxAbNiHhWA2svQ21S0ewXd3PciD7LttJdvA/MpX4v0ZfGqcLeqMbiw6tFBCUwMq5jD/w6QyNPX
	OsEm6SIYYjHjSyjSiVlG3Y0rw+Kk=
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639279a91.7.1788379663613;
        Wed, 02 Sep 2026 13:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639151a91.7.1788379662903;
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
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
Subject: [PATCH v2 2/6] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:59 +0530
Message-ID: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a988210 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX28IawmYt/ZA9
 zoldoPzxjg1sp0iEUHV2MQ8v6RmySAqNRwBPYG9OmR1w6ShLd59DjajB5GqRG+Ugk+ELQSEi+w+
 a9eyExqLP7sTTMVUR/O6UsPGYYrHZR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8TWNHz7GqLZ1
 /f+Ie6qmEJuC8iprMxnl30YrUYTBejBHiqopuGmrMOF69XzcnsoHQqBIdMYTBQq8Gew5V5mQCtv
 xQWkdxAyfeVHQ4D7rC0f5h5RSTsZg7F4xtWphHO40pXanTWakFIm7PCtqgfsCITmHU2RxoVMGSR
 i7ZFlTtj94zKeveU4kcYmbOO3klSYZ8P5PYA0b30YTO6w5RnaK6rr7vxs+A7TEdVM2IZ3ZUza2s
 L3LUHCI9inMi98HrI+Mi9QP8Z3qVS0I/CRoWU/PPsAp62WQFAdCJ9EjljTiYBwMQxIKTNddhVAi
 C9Z6lHL48rOgAl8x+NCr6RQN5l7CIRawksUNrgGIaABqzu/YO9Yx6qJaFodPcJdJPDcIjA8KFCk
 g3XTmoHhBzvPZ/UTx0Yfa0i13z6o8Hbcmjd0z2+SnCHDwc4uqfoqLyRP2OozGUqdauaJa24g97J
 mwokl2bv1s2USJzSMcg==
X-Proofpoint-GUID: SlK8R00dsyeKnUvN6fjlWfAuUth99R81
X-Proofpoint-ORIG-GUID: SlK8R00dsyeKnUvN6fjlWfAuUth99R81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

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
2.55.0


