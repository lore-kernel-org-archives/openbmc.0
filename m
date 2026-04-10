Return-Path: <openbmc+bounces-1795-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEFFF45A18
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:31:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsyMz24qlz2ynn;
	Sat, 11 Apr 2026 12:31:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775826312;
	cv=none; b=iAZ0r/WGyvQ01oOJWMMIH+FmTTdqHcOda23EgPWSNBP9943PUFgQX5w0NYhLRLUyAUpb5CdNA7GHWDc1eR9aDC2bsKkdwggB6XjK9gtVtFGZNNUoPU011ffvS3wU4uCP+NsT+yrOf6wVHM43CBI26wN7pPUHLCqhCnRye3kXGK86P1awEg4cTljkPbitbGGjOoX17otjzO35s7SLLEEjpr75Blll7nPTnVztQs0ncYVWHApMT2BBTSQuaMNYTzgF6GiwYddRuQd3r1Z/QtVxWX7p9bZORHw0iPGnPY1X5pFBoUz23hOHMDDoDIjDgGKTFkwBoNzk1Wq1k8+RG2jaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775826312; c=relaxed/relaxed;
	bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGJLPtQIrVyje2Jt81IW+2gz+BFd9eRpSpBEFBMh72AZYUwg9ZzA/6PeDCqJOM+eWpihqrOyKVpExOhFUg6kLP2GV2gCom4wgfT38m2gk0egZekmW/lhjxgUnYyscr0iN0q0VcEnf6fSQfQrA6ldhJp7mRheCFr8uhkvzn4JMkfklxyFyz1YJT8051sAEDhUExx3HyH38oeRy7BPupT/vBdRZpPkFct0pTGvIMMNpZR0Fqvnt6mxxRvc2n+d6WUd3kkbPVO0iKxI4K0AsHkB+JQpWkhxPDmqpFqM/depp/EbSU58gz0cb+l2BtvK9jkQE4frvOUvaI/7G1F3uVqrUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUFdD9cW; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B84sGCwd; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUFdD9cW;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B84sGCwd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fscTy2sjlz2ySc
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 23:05:09 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB10JX438786
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=; b=AUFdD9cW86OQdh94
	7OBGt4yDg/qFObzLKy+SR5bZL2l2QSLYO7XxeCMZpKcrFaBHIlCxLivn3TvriIw7
	kJwN0dRNbG7n9VuIZ+9dR8VSt3a8uNiTQow2eSDYi0U6yLignMOqz+HQ9lQCwoj4
	ju5yp4P0/i0iEY/2BbUReRiqCwPxAvCY7Fga5+mFbl3Ju8L2uD6bHTxszMfQalUu
	Kv5KvsEooy3iLqkpg5Agi8B4TvFJkS8FfkViMJXSBl2kENsrMrPUsI8NOrmAUCnZ
	Htwb3v+loRoQ8O4yAYJyQ/d0wEddBTBSX8S64sLTLfiWD/H7vyeTF5Gw/kx+iGIX
	ek8yCw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rbs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:08 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68c2c523fbbso901415eaf.2
        for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826307; x=1776431107; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
        b=B84sGCwdPCzHT1JrTXYCdPW2JnSZ35YjtOEwOOpC/nX/kaeB4Hv87gYzvE8lJ9a0nQ
         0HQtP1dC57D6bjkISSeT5CZ11J/9XJOHiGC7ELmXQtAeXcPQjtFUoxMXR5SlaifTgoHF
         QEB1WT0AHqLWKBVDtXGO3wsDUpqolOueikXVS/DrUKt6lV+/xG+Svp3rlUPaCMvwz56g
         Pf84S9z8zIE6pOPMB+HEk6OalLKFi74+gNHEx+PDz91RIhhYWqkPUg6RoPf+LvhN7mvZ
         RlK43+XkgTfikTrqbg8Ie+OdSGa81vsN7DosRB2HcV4JRzBrZnhRFc9IW7aGZteyDYET
         OyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826307; x=1776431107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDz40rQE5b4gW+3Z4EOGQCZwLjZ4K9dUfDwU4afmhqg=;
        b=HJQElqTnLzgy4QUgXSrzyKjVq5ZeHxedpKvhuu4HKIKnLn+GRUfG4ukU9l9uVUYt3F
         P0ZsbH7nMrwwT5KdCHBNP8oQfm1tyzJywL/cMvAelhGLHxmIpy5E41bZUFA4CizNbhhE
         VUGgGczAJdcVeEj5p2z4QlZur7K4PMw7HM/sgyRB1MDI+BVV4Z1KOArc/1SXVbSYgE47
         mtPKt4LO6DNVawBzkzTlBn2K3SFk41S6lgzOMbmN0XEqpVjmLCrVRQ+nUrArjtx9A7Th
         j/8mdQlwQLlS4MarG4qtGgPzMWK95lQjDmYiWi8IpOvnUtyity8BCTikuE9EOxj7Rpv3
         WILg==
