Return-Path: <openbmc+bounces-2760-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110ACCA467
	for <openbmc@archiver.kernel.org>; Thu, 15 Oct 2026 18:56:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5HNl2mXJz2xdR;
	Fri, 16 Oct 2026 05:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792090599;
	cv=none; b=CX+bEj/ZYqQyvXlQyeRWegYj4QcdAb6el/V2CwPLvrAM69c3MJndTh87J/IKYeWP8k+bqoI7U9is+sOizAMuX6TaiAsFIjxSv7W8n9CnzoBfxjsP5Jem4ibsA3Ev1E414NitE91fu6QWPZuAKOloULUnUaGzcbTdItwFbY7EH39zoB9gU804nidxbMxbeAMBU7rML/JioeGgbZlx8M3yQmqhEDZo8dUjXHkTwaHT/Q9enRCBLX/HNCNidBmsSEioViHs4BUzKfad8v/0K6LDJdlBbE5R6yCjiTyjnBSjL9//CbKT7cPM1s6f3goe3fSO4VFNfmTn0exMA4iXhAC02A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792090599; c=relaxed/relaxed;
	bh=w9OS6nwZ/sre2zgwjQKWy+8rIDmWVPr1X4NAgKLgvpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eGBt6S8X+adEoA60wCnDrDFyK+bU7YcKjxLCHu8GNFhl6zHOd0ITDLnh1RQmLon0dHRYTSc7qQ2wSz2los8S9QKklBSIUFZSqO7iilYQ/hnrfrPnuorRcBKsgZYUWr8sOQwQON1jCl+TcR5eYd17SrmjULvGNMyQaAzWQoDT+SKCfR5qCoJVfnkAi3XIFOoNb5mbVNzTspJKyVvdQ/UdDvv9iIXDAfIerg4TR4lmdllD9xGH7CUnE8TxsmHgHOhysm++sUSiEjEVUpPbpGUIvGwOndr+iv0mkZYZM5KYfV/nbTDSImJSev1VfW0FVCbpwJegyUM8Z81uYhacLvpNtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=M8jgrTyb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=M8jgrTyb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j5HNj0NF3z2xb9
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 05:56:35 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so1671565f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2026 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792090591; x=1792695391; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9OS6nwZ/sre2zgwjQKWy+8rIDmWVPr1X4NAgKLgvpE=;
        b=M8jgrTybn3phuza+2CBoD/zLDEE6YpMQYolXgIaYj1jU4RsqKL63/Khz1Kq9iC98fr
         BzqhVkYQsRqs5rUsvWPxvbLDNoiDZ0Lk6WFM6nHbHHuj6YZrHibOxtgTXkXF0NFBGpm5
         AePjcG5I/gFQM10X3htr7DW2qM5J5u7NSR/l8jmMTE8bxPvO/Boz16vuqMNW1Kyz16CY
         ULJ+UoNLm+ydy+SFSQi5fMiuxzGjOilmQ0KwVt0U4iVn7aaCzJGSu0/zVJVsHU5fG5Ee
         nrbgpUhVm6x27hkynUMhhYIidzx6u/wiSRfefCNvejpvMzMpmrkYduyDsJEPvRg+WaNP
         4P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090591; x=1792695391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9OS6nwZ/sre2zgwjQKWy+8rIDmWVPr1X4NAgKLgvpE=;
        b=SAtytR7Kks9Nfklb2gK6SXfB45fTiMkO+mUFXCdxlpUfcu3qW8/yMPV4bLef60yARW
         YBp3+kEarJxzZlcezXqj5DpQLRPpEYlj8PZns3vxINFeVFi/cZst5qmsqYzVEwZDG444
         6pq1t+sBamkum1x/AeNQvPVHPyLyX0BmgkDH0IgpclEjyEoi0yDQjXb2ZLaiQ7/LckXd
         t+/exj1UiXVBVr+5U5YvpP1NCGofff4DgJE6APqVDdsG3Gb9u8neVO+voThWZWrxLv3f
         VE6m5eSuqxfpv676t+BBFh6+F/QpK4MxRwuYsBUlDNRu8FJGq86eV7yYCYEreZhDehaq
         5Kgw==
