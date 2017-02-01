Return-Path: <maxims@google.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDH0Y3wbvzDq5s
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 08:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SpDZAonv"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id j18so167605062ioe.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 13:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8628Lxq3W8fLMwb6k51ir+kEu1AE5uHwCHkWO6r47GI=;
 b=SpDZAonvkFaBB+l6D9O1EY4BuDtXT50O+PBeeTkVMB10h+mloT981GUXHcWYlfhXrG
 oEepb8+Zo9LZDqqe3uShT+6CsBqp5PjSHkIjhOD/EcviXMwjCnPY/RsVBzTevzmlOEan
 QegTuPRYt5tf8GPnV8dLDqNv8apc7y0VMBT7pvvTWuOjvz5OdxJKx4YmwQIWowuBpwWG
 +5HXDPSgbs7Gc7pPd2a2e9mDAQnEhsi9zXThSKsM/GCbd9bmMph3Ij4xC+A9aeKiIv06
 6pYjIVxGMygi+mTg06aF5SRDSllnHbD0gUt0c5PpnoqGg6hKMMGJqOu+WWAUINyXbg/t
 vR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8628Lxq3W8fLMwb6k51ir+kEu1AE5uHwCHkWO6r47GI=;
 b=TRrCRzREz0cPQ2hKEq/1iyOJkETQsLEXlkOYvrFrJbqUdtPXa0ya0Ro9rb79j6eQxC
 sSMMkmhYEIZZjFbCG4g7oa5wIglneysdXH4S5HBMQK+bxSTmJSGoJpt5DKUIw7k8+5J7
 1j1i5Z7/wULrJSuntnTpcqRIwyRVgyZfbIM5y9IX72zD2UhbOoHESkVdEXpe3XwrELAK
 cZgc/i9ppcCWt2G1wNqNyT+p/sec51yJW5XqZzrbHr4Jmjc/HIxIBlnB8RTcZzbQimSS
 txB7z3mc9M8sjvvXglnOkyC543e3CI4in796D6MwDgaNtbv0FuqbvhA6B2Qi+l0UBDQr
 q3Ug==
X-Gm-Message-State: AIkVDXLDWwEjUzYxwp0daybMUUn3aQZS60EseFMWSkS7vIQYDHLsWSuZf7tII5oMDT/LA9Nw4JvVQ3r/gHsDqLc2
X-Received: by 10.107.142.205 with SMTP id q196mr4419380iod.147.1485985929907; 
 Wed, 01 Feb 2017 13:52:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.134.141 with HTTP; Wed, 1 Feb 2017 13:52:09 -0800 (PST)
In-Reply-To: <e7627b17-2ac8-a954-5bd7-bcd3cd0e8ece@kaod.org>
References: <CAFR_W8qLw174HCxC4kmPuxZp30nA+n1Ug6FRkk1xSsYBUxZSpg@mail.gmail.com>
 <e7627b17-2ac8-a954-5bd7-bcd3cd0e8ece@kaod.org>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 1 Feb 2017 13:52:09 -0800
Message-ID: <CAFR_W8odv58XkjAQjPSCXc47D5Efsg4wH_3geTXjQktjKt_GWw@mail.gmail.com>
Subject: Re: Support for Aspeed SoC in upstream U-Boot
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2017 21:52:14 -0000

On Wed, Feb 1, 2017 at 1:15 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 01/31/2017 01:00 AM, Maxim Sloyko wrote:
>> Hi all,
>>
>> I'm happy to announce that the basic support for aspeed (ast2500 eval
>> board, to be specific) has been accepted into the upstream U-Boot and
>> will appear in 2017.03 release.
>>
>> It's a bare minimum required to boot the board into U-Boot prompt, but
>> it already has WDT, Timer, Sysreset, Clock (very basic) and SDRAM MC
>> drivers, all implemented in C from scratch.
>
> Nice job. Thanks for working on this.
>
>> Of these drivers, WDT, Timer and Sysreset *should* be ast2400
>> compatible, but I haven't tested it,
>> since I don't have the hardware. Clock driver is not ast2400
>> compatible, but it should not be hard to make it such.
>
> indeed. a couple of dividers are different. SCU also.
>
>> SDRAM driver is not compatible and my understanding that the controllers
>> on ast2500 and ast2400 boards are different enough to require different
>> drivers.
>
> That is the main issue and the driver will be much more complex but
> maybe we can start with some assembly.
>

Didn't you have it all rewritten in C in your branch? The way SDRAM
driver is hooked up to the boot process is basically a "manual" call
in dram_init() function in board file, so if you don't want to have a
driver, you can still put your code in there and use it "as is".

>> I plan to continue expanding this support, which basically means
>> adding more drivers :)
>
> What is on your todo list?

My main goal is to have full Zaius support in upstream. It means that we ne=
ed
* To read FRU: I2C driver, EEPROM driver (upstream already has one),
* To configure network: NIC driver (rewrite the one from ASPEED to use
Driver Model)
* To reset PHY: GPIO driver.

For these drivers to work properly we also need Pinctrl driver and the
support for I2C and MAC clocks in the Clock driver.

> Have you tried to rebase the current
> missing drivers, even in an hacky way, on top of upstream u-boot ?

I haven't tried it, though I don't see why that wouldn't work. There
should not be any conflicts between openbmc/u-boot and mainline
u-boot, apart from maybe in configuration files (Kconfig, Makefiles,
board configs)
In addition to that, the amount of work needed to make it work
properly (i.e. "u-boot way") does not seem unreasonable, so I'd rather
spend time doing that.

>
>
> Thanks,
>
> C.
>



--=20
Maxim Sloyko
