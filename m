Return-Path: <openbmc+bounces-2310-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A91C44532
	for <openbmc@archiver.kernel.org>; Wed, 22 Jul 2026 11:06:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h4rzc46pGz2yfs;
	Wed, 22 Jul 2026 21:06:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784708512;
	cv=none; b=CLUKGcB5zn8tQv+TzEEMkoIf8Uod5C1mSV0HvdSF52YYcC21EPEccqWoa9HpLdO2kVvklwjeewU4nyOGctUEG5zAXw0qR3QkRgVgCkFlKY//r8OvSUzP7R5lu+gN8h9VHme7h8XORhjZANITdW+Ps99c7EA/Ro6iYekT7+8FjfSFEvCSadR3Ps7R8OV1E9iK33xY+PMdnHmEaMzW8YlOQ8iLRza/oqpT6Vb0RJpWrqPtfzZzGko+VsQ/Tj9fjPWKPnxMvaJwItSKlRQXl9ly+MtiOyrE5Seun6MCu/Bi5ctrs801UBSPBjlHDwy9CKteesIu13BaKNdze9r9UN2qYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784708512; c=relaxed/relaxed;
	bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRnmOrUoIlDYcC9H78T+M2/gKeuXD2AVupU6GSqSIZhIYAzjyYLlAZS4Xd2jfpgUNDvV05rX/R11uzAKPmjlZkMnm2AumYd0h3oJREYK6/DXl0d8k+mL1zk5lURcMaY37kLo9yOa9K773fwCSeES9v1wY86Vhs14JXVyBdcN0Us6D5TGGFTV8S8Er3YYBxGnYke9A4nES/qADp3ZQkrbcwdR4ZIR4q2eYAw8t149yh7a0NiuCNQsXRcAqFusILHZte+UC/YzeKPOEKBKPD8hiwWWYqSZdGGxbst5e8/YPU58lyxNM7706+4DaUCp9Dgd3xsvHiEpB7MZru9h4ygesQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjpK3QtR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YpCH9BAZ; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjpK3QtR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YpCH9BAZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h4nKX1D0jz2xLd
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2026 18:21:51 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53bAg3882940
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2026 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=; b=bjpK3QtRveDeMCC2
	K/RlkmR6v7hFM4AQ4nfyr5xKqFXdjAqgAQ4PpbQXMDBqjqGDS6LR/4s7nVJn5VXt
	IeGtUyLCV0Ht/eAgcnkSCpeWFkeEFXxS1KFTbDtmI3ahSEGXPI000LLSh2kXpbwE
	Pf+h2TGWfwXP4YJT5JWwjuJuxsEvinU05sqBfiU7ohAGo220zrImzGxyTO7WZMPP
	yZ5jDkqz0Tj9g74QLlidBioGgJ1yaiXUrq07o2WKoC2aGR4St7MpVuqn/GJOihyS
	akS+zBYi38aF4sP5vCdGEQpcYxx35z1aJUNws17dFDPOpu1HEoLpdGIY+NHJO2A+
	pLZpFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1413-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2026 08:21:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso155708541cf.2
        for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2026 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708504; x=1785313304; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
        b=YpCH9BAZu9espuHi7GQxAeiBIY5CSIJ+sMP7WyUMszOZNtMVH3BT4xB5y1806tsJTb
         kB8bZo8dqiohWMjciABo2B1jXit3jhJk9qsUns1OS+Xea1V83AT8jCACWPwEVnBmvbUl
         LtJnqVtEGOE3vIm0KL/AjttO/dTcA/WwlrmO9aI+5VLpEKbqPnbxFMRKdDI4DRNoSGan
         EO2buNo0yFywR1AFJKSQCLRiQnIzqsfZsUB2mbLB1Xj6irHXNEHfFGLpcj77xsSV9XFG
         t583tP1IUmW4i4MjqjckJGOQfZibUkfKEatLzp6kyC/4v2fFLyGDVlyiUdPpEn3S8CAg
         eW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708504; x=1785313304;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHQZ/CWxA22Mv/04aBv8o7hR+RlYHT5Vmjk9Hg5QZ2U=;
        b=H7Qz3cmkbsx0DN48U6IcXN8+Ihh1Zy85Gp6DA/v5YjxPd+xwRuCiCQQAIZHRew6Tif
         JjyEVTMM4y0fikINR8KgquSX22yCRfDZ9/FltiWxou46UEuAkkgaKcMpFcQPR2THXisR
         nHvMVlOunGwG4TYw/VPJ+9RvlFRYoCOvTumDNac/C7Ydx8DcCTiLSqsGdvy+5bvn3Pvu
         sfCRGi1733oC8sFxfff4kobVw/iJ64Upg2VTBJR5c8mydtXHjGlN61m8JsJw28xy3MAr
         v1oFWMg+9MuDWv25eg/RrndTeAPkgRtOXvDDguFaCyJDfHmfk5bRB9gJOWLWoqV9mepx
         RP1g==
