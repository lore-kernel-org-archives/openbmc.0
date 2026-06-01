Return-Path: <openbmc+bounces-2018-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3077CD6E55
	for <openbmc@archiver.kernel.org>; Mon,  1 Jun 2026 13:34:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTZg83l1Hz2yrt;
	Mon, 01 Jun 2026 23:33:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780320836;
	cv=none; b=KlT0Y+d7aAhrpfGgxSQST5zaHAAFpelfHJSHMIDQ64hd5mW/J0gI9buUILZDhdhXfO9b5+fg8CsKtmKvF588DuXLO4v3fcZqY0RkOi1yBuh1ABBTLtz5POUgvhvj1JTBZ8CrPN+SnHYPDB/nKyOrFvDqJS6gaHWnM3vFgGIe91OT3MKprWWY9EQdAUoZJm3RUyymSoIlsfXlNLWAixoLTpIBlQOdfvAC+cx7efmaNY0XbReEiKKFG4nq0lyDoR+v3qM7Qr1S1nHftQtdSt6EYlRdrOF2nc9RxklC8oZnW6Rpk1AitM4/QY8AJnVxLqomXNggETZxcZ+B931+28ouvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780320836; c=relaxed/relaxed;
	bh=icsdwZibwPBiJe+9N3KKSvfDrkWztma1utpMqrlB5k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIQanibHBfxipQD3ubzBdu4VZMXumek0SIERV3q6jvlszu2sgIEZi/6Osaut7FEt5MwIrJq9hahnWgsdqjWtleOMVKvxJz/z+dSgy80yq0HNLWHv7emfO3oECxoAxaeoik4F9EQ8c2NE/peu5hJdaTfE2qWeHNtoVScV1G39V47w0XCH0Z+uwtaUhVLFaljp1Wf50fBdL8cQuhiwvbVQA3s+YoMpmOvZQYvkgfcbd+5KzNAyrUZOXUVpy6hvlfxA5Fr2fxvhHx+jACcaEScmXbDiG0VUUz+s4cFtgNacmUQS8yOWN5OZC0X8UaeXianJKhcyUrdupaBu0G3QoR63Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QYTkuE6v; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QYTkuE6v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTZg65RSkz2xdh
	for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 23:33:53 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490a7a9f81bso11099455e9.1
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780320830; x=1780925630; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icsdwZibwPBiJe+9N3KKSvfDrkWztma1utpMqrlB5k8=;
        b=QYTkuE6v+F/Xm/CmD+R/A+8Kx07Zc3Qi6leQgKGPw7ceNYFSAI3wDods3byxQXlLJ2
         4kPqGuYx7M5g+XMFfdtf++uQqORvgPeFG+ff07GHiKKEeYc+yJfPxJaZRAPQLcxMORBd
         4OvxSQsH38HFNDLF0fa4DMnVT75zy3iFWIWZgUqI/s6LQ32TSAdjNVCO9mbv59dKfOFc
         mhw6i9VBu5tyre0HoiRhDEiipASNk0FUvEh1x6kw7WgIj9x6eMZVA43RueU43nUWcuXk
         0/BKDicSek3RCqc2IFOYbzeDAjmQJlEm48K+ZXGmEDeag9+9OsZwym8XTgGCv4FOXqF+
         OmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320830; x=1780925630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icsdwZibwPBiJe+9N3KKSvfDrkWztma1utpMqrlB5k8=;
        b=JkVqeoBtz6ouGM8OYtX1Rh1XlroTNek7BrKl4iMMn+1RsZspaBuku7EO5xC0llGslG
         oWpmNuw4VRI0ETguMp4nGbkSAuQRT7ZGDkKHnQ5ob7NabPznvpeGtYyNH2qH6tBO8oyt
         LvSOTdNdoOgHmDNedM5l8NCkdK5tdKEybv2tSvYCbxzTGvzotc1rY/LbqAmOZ02AjdHP
         M3w6TK/r9SPBe+ttDt+ysdf85XZSTyWfXQXwGrwuXtEPu0hyxVU/Z9WxTOzWIQWJP6A/
         uMxgvHZyorucdGAzkYiNLoxn6lI3fw4xHel7c/BTn2GbeLPy2XXMNVdcMBihdWHHN84R
         tTtA==
X-Forwarded-Encrypted: i=1; AFNElJ84HmhbPtgtyGmzDZwOLPH03OK/E2E6rgVHc9Awl+OddfsJeCJf2ucaikYt/RWyB9Ut0Yu1IHl3@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7B/FGfM1Wq9+0wZo0AvfOB+xnppHKhYzvLOWQ93Vg3Li2TGlL
	3PpHmM+0jHEC3S/51ccW5f16ET97p8CsD+m4UnpVRoG1CZXmyClCulrPkYugCKtgBiU=
