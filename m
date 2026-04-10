Return-Path: <openbmc+bounces-1791-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6038FF45A18
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:25:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsyF35PF0z2ymg;
	Sat, 11 Apr 2026 12:25:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775826318;
	cv=none; b=KP9UtYE4WoS38W7F+TL9K02NkW9hbnLkeR7FacU/4hNR3FBx2Y43UMvIzfMdwz96B1Fy7jtll610IqUyQ8lgm3GCYnYRDTjLpSB/Yc7bScLFvfKUSBeFNALsV1iv5xaUvWIIfdX0Ca+rtyOY6icVtflN27qyv3Y4qOdNyybwL98Yln31EKV50F/GMoGql3lf7tJSeUXaCXfTGHFWhYhbzgnZ4C6sGw+phd5+1nMNSyMKURP8hayvYzaAgZFBabdgM+fBcOWq5APD8Pzo0wghVNfGkicXMmYetqnddMXO7hMLjkMjkcdSWW/+qDfeUzRXyiYteRLTJXBvpgl5pJ1nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775826318; c=relaxed/relaxed;
	bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwhkMMjyewOjhwTWtsibPK2kETXXYz/UXI0MExPZMZ9r59VU8uVEqQcvb9v0dVtwpYHEmduuZDckDKWxBSqTslvPzhqDcIqy2P2lPyZRqMlkBvFVwZQfkbaQ0eRqd86ne2f0uShFxIZjsQOGbcjrsxOISO63dDtnEwdi6FHMDa0W7KZNCpOyRxhRGpJMyfRIjcq2rHD5Qoqq0EQXb94lwhyQgd6OYcA/JwmQc0KAMnQ3gBuZpgLTxkLC4VePBk9hM4nHLo1+cgVPPtmjtOWmflLg+SEGY0kuX3kFrLnbv4EcQQkijjz9gOMROQDv4uk+uNeE1qw6QStcKcvCF6Oxnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XifP1DBR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZcJ1ywL; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XifP1DBR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZcJ1ywL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fscV55q9wz2yZ6
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 23:05:17 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAVP60709084
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=; b=XifP1DBRYal/FUlj
	bJFNkprezix621ZqVep0G97j18bnMOTIEO8CZEO137KFVsfmiBWn1ig4e5WWu97H
	AFEwVPMQhByNNQBQ5S3DnOC47fW+fIAFFsd+5BzMamilhnfXFRyjH6ASmx1lXZld
	O6SE0lrLdLDG+i5DbSbpWAV6g3E9ZO5u+MuUvqIDm6sgCSwWCeW9dTfgdb8xHSsc
	7R9Dp5M4YPa6iTc5NGw71xM7KTBILMy0hOJAVCsHCqdxXHO89Sj4as2P7LF/rCQ9
	URo3X40ei0JPw2t9wE5VjBLGRhgJmtBlPyDFENR/5vAhjxerNU0DjrFC4wBU/Xm9
	ujLECA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj1ftv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 13:05:15 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6861462170aso3826645eaf.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826315; x=1776431115; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
        b=hZcJ1ywLuZslmvaMn8hN2C4yWc8mLMZUy45lDpz09TwMBhYFLz6hgjZhTstdOHpQbB
         2RekdfkEVQhHPgSRlXzpOGidEHwcobacP9AaQybeLT0o98yzln/nuQHpfLKEa0o/SIvZ
         KgYaNk5iYemOFmqmdhVqRmNGAsHPiU2UwrMRhf5MgdZFjIHLFiMf4xDr7LMiwRW398LT
         WXTD3zBr7DGRTmvkZHESZJbQL+BlkO2qa7BqGYd3RHcbSEasTvUPTlSh9ILgEZRh+PG+
         vatd5Ohg3Wkb8l5/Ds65BHgr4QxsaHeRmgiSohi3Sxutf9HnZdjd1f57WfirW0B0oDZz
         T9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826315; x=1776431115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rALv6y/pf2PNh9pVOQZicmQmtag5nSH7E50ETGKM7DU=;
        b=jvPfYXR8z/zdUjdqJa8zOdc/tRBX/v8qscIZ89Yv8MEmwsIbyKieBovdhrXyZA7A8b
         Dosl5sHSsVKRtXO6Ao9QOrmqal7LNAon1rIZX4JlZZATjnUVxwHsPZ54ZEL0VqshAyS9
         2FsCHOh9NDpS6tySndIL0R/laKeQWpSUw6tOZj+lHD4UpUqCjo/qTcFDIfjJeqIpOZ2f
         08GzES11fFUDPIS7WnWzjD7lDpUo6Tba81jbNlfE7hGQTqARr+iGE8EcKhHcZfNMrdY8
         5WqK8FJXUSDy4SP7TU632IfVMem2bwXY80gpCCuzsar4zHY+FT1s6dIKD4/hDl3o1omH
         QuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtBtDz7RWF1DgE15vkygARtt2rhh6sVHkin31MoT3HO7gx6dbjAb5dbcEPRsFpWOE8sNmVn0vf@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/vehRqkIWOLTTN/eCDpAXSX17Gd8beTSMkska6EQu052wbrUC
	6xk0WGassTt070NUaQs3IHgGuSTFDcIjGOjEkI3jN4+mvwCXS0l8xNVX7XrtTB8yUMp3a7s+b+A
	3Pv8c8rvvZeuDcYKGqIdWkEJBPKQvXPmWFvJtdEZgEWHIro/tXJ9GxLjsqE9VHg==
