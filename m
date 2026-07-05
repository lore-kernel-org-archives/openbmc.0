Return-Path: <openbmc+bounces-2201-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE1C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 23:37:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtkQz6yNZz3bqD;
	Mon, 06 Jul 2026 09:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783280456;
	cv=none; b=U86Oi3pSFdGnXOOj0LC8dSxtXPkNU4rheHvBJH5rJfHwG9sjqc+upFr49y+J2DWwQVQtQ33vkIIaWccThI9aT4nLlBHpvZBHVszFEa3KQgIQxCyOvAbEkRVCtNLHTOSQtLscaDE9zIdxC5TW8435OdXlnQdmsuctTJXhRrn78+VrCgZnhbGfFEPy5uy8/mzteIDBocyg+3Ldz6s6n3nY5dzqHOzeE9n0IsJgZvCFZ5ORk3dTt41Czxq9RmhwDmVDJmNsa1u8VLbRpmNE7m1qBpFbI27WB+LIadkb/yKqi+55haycK3cPhAV7uyjYOLVsE84+gQtUpAKH7x8sIlOrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783280456; c=relaxed/relaxed;
	bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEmcPJe8UVDcaai0BG/FufCBVIOyQr7mtSrNMJ2cqiTqRAEL+EJfVPfOKZL+QQ63uEMWTRLqh4AkGhv71R+BS8E2SKUHW8XOeY5ikQWeLpXMw+rUoWIltaTeELbzv+SBucUzLjvImNZ8a7ZIDiLF/KaQLWNPWFKmI3XIIZz3jDCUC5POjC1l7gwoUYKKJZweMWW73Tq1LjIEIfZrYWKyV6oknRV1487E9oHr+qUjRzNe0GYE76c0rcFn+tak3sWdXxidoW/vhutgNcNcOh5FRVX4BK69NVDZpoxTE9DX+21F+eYp7OI9zkQtaQMD/iGe1+RmsGQssbPgI/VWafDmZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtgGyEI1; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJrjYBG9; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtgGyEI1;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJrjYBG9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtdBv51gKz2yf5
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 05:40:55 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiV0p2273382
	for <openbmc@lists.ozlabs.org>; Sun, 5 Jul 2026 19:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hN6fEXJ0a4t
	H3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=; b=FtgGyEI14vKK9OqT430xUfOmGLF
	J5bdRwGnYlPPVp42isHulDlrVXRumzlXOnWaKAvEqFlOMf4WK0t/UVb0tPS4H/wS
	PtxzMba7S17DNMo9ExtOcv+rJsW93dNgj/CIpMpvyCzFyneGj05+u1GK8iECoqyK
	WM1mPqrqXajrrVrH8/J9pdvK2VoDaXNIt2t74egeo5x9BAqNhYqqiB5QdwrFv+QG
	jv/TZ5nh6enGJUvvqqxYx00YdVL+37mb/7PnZAc+8iS+maLp8PJIHST5NiO92D5M
	ugD1/b8iFPnLJM/Dv5JgaqSUO0Jj7Rg0n1nlkl2C0BeSOL69BMELnoL/dgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 19:40:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so3489407a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280452; x=1783885252; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=ZJrjYBG9YSUTtG4KJ3Eij59kTqyM01kkR8kQk0erLCloD5h6FkOYakxNMsOyf2eftg
         JsNtsXtc2pM4Xd2sYntXRwSHg7wQ2HvHR5rLdkNnGkKvroOzZYEeGgI8ooBlQCMTtc1e
         1wFXdYylGg/QqTWTjqkNg5T/J2O+eNO67ey2ruLOSXdcWH5ReYSseMuak98AbtgrrDFh
         oDrPDaUzqUrTrpY9mKMaYpLW22KpvCOMQ1IW8pfeW2PStnCdjzW6a7HzioA9SOT8tKE/
         FYG4H/k5Jd+OEIuxqXaAQ/xjLL6EIIEB0Q/0D91lOQcciGchWnIaQaf3CC+LyB0BBUuH
         3zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280452; x=1783885252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hN6fEXJ0a4tH3MRwTjmjwBZxQ0G8Nv14FZEH67BaPoE=;
        b=ImrBMmjeGzA0mOHcGcYjFYWuPXovAUOofWUcFEWEJURhOvJDvJ9e3Yyqngy/1NY5j5
         k9QTtiTNBNhppPKQbwmGNdL9iDT8f2/KBre6ukw4tTDjoQCRJ8G9jpQfzVgSOwX4lhgF
         9c+lyv5SWM1KAp5R6S5HCayzss4mX7rvZZBW/yRWGrLvwEpaDVF9XJ8bnEVcXHDva8DG
         KkbdP6tVaKeyXAT+6FL7tabuLPU6BxMQxuvP98Ko4NRsA2kWci4sGvNdpxlmrNR/IrBH
         apha3tbavu4gJOqMhUTxWlr+/qf6tY7axZD10JsXPg4fITtz1rKyAGWnkJH1tcRs8SGa
         i2/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoDs5iuuotkdMEnSJs5xbKWN4RlshW21x88jGsNHT5pXIOVDrlPrxWaVBVVH1/RR8zc3SmCclf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzNb9E8Dp1knlz8/lc0Tvjfu/+GF1nFegse4kbzIT0gUgHoEk+Y
	BkeHXfXI/kh3VECcPNCZV8q27os2I3SzvnaCZRS6eGcb31aRHfJTVydr0J3x9QUiqw5Wv582xXg
	OUzyKm5mcCgvZq/jJJ/pPpT/XIleiO0acnIy+CoxDY7BtC0sxmqwJTXNM7F3O9A==
