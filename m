Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2yzD64XKzDqRc
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 22:18:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=QQ+zs2cX; 
 dkim-atps=neutral
Received: by mail-ua0-x235.google.com with SMTP id k90so104723876uak.0
 for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2016 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vy+ymhWp6ndF0Ohmg1QUXrTA0zrXuAiK+F0mtNjnXgs=;
 b=QQ+zs2cXc/2wA+7623QIJIoNC9BRyQKqT/PpWOkr73uzoKuCBaPfNQYJE/4yT+WGzf
 SL0qZRnYvC4rL5yu14Fr1KzzjJ+k38M8Ei4NI3izo6ROaKaezQaa82Ptnz524KJGfjsD
 fwItOTCnxfkwsPXTzd0yqCjHMU+ucBqyskQlxJHexJvRbF5nFrOceTsH93lCRYB/TVG+
 312VBzA5VaBLiExJXgbo/+XMuUWJ+k4736oew/k9xqloADMqlpveZxT9isx2TT13/4uH
 z7JYi9DZqYAmFj/9nS/TBfIpzcD5o6s068dzEV+ZbLFaa3TAVD+I6b68a6hmL1VgHCv2
 r4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vy+ymhWp6ndF0Ohmg1QUXrTA0zrXuAiK+F0mtNjnXgs=;
 b=EdG+4v5LVLuLjuYGy0I0xnrF6M4DCiRlvHJdohC5c8jwHemv4fFF46cUsiTXn9X802
 8kdKL+bn99FcSC2KIbDRbt9/+zC3mALpgAY30y1IM/PVmQ07VJ0SNlriE9OqODyt6utU
 zEWgv/etKHuJuYreyakowPgNcxgulUtmFyX1mN09ePEm2yRPsTwIx7TY3Tu70vQH0Yb/
 A1JEkpnWY7Wr3xS2Qw98ej6y9loXzvkPH9jW20t22R+V/AwKq0Akg3xbtPCfKrIo1NeY
 bDjILRWa4PLp+vCJfqAvb1Joulokbq/YdJcNDtGEDae0Hjt5G+fCr+C7avyXlNzggut7
 frig==
X-Gm-Message-State: AEkoout60JHdw24o8KSCxqrZE6M8vkzyTLWxQyYqsF411axD1pwLFr2DnYyTcvljYGYigNVGhQrUSDWeQl2bsQ==
X-Received: by 10.159.35.75 with SMTP id 69mr25828125uae.43.1470053893519;
 Mon, 01 Aug 2016 05:18:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.5.230 with HTTP; Mon, 1 Aug 2016 05:17:54 -0700 (PDT)
In-Reply-To: <DB4PR05MB0941DF5F4C384D1DE5429892D5040@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
 <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1469408379.5468.33.camel@aj.id.au>
 <DB4PR05MB0941D264C3F26B9F9378E78ED50F0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1470010405.4428.3.camel@aj.id.au>
 <DB4PR05MB0941DF5F4C384D1DE5429892D5040@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Aug 2016 21:47:54 +0930
X-Google-Sender-Auth: a2bZpzuhXD0eqCFVD9y9zccMCBU
Message-ID: <CACPK8Xc=KJ-KmBvu2c_WxggvLpw7G-j-it1Ld2WR=WnjH4muLg@mail.gmail.com>
Subject: Re: Aspeed 2500 EVB i2c transaction time out
To: Shay Slobodkin <shays@mellanox.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 12:18:17 -0000

On Mon, Aug 1, 2016 at 9:09 PM, Shay Slobodkin <shays@mellanox.com> wrote:
>> Sorry for the distraction here, it was a bit of a long shot. Building that branch
>> without further patching probably would not have muxed what you needed,
>> but it also should not have had the bugs you pointed out. I think Joel was
>> intending to push out a branch to support the extra i2c
>> bus(es) you need. Joel?
>
> Thank you Andrew.
> By the way, we do see I2C time out issues, when trying transactions to LM75.
>
> Joel, is there any update regarding the code? When is it supposed to be published?
> We can assist with testing, if you have some half backed code to share.

I've been working on it, but other responsibilities have been slowing
down progress. I expect to get it out this week. I will email the list
when I do.

It would be great to see your progress. Publish early, publish often :)

Cheers,

Joel