X-Forwarded-Encrypted: i=1; AHgh+RqxvWo8+p1HzlJrjup2AYN1IE/EtL/OQy4YD9uL8D9PPScz7zPKTqQ2ie3nCUGSt/n2SZluRQsu@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yydkr1Aq8MY4lUipp2uuLWxjXBdvDSoqdD/MG4Q0InHKw8+TMC7
	EFXFQMyLMX0Qnsd2lkodrmeUz0eoi/m4y+0RoSP3KC9qv3TF2cfdPUYJKXbl6f6UJtcYiq7fqSs
	QSiZLrUIECkQZ6+tF9z280SPiGMUUJU78lqbdsk3xoxkHVa/VziIcwU07CDrSqg==
X-Gm-Gg: AR+sD13zGqUpKaOCRHpl5lz5IBTLBTZPuzVLPmpyPeweUCmO03emXmNPjedlmsKU6lH
	F/eI52dtU8l+vW7+aPjAHFzV/3lmrjzsXXQfFQo0YZJGScESI2gJAmCoGeGmCKLeRYZaK5d21RN
	ko4wl7OlwwJm1tY8dHLBrKfRAY7gNJ3txwOHcSY+WB0AQmaVkZlWmGrnbY4hTY7cFNqEboRWCti
	1R/NoVe02EdrZ5SpVAtntTJyR8HohTSKR04YCcSR2lDvNS04ToNlZuu5IfogrJ7cAVPOFdJb2Wl
	iAd22NMnT6DSHEGkSpuBgyFEKxaK1OG2iQSuHbKYnXmgVoDXTtB1GYkTwuL1jHoD5cpaXVRZAit
	C0wwmlHk32AE3HYIPGNZX0CsV5t18hA==
X-Received: by 2002:a05:622a:1a94:b0:51c:1bb9:137f with SMTP id d75a77b69052e-5213c20160cmr208790791cf.24.1784708503652;
        Wed, 22 Jul 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:1bb9:137f with SMTP id d75a77b69052e-5213c20160cmr208790591cf.24.1784708503220;
        Wed, 22 Jul 2026 01:21:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm3735346f8f.11.2026.07.22.01.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:21:42 -0700 (PDT)
Message-ID: <3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:21:40 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Jacky Huang <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
 <20260710054849.3178747-3-jackyhuang@nvidia.com>
 <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a607d98 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=aghwDrSpn70jpU0UxqMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zd-H9yr9C08EGE4tmGxG0092Dcfb63VP
X-Proofpoint-ORIG-GUID: zd-H9yr9C08EGE4tmGxG0092Dcfb63VP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfXwO0AxZ8wp1Vi
 JxO9RxGSniQAMpkb7tEd8AzGCEuCzMBDvnEmu6Mg3TbyAiHCKETmttiRp/1RlqcmJb+mUwsw8Qw
 Vcofj3QOWHrFFlrRpobpuWlNHf9A3hg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NyBTYWx0ZWRfX/MHfo2andpDf
 Hk+35ix2ge3gCioC1NoIBT/PBhpoxIgnHbs1sG7blhD9x5r6llJ3aq6ivztsplvO1VMf+RtVUCG
 uuVCV0exesV1zzE4UHsWMaAq1Ahc8kqaN/Rb0o3mmjotxFXhJ2fDbDk/EPRgFMkPW1ec2UnA/jq
 PvqnVliIMGVqkP/Qu3YjEyVNPDPerYBlijYTgpVxzDcKJbJDZnKoAgCpQOcqYyX31rhygHe21Nh
 JScBsORGhkoyWTc9fhE8RDSMMPUx3RNkLCSGZw+TBmsWdb10UuBldMQUdCIQvB1R85llwANPPCn
 pRUdJgcjJ0m+sfuPHK/ObRPSM/rrRKjYLOyldpDuSK/kd7pRcSLumwUfOD0cDuPgCmtrqS8czlp
 FHuYy4LUaA4o7SJoBOCjhoGjQf8M/A0LAS/y2WlCDRdtCi8xjpZ79OEad3UVt8AGWo1wKtKxNSp
 0oYAW1TZ5grczmOpdjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220077

On 22/07/2026 09:45, Andrew Jeffery wrote:
> Hi Jacky,
> 
> On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
>> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
>> Rubin NVL compute platform.
>>
>> MAC0 uses phy-mode = "rgmii-id" because the on-board PHY supplies
>> both RGMII internal delays.  The matching U-Boot device tree does not
>> enable SoC-side MAC clock delays, leaving the MAC internal delay at
>> zero so the PHY-provided delay is not doubled by the MAC controller.
>>
>> The corresponding U-Boot change has been submitted to openbmc/u-boot:
>> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidia.com/
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
>> ---
>> v3: reword the &mac0 comment per Andrew Lunn's feedback.
>>
>>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>  .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 901 ++++++++++++++++++
>>  2 files changed, 902 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> 
> We now have scripts/dtc/dt-check-style, and going forward I'm asking
> that all new devicetree submissions pass in strict mode.

Thanks!

> 
> Currently:
> 
>    $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
>    152
> 
> Can you please address those?

Just a note: --strict might not be ready yet. It reports some false
positives which need addressing (I have plans for this, but busy with
other things...), so expectation currently is:
1. No warnings from standard mode
2. Review and investigate warnings from 'strict' mode, but do not fix
them automatically without thinking

Best regards,
Krzysztof