X-Gm-Gg: AfdE7cnRRz797hkailrvjylKvyXXUFLEGsui0xxFdZcxptcwik8HcefM81mc/D71l9N
	wQWl0I/EGjVKhZxEIMneCXSrEn7Wd6IoxYvvJsjrP89dPX+refY4TrrYI3KD/wF8QLZu0NhAXrE
	/M9tILL/k4J1wdCyKZ5UlXu1GrtST8+Ympkfotf2RnAiIjOVeNg7+/qh6ZEQmH0gHjgJ2s2um1M
	ciTxZ9rZTWYjN8BTQO4T2r4opGU+ZgBE4o8truF4wFSYtwbFYJLhUMDPSRjUaXgTqi8vSw13D0Z
	3y3q4tbHy3hKOvm5X0sACqIsInoqLD3lsSrZzzgHnOhYGtpMrQnuu2i7Y2ERUamjW8TOnAjnqyB
	Ceugtyv6nNYwErmnbpyBxHb/WVdMAr9Id2Jxwvg==
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386824637.37.1783280452362;
        Sun, 05 Jul 2026 12:40:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670a:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c03e4218c2mr7386810637.37.1783280451853;
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:51 -0700 (PDT)
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
Subject: [PATCH 36/42] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:12 +0530
Message-ID: <20260705194019.2565498-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzdPunFe3ZNzW
 VGUk3Phe3PJHdUQYw0NzdDfDX2WAg5ValyTNSj0ys/keTB1Wh1vCWPtiJAPoWz/Q+eaFT+nncqJ
 PJ78AqMnxGYqc0Fbbk4KoKj9BFF3tvY=
X-Proofpoint-ORIG-GUID: KA3edDlMQ3uajAKSgvOCsBryjPOifr_i
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab345 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=16fIdGUa3qEwhQSg-dQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX33+KBRr4oHhC
 xvZDiHZXnXyrBGJf8sXzNUVxwgOhBqtkJI4Zd2eFWBjoUt98g/M+SzNqi0clKSiPmQVZs3DYOqj
 i02kLsSE9gV2ySIiqb6S/E0Smq9wBgi7bpqM3t8ACVSzDP3nvOyCWyvqclcZr79qml6BOlRUO6C
 8MkEUdedDcO072tu6xw7N5b8pOzJ+V6UyIQV+wprV8EjwoOnZolv7DCn1joaTCqlLsBwAgPlThq
 T/JTUekaI3eK99Ai55xz9rmDufZofOZr0QxHvs9KUzsjRvcgMmUxNqnEdPJHswLn+3Vs+hVTL0+
 10cmw0g2NSjKLtja6i1RX7P98kmIaCTDzXwWmCeNdK1wPjlswjxOkTKSTS1Jy5QpIalx6qh3bSq
 8jfzejgphWy1WpWzYCQW8amJPEESdBxmqDaXBUFvPbJcQBFRzCo2P8YZvf1aAbVquxQAqm39MGd
 6BnTYpWTf1S7aUNMfww==
X-Proofpoint-GUID: KA3edDlMQ3uajAKSgvOCsBryjPOifr_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.53.0


