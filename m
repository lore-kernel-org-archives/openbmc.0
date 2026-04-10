Return-Path: <openbmc+bounces-1792-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BDEF45A12
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:25:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsyFB03nfz2ynf;
	Sat, 11 Apr 2026 12:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775826315;
	cv=none; b=E1ePx/8klc1yQ59+3NqbbkEYD2TkJUyN7CfDgXiX3njN0F7IaSXSwo7UlWkwwvwMqYv8ZP7vNxDPSQvS/iFFvUNtdNPPY6Q7PloeUOml6hqKgqr6WYTNcDZav+yAchXaqYpoqU2771QU2LYP99Ud7NmVtyjfUYgvGly7VR4gsCL8XBj0zaFx9in1J2Az+lWSFuD2njDVJj5zQQUN9MlqTvPRF/DOFMJ2YKZhoN+0kzQSAM3Mmij33jtxUjGus0YROWzFkbgzZIMmqVHh0Ir1z0ryGQoSgze3UhJ94HD9GYrT6dBITEz9HGVarARNfh6dMtxhuxM9uAX8cL2bdHAkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775826315; c=relaxed/relaxed;
	bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAX/pkdCSDWNWB0TwQmAZv9EgqDVl5oz9VNe/g/G1uuxLzPRYKPOuWHQ6AeaYkg3EhEtBOLQA6iRMo5remo/GIXylpQWUDOtL/pjLspn48mUyCdZh+ozwnt8bzzF2sqF8n6o0nV5WU+ebE4QQeC3qDeXmkQoiWwHL6IB/6pN1taVG1PFcz+RL6ZGl6WLsWh9LT9F6qucwzgwjZ/zFvQi2grFLiuKD8g49ilrMSuqTZPZE3b+QGcky21bbQP3qt4u3L/aFTS01PDZff5fnjkBDKUitAE9fVctW1yVfMO5OYRXAmzQr91k4coXn093BpWpEel2ErM9eE1GPlkazowyPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZzQizyou; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KY9STO1+; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZzQizyou;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KY9STO1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fscV31DGmz2ySc
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 23:05:15 +1000 (AEST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAhIJi4148720
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=; b=ZzQizyouKxOj7eUR
	TrKLsJVmCHGzlHU+ObSntif3x+mSaifPmnUzHf9gtI5VkJL8Ab1uQRzun8W2uU7o
	CzDEPHLBdxHjqtuCtBSJ1qxhJqPHk5aebf+u2gXh/cVjaGkJaB8rTJEYQ/+sXgcF
	xTdVWMlwJmSSWvm0PaGE2GuBHU2SeYv4QoZs0pZsCcReMGn9P93C/G9xsfBGVt6d
	3vw2PXX6Yss35zeWSSSVP3uJKEq46EDaexAaSnYtBbiUMEu9YssdFcIJRMwxQfXT
	4c1+GbEbBErMt6L1FSE+2vY1Oph8+2AE25sbdw8LhNSe9MVc/00cRZ8JSis3CW9x
	GD/9tw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudghe7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:13 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6850890ec96so1614432eaf.1
        for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826312; x=1776431112; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
        b=KY9STO1+waBxPeHMmEYQVxwWQgH7L+amJgxs9yLl5YNqSDoQ5HStX43wZPozHHeD8G
         gcQoh1qEdXpSIRJy8h66tknRUoly/WffNqPrQWRtOGGjJYBKVNs637DKV83YB5qf8vCX
         o9f6mvaTFoaWsg45lu7/Td4Yv6SkLKeSYYJSRvttWqKc4z7EcTWXLR3SPJH/v+UHia3P
         ZcjJUoo8TnZzFkg6BKHSMwD8homY4NP/zg5yjysZOZUcJkiUo3YR2/bVOF6b62Uol6QB
         22DeWSqi43uccClypwW1sw/3TuHfVBTxf7kVs+pm+aVFW7hayhUoDMPwvj0830iYr2K1
         R8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826312; x=1776431112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ct0X104iLElKowYrfBtaaKUBw6k//aKWwwbkwbYnMlU=;
        b=MSuBQU2TJUGj01GePiXAT+nDldA0yILH3+t/oT0j7iFtrh4i05ZOLu0NtsJmxHWA4m
         qq+wGWgCQAZaoXaNgYSjYczdKfAjt3PkiT6hlo9HN6IX5vTSOezEBYEjNZLG9Ax9zi6U
         PSMQ2XcBanCXO1Zkh4kBpG2nuAtAOkddsPhrSlujORI9ol9sg5OhEVzxpHK8IMSeHJtF
         p/UpTHIb8RTh55a5yYvGORidvQyGaIgLX4D6vHrXT7agrTZZ35+dmokNWpBGLYkd2x1/
         PxUGq9TkDma9QPb+0T6n7fKRB3Fc5duaiUZRN+GwluLpSxCjXY/V9wZAEx5EvkiHMHz0
         n5cw==
X-Forwarded-Encrypted: i=1; AJvYcCU2+5utOcmFRT1Ix06Vv/jh0rUsnKQGyvh+6te61he+7hFTKGNXIf08COYhuCSRPCleBERHvJWL@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1Nb+JeCkZTjjL9l1v097n0qvE4+vSGfVo2zpIfAkiLdEN815r
	S7FH7LBiBDD8Do5sPcT6smsnxvUpNu964UUW+kW5Ak4bx0jpr/U8misjwsIdfB2Gi3pNJ1jtNdr
	N0j8/2XzNOA5GMfGNWG4VjPRyjBXppKzr7NWt9K5p0/THlg99uRrr0BR1sfr0eQ==
X-Gm-Gg: AeBDievjZdwr6UvYf8SVOi2mf45JFVgi4DbF70pPM1rvzTvPuUfSPcFecL2OhVPqNmz
	CVq3DCOmKZqCkuvFaVH7KN7ApdU9v2+Qk+INnIqvWLWCd2aQWtXJxc1hP9VXZtltfeLlE0eEj4t
	0YYxIlAKatBwuDhQEM35jB2UK1epj/fj2r3rAshpI4yp4abhsI5am0mMrDyjAFCVlp8z5M1zlaf
	E347TlA6Eu6CwrAJEXe2ej+/KTYmgUFq7K/3nFMkF13ldIhihLqTw0+VbRKjic9qRZDZY4dM9Z+
	Myyreqm51/rSHoFiRxXw9MHPLuH3OGw3S0n2A86Mi4jnm6OhJKOt8X28ClpWLadiij7mDqEVNha
	fqZ/xPc9yxhFCfqJiz9ML4eHPAICU8ETxxt5IhRBqf2Ss
X-Received: by 2002:a05:6820:f031:b0:687:6b:9bf0 with SMTP id 006d021491bc7-68be596a68fmr1446319eaf.2.1775826312152;
        Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
X-Received: by 2002:a05:6820:f031:b0:687:6b:9bf0 with SMTP id 006d021491bc7-68be596a68fmr1446257eaf.2.1775826311405;
        Fri, 10 Apr 2026 06:05:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:58 +0200
Subject: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2546;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v1WKkbTNzuGJnWXiDHEXgh523eXI61Yj4tEY2tsMGp8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV7euszaR8Gmdeu5++cpU5XJM5Syz0Pg715P
 yY26qxUHTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1ewAKCRDBN2bmhouD
 18LwD/9YC/NRlFpzIIOUW2EStYSQlD9cd/XeuabDzqY1gNQA8T17aTwNbQq0OH14Z1WMLxlw4Yp
 rsp6yQJuF9mktdynv+cNkpC25n89c4j67EtZPKLwaXxrc33sj5xJwvJyFG3WZvat+oBvT0cR8aN
 NAsQuKLXJq0+wwfHSscLf1an7safGGAV2YtpWFrmnQp01MYGhyLPa5xqieGQkl+sRlahFsHclvL
 fuxNm4+goyCx/WHPto5DeRzq0+qOjcnrHwKKlcc2yQm4BDzCBDv5S5IcwtpONq+RayvW6OH/mJ5
 qcKTv6yh2e5+uD4vjJERFPBeTfCb+pPaRvjaUo0LoiC3vhPOru14i4icXJPDkS0NukIQ/nn0UXl
 ljLdinOe92uAj+qPJlSTPJ7Dthgq04026rrtHNc7iOOKSI2UdBPOL9XR1v3F1KYXCe0pjHQQgXt
 BOyuyO27scgSZu0cr4UyIr5nCaBq7uyvbOtsP+n0Jxi/rq8YNL2+ExePu+aGxDPZmL9H73xgG9v
 tt/OnXPOR1KE371DPwvUXZbzlSNG99fkHTPnmtudI7Q0txM1x75FUkEXoPAdpmQZPcPwnBltiAj
 ONnypah+0Xgn8JpjmGCieqbU/2OyfXEDHs3/fEzwqZjpqxa9gh+Voz3oHvMDG0qjWpQD80BV4Nd
 4NWItbY3Vlp8e0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: -DVccLNIdVkFvNAft5kpdykxb6XPHRfe
X-Proofpoint-GUID: -DVccLNIdVkFvNAft5kpdykxb6XPHRfe
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8f589 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2GgY1jd2P1PdBW9LpxUA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX8mbTCTobhVlo
 Xxw9cJgVRslzLtf+God/wj8yqBpexll/GE9L8ec3ZaQVPtQzyHGAhqBLi0WlAfIgASu/SPOJ/0W
 WnFQgbd9ZxBkedpNFu0vqm0+qLjbePlMoiKk6I6bx4SKz7DSWnn+/eEaD+qf8SN5LA6KScFQzwU
 Sm/t9/8damE4zW0yakeqfFz5qgASwHhF0oS0R4NyQV8Je67ksF50Hm3iCyxizN+fl07AvfbzPEI
 7gn3SZ6oItBfoErOm2/5ZHEskp1vL3IEodRZm6s+3aEjSdFdTacftqJOAPEuJA182VlNWPRZOvk
 lVR6CG03y+o1JzPygTXckFTCbvAVR3Va7KxjmIBJlxsV/04YdMH64lsUJXYimQbW1AaF/GrHseu
 EBEhS3D3XjpPhD2o77ZG30ZivNhTwqvD5hGKK95tiCNw6l+1Z2nVK57BNNoP6BUUKu8xio2l6ma
 fj/jQhLO0k1zuK+YePw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122

Enable compile testing for Realtek pin controller drivers for increased
build and static checkers coverage.  PINCTRL_WMT uses
gpiochip_get_data(), thus needs GPIOLIB.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile       |  2 +-
 drivers/pinctrl/vt8500/Kconfig | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 9320ffae5f31..78135ee963db 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -97,4 +97,4 @@ obj-y				+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
-obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
+obj-$(CONFIG_PINCTRL_WMT)	+= vt8500/
diff --git a/drivers/pinctrl/vt8500/Kconfig b/drivers/pinctrl/vt8500/Kconfig
index 2ca00b54b7a8..1a40c153a82a 100644
--- a/drivers/pinctrl/vt8500/Kconfig
+++ b/drivers/pinctrl/vt8500/Kconfig
@@ -3,16 +3,17 @@
 # VIA/Wondermedia PINCTRL drivers
 #
 
-if ARCH_VT8500
+if ARCH_VT8500 || COMPILE_TEST
 
 config PINCTRL_WMT
 	bool
 	select PINMUX
 	select GENERIC_PINCONF
+	select GPIOLIB
 
 config PINCTRL_VT8500
 	bool "VIA VT8500 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -20,7 +21,7 @@ config PINCTRL_VT8500
 
 config PINCTRL_WM8505
 	bool "Wondermedia WM8505 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -28,7 +29,7 @@ config PINCTRL_WM8505
 
 config PINCTRL_WM8650
 	bool "Wondermedia WM8650 pin controller driver"
-	depends on ARCH_WM8505
+	depends on ARCH_WM8505 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -36,7 +37,7 @@ config PINCTRL_WM8650
 
 config PINCTRL_WM8750
 	bool "Wondermedia WM8750 pin controller driver"
-	depends on ARCH_WM8750
+	depends on ARCH_WM8750 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on
@@ -44,7 +45,7 @@ config PINCTRL_WM8750
 
 config PINCTRL_WM8850
 	bool "Wondermedia WM8850 pin controller driver"
-	depends on ARCH_WM8850
+	depends on ARCH_WM8850 || COMPILE_TEST
 	select PINCTRL_WMT
 	help
 	  Say yes here to support the gpio/pin control module on

-- 
2.51.0


