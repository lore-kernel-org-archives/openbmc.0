Return-Path: <openbmc+bounces-2202-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F98C43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 23:37:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtkR71WZnz3bt2;
	Mon, 06 Jul 2026 09:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783280450;
	cv=none; b=asAZxlEsOFkljJ8NSTDxeLRshG7SgIr9w2ORFJZsMPdiw1nUW2MOHZ06DsQR8LnI5ypczmkboBlmsDVarlQXKybAAhSs4QEwUVRoGtVStj7gPClUTDMUMMUrBXsM2csamkShPPHPsjtUarQyg9aahLWDkb7YDgJnMWFTkopcVlayWdGFkz812B+jX+67OjyIuDEqmjyJl+c3pLedhlEZHRw5b2/KHQLZ+EgiKWnNyU3xSVTi80FwKFOmtlv/sTxPA5i1Gm9cU8QKVyMbFyJ1O+4roRA2Hj3kHcULqgWjeyFSk5/5A7vVHi28pkBxOLQugXrJfx30g64MDshPJTXTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783280450; c=relaxed/relaxed;
	bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7dK8LvZQj805koPD4dz/W+4M54XHB1WBA3kZiDNoGK9WYXCkLjIfMpWGlRZXEsR5kNIgOLNg+hbfrREZBLphozqnH9eVBR8deRf424nYOA3Kt9P6+Xc9pS5Ga/wbah7SvqM1KFYGlmo0MtHqbxeBfT+jlpSHKBtYiuBA1Xv4UKWJd8GZaIIA65O81bYyool+o/QVdXRSg2u+WaLuFph8AG6ypnnIwa0Opn5qgpKJcyLUc8/nnXM9RTQUMovHac+pm18kCtVWeMeV6GKF/zKvZPlSI4t0GdWmsVMcz7FqIE8aMGeq4FvC5R7pXzAFuYvizjoMQBSCeigU7LG4wyAcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lc/WGFTE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIucv+xL; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lc/WGFTE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIucv+xL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtdBn15ldz2ygl
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 05:40:48 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hiq1R2273691
	for <openbmc@lists.ozlabs.org>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso3250196a12.0
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=AIucv+xLUQhEsADc0rVsHFl2Adsxwq1j3/LTmRC209BxH9sRzMWd0Nc0gHpaH6mMNj
         URkVavNT4vARWI/PrG/BauYNXo3qBZnYSCoO8g6B9ptvk9b1sSf2lRJQm2wjxh+WFszp
         aCC7E2eAb5xorvATod1BD65pYkRb6hJux/qT3lhzx9l1ueGbuiqCHDHnc7GmTXeX6+7g
         Whvex6qbSMRYjw0kLjFLZ/eWotBF4GDZjU6bahfnI+J8YFM/zLAqTcelnj1QF/fzwsng
         huSeCs3LA68wwHoR4deLS96WyB7dpHMSXeLR6dHoRkgeMhVlIzrdVOHamPSjmRKSGKj1
         wQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=jTw01/gSYt5tLcnRKr5dyXu4O7LMZAdDjImIrE0XIkLE7f569h7YTbCWaYop/maT7i
         G9q2taQkIvSMXXQFEK631RN9spP4JAdwkERI/KRHPVHJHd+c6RqZEpZn+C5bhVMQCku1
         JMU7Fa/zBtnuktw4jcJmHF/WArIfYmH3G8BOxJPke2deXHm7tU7eXvTX+ywJCz0Jfs5z
         2GJsri2WclTlYN2ZKMB85NPtGxf3MxGSXPgGyh1VWcggRXun41z08X3acHFxa0obnPyy
         JjbKsrLIHk9ddRmvr3rv9f1yDMc2bybxjEVuS83NeTjTVWAfKVL14bBApNQAt0eeKjnF
         I/kw==
X-Forwarded-Encrypted: i=1; AHgh+RoqBD6Oh6s5u0tuyLZHvhjvg72H9dKIax8kQ/snkGlBfYWvGxvXElznBH6YsaOdT0PJc1jHmH7S@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+t1w2UtLZRfdRb+rF2FfoHWlLKBce6qqbI7L2Qva+6RZGwia9
	GLXVY0Z3ZeAN+Q+M3aLM9Cmd5jr/AfU7kwuGXB6I7UTxpLHp2rhKfvm6BHyxgC6HgctEytGvogS
	TxmlTe7dngNF6YGktrqCQpBcUFdQrOfRbBi48Qqbm4Cw0wqRciLeCe+Or8HSgEg==
X-Gm-Gg: AfdE7ckA7P+zL2VOVjUeoLsgqmGVWeDGEO/PLdtekXvEerkdXGf0hERIrjEzfuGvs3d
	4Pbj199PNLo7kc+jsUN8c19gYyWeEu9pF2oxCy5TSUkGEsxgs5mEO49otfpU58EnjtTv0/LOaws
	eqHu9CIuzJMapo1GATAn3hgyT6oMxdlvsQtzfERvHV5UTEngGscbswvKJBbXZMRfvyDuRJXD8U4
	DZDuxfA49BCijigOMTtZxX3ElCv0Un/QOm1ud842F/rNaqy+Y+r4XnJPQhJWqA2Y9BBoc6Rb6gw
	5p9KRzy24mlXzpjMmOJ42i3jIMBdjXNdjjxNaI/DvbZ2Lxjnrs3vNnomSUAQ/Wph8o8RW2XNnuH
	E6ckSodKp2yf0wiarFnVGa6zMRwB/oZuN0xh7Hw==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049933637.60.1783280445926;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
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
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxlRfPy7fT2T/
 JGrfQTCz8tVhsdTermznJ93nEOB+m/K2HIlkWQ28+avKwE74ZVNooiK0Q6PjH+KJ+XzKbS97wcL
 IPJ3JAkam9LM3zEKndx+/+VIWvR/FIc=
X-Proofpoint-ORIG-GUID: 6A5g7R3f1-tGo5CA7EkZ2fJzlhwl0DJF
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab33e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXyrmg6AkPrH6p
 Ui2yr9kja6nv7GR26WDqCju5otMJh7NLJYumhsUc7zJdSQ45lqfmhV0NU4huGdhBC1wBcey6NwT
 AcaTNjfFW4tF8nrt4smjxmOw63xeCRDakDn/ZEO05TwRBlw8Zpbns82+MBIWU6/oRUjt+Q/pmTW
 1xPXlW+qtj//7y9OqPiiyKXLLAwOUfvelhpIuaQdobDyv9i/WrJZThpslyF8bKBIVMT+pvDOhPo
 8AblhtJ0Skj3aE/MEOeT/Fo3LF818rX5a/6FGABpmiJs58UdsJ6NUbh8E5yO+9jol7b7iHxBrcJ
 qLx/g05oD5Txvoke1IRcVyKdD755Wbo1puK5TvAnAqNYJ+iac67ZlwMpUPXWudGC+Bt0WZxcny1
 iYMCkupL5HXPeNhbssEd02TRPsahU1TemwOEOLseDu+UUEpUiNDob8i1ZJARMs0iWa4+VN+2DEI
 3SNfgjtgDwS//FJ4R7w==
X-Proofpoint-GUID: 6A5g7R3f1-tGo5CA7EkZ2fJzlhwl0DJF
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
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


