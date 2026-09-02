Return-Path: <openbmc+bounces-2525-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7379C61DD6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 00:29:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb0pM4jsVz2yrr;
	Thu, 03 Sep 2026 10:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788379677;
	cv=none; b=efjc1325OlEBnL4SWr7hrgfRBGEAOfqBkmTBE+mVLaaUbkQBUlsHp+FV+fXiu1cgPrP1Lvf9kmWL9dOXOu/dGXvpZE/5sIMbPhmtjiaGumZG60c05s4NsFqJzEfjThkE3ZCUzW90XNqw0X0NN2b6Squ2vgs9laOXA8BnvXy4vgcMY2OhASZmkzAyZEsj8GI2W9GKehKK3tcqYeH5YZwgWIox88OSdhv20ibLjXwC7m2ZMViAAQ+U+jTU4uRwi3Q3lQtkXMYHtfFeTU1QLup/W5fgJv0f+vOJ2JV3cBmL9yaYO26LNGUt4iPWzK2pp9j3ToocC+iX2Me7OlkTRYzktw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788379677; c=relaxed/relaxed;
	bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPHAhohS15Vnnypbzeirgj+2G/jbFs/45aetWyW8I7zXSFjP30f7268hQ4KkgZ0PYKV4fLbNE8JnajkhJNAA95qt+l5y+zwRVBQ/Ut40kxZI2NeqxWtqNhzRdGrKK2BUbbGgvbAF7asqFcGbWOYH/fgtb3i2AJH/Ul0ULgvXjIN8hUEKNLwEOKfZOjncSelybsi1AfJi2hIycB4OfhV8t3QaIa2TGldJMt8s/rWsDb279ialLk4ICOIIIi2OQklHX80vGo7j2Uo1wNZjDov754EGaaff8DeHf1YK5sNDCRwC+jEdAiNgp3mDNz/4UNKGYhwPI+ibRnf4Y+S9mfUDGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkLi7WnJ; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UwAu+1GL; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkLi7WnJ;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UwAu+1GL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hZv0r3dsCz2yjp
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 06:07:56 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqrkj1586078
	for <openbmc@lists.ozlabs.org>; Wed, 2 Sep 2026 20:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01vkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so25349785ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=UwAu+1GLosqLuKsBK7x6uX9U6ZaU0DMQOuLK9n8Jm5begq4J1p2xUwLLyaBxOM/M5Z
         7/dvEpENBJq7JSeITkbo0sfSl3Jv3SoL73NBJIkZLR61e0Q/1Le4QB3m2kfR/5YyGOMW
         sbhRFZxsKdSbHeC1f+uFEWg0dbRRubxrwk9IJSl5weWds6rrRTFw6JZa7YdZsIlYVtRj
         UkkDu2NLm4Ud3WeHs76XBV/Kovs8G/A1i7lXQWAmeSkhlWsxmnU0lu37wsWvvTd6Eudx
         pJYRL2sYiH926x6Lto+0EcZF4p9eIn3fOsPzTFleKV8oKsuprswqBnRuN0w6zUN2PDxs
         FjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=QMmkHdtnAU3NZ70nj0E+/JhRq7p4snqVAjgu6yB41zx2ka0z8vrv+7DH/cTfigf73A
         FepZA7aatjKW0QxC/CwA5ypg3FxlmmYYay2PdmYXEPMxQU5iqQPEkZWZyKI477nDMDWH
         GJnNWE4Ru916Ohva2WpTtwWIVx/71i2DvReevhzSJQb0QckTZjOgwe20ouqvOaiqep8i
         +nVJaMwWmnMQmh/Jh7buElF3/g88gmFrdeCU8MD5flFGI3MSPrHlMju532jxRZebu4D4
         iL5BsubnWv+buR4s1HvIE5hwjfohgc+N8qpqIkcrv+CQ/qtI2E5108OhSZZvzK/+7rbB
         sMFw==
X-Forwarded-Encrypted: i=1; AKwUvBzzu49V80f4yUXpI24tVgN2g28RtEHI1KA0ultApP2UeyHfXjlBXyVygN9m56zHj4l3flivrPS3@lists.ozlabs.org
X-Gm-Message-State: AFuF++kRFQO+k8NvOeb1frTMb9yvJqIKcLAogx3UjqCA1iHyABXUI+tO
	VEyqRvNS4nnof+Uppod8/HQljf7IuG3DAwRWWkJ6Z3WHZqmrw25Rp/wrKLKM5eUrJv3bIYyxZfC
	CqCb/sPJXrrMsxaNPfNU8IYfUJKg+saKY1tcGhVPzpa9xNLXU3LD7ZwZ6mSGcMw==
X-Gm-Gg: AYBFou1j+hmDwpdQfPYQzNAEIZGwfubG0EpunIRXqVoJ5lAD5bsGiLz1R7DqdF6+YNQ
	rs+wHPtX7v00DoSlXkLokFxshKh9hzsfMcOra56/A2TvUmV2/NedR7OIi1ufxem6JtpRsW21iHs
	DSnW/dDTOC732IV4NkdZkgwnUTO5vVHywPrKDYJNO0G7xG+2viDGkW8tG9oVpr6fy9W9cpLYwDn
	XBX4x52qX5SiRE/VSss4k9Esz48olImEkqX5dfTGjiFzD6OhzXH5QHrrHKVHgwDnBXyiafENbHO
	9t3JOjujccQY71ZkuHLX6rZ7o64bLVT/C4nLduapQLfQgy8TgJ1WhznZtFW+4GQaFMikaiijp14
	7krhqk/Za3h5kOv80Z2a7G5vwd5s=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99505745ad.19.1788379673746;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8AWapTJqJNIpirne1GjeOY4ueE61Ss5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXzqZGn21Jiwbw
 +3QkIt4jfhElXpU7HXX8QSQlbUeVDyAQchg44dbEiHcvO64SkNfGCTD1PSoUS8mlWTVovb4Ejvx
 iqQ1PGs92Y3CtDXP9/cfFCteby1RjTyCH6s1jVYSkAyQZ1dzoyi3wGT51l1CSdkAe7m+pdI9Mq3
 /8CMIkD8RQ040mE4i0Bq++rmmEOkYiozxDloefObYYxLqMqlH4ojP++WtmL2yxA67zU6+QlpON9
 AHRNHihrYq0LxmffGMDeOrGqxhyydGInBLEG8+rQ1IU4q5auJcOW4t1GbFNj9JqYvG0bQ2DMcAO
 dhJlMmtbMybfHuRIBCFzey2pO5Y+y82X+U6mTFVUFI/bkxicmABSqpfbn9vrW0Ta2J9gteXDlg4
 dc2dDhWYxiDpNsbmX4P3Nm9LLesSgFeqgmdHOLmU0w+vVNbV2kzSIEFBEfXe+EIVKg2wV++7YL2
 9jpOovWK4zkaUbVVkEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXwhxCOrKtSn1L
 BIDtlMaKDPWU+OkxDWwQJpAFLPx4JTFhXpJJLexowUuhxNWFdkreAvdCrrZktfAXXZ5Ic/jOa1j
 shuISStvWgwE17LojTe1smyJuHjMC9I=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8AWapTJqJNIpirne1GjeOY4ueE61Ss5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0


