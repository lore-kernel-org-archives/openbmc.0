Return-Path: <openbmc+bounces-1794-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3C2F45A0B
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:31:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsyMy6jglz2yng;
	Sat, 11 Apr 2026 12:31:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775826312;
	cv=none; b=mXHa2Hz96JtJA7HgnubmC4DyRfa4dPWZex+feYMC8TXZ325BfeDJ11+dmiUe100toIJ6e97+qdw3Da+o8ueKee2L7FR/FDjryrZAsPdJlSUiouriLMzdUUY8l9yEe8UF6iJtHH0Lnlw2VSAOwgmbKutCCF+kJlIpAUaUFctqh/t95s3t3V2I/SFicCE9ut/ExKAhNZtpNhAeFSv+nezCr1EUjCkdzdjK5Yj19ky6hbuBjVhngU55pustWVlmGWpWgKEwHq6ZdlO8ZlQ2H72oErdTCr+1WoZ01bYko7UxrGMmIIiiGC/N2idOLeKaSUVoQz+whRT3iDxTbBuhbOIVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775826312; c=relaxed/relaxed;
	bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CLukY4vFJGc6X5z3MPhfD2nucUqmWovtuhln78pF5lInfz7ueO9DwBd/Xo5PIMm+er5ObIVORwed3jXSaqxrqjPAMQsInIYBnbJzyq7Yzln34aXarxUy5zQKhFa+YtRJz2DvKfg+/vUUwhynkILfGs3PhlCmNHLocHyDXPdtGKHxKEN4yM8FJ4Q+xV1506RHwzRZF1+P1w+x6bERzRLn9Mqf0XCix/KsipLKUIp35/Z3HLPZE/1n48XRYA3JjUJ3AwZO7vryNtn3YF137fUHeiEwqkNQC5ea03oewUS8DGy71Fkei+faAC1PTYThAC5uAWDm5tyH9tWXs3+WYyRacQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0VAggTv; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M8+XD18o; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0VAggTv;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M8+XD18o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fscTy3BqQz2yhP
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 23:05:08 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB0wwK438755
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKGpOYEOt3kDvtmS3WtStq
	ecKftz6DotNJihv0NRd50=; b=K0VAggTvng9Bjs7Krsu/Hj5qU2wi1gGOJBqGOm
	EOWsnMVaG6ugA+XUngevVyd0c3+yABbD/bKvsDQYii1u9w+Qg4unoV92RmmORx67
	X8jnA5Fabn8k4bEFtUs9S4vbIjkM57ogA7ouBar5paF319V4t35y2l1F7H60GSKz
	KyQBIQN9iDRRvCfCi6PUbNCxH+FcGmF2idQeuKdQiYTMmysTK1lhQwM0vhYFM6xH
	ygO+QmkrKrhuIIfgKn1LclT8xgomXQOrE1VwW5O3xQptJ67+C17gJNBLU4Q0dFsx
	EkUL7ywjp2UWhq0t1Li8/FWMv7n4OveuLau6h0ErCbGl8q4A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rbrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:05 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68826165bc9so1648868eaf.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826304; x=1776431104; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
        b=M8+XD18oFnsXG5t3t2PGrur3hnvMidbTuIi/UWEJhjOR221IcHbCd3mqkIHJnzmdRF
         UHxx9eu9T3HzZ7eo3vV3cuz4N4bTlMS5Bm4wqx6CZpQBAmky6rERsWIKPi+YkvtTnSM6
         YjeQaFqIEVSGl9aKmZO7+ZKjLA1DEcSGHX/5hkAvzF746JyDibKJWFnCvxMv6U38gDFs
         NU4gsqqmD0GsQsb/iFKMe7bmOQoiE8/zYElRgd7me/+DX/BwMJEJefubqouMa4aUm/dU
         1W/JqLcXUlHaZV4qM3J2x9HEUFrAEwlGr/j5ujVz1QOGXxStA4gmw5sbioADDeYJPxo3
         t1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826304; x=1776431104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
        b=G62mvVnc3AtwPPpcAbjd3gQiLm1DMiIbW6qKgC6ucWrAB0oYNsq9K1WDZEcXD0W8aP
         acnY8L4CDs3cqiIq8n+J9Fo6k6v+4AJnDI4KCkLUcVbGpffytlWExCj3aCdUO6S4opsx
         Pc38rlzW3BV6FXZcMdcHymcLqkqFvHk2zTHKqc+WL6MBYtCLcvXrPRvF4fEyx4pRQktg
         JijetHvfXr5Qo6Aa4Ie26thQEYo4QpWCYlMg63K+rCTMx00OnqBwAx719u0WWQweDQUc
         QJeErioHbgkWu9UKJDgpZNVgBU/38PNKKxdRZyiGrjkkDYtZcSFvhiMd/gI/LH03dlRI
         szzg==
