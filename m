Return-Path: <openbmc+bounces-1826-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F1F433D0
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 00:01:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwypV684Lz2yvy;
	Thu, 16 Apr 2026 10:01:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776078744;
	cv=none; b=Vili/fALzQoC+qmi+D588DdBRaeLYhWz9g2wmY5xuq1wgn4OC2IKWO71BenafFueDx5rPJZROfMNKsGZY78Z8OljI4EXxkrIYGueg425x/MNnpQQnG540Gk1N6yP79+cKip7gMrlL3QRHiCoBLWs0MSZvHO+kEEi7g3wVgy1OcCVsiIitwhV1BLDWwzWzlwhjCKaUMf8XuvTwLxLM3qDLt8yWYJpiKV4MxK4vxpU0Sy25euhsij3FV6kpLqKHiXdS2+SJDljwPvPywn5M4I1IP0REqem3XdGa9+NU2W8ar5gS2n0Ww+5rGqX9eU4xjw8DT/6Uo4lKRU/utij8oNJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776078744; c=relaxed/relaxed;
	bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U73PN03rZepA6Uz0e4dS34VkCue7Rn8E9JfxOs0ieCSfsxhLGBgB6QBrGwZaUk1IWP9jtNgSb1RQxI6463nIpyVwrkObGxZeDtISR8md3Fm6kEUhwaqraFgseXYWiM8Sf0LBaZYNBr6BsZuRy2jSlHgOHO4YYlM/7Gx58exZcOv2q1PumzSso8xcfEr9oe7iE6C0raXNT5bVzS437yZfVHglrJfHEItf81wl8iVrukrysC5RaBeAq4SVMnUEmmWotc+SnENvaJCw4gbNWSbg2VXJuat5JHVAqzgLY+2kRUdpHcJzHfb2wANrLE4qsjOmhA26euUNdpO//oivWJgTAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFiUm1o+; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OawMsDzF; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FFiUm1o+;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OawMsDzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fvPrQ2ltXz2yhv
	for <openbmc@lists.ozlabs.org>; Mon, 13 Apr 2026 21:12:21 +1000 (AEST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7lwAC1733699
	for <openbmc@lists.ozlabs.org>; Mon, 13 Apr 2026 11:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=; b=FFiUm1o+fEzL4QEl
	JwwZTE5+MVZjFPn9+vJwWnKoCb2dyUKjp9x6soTdaYvmNKJ59deI2A+Y1KulYgbM
	P7n/ufXltYQT0VTfYmtOy7ZxMyq0btP1bG8S05drPskVF3V1C3a2L3gcQFx8yk0Q
	HUZT8PEMsdb6fkHlllgZ9bGd+wt5NDmc9jZxrCoWoHFgkT4TC3kBrJB/amzVHvlf
	xJ2FOBDN2/cMSM67xRwJ8nG90SFBTzvR1aN/7nmHIB5H9b9oieKwb/H3t087Qe2u
	6WlCpjAvSPZ/K2ib8vHJBi9nW0tQWHIWKHBshd/qaqPhkUgzADDM2GzT4lUwkRfA
	CB37rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfw1gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 13 Apr 2026 11:12:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so61109591cf.3
        for <openbmc@lists.ozlabs.org>; Mon, 13 Apr 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776078737; x=1776683537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
        b=OawMsDzFSqJJeLLtXgllR5Da2DNsczREOi3uFJSnw1u2mzhrd9pbNVd6F7GDGnCnA7
         07uqI8iTsZXfmHvO6zUCJNWMmABi5u71JU8+F/cOIX3BGfWP/IpD9yjZB7I78tJX+e+E
         tD7c4Mcjeje2YiGb7auJbhFNaNET7VHOFV0VsHFHuDgw+knLWTrWrOYoqNg15VBoTomN
         htp8qGRMBLNZG1H2rtZ+pjmuGouCzkaQpNyDA0WQmoRuU/guF854jgM4obBPRfp1ZNRD
         ch8dGuM9wqfajly4fLWmQU61XRyBvQiOnzRUiAtDVQ178GGQleM9osSxl+d14LHfWI/x
         nc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776078737; x=1776683537;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q13pMNKvA0d7OkiErS2v3o7XzXIeya9tsuMotgXsgk=;
        b=sEgJFq38WLiGmeXV/8gTRlQ0d1/LWagJT8TdmEobE5+Q2D/AN9eZ1rhFogOjKxVaFP
         7Z/TP2n+K5ft1a1RveDtU13p/aucsOMaYxGa1x3bQWkpxIZYqUiLA8eFjz1MG4qHM0BC
         qxD1BA8TgDvR07Vq25Se8GeQ0klZkJ5hPs2lfeUFDvrzP1kprcjoN9PvoHbPfBqgk2/X
         5/636oRzh9xXI/i3XnjrzXtsPMcxuNU+WHP1PNMyNaUHOtroKvUHfOTvgJebhJJV6bsW
         YSwFYVZaBItK1BTw6gcDBqsKgskbieIUiLL1Pb1li5NrhvQU1eyXQzhd5EKTGNwpD2TD
         ZJnA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y556kysY7RJurNPcVt4PjdUXgSZJUYvtK+NC2dT7KxOCewLeuOgDUdZY7ZcaSS3IUzeVt5vb2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzF508IK72iOUJhh1Gmiw2xfcw1PYYPOJQ+XoYZwBSc1H8asfYB
	r2zwiuIt5pWbuWI7JOxdNUHgNFBfr0I9OhUFygJfVUUHFhKYwOuCEx46bZUBwLTyfm8obOFNblk
	m/3uGHojoxW6ujrPf8o50S9dWw3uoSV7cMwz1NvTgmFzBhi0VBBSADYzpQJeOdA==
X-Gm-Gg: AeBDieu0SU6f8E9SBLVx6oBhgggfjbEWk9C8DdIsvWD/yNVo7t/OIVujPmkEXX2RFpg
	SkuFwjTe4Rkk0wheI/5DPb1vHSUIPLTEieprrSS8C672HWpeNH0BlrFVvVWsEGe/dV+Tc4TgVKd
	dps9NZr8A5jU95b02B/oEJx12xH8xrFTjjSA+Qk8t4ujdkInQ5RWyO6GRAg2P1kf2E5gpNJrJRQ
	DLEKt5HNJoGGmoWiw2cdoNq+C/8fNl3sAR3XJ4x9fvYDiBeraggRNmN/aH6hQtjU6U0RMARMBGA
	F2q4goAOV5yNJHF8drqqrm2AlGHaTuJZd3mCLWWL5SeZ9UtcBeyGQnEjX7psu4v795JVHUT0rg/
	ELhiwJKn5qQo2YTUlQqHaOAqieV7IA+zIVEDcdxGXP2tOdgQ+
X-Received: by 2002:a05:622a:348:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50dd5c2165amr198617151cf.54.1776078737565;
        Mon, 13 Apr 2026 04:12:17 -0700 (PDT)
X-Received: by 2002:a05:622a:348:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50dd5c2165amr198616561cf.54.1776078737121;
        Mon, 13 Apr 2026 04:12:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm277853595e9.15.2026.04.13.04.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:12:16 -0700 (PDT)
Message-ID: <dec1aa54-5bfd-4372-8c5b-983618d48291@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:12:14 +0200
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
Subject: Re: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
To: Sander Vanheule <sander@svanheule.net>, Linus Walleij
 <linusw@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
 <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZVmCH8ydwcRtSXj3usJRq6Is3JraFtMN
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dccf92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kD-Xf_iB5HnCcHWKTSQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ZVmCH8ydwcRtSXj3usJRq6Is3JraFtMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMCBTYWx0ZWRfX+ph3QUYZlwZo
 P6YHyB9jzTNJn8jk2D+sk7br2M/+EZt/gxnuZx0JAhf1Ci2eSbWlQv4fImjJc4aI/sPcXsjZA5D
 vRinz7beoNVKSCdyVqP6CWGBjNIosLpDTseBP4cu7nvXjt/G+/GI3qWB14Had8yOqZWO4s8K994
 T68Iplij0szM0H+eqDJhFThSy5hWYhDR89lYCd0a8EX8JB4YVPPIpzeSmf7EdxYDdYbUWY2RoJX
 K5HHMhycUnwP2CE8TCrvld1vTuVVW6q7idHYmlXC4fRmPwNBn9u0JUlNPiSCkMNmgW2XwkysszB
 mzs2XU/+Dyab7yfys8N/nnKJmuVvPx5+I7Ggyml/UjwV7l6rSsBrLCqCN6F0M44ZafAHRj9BjA/
 8/aqe2xFZF4d3CJGw8k3DUD94KdrTqFIySObdDObFhvPf+7CIuYGtYt3CBc6rot3P+iA5vwCH+B
 IJpWRMkNxeCjtsDgCFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130110

On 10/04/2026 23:22, Sander Vanheule wrote:
> Hi Krzysztof,
> 
> On Fri, 2026-04-10 at 15:04 +0200, Krzysztof Kozlowski wrote:
>> Enable compile testing for Realtek pin controller drivers for increased
> 
> Small nit, but this looks like a copy-paste error from the other patch.
> 
> 	Realtek -> VIA/Wondermedia (or vt8500, whatever you prefer)
> 

Yes.

Best regards,
Krzysztof

