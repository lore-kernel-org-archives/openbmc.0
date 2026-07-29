Return-Path: <openbmc+bounces-2330-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598E9C53200
	for <openbmc@archiver.kernel.org>; Wed, 29 Jul 2026 23:37:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h9TJX2KSgz2yk6;
	Thu, 30 Jul 2026 09:37:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785305827;
	cv=none; b=mx/oI2xumUbH6hw+StY1Ig+SzfocUaj4cFrUbQgFrkMT6v4rSM0IzVOy/qQUf15VQQGMtJ7DwXNslinEVIE/fLzYUfu1A1jMJvUYu1OgXLjrCaTbejHIUIjKMFmLYZLxJLeeGfeNs0tgiDTyTWWSvdbSms0LxWkwhYCNmaC/o5SwhY4yqT58oXTJUGl2QNEd+e7WmEAffYaoMsMeYscm307uhhlG5FWnQIEeuzghibsPAFvoO2H1lharsmEmQjz0kWdFnn3HeX63hDZgJZ/r1+i/ca475KkQLh7NWFaU+7XYiDTkv5q8uu3nIZNfw6G/PQEj0YZrPq3vSW5piJGrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785305827; c=relaxed/relaxed;
	bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlwiDyym30P4ONGI/CRPRgf6bYfBkR6bBlhj765AdE0ZgC0iFXADJeUROXlm0KgGE4ztcnYS6F+Qse7PP5I1yF2pz9Q6CH/QyjA1gR0LsHZKcIhtOqgMljNhTCvoI5aSI6/hyF/0mDadmsI9SZD0k0oy+b5cCrAloTnSCLueMOycbYE8g4VJezDWLRw3FuIwDd94uaAoL8TKao0r3yIOgtzeCFeQ1At4cWKAIq7r8MaWVtkbXRjfhMuwSAxPxLBRxUIrc8NO/aA2/j92P+8OF+yNt1fHJIyF/z5xzg8GJaTRI4QaoEw1klOTwVfpPX7Z9laAxem8PNmRK7B6q1CZ/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YtCQKYJK; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfHIttZa; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YtCQKYJK;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfHIttZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h92DG5FDpz2xrL
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2026 16:17:00 +1000 (AEST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cQRC678127
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2026 06:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=; b=YtCQKYJKWcBf0EDD
	oUBMOY2zBQW95QjDHeLJW4TgIst97oo7Iggs2DLRkeXxpsQk25CkeMojtOagDCad
	8KbSu/5o3VUqvHNepbTc2f+tmv3qtIPAwVMrSBVSSNYZgei2mJeY8k5nJIN1+AYp
	c3t/ZwX9B2s9PkDK8WyzWQ1o0pZzFP/g/vNFFflKWlcU+8e15L7xdNh6PH5rSKew
	BdVx31bBDJl8rN4VcKK4cI9jDz2MF1ztSvHNY6MBiVw7id5uFqaHz2+aMrYLBFZy
	feceyXl1+3anshl/u/leQeBbqsvwTlRvONo35T64KNf0e6ctXXrdz+vw9rUVMooz
	GSjV3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sah8gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2026 06:16:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e97889ac8aso7172876d6.3
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2026 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785305817; x=1785910617; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
        b=gfHIttZadLp5OLG9rUl5Pw1UxioueUQxm8ynXkWfgMa5SrQmwPRRbekucxmNnkHVPS
         Gbhg46BHd1WQNkGwmqY2wG2PwrVAexa1fH84/UOmxkiUcyGICxuMEF7CT3hXqcj79sjD
         Rvn8LBRdUjTNL/klT36EWOLdksuan2QreGs9XXlBSrrAifzFcjWQJS/ZXlzBt8kif0K/
         mTI0r8onToLitjU+Or7EG7WRH3JAo/SN81pGMCDv9EVKcKwjOhuk4AYXCTtvszRTt3tm
         6rTjrLMDZbPVc4XOUCsoLZWSuPEENHYXPaCcDGGjI3+R9PXsCno90k0Al6Zn8U/xHtF6
         GZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305817; x=1785910617;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz7KhVWynfK4YJouO55SMawbYSSOZKSjjVpnD5FwaYQ=;
        b=NUDQi+3vdDL9Ty3iqcZjAted3FCLiCFWxoawauS8MpzYhz3Ot9sERp+8GdC5V6iPSC
         0j5j9O2fIqrIVpT08iVwhz8ObqdDJMe9mX2nkIYZKB/QEUSTKIvTl/MASc8Hnj+vihiP
         qiFYhHYJeVqnSY7XKJ+BagETnkQgTmY+nafuvO7usmmhQBHiZBtq9uzyXw9muFq+pgdk
         9sIEhZfe8lyApaMbaJssmEbsspsK6UhTYqALXwwI2NM7QzaQdeS7vbONJ7nKxadL6wNl
         QA7uf3+gaMGMF49RgEsty+Va1/Js/wIn6DRGIEAnpRz1TOPNYnXJhR0vlHmNK139om3n
         HmaA==
X-Forwarded-Encrypted: i=1; AHgh+RrxGnh9+PKSI6093UH8dQ3s7ZiS5hISWayzVoQgCpKokyEpGYdWrV1APRAoAS3Rs5EMYL+fthS7@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdJSSA7aSYBYUDum9ohC7CGq6Cc3QPZFqhLfAZd27eKOXp725b
	/H7v+7az+xAWg26GWZ9zFPBxnazrKHRQg/3qrp6shY8i5Xq9iT2AWjOdojEsOlHVwef+Cg+NZSY
	j6z6llvF8OfPtCBItjrCNLF2vrGX7i7OCvOGtp8WMT+ocU96D5Xm43a5QVeaHdw==
X-Gm-Gg: AR+sD1398Fm+524Xs9aXfIxExziMho3KLrUaVjI4Aq08XfiH087RvzwkiCXxYIb41F+
	ZmkTRQ97W3qp2Yqaw500yL5FD9oE8kKxjoWmqugorZLN+BI2dRSYIUzos02Wio6Q3leb8+6wfJb
	6pHPiTXgSVyFtXJk6tgxB14Iq/H+yj2E4xw7ARm2zxgMJLdoZ7hsyC0QCNh30PHIu2sPfIghx2l
	vq14HADx73XURRjRiS6xbMyNRsIWkA1DkF8k7b671mLpFR27SvGgkg5da1Ds0xwSA4SCckMTu6O
	/qdSXEfXvg0qXfn6R3dDRhlE+JTyH/sU1B+rIa0xV/B8h5PeuZ7CeqytIil8ovkzmOHTO6IG4an
	C/B7NW6m68TttqADFyWMeiWPEIeLpYw==
X-Received: by 2002:ac8:5915:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529d713e451mr47633151cf.39.1785305816985;
        Tue, 28 Jul 2026 23:16:56 -0700 (PDT)
X-Received: by 2002:ac8:5915:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529d713e451mr47632701cf.39.1785305815597;
        Tue, 28 Jul 2026 23:16:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3940sm5367800f8f.7.2026.07.28.23.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 23:16:54 -0700 (PDT)
Message-ID: <d8927b08-f743-4b1c-85ad-f64b9e5b326f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:16:52 +0200
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
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au,
        Rob Herring
 <robh@kernel.org>, conor+dt@kernel.org, andrew@lunn.ch,
        devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
 <20260728085640.1001890-3-jackyhuang@nvidia.com>
 <20260728143952.GA2121505-robh@kernel.org>
 <20260729060612.1085870-1-jackyhuang@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729060612.1085870-1-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sMdQa8B7NWZeRBDMgolqLSUI2_fYZJKv
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a699ada cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=LSH1fm4cC_m-g0oQB94A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: sMdQa8B7NWZeRBDMgolqLSUI2_fYZJKv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA0OSBTYWx0ZWRfXzw6SMw78m6h1
 Hn4gmuF7WnS/msO5i2XwGpaPCZn9JzWofp9kJaPzTc2rDxYDPyRPztQNgD5Bikat7EJSV6otNLL
 333+IDhjpNHqqEimMWcewf0s3/JmB70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA0OSBTYWx0ZWRfX/ic5pHzBE1Vl
 Z1sn51PN/MG72B7E5ct6yIgKxtpp83dgU2QfL4YprcausEutkY/LJV9AWJaR4uTxj+C7TCsqQmU
 /PeWtRdFunDTxzWGivjlV0D+vv8QY6/AFGUrHYoWfhRWVCYrzynOn2q8/WEM4Y7xSSMMVXFhAIY
 jEjrzv5nW1IwfxK4pwGPcvggZxwyLCB0qnUw4bhZnXJjZGf5EKcG7LCX1Z7yfABcoaJcvBEArcS
 2utyS+O1VVD65B3LFBX5TKWtYd7+UVpTPjpwecQm5MQV32MWM7q7UxT+E8bFLJtXyLWgTqBoNXx
 nfCUutalSpU0TLlraebnb2cPXyq4KNnUqO0exMlRDTr7y1WvfddKXGtZpCo3mOPDBOQ5ZcFYFIf
 HfGWrjLDfZtMywouwns/0IP91OxvBXLHb1C5OzSnRxeRMfFKhcp65i0kVrN9xAGN0i2xZdrhxNx
 dyWWkM1cy8+CQKAG7ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290049

On 29/07/2026 08:06, Jacky Huang wrote:
> Hi Rob,
> 
> Thank you very much for the review.
> 
> On Tue, Jul 28, 2026 at 09:39:52AM -0500, Rob Herring wrote:
>>> +				cp2112g: device@2 {
>>
>> This and other devices should have a compatible string and associated
>> schema. The hub probably should too.
> 
> Will fix in v5.
> 
>>> +	flash@0 {
>>
>> Needs a compatible.
> 
> The flash@0 node augments the corresponding node defined in
> aspeed-g6.dtsi, which already carries compatible = "jedec,spi-nor",
> so the compatible is inherited. The same applies to the flash@0
> under &spi2.
> 
>>> +		status = "okay";
>>
>> okay is the default, so not needed.
> 
> The flash@0 node in aspeed-g6.dtsi is status = "disabled", so the
> board file needs status = "okay" to enable it.
> 

Why are you extending existing nodes that way instead of phandle/label?
You write confusing code, so that's why you have such comments.

Best regards,
Krzysztof