X-Forwarded-Encrypted: i=1; AJvYcCU80xh2Nz++ntEUXhGa648B7/WlZkgJwGIm495Fb1q28GGENg9t0edW4ZezbRSlpLZx2Ill4cPo@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9aA4WdVaBW1Dx8IsQLflNezcmIlcN8ZYh9+uXh4rqSZij2r/Q
	rX8PAtbugx5cvvGBCeCy+PislFRLNSPcnj67lLTR5A2ZYZzOVrlsbELSybcgY5nsu+Sns5arBTW
	uZfTuos3QYqtKX6xk6ZFhRpRW2IRPkSx8f/+GD5++KJ252CvU/eH+gJj1kMLXnp+z+Q/S5w==
X-Gm-Gg: AeBDiet6jWvUYq6syPw9oxkBOwQIYP36ZreY+YbTAhToQ7a5Updrbcb9JwjnqVNIRKZ
	IEcCz0Ya1BgEZhR6fiy/h34lZuciJR+hd0gW59HuyXnr5CksC4dwbNwijl7xyLVQxbscEecPjwg
	2d6Wfz3bPewAwhxO96AoZ3o0XLMxdewr8lNpea3OOC1nMRTaMscCa/GonbPb8dMslVWH7LNTL/+
	HQ1B7P/IAO2miRAVwUlIpt3f8FC06GmgXo6ruSy5+4EHDgQOAYDvUggT0uW43WZAYU1hOKl5lTL
	GZmev+A+6HTgvmtXFXp7PKmUwVITsUIpx4ARwwmcnKofypHEnX56/UKDXKoffETIRnbcetV3xli
	FWdTQlDREux5ht9j/+komtOEIAU0GX02NlCgRLkiWZ8+p
X-Received: by 2002:a05:6820:987:b0:685:f11f:edba with SMTP id 006d021491bc7-68be604a40fmr1442392eaf.20.1775826307045;
        Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
X-Received: by 2002:a05:6820:987:b0:685:f11f:edba with SMTP id 006d021491bc7-68be604a40fmr1442333eaf.20.1775826306490;
        Fri, 10 Apr 2026 06:05:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:56 +0200