X-Gm-Gg: AeBDiev7jzAb5ufLnVZbxKa+Yq0jpmbax2StFbUzlIo5BBS0jrdqUiS5GrBiyMfn7bf
	uTV+6HQHWBUXYdVKxgjp11xFGc1vpzlPhYeIJsv+59AX6Zz6yQHth/eHhgV+WiAr1mRedofO/MR
	SwSS0bYFu6lB9FqS0+EQsgDZbZs4jYMzLW/vQHfOPEKrv76iRclJH54doqHbb1y8+b2BEy0Z8hc
	QU/XHCBC90qnnqKRV1yCG5RN7//YV9rzo8rd9QGtCWvMama9l0L9rT/e7xs8SqAg/gQxcWc7HCw
	C14YviZORhU09JOXOeqXl1F4jahY5m1ros6zjXA3+RFb1kGgzaidZaagmXp0hM1lTrqE9ugJNA3
	lSuznhvL94PHDqW5v1TlnpOMALmSZQyu1DmjxoSLw0WSG
X-Received: by 2002:a05:6820:1692:b0:684:b4dc:59f7 with SMTP id 006d021491bc7-68be84d20cemr1449906eaf.52.1775826315081;
        Fri, 10 Apr 2026 06:05:15 -0700 (PDT)
X-Received: by 2002:a05:6820:1692:b0:684:b4dc:59f7 with SMTP id 006d021491bc7-68be84d20cemr1449864eaf.52.1775826314584;
        Fri, 10 Apr 2026 06:05:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:59 +0200
Subject: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller
 drivers
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
Message-Id: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GjAMz6tobYIxa/SJLPzRW+5gux+Gh/A3X9VoXHkjEnU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV81Vd+JP/scQiZoHE8MXITVvwB2S+oCSyu5
 bSdXev0yGOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1fAAKCRDBN2bmhouD
 1zcUD/9Yg5PqPB4i0qujDFde34COX9EkMoqe1+Z4Yi+Xoa/AA0fCdkrsfBesbCrqMV98JSevsIG
 YnA6sHvveGld5hbUKAd303/SDLywIlrEOLGlZDMP8vXK21Zb+WjLEoR/UJgjMl4a3vv1MFEdRve
 RVxvFzhbIpiQNiF4Q6vLmATxbrKqalDmxKreE3ZBvVKoNIWlnsPwkp7g1+GgE09Sj230eRg3pAC
 uPIwPD9SKELCOmPVU5DnDMsElI2OnpVkqduvNy6pOfKJtZDoqgAEgSqPGbVFMi90I1LBomNXWsa
 oPmObSxNd48uzwDK1bTxS4EzAC+0FkoehmUtLIsoiXt4RNT2dE8I+I0Mww8Wev5x1QYF5x2AZTd
 U67BBz7tqOwBj129s3hp/RdyzmQXOunfZhRvozGEmwnBiHg+WdCwVDSHE9l/miJ3A03rcbW2uiH
 1krrCtVP4zUpSS+ZkdMGyxKVD/Gz5sGFJAXKxnUMWVl1WN1sIzx11BMI/UaSbRBpddvCPrfdUOa
 Gnq4EAtfCwik2+YUaKNT0IFlJHBNUyr4TcSwtRoOd0CUPMPX/yDHIDPn22ikxRL9QWxo7bI9Tim
 q+H6vpNr7FM0V+f10VkV1ji1RqQfiEU07M/Zs0WoVph6I2tYqIiaLJBF7rC0eQJtuvBf/Bvimpt
 tH+Il+mVaAxb4Mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: M2MtRe7QkBAw-ckAcJYqS0mYp07PV6Q3
X-Proofpoint-GUID: M2MtRe7QkBAw-ckAcJYqS0mYp07PV6Q3
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8f58c cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=h1wwraGuyCXQn7UikQ0A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX5zY1MgehUjr3
 96no4gWWQh7qS54biJbQfmSIAxu0uqhCX5uayHJ9HXocpZ061EQiFm2MvF/WzCs2fm/9v2X/hq9
 5Kz5ihcKrMlX/8LEMvtGyZhuO7tyKOu5h9N3Yd8f4xIvpYvLmk2ftAXcvwjLCwU8VG00WYOM7b/
 WmO3i5kaY/qYonCEqy9AAIakV27KEIGGOCER5aL8Fr83cw3H811DysmUEwTxa5EXQkk8wvjf/WR
 +pLxlws7koKAegQhlaii8yB9fBWPGAzqrLYWbCxk0EaJ/r3f4cwDl+03jL19SQsDlNCTBg6Bokc
 F809TlB5rMddn/j1WvjTD0oE7yAaU0dqv3br2yBJLjIQxIUkUEwBSUIwo+uDax1TSLANUlrtR9E
 HQPxXdgrbBGjoHTWvrV5tthwi5QKqVatK0JHJlGVRZkxAARYgeG9n2wHEnUHcxi2CqG/xHbfo6M
 xLldObNA1NZ1kUDrjmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122

No dedicated maintainers are shown for Realtek SoC pin controllers,
except pinctrl subsystem maintainer, which means reduced review and
impression of abandoned drivers.  Pin controller drivers are essential
part of an SoC, so in case of lack of dedicated entry at least cover it
by the SoC platform maintainers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This patch should go via Realtek SoC maintainers, not pinctrl.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..374ce55e4fb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3373,6 +3373,7 @@ F:	Documentation/devicetree/bindings/arm/realtek.yaml
 F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
+F:	drivers/pinctrl/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>

-- 
2.51.0


