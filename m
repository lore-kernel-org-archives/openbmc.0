Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stST135JGzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 17:56:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rkGZ1Act; 
 dkim-atps=neutral
Received: by mail-vk0-x22f.google.com with SMTP id 192so10493739vkl.2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=PhlsPrHkOqWBf/Nx5QN7AVLUN4EOvHAcoDYm7+aedWA=;
 b=rkGZ1Act1Yh7d1KBtjab4MBySVnLTNlzbTOO/ZcRipWQpaA6t7VUiSnJwm36XiVju1
 LC7EC+Yiokv3fU5tr5NVWW0xM3HoRZjYI4gXuRS7m9zU9kFdp/0Gv6D6SA5+Hbr5O2II
 N71kw7zFa3X7hmR4nWbkyTnrRe/AsNI8ATEB8/ygNdwFvRPl7iWvBMcZ7FEmFk5hwrhh
 7tdSWZ1qZicGP0kzga13uR5ygYe/+AF1xGBOw0/QJxk+VrU2Jg7S6lUKmGVM4BVsecOc
 BhTnamoIP2h9XcvpUVvM9nNV57cT0gLsUH79euPcwERwxJXUBKoMQaXUrybVZqChNP0K
 AEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=PhlsPrHkOqWBf/Nx5QN7AVLUN4EOvHAcoDYm7+aedWA=;
 b=lr9zKxv83d4s162RO77LgsJe0wyKjGyeRYcYhCfI47qRfUt17ATVH8pgOX5APQVubw
 wcyEmqEunKozbIt4bMTdDv67Bxm/yHinlQCckVVqxYhKzQ3uPXvEt76z7tJOr1dt9BAG
 cEeZiGAL3JePj4swr1spGo5Jwyig1LScymfeNsgOhQTrbD75HushXxJOq2SupYuxV3Mc
 uUSXEEVY6rLB90YudP6ctXKE7bc/ff4wVIKziP+0ehGpZoXpZhYmV6+VJsdVhs5b5M0f
 oY37uoUSUnHVbPXa2chAKuzcVcZokI7oqtr3uO221wEAPcZFpBfahdysFtgYTo6dXj3T
 2pwQ==
X-Gm-Message-State: AA6/9Rnq77nzoEKjZuzUhmkv0h7TViM7gvoqgSlaMJDKezpI4NXJtmvsUn6HSkoCfcKAV60nDNP5YFp8zpvjoQ==
X-Received: by 10.31.102.6 with SMTP id a6mr1590069vkc.151.1476168979178; Mon,
 10 Oct 2016 23:56:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 23:55:58 -0700 (PDT)
In-Reply-To: <CAPH-5w5H-qYmjq+94U+jP=Wf57jdahO-jMZ1m=2gB9b8m8kAtA@mail.gmail.com>
References: <CAPH-5w5H-qYmjq+94U+jP=Wf57jdahO-jMZ1m=2gB9b8m8kAtA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Oct 2016 17:55:58 +1100
X-Google-Sender-Auth: EaU72qQ9vzM4E-ixwP_FM9vI03s
Message-ID: <CACPK8Xcyv2XLfZ1uawt=jcGDvX9cHOOMB9N9pGv5vV9gQ9objw@mail.gmail.com>
Subject: Re: libflash questions mostly relating to P9 bringup
To: Xo Wang <xow@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 06:56:22 -0000

On Sat, Sep 24, 2016 at 11:41 AM, Xo Wang <xow@google.com> wrote:
> Hi folks,
>
> I'm under the impression for P9 bringup we're sticking with BMC-side
> MMIO to set up host PNOR access (as in what the host is booting from
> over LPC). I see=E2=80=94and agree=E2=80=94that we're not gonna have MTD =
working by
> the time we need to boot early machines:
> https://github.com/openbmc/openbmc/issues/553

We have mtd support written and in testing. I plan to land it this week.

I would like us to be able to disable /dev/mem access soon. pflash is
one area where we almost have the bits in place, so I think we should
push to go straight to the correct solution.

>
> What does libflash-based PNOR control look like? I mean the hacky way
> we're gonna use for the next month. This is how I *think* it works.
>
> booting the host:
> 1) the SMC SPI flash master auto-detects (?) how to read like the FMC
> 2) Swiss Army aspeed.c do_x_setup() enables LPC/AHB bridge to the SPI
> flash window
> Is that it? Doesn't involve MTD or pflash at all and it just works?

Yes, I think so.

>
> updating PNOR from BMC:
> 1) org.openbmc.control.Flash's update method calls op-flasher
> 2) org.openbmc.control.Flasher invokes libflash erase and program
> 3) libflash arch_flash_arm_io.h (?) and friends
>   a. know how to talk to the flash controller (BMC_DIRECT)
>   b. map AHB, GPIO, and SMC window from /dev/mem
>   c. know the size of the host PNOR? (it looks hardcoded)

I suspect it uses the ffs header to determine the pnor size, but I do
not know that code well.

>
> updating PNOR from host:
> 1) whatever calls pflash on host
> 2) host libflash powerpc_io.c and friends poke BMC registers over LPC
>   a. write whatever LPC stuff that turns on iLPC2AHB, then use that to
> set GPIO and SMC window to LPC for host access
>   b. powerpc_io.c also overwrites the LPC/AHB bridge mapping (previous
> set by BMC kernel) with its own desired config

Hacky. Not really supported.

>
> Can somebody review that I got all this right? I saw some conflicting
> information in https://github.com/openbmc/linux/issues/51
>
> Other questions:
> - what's the plan for "booting the host" and "updating PNOR from BMC?"

We plan to expose the contents with an in-memory copy of the firmware.

> - is it worth extending the current libflash to read BMC & PNOR size,
> window, etc from device tree?
> - what does arch_flash_powerpc.c do? It looks like a whole other
> access method with a host-side MTD device.
>
> thanks
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