X-Forwarded-Encrypted: i=1; AJvYcCWZwMoKkEJQppkj5MgsFDjj5RJlK1weZDB/deuFE7ks9FVTp75XjJIx/Y5hT4b7VUmP0E/nYos6@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyy6vsN3pQ9wPWQ/+AgFT/Rch9ITCJWVTOKV/pf1enxRZ/S2P/9
	S9YJyMFaKt++oHZRdlgN6F/bkARM/iKA9GpT1dg7OV5vl4PFLMa0m97w5fPUsrRj5UB/8g2NBuK
	yTDcl7B45qhsjBHdggMjS/l9iQoudUDV4MkZY7TL5WRMl+TIal3AFqw/uEV5Y/Q==
X-Gm-Gg: AeBDietHOioh0uC89FEvSP/xMahZ4rnFQ39KMCUr2PVfoqb6vlsyGKB5WPZ21VNVGkl
	nGxO5AYofDANSr0htxhN27bYMxbsUuIxbKNcfHo87PSvhzfEHq7p/Yp0W+qKI+nSeXhDU2TA0Kc
	1ApJB5kF/8FIk8At7JHB7KYcMwI8exVb7poGXQo61mlAp/pHl6iJk37kTbC4HX+HTIEkkc1qXHa
	jvcbgQJWSpajh8ZSm+pP6G9SCgU+EJpOQhLzQL5Ks/v1P5QmSlwhcyJCTe4E7YE9W72aQTjOhLT
	RahhudOk0V0s08psYtv/JtCkaSASLC1F2ICIjf8aChgj4337GJkNZQgccY8vobkvLr4cLXSuhDu
	rPfa7lHMUl/T8thPKzXvhgxkXG2rzy//6577ugIEZuwby
X-Received: by 2002:a05:6820:6008:b0:687:2d4e:8512 with SMTP id 006d021491bc7-68be86d04edmr832928eaf.49.1775826304300;
        Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
X-Received: by 2002:a05:6820:6008:b0:687:2d4e:8512 with SMTP id 006d021491bc7-68be86d04edmr832894eaf.49.1775826303813;
        Fri, 10 Apr 2026 06:05:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: More compile testing
Date: Fri, 10 Apr 2026 15:04:55 +0200
Message-Id: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHf12GkC/yXMQQqDMBBG4avIrBuYiIj2KuJC418dKVEyUQTx7
 qZ2+S3eO0kRBErv7KSAXVQWn2BfGbmp8yOMDMmUc15yYdms4l0MXxOhUfxoLGPoUNVFyUypWgM
 +cjzHpv1bt36Gi78NXdcNRSeqV3MAAAA=
