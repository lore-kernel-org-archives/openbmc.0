Return-Path: <openbmc+bounces-1364-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD4EEA86E
	for <openbmc@archiver.kernel.org>; Thu, 12 Feb 2026 23:23:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBrv74t2xz2ydq;
	Fri, 13 Feb 2026 10:22:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770874097;
	cv=none; b=XqZ7GegDxOtOJT2K+AXGVVw/I7xwbUFZsqReMWXJZvff9O+E6Kcj9UncCeHeWEGeciuJCPTtkZyJFSccrvX/KDZ+hg8ilGSs+Jvj3qvmgx8gPKxfI/q0Vd/LX5+i1Kji/O1VfJfrqVX0tPz0//Uhe+gg73R2lYm5LyHNO+zZI6KWD5onFMSDTSwe4ltUKM1d9xi1jgeVemz7fJ67U4hLZ5yqq+5VkhTaD42199dGSYuGRiXzn1BmONA6lccCwteWweEGMYnj+MaJYg3OgW6KajNAn7jyMlOzRPBB8+m0E6nR9gPQ0ZazcYgM71+sJul+GFtK6DK4gNnOtwBfihk39g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770874097; c=relaxed/relaxed;
	bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYEpussVgNI1CcnuYzHQMvBe84MplFR8A3vDwDAMpYROojxFmfDn3g4IXvYJo4B1P1oVDZcBfKzP6/1Ej/U+wG3GPpunasoMnbaWCyvI9OjeSg47XmAZdcNa4JZFicdye8NHTPSGSgKALSXr+j1TZOuJuckFd3plpJ+OGZjp2r1pLnLQ5gQkz8VkhtZQYd7yNo/A1eJjt3CU1CvU7ujYk5Vsp9JvNiNGONkTd/lw8lfhxv7jyTz7MzByeGdwRXSIMXXIXE/ehUBLLdfIbl3PuGfGrqsXsTncNCqlzaYh2JqTqGw4iOo8HAdzYanrEuYIyYAXkBHyCyB2yIzn+cxiWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R5J501z8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R5J501z8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBP333zVJz2xHX
	for <openbmc@lists.ozlabs.org>; Thu, 12 Feb 2026 16:28:14 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8230c2d3128so1313628b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 21:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770874092; x=1771478892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
        b=R5J501z87Y/rTrNUNlzp6x0MoGVVJfezUzp9y5aCCYo+/KQEOM3O4Gix0uMi3NQ3WX
         jVxcG+EfapoafJhhDfC5dJrqpWA0524u07qzXpiXEmzsH9YLASPwC16Izt64IJBaych0
         o792JM5qB9Glr4508cBHZ3sOIJ+dTv4aOvvBsUElHIdDlNj9rk4yLUkdoZhlRohsqTxc
         kOl/O9OxgfYxPjZR0+B1yRCRq0AFj4yuSXrIT8Lz7sa01hGq8jfy6I9vO8kiDhzYszVP
         wRumpzTo8UUs/TIJrYk3rJpO42NrfACbU+D094vDIFYQ8iJ2r1QrSqi8syszunE20/wU
         PJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770874092; x=1771478892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
        b=eiBXFCU33YKEtcsPa2IglNgPGrC5i9tvf8oSj56wVWAcxR0T/BJ9dmiIopoyM5cU9j
         vKYx8KBSbz9uPDnbY8eSwqKYcIzUVx9TaKlvnORSp33pGtW6fLuEu3VdxD3TPjLSNbmf
         9ZOCVCYH/gH/CEKXaa5A4YYlITaP+EJO8h79YaD3b6gQXFjpBOpDhYA+Yyx2gP+q+foY
         mM63G6/v/0L1e9JzUygWR/1/YDEW1x7GMmT0W7iXkZyEmICYHFJBW9jORKclE6Tkva5n
         YU7fav8v1wAkdP0QxO7YFQ1xBfZD0EV/qUUlOJDWElRrbkX249hK1T9bdZ7AAmCnNELC
         Vw4A==
X-Forwarded-Encrypted: i=1; AJvYcCW4IVDa0Poq49G00JkDtm7RaunJ3AmVnUgzx0uEu68Yh+iguyEeSKnnqHENpp5NqHUsev4t2PT0@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywvcho7NV2ZKfXOma81Nh/ddKsmLJ3IUKtzySgvJNeSmmK52yHK
	efZl+PtK1aD93Ng3lnQS9NAjiWG2x+t3sjjhHs7E/ZHT1i5ctd+Q57KJ
X-Gm-Gg: AZuq6aJk+hHRo2gLLKFkRbD9AlMhog3XvzTAE8WsOmSpcaKSXaUVARZlT3+tt2axLne
	8fxmxJWYsc2VcTYAg9bVGOgPjhF6/rAJ9ptjnRBhxuYaGMMH8DXvCKd6qMG2VHnjKbhzJHk2leN
	I9V+zc3d6+zaX9d5sm378M2dEbLFUYmpC6bt1AHEFFawy7oA76gwPclpU9R8Zy9HqSy+rhH9EaY
	qfnxqtqf8ILR2XQRp2G30kY5vn3HKEvO70+Gb/2fF0dSte5irmkW0dq5DSPCD4ZWEJMr/OJ1BSk
	XNGXLz1tVUtbos8Wn23QkzdspwlqFJhXFBK4xKb56R47JKD2inmZ9LDJD+6pybpIxs5EjnKKJpO
	EobVSdXyc+aCIudkKlNPYot+OSpX1zGIhQESQRUcQwDHqYZXQrO8L8Pb59ToLKzhwdU4zGrunVB
	2nKpEIlDELbFSjVWEq9ywaM7vkWVZMLPjgaJlFjATI5Mc3Oqd/ktqXRxC5bo+aaG0I8Cy5/RIG+
	WS3
X-Received: by 2002:a05:6a00:92a6:b0:824:4a22:ec02 with SMTP id d2e1a72fcca58-824b3042b8bmr1089776b3a.42.1770874091996;
        Wed, 11 Feb 2026 21:28:11 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e368d0asm4119668b3a.11.2026.02.11.21.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 21:28:11 -0800 (PST)
Message-ID: <532078ce-f02e-424f-8382-2b52438a657a@gmail.com>
Date: Thu, 12 Feb 2026 13:28:07 +0800
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
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew@lunn.ch>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
 <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
 <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/2026 6:21 PM, Russell King (Oracle) wrote:
> On Wed, Feb 11, 2026 at 05:52:21PM +0800, Joey Lu wrote:
>>> Is this register preserved over suspend/resume ?
>> It is not preserved by the GMAC suspend/resume flow and therefore needs to
>> be treated as a system register rather than a GMAC local context.
> That is another reason to use .set_phy_intf_sel as that will be called
> just before GMAC soft-reset in the .ndo_open() and resume paths.
Got it! Thank you for clarifying.