Subject: [PATCH 1/4] pinctrl: realtek: Enable compile testing
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
Message-Id: <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EvA7w829n8mfXKvoaEE6kQ0QFggTU+hJ+TQqAlBd+d0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV5fURTv69ctIJObouydnGfin2qlcPP7k+Jz
 x4cFHxLp8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1eQAKCRDBN2bmhouD
 1wzwD/99QhlA+5EozhSFiPpos/E8vIiz3LaiJBgNVAsipLyqXnfxXpkr+HGaE85fbl7IbeyQDzC
 9JgbCq4S288BgK5gKMnwxpaMLaPFWZqqoxC7r3CDwyx0QBD18Z7QxzZthXJH7btlnWYMCMiSdNc
 bS4IUmzsU/neeqaMi0pakxgWRf3iN1NRW0JBx74RFxa7w7PvHfwMuei/ENvGgkmfSgtI+2AATZi
 SX2dHL55y1Y1VT9wEJ3CX4os9kBOtHTsdXUOPnY+/FpolynFHMZ1ZJ+YLY/PHDNilVYxtd5t2h3
 1PtVdHHTy/HqetoAsmVH9Pm79ld4RSS1rw349IKF4CjqnLyUnyv+xjItYjW42SBerN93LoOWIRS
 M7nrOHnJgGlIfVkoPxBS7/eGNgls2vDogY6R3pA9yncikato+ONlrkwivCrVhHRGx1EJvbL/nT/
 guxKjxhfsGNjpwgl9bgmzN536jwl5PL4Q0l9XfPVoZq7Owibj3iL1S9b+1lBHTL2B0PwoLc1Jf1
 HgQIlbkFmfboCrOKvXa+oMQGJP1TX4S1dL3pRmeuH9lU4p/vBS6WuXSHEAlolurGqeiCpaVjZyz
 vpmu1Kc59HzyiLLVSSiXD9xfVzbFuJeSR0qKZOkaRd/zTVjrA2H2IKs+NOajRoJB/QOfjXm8oh0
 qHiKBZcbERs5xkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX+c/t7zZQk/XD
 BwNtKeXhQnFQobwguRO8IOg34iLch/0nFA+PXmAq98Ptm+ohNfWnYJ64tY7VczVx0D1fHU9ogh/
 +QfBanBdTH7qOr1TeQRPDr/EBZdr3B2DR8kjMD8//S4NXyFgGKA2kFY6PJaIMZosXsS7novh8F2
 AYdLlNOKkupRY2SCBHX4Rb7uwYALqCpsNoxS0wzrAG0IWIr9EiksdFbSuMPBLiHgfmxJO8YKNet
 OeSgudoZ97ZgAYeB9KkFYsFQcvACWzFE6uygp+aHmXWxhv2EYtMFlwAcRsLdADgGVAenGJWPrEy
 VFB7L/GG4tUXyF+/LKILY+p0S1ivLjvm7nXBw92B7Fh0Yet/p3eKZ4a1N3Q3kMdfIOatkPkux4g
 5/pXncZPjWvLsM9Sd1SMPB/58z0LYnpC+F/eYo0mE5Krhz14tZI73Dov5avwxR0KnzprZY/gAbN
 KJirFABD94LP1ectviA==
X-Proofpoint-GUID: XLRsX8rdZZDKCd8uQA1QcajlwAD20d8A
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d8f584 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JDIqfKjBPsxaAJzGQCsA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: XLRsX8rdZZDKCd8uQA1QcajlwAD20d8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122

Enable compile testing for Realtek pin controller drivers for increased
build and static checkers coverage.  PINCTRL_RTD uses
pinconf_generic_dt_node_to_map(), thus needs OF.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile        |  2 +-
 drivers/pinctrl/realtek/Kconfig | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 9d33fa28a096..b054cfb99348 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -82,7 +82,7 @@ obj-y				+= nuvoton/
 obj-y				+= nxp/
 obj-$(CONFIG_PINCTRL_PXA)	+= pxa/
 obj-y				+= qcom/
-obj-$(CONFIG_ARCH_REALTEK)      += realtek/
+obj-$(CONFIG_PINCTRL_RTD)	+= realtek/
 obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
diff --git a/drivers/pinctrl/realtek/Kconfig b/drivers/pinctrl/realtek/Kconfig
index 054e85db99e7..a156c4ef556e 100644
--- a/drivers/pinctrl/realtek/Kconfig
+++ b/drivers/pinctrl/realtek/Kconfig
@@ -2,8 +2,8 @@
 
 config PINCTRL_RTD
 	tristate "Realtek DHC core pin controller driver"
-	depends on ARCH_REALTEK
-	default y
+	depends on ARCH_REALTEK || (COMPILE_TEST && OF)
+	default ARCH_REALTEK
 	select PINMUX
 	select GENERIC_PINCONF
 	select REGMAP_MMIO
@@ -11,22 +11,22 @@ config PINCTRL_RTD
 config PINCTRL_RTD1619B
 	tristate "Realtek DHC 1619B pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1319D
 	tristate "Realtek DHC 1319D pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1315E
 	tristate "Realtek DHC 1315E pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 
 config PINCTRL_RTD1625
 	tristate "Realtek DHC 1625 pin controller driver"
 	depends on PINCTRL_RTD
-	default y
+	default ARCH_REALTEK
 	help
 	  This driver enables support for the pin controller on the Realtek
 	  RTD1625 SoCs.

-- 
2.51.0


