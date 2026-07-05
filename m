Return-Path: <openbmc+bounces-2204-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D8EC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 23:38:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtkRK68G5z3btj;
	Mon, 06 Jul 2026 09:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783280440;
	cv=none; b=Qrzzhupn+ux9Exn59kllWgOkeeLb8IV5Shro1pf5A1JeXvv5NWJcJDv7xI85lXpXgkpud0/xKxbbCV5eJ6ommquJCUI0uO0Yd/571W1mbOExR40ibfG63+93zrlyxM3C+mX+Q3pkGpT1M0ahoiObT0wvA0DZgtp67dTqE04sYQuaXY3ZIS/AHMrDw0QOGFtxooj64wWpptWlAF1rsKLNHqB7QDRchz/tJcn/qk+Us4ue3d6R5F22pgSJJKR8+oPcdua4sTxoq0kzEhH1kxtHTZJoLh0XD4b1QnBG5UAgCFusYTjceHyBXas+TKiPTFP9au4Y6t13AYBbuwGu8uLTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783280440; c=relaxed/relaxed;
	bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrHGE3mtLY25b/NvNUMEFAFfR4kGniZM2eCgdMblLOe3P/0oUcel4NH9nYRs5Eolwjgo+5xbdDlsv8+P+eBFn+NjGZrJFc2RUbsq29jO3lX1Npk1Z2Lwd37rJjiznKe2Gm72AJ/nGTK/k5VImJ2pugQdleYa3HWC0ib4UGs71BR6EVs2IBa0CCYQHQ56HkD2/JZiGJQmlbnZu+oSmK0VHxhAS8C9UL9idrybjCKfOTUQtfyh4baEU0911+z3HNfkCbdY3zf0c5JHvsQC0Ft9Gm0iCT8dxaiBA1ci6EVouJtJK6qrkTJSkmBOm1bLjGd55GDv/8HWgna6EIP/eVszMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDqYFdv4; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdlzMJAG; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDqYFdv4;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdlzMJAG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtdBY3Db0z2yVZ
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 05:40:35 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hj8Ub2274089
	for <openbmc@lists.ozlabs.org>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8952346bb9so1794071a12.2
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=IdlzMJAGXfM4TJ9e2APquFKdViAlT9co/vusjPMX43JC5+G77t0ghOHQeM9vQhdqkJ
         2BmdFVq8B/43vFm8vOqueBZgLN6PniY4ge05n9Wh1Uay6rbl0JwjnzuEfGZ/lqSzS3/I
         Z/l49CgFT8Z5vh6z6hiG3AmUIXbml06DncvaMydjDLmXchRzBSH8IK32IgXiX4RLAjKA
         AJLBVF283wWe+Oo1irVTHg/g9BSku+poYi8rMSbOfHDoaOqYjYip3ZVYAqra+D77emFF
         diO/AhFphHzTtnYaNsGSBLVxSsXfZfHnfSCHnfvCFuVwgHa67XMOzC4ALYvRu9eXacMh
         kgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=Ow4+k3ZKLPxT1n31kiQKQTTOf1ha3t2m6OaLdiVSbuJMe76dY+qVYX64KqQOUaiA+/
         R9e58HBuQUJxMpNKHNxtW7pp0fRtZ3zouJgWZnvG5NFc2z3m5E2ukeh8SkRCIKkt+F36
         aFWty3VRvYU6pO6wt5CGe4Bfk7kbHcIb5s6fKHYKleuIJVwq9e7Xg4me/LfcYC69W9ky
         b0yUcK+OJ30dBVDVgaEUjnEab9neFo9OSu33ra/vFTt/aAwUoA3Y3CwJKQnj6BuQ7dMr
         +DWwgTISv2cuUCEGpvuvNgSoPDu6I7uvFe9MMjgE3/yV3NCDwKR0C9eS+hXyxKX27jMw
         3h8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrfh6oBbQv4hMDdQKLlT7X5nhyxiyTb7X6sE1RTbE2a7LOw9fU0uTfwHiJR69rVDnpZPwY2MK1k@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3GImNpKxTymEvx8CA9M5AyRfYEhfPlSKp6i68et7aO2m3CVjk
	SNd/7BxR/JwRjDREfpeAbI8n/NYFI0edmOHBVhqIlw6zE0w7EIxdtBeUeUiaj0FexX0dwSf6Nhv
	HjZxCvsdI64m9HnC2VK/KtVLT093gi3eiZkSRROTbieMbCmexS67dVpMoe3ynVw==
X-Gm-Gg: AfdE7cn4R4gDl8VoATH5gpHVBM9NQAqHg/gXGCxi0HClL8htBvk/bU0HtvsKAUUJx7K
	8cY55gacJJFsjimsOxQtapsTgsk/s8uN/0GQZ0EmP/bZhYC6c8ygjkiy4/3lFILO+/VLQTSQTSp
	kdXM+Macb3YEa5sapeIiJLlJED1MpL4FTm3dBDYgLpQ4mZF/BHrLo6Ai571/w6VcDbVEJ0yGAj7
	HopRPlhVJDnZTsCrm9GlKADkNmiF1TuOzO/rYrz5wGkxAyff/qJ/KyagZF4poqjiXTN6YhSROsf
	7d00kz7F73QYQ9jkQfwU1F5WsyMqFOxbScTksOf6+ottMqQcJDMxdp61b0DShFDZGo3emotaj+I
	ftz7lbtpbvaqi+BVZabwKE3vNh69+W65ga6WTCw==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693683637.34.1783280430283;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
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
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX0KihVsrnQZje
 6rbYRe42Dalt8h+oLjcBWzJyJABGX/J1qHiJSeJ4JjHoBDyDFwweZM7ocJmBXd5U32KxneyDQrF
 xBoGGBwqjtREbzSZevZkMEgqi2yBpSQ=
X-Proofpoint-ORIG-GUID: bkp5hhTEUGnBDI05S7oPhlwjM8He4WhH
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX959URg7GdsjR
 ZCvUTD7QqkCGccTZlqZy272bLwM9FG89qNyfb4P4exFDXV9krdlMTVBLjIWYmFdffORmxi/Y+e/
 9N0c13oHlW9i4MHrI1lDP+RnPGQ9+tGX8BJ0wQuBHge3qkJYolUfPT0yoHWveHZiSBH+nmFWlFk
 RyOEsMZwLpvs5/TW/+lc/JheEVOIX097BhBljZc2yINfDNzRfizZSiGElwifBSpolKUTcOzpkNI
 +SF6eGS8l39Wcyc7u2G5vhRw+QXQhqOqbdqz9W6WQLCMYA0tW9hbGaS/cQ7A/7psiJB/LU+A7BA
 miJLGKorfhgDa5wajHJOAt8R918eTlvKMYK4mWEWBg0whuCBtTlk4VSOJ5RYaupiy/NqhPpdvfW
 ZhhZe+f2/r4CU+frGIfA0lHY+SpRcwbhMkGVKoxUxcCOGBD0U90zM85w2TmmzVR1ttzccG3JUUQ
 1IHT4p79hP4RpmT3Uyw==
X-Proofpoint-GUID: bkp5hhTEUGnBDI05S7oPhlwjM8He4WhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0