X-Gm-Gg: Acq92OEZk3xkgcqfC5btLbBAcj4sh6QgNe6D1jcsEaGFp6wMIohsC+jwdhQgcgvS2kI
	sut4I3UImMpa/JTdQ/49IuOBA2TAVM1zeXiF488h/nzJJDE+tbBU9cuASMmNvt+rRVz2kds0umu
	aPB1idrjdpl2S+bz3VAruL4yylCvo82BZt8RzSWRVClz4JRSr9AuXX7c3OMJB1MuawpTr9kUJYA
	dhTU5eQORSXB5FQ45iLq++vzd3gkkABV3uHw5KvkZq4/evZs7V3EXrub4YLkil/Rb48MQnP1GEk
	hcwmQJChC22qLqtzFtvxc4++sMvclsiLebkEn5JnhlEVBOgEuQb8ye8hxVqy9lXXalEil3ZuJS9
	gBHE+fPVHy0sidk7TxZctQSmYxvW32Dt0BNaM8MUveogcmcvm5iPP0XrHTkH/3UToGAzIB3wLwV
	JFt7+naJqWu8zHPGDZ28+mIpCydD5Hy/f9zNnfe8e2UUOQUJAFd9Kdo53tfT4CW6gXTIyecjwXj
	znZfU+rKEf9YuTqyUI6r9ZKENDefBHyVNUp+ge1mKeLreCoDwQ9Zt6xv6Pm6rdI/716m+KS9SJU
	dg==
X-Received: by 2002:a05:600c:34c3:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490a2a2aab7mr174714195e9.8.1780320830142;
        Mon, 01 Jun 2026 06:33:50 -0700 (PDT)
Received: from ?IPV6:2003:e6:6705:6500:3eba:c936:e58f:3e19? (p200300e6670565003ebac936e58f3e19.dip0.t-ipconnect.de. [2003:e6:6705:6500:3eba:c936:e58f:3e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7eeesm235165655e9.10.2026.06.01.06.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:33:49 -0700 (PDT)
Message-ID: <27999869-0903-457a-952b-c77a61b61c1a@9elements.com>
Date: Mon, 1 Jun 2026 15:33:49 +0200
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
Subject: Re: [PATCH u-boot v3 2/2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org,
 Ender Hsieh <andhsieh@nvidia.com>, Marc Olberding <molberding@nvidia.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
 <20260525-asus-kommando-v3-2-e6a0ca1b4a3e@gmail.com>
 <0a27f1ad-d5a2-49b2-a79a-c2134ad7b2d2@9elements.com>
 <CAJ13v3TYLDswJROz=540J+XuyEmYMXEsaO3PgQhvFueSpsqpGg@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAJ13v3TYLDswJROz=540J+XuyEmYMXEsaO3PgQhvFueSpsqpGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/1/26 3:22 PM, Anirudh Srinivasan wrote:
> Hi Tan,
> 
> On Mon, Jun 1, 2026 at 4:26 AM Tan Siewert <tan.siewert@9elements.com> wrote:
>>
>>> +
>>> +&fmc {
>>> +     status = "okay";
>>> +
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&pinctrl_fmcquad_default>;
>>> +
>>> +     flash@0 {
>>> +             status = "okay";
>>> +             spi-max-frequency = <50000000>;
>>> +             spi-tx-bus-width = <4>;
>>> +             spi-rx-bus-width = <4>;
>>> +     };
>>
>> Out of curiosity: which revision of the Kommando IPMI card do you have?
>> Asking because I have two R1.04s and both fail after a power cycle, but
>> only if the SPI was probed by U-Boot before.
> 
> My card also says R1.04 on it. My flash chip is a Winbound 25Q512JVFQ.
> 
> Are you observing this after a graceful reboot from inside an OS, or
> when you unplug/replug the USB power cable? If you're doing the
> latter, I've observed that the card doesn't come back up properly when
> the UART ground is connected, even with the stock fw. I need to unplug
> power, unplug the UART ground cable and then replug both back in. I
> see some garbage output on the UART at boot if I don't do this.

I only observe this on re-plugging the USB power cable. Disconnecting 
UART and all other peripherals that have any ground pins makes the issue 
happen less times, but I am still able to trigger it if the power is 
falling at a bad timing (e.g. on init before systemd is starting.)

The R1.01 cards for example don't seem to have this issue at all, as I 
was told by a colleague.

	Tan