X-Forwarded-Encrypted: i=1; AKwUvBxkl/uw4UUqF0Dz4/cI7EuawHZyU37oLVlsa3yDCjbuVMnyCHFBv8u4pkkkfvJJQ9Jn0eVQXyej@lists.ozlabs.org
X-Gm-Message-State: AFq9FYJxFRuQH8WwaOzZOIzPHwK3Fx9iItPa4akXnxAd3CdyxlDuh+ZQ
	G1F4RF4yhmDPxfNOdmbeT2V+iFeA6pddj+ex+bf2SFFaCxhGBkGbP0x4MIK3m2wRSnQ=
X-Gm-Gg: AYBFou0puezqNlNNucUmFZAEQTVSFogw/nKG45Qbqi0wBsTAz7ybFVNfwewHc60G/xO
	boAnNKe8k/GcJp0X2w563A5dSFqlRR+trokbzxRIqtcku1Q/j2qavu90kF8wwRwghU9UTCtU+O0
	cmm53DqU+O9CeeKxAYnQ91Dgx8JUjoB10FPUzilUaX7mhaqtCleWIBoE9MP8qFA8vClnOY1xASK
	7E2nMFcYv7xvNtYeo+xp+4Ttmm/ic05FoUBdd+XbJCQhAPXabUecQG+zzNzsQR4rhjHyBNC+lmY
	RyI4QGfAWlrqjJBv0EDRaZx90JlxXSKqWSgkl2x0OiczIhaLxW7U15WtTvpyj4EAh73rnERbEHW
	55Zel/7Y2kM1rcWRN7LCuq3kxF21EQZfRqHpSSsgh2FYQ4uKJjYVqMbzr3U17ZVzQP9Fpnw+wDf
	xCZWhC+lkVz7n3EW8cFdf3Ar2jKnxn4fWvb2COdp1zlgZzGd/35LLefbofJV2V2+yxVzoM8gmlX
	BuqjHEilX9vKuzJPLf1za5lF4o2Kdxlp6Uv0AQ0NgOshcYXjmg=
X-Received: by 2002:a05:6000:40e0:b0:48c:6a4d:3b67 with SMTP id ffacd0b85a97d-48dbaceb433mr39249716f8f.19.1792090591349;
        Thu, 15 Oct 2026 11:56:31 -0700 (PDT)
Received: from ?IPV6:2001:9e8:2f4:b401:e5a6:e075:4922:88e8? ([2001:9e8:2f4:b401:e5a6:e075:4922:88e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f8f624sm9253962f8f.5.2026.10.15.11.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 11:56:31 -0700 (PDT)
Message-ID: <b583a436-a759-4bc0-9023-a64c6f2d41e4@9elements.com>
Date: Thu, 15 Oct 2026 20:56:30 +0200
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
Subject: Re: [PATCH linux dev-6.12 v1] eeprom: at25: fix read_poll_timeout()
 arg order
To: Ninad Palsule <ninad@linux.ibm.com>, openbmc@lists.ozlabs.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, eajames@linux.ibm.com
References: <20261015172509.2577073-1-ninad@linux.ibm.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261015172509.2577073-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 7:24 PM, Ninad Palsule wrote:
> The arguments to read_poll_timeout() in at25_wait_ready() are in the
> wrong order. "false" is passed as sleep_us, while the macro expects
> sleep_us, timeout_us and sleep_before_read in that order.
> 
> This makes the loop busy-poll instead of sleeping 1 ms between reads,
> and shortens the timeout from EE_TIMEOUT ms to 1 ms, so the wait can
> fail early.
> 
> Pass USEC_PER_MSEC as sleep_us, USEC_PER_MSEC * EE_TIMEOUT as
> timeout_us, and false as sleep_before_read.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---

dev-6.12 is unmaintained, thus won't merge it...

Tan

