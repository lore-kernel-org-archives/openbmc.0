Return-Path: <openbmc+bounces-2364-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F79C55838
	for <openbmc@archiver.kernel.org>; Tue,  4 Aug 2026 12:41:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDtTN5GvFz2yPR;
	Tue, 04 Aug 2026 22:41:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785847304;
	cv=none; b=TxSjSqHcSB4oWmeQ4Lzco9JEXYPGPK822xqw3flsiruIhSRKiNHUIhUBptjmH1eEKQNPI52bUUnpI2EhUWQafY74pUBhOaXg/dv3H+z+i1LGKpE+TslHGeZxuxqDCrczgqF6qiJEZmGq9ABjPUT0k+9/6F5v3+py/DE/RLEGMSeWRtzlNaoooUIZy05kE4R73WPuMmXMufkzJJRhE+jlcK/RFVGAhjP/JOii+dsCUIGk+uD/pswgIwqPNmdX+zegBPXF4vbxK9Fp5I4LWleM8nttkoCrFwiKKBM1cS6V2gbPVeGVXG+IY2T+QfvrrsQc4m5Va3WV8MAuPniaLwn5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785847304; c=relaxed/relaxed;
	bh=2mjDeMnGXoXwpwmSKdHv4IQd9n6zIKdvWKLxEiuRbOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aHKD25Wqxbi1a9Fc2RDt0Dhlo35UGQulb7QhsIUa0TvlDEIUIjnxBGjY+CGQdj3ohiljqdXRiY48N4wmFUlZDD//n8MDjVAViR/pYOsNkJB5WqPD2lK3mFJJYr6cqwYnymYPf9gJB9sY4Jz9tJEtb4leJeQAyN8m95v4AXy9eFQb7wztKO4S96V33XGW7NbIU8tcsULsw3lA9GYJeWExxwBzyItZZ60wfww0dVbFWB0HMA6PAKyamvZxMOWn9Ksnmee9UgTB2eLsNGnU3mzVzzd/1d84JjR8ExinDb3VRxAG4vp1c/5R1nXdBbLuz+vem+79H4IfqEO3Hl92qd8mdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=gwZooXai; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=gwZooXai;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDtTL2C84z2xyk
	for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 22:41:41 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3420856f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785847293; x=1786452093; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mjDeMnGXoXwpwmSKdHv4IQd9n6zIKdvWKLxEiuRbOA=;
        b=gwZooXaiCnswbEkBurmZ8Jj4oK7IlOda5mo4v/QVHOFgjTl4E+4A/kjyeI9XtsnPs3
         z06Uj3bfE0xD4rESMfDTVW+bVfns72ZnsYG8zOouygYPqSx3vQy6AUbOr23Z5kf1gB4j
         2RN716Rb8LhKAEZbkh5a/+uqAMc37ni0aYkB55hBkwxccYiYXBxN23hEO47MFeRF1M8B
         LjUsX14Yj28nva0IIv0z3Oo75GwIPIMutPApIHfFtenJ1UyZkFrUynt98z1Folt09R1k
         SJGIoRuCWQbO1pdrGdN6sU+VIg0lFuvI61032SS1G7LKYg69S2xCtNd5kczfmRjg6t4Q
         +UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785847293; x=1786452093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mjDeMnGXoXwpwmSKdHv4IQd9n6zIKdvWKLxEiuRbOA=;
        b=FxNX+qSZdggviEOREdir+kLLQbJ15O2pDiK1zAsD2tAlZScmCjobrKi8eRNsp2V8cM
         q1wSGQW2tFvuXDBD/GfG84LduBY0XB0Ppgf1bDG4OSkIBoDwPyxpXTfgvISesjXVX1oo
         0pme9H7XLcy9O352mN9BnMjjYuOC0yxWMspRddyTMiC4FZb0xlfU0hHW3YSogHCzc0Ln
         lAqDaie4vcvhQf+aC2d2no2NHYcn8vmHnMQ2BEtK1v89sPV48XYqjMtfDrRtvYWJyaWf
         Wzw/Gh+G0fgdd57tICQyxKaEmi8B8sRN+svuzAW14AO+64BN+aRwN2AmhzuFDzooWyuM
         qw5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkT1woJo8P3YmvgkhyP2/uilGXYmId8wGWbO/JEsfiXAEzich4jl6qG7kVqcr04s2bSRzgHuvU@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxdf6s1BEjDVMNuOHDJ9OU+S3d8lWHZmZ3a7rQOMuzLjBaToEi9
	LgcckqJ9HzQKtf+nrIIsytF62HgbR5+C/AglFz0f9clmr5uzAjhTITgyf5QH8j4Etp0=
X-Gm-Gg: AR+sD11lOnJ63h75G6U+Vun3eBZt+U1i5DiiTkhbnXGFuUFee7UMkgZ44Kdg1p5T5yM
	jA76ZMa6hH6BCsZvLV7wcWa3olc4b6H1wubyLI9xRi2K7G91bwwLPHZVnMgiBNwVJz459GOaD3D
	Yr6paMSnHuhFXczQWZDoBvAaqP1Yp9lkZk/ld0mpZP/NmVwA/LN2nRCzAjerQGvHxVSeA2nS3QG
	mBoRwqxwS9AWlZVpg1lD/a9N15aef5ISEg+0R11Mj91oEe1bRLr1nI1HoBgcF6OMnPv6sQ8COmu
	1qmmNyOkxwqKfKZyuQBGOHR8fTPCt5Xr08UvZr5bG3pASXP79QteYff64eHjVOiHfGTqQd5mpe5
	aGnBLXp6/aGwaA5V/8iFsif3Zlp4zFNoieVItm3UWvaCAwIs7U9GXCCv3nrTfOZPg/NCMBeHZcI
	xWjxvUyqcHmPVnIoUIeGQ/BJT8pQt4XurZCQnWCfqS8DNpKHRNglfKoChn0r3WR5dfg9Ara9fgZ
	+uM7pQ6TQlaxuoEkAK6eKoPAvwda4nMhoFDTL87wJqgEnNdYc0=
X-Received: by 2002:a5d:5f48:0:b0:47f:8ac0:ccb4 with SMTP id ffacd0b85a97d-47fd729edd0mr36959837f8f.10.1785847293138;
        Tue, 04 Aug 2026 05:41:33 -0700 (PDT)
Received: from ?IPV6:2a01:599:844:fb5f:1d2d:e32d:43ba:96b3? ([2a01:599:844:fb5f:1d2d:e32d:43ba:96b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm40126433f8f.3.2026.08.04.05.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 05:41:32 -0700 (PDT)
Message-ID: <85301f74-6c9a-4c8b-914b-4d70ca063562@9elements.com>
Date: Tue, 4 Aug 2026 14:41:31 +0200
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
Subject: Re: bitbake obmc-phosphor-image failed
To: Hebe YL Huang/WHQ/Wistron <Hebe_YL_Huang@wistron.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <PUZPR02MB6264D29BBFFA2583280A1461B5D42@PUZPR02MB6264.apcprd02.prod.outlook.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <PUZPR02MB6264D29BBFFA2583280A1461B5D42@PUZPR02MB6264.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hebe,

On 8/4/26 5:25 AM, Hebe YL Huang/WHQ/Wistron wrote:
> Hi,
> I was trying to build image for evb-ast2600 based on tag v09.06, but it showed some strange error and failed,

The LF OpenBMC repo doesn't have a tag called `v09.06` which indicates a 
downstream fork. Please note that the public mailing list is not used 
for debugging downstream forks.

What I suspect on your error tho is that your `tar` version is too new.

Tan