X-Change-ID: 20260410-pinctrl-testing-10edae894600
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vDjc8gfmGKQkQFut+z56nJiHddVoPx2o25I0xNC8pyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV4TynGFLj/eYUtYaShlZW8le3GXFJG8zScl
 s03NytuS46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1eAAKCRDBN2bmhouD
 13IvEACGTEmnt+40yLlzVQAlkKhO6gro2lzbOp/zQK3xju3EqgEcoaCkKYxlO3SUnvROj0YS9Zc
 cSZ1x8EjbI0bl7vuR0UaaBz5xzXK4mUVMEzatb8BpbinER/75UBVHe/4hIGVBmY7B/EN310UxQS
 jzhx8XU8OKHfFiPvhLSrv7VKrvRnvZlsUFWWGYVgNdf0mEaZDovPMaMRtq9DzSLDmEV1B+YTDR5
 uyT5fpgbRSr6GeZ9iCfOlH/sORehIiUHTdzH5M2mUl6WSGjxfgDvoSDT6+ua4PjMieLBumpu+ot
 ROa3ds4QHoab6obHagcuygOSQJNokGUTVJxh9hAcE6MarHk69vghzuNWkBv9tinT5IHRMo+XcG2
 Hg7/vqmHQHjOv+rc4ohh5Ek/eSodSv4EbgLbJUL+ml9aCF0uLzQRXW+UWNxEXU77vCG0Q0oeQpR
 g+J4k4U5V9XcM/ckVK309HSyWSULVO4L5wZDWLsgbSpoctAcF7slx0zz3WQfIJrwbhC1W5ytbpU
 ar+NY0CskxlF7OqHMWxRYPkclXqnqvmYuqEIj5aSYBRt5W78tvQBJM4mYQeca1laoaSYn8bzHKG
 Xd56WGAO/VGsSYbCCTYl3XCoM30G2j8UGUfsiPegRWluD+vRvuRTF2QB8V5HX7lywkeAUpSFQ9U
 g6+8QDMa98j76lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfXzsgm9BQnR+B+
 sWrG2IssRL05PFV0DifsR5ojiTYVXhaWZeB52eTE/2KEKQ15/D81K/+yoxZavq0dQyJ6HhPw8wQ
 mdJLl3jfXHY2/MLFrh5SXMGbbkuS36RE5QqayptIrg9+14nOCCMa1WedNTjsSC2/7BCBNICcvOx
 C0INOOJ0W6AN3CtCr1ftZjl70H//453QGSi0mBtnh05vTyBzuMbahW/uSVHZMJsh1/3l8eanUbk
 +LbmXOsofl6dDTrcxpUpA4nZNy5WRqo0cTGErENi6W38UL5XS7F8MWHw9WA2dxI6sh8NV4JOHsR
 sO31n+bbor4UNel7E5+4Ozpv3t6jK/3TQnRUy01PRakVLGzHnfWtavSGCQlMNDZON8B5Cp2Duej
 D+hWuQZvh4FaBz4/Tpz3lC7UdByn3jZglUo3D6RoLmqhOJ1isWqzO0bf+WVsgiwmFZ7+BjLqi2q
 gS58sECtxfDPLQwWqCA==
X-Proofpoint-GUID: gynwB9ziAHvZXtpkk2FLmH41ShmYA27a
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d8f581 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X4zHBGs9HBKMUBQ9IvMA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: gynwB9ziAHvZXtpkk2FLmH41ShmYA27a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122

Follows https://lore.kernel.org/r/20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com/
but should not depend on it anyhow.

More compile testing means better bot coverage. Plus having ||
COMPILE_TEST and obj-CONFIG_ARCH_FOO is kind of pointless.

I built these on arm, arm64, i386, x86_64, sparc, m68k, s390, riscv and
powerpc. Branch is pushed also to LKP, so more build tests will follow.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      pinctrl: realtek: Enable compile testing
      pinctrl: aspeed: Enable compile testing outside of ARCH_ASPEED
      pinctrl: vt8500: Enable compile testing
      ARM: realtek: MAINTAINERS: Include pin controller drivers

 MAINTAINERS                     |  1 +
 drivers/pinctrl/Makefile        |  6 +++---
 drivers/pinctrl/realtek/Kconfig | 12 ++++++------
 drivers/pinctrl/vt8500/Kconfig  | 13 +++++++------
 4 files changed, 17 insertions(+), 15 deletions(-)
---
base-commit: a53c56fc5daedea57de51c02ede0b48f055fd8b3
change-id: 20260410-pinctrl-testing-10edae894600

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


