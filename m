Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FBQW6JPw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ERMpmzSq"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lLFQ3ylrzDrpY
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 11:53:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EE48D22373;
 Mon, 14 May 2018 21:53:23 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 14 May 2018 21:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=LBqRdR/N9HuQ1PsIwFKlXyVucbfgb
 idwUdvQxQwY5Ko=; b=FBQW6JPwtR1wloCHQww5v/Men9Z75l1Brv1Q1ToOr8vQY
 Dl3mejLjjBmoHTJ6Pafhao3WBOTJXAuQavQzed/e6rSUABnc02LL4iB3NQH+uTi3
 cIh/Geph+yAHFmsF3rf6BfHz6Rm0XZGmNEjGdfUxzvS/JfJegrhkb1+aGkR2dIqs
 63ZIGW2do9s7PMi0EggwQZaMu5EHt5Mil8+FZRnYKKXlPcHvnnbaJw7svj8KQT9/
 4frM2iza5qkB8eTX5VQQN3OrfQ30mEYBD0gaw8bNLUHpJjHyjfXT16eOuBAu8zl7
 E74zCSKltudnlARaZHL/IlYugQejxE4hj1mwF69BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LBqRdR
 /N9HuQ1PsIwFKlXyVucbfgbidwUdvQxQwY5Ko=; b=ERMpmzSqLaKBopxyNuW92W
 0+3t5LnSFMQ3RiRTlicnBRQI9MV6RpQ0LhBnDlqmM3fDrh/T/jESvBWxiKhYq6CV
 RwD63j4C8HJonvMjVC75tLn4Q0V2/pu2AT3khEsB22myQwurJ/9SUNGzY0I/+7ED
 8EoW1Byl/JGggRBa3SwUXzhI1cJ08Q2RxNWIA8Dcb5kLaeeJH37dUUTxt11ZI4Dl
 kQ+Z52Z27ih2eIPWlWQHJagRxIeVZQHKF1P3TrYoyUTLcNGU+5G2FPh3CAycNxQa
 9XXUVjx0c8Lj10RZZ8HWi8RNyNIhSkwsz9mtQ7JNKA9k2Zk/mfenADKuSrY6vKaA
 ==
X-ME-Sender: <xms:kz36Wu89Cap1Azhy818B2abyeGL11SrXRZXTzTee8dvGDbTRViAbtQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 99B56422D; Mon, 14 May 2018 21:53:23 -0400 (EDT)
Message-Id: <1526349203.3522551.1372178312.7B38A3F9@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Andres Oportus <andresoportus@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
 <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
 <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
 <CAARXrt=Pkddt03EVfwjZN9Qpp8No5LA5X6dqJ+MfU6_K+k-00Q@mail.gmail.com>
In-Reply-To: <CAARXrt=Pkddt03EVfwjZN9Qpp8No5LA5X6dqJ+MfU6_K+k-00Q@mail.gmail.com>
Date: Tue, 15 May 2018 11:23:23 +0930
Subject: Re: Question on States monitoring
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 01:53:32 -0000

Hi Lei,

On Tue, 15 May 2018, at 11:19, Lei YU wrote:
> Hi Andres,
> 
> The existing [phosphor-gpio-monitor][1] contains two services, one is for
> monitor gpio interrupts, the other is "phosphor-gpio-presence" that checks a
> gpio output and let it be some state on DBus.
> 
> I guess the "presence" service is what you are looking for, that maps a
> gpio output to a Dbus object.
> 
> The existing use case is:
> 1. Witherspoon checks if power supply is connected and create dbus object
>    /inventory/system/chassis/motherboard/powersupplyX, it also is able to
>    bind the kernel driver when it is attached.
> 2. Zaius checks if a PCIE card is connected on E2B and create dbus object
>    /inventory/system/chassis/pcie_card_e2b
> 
> You can see a little detailed explanation at
> https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#gpio-presence

That porting guide looks like it has some interesting info, and I feel like we should probably make it part of the docs repository. Did you have any plans on integrating it?

Cheers,

Andrew
