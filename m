Return-Path: <raltherr@google.com>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xf6gW4zNYzDrVt
 for <openbmc@lists.ozlabs.org>; Sat, 26 Aug 2017 02:53:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gW5AO0Ec"; 
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id z187so1092437vkd.2
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pRnmxygjSt9+3A9M2Y/lh1/pLlQlDNc+7FeV8g27P58=;
 b=gW5AO0Ecgj0EpMynT1ScrqZknF3ugxQkDxF1d9+XBiY2TB9KCLlk0rwNJsV2mavQij
 Xr1/wA4fD3NqnmQYgU9Ap64htBq2mHfMYfbO5bdowEr26JVGhOimzikl0H6NNErY5I81
 pYM2j1Ukmj+FmCmpEr9wqIfV7I7Ch0poVMPc0Q7bR5zy4pSo8ELk8trOrw9RApa6nQvu
 g9hlkb6R8pPIiM9mWglxq7MUEXBxCIFKlAgVcne4RHxmiKGXulF0xJLzCrTuFfAOMokY
 XZ88BJuFemeWtXEdzNvS/ZhhQbCtHIhlJEkge0aDhnIT4ojPKAutV9+Nr8lbqSQIY75W
 Ufxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pRnmxygjSt9+3A9M2Y/lh1/pLlQlDNc+7FeV8g27P58=;
 b=MS410wAjty57BuN0lBm2DRfNJm6Saw6uED6KNzFp2wt5gds033zP8Z7MGKMYsDm6R1
 2hjjHFrEgkCu6Wzg7JzLHRZabbiukO+VuAd5n0EzN9nTJ7XlloX3rQyeb7+Vm2g3ESDa
 Ofj90F+5UaDrAvyGfj8XswRcqgtVMc4KB6o6+KHzPTYESoqKFlbv687ri4h40cZsyrqD
 DE2CfVMrfKNwsW3tfQCdTRVilZBVtvkaK1lP5Mo9LSjnCHEfg+saevTdoXEJf05J/SDa
 3Lv/6IVNbgSd8ENN/Cz1/bN4pSFI2D6u573bh1gKPNzPnhGY85L6B02ynL7zJCEIvTyG
 Ue2w==
X-Gm-Message-State: AHYfb5hK9+Rs5jIk8rHtDVu/c9URfA00Hl3fQzbm1Tb7OXUl+MQGAHo8
 +n67KEq8idBYfXgc+ezv+dAn57EJjIQn
X-Google-Smtp-Source: ADKCNb4bATVL3i7hDL9X7s45e8GzsAGibCV26s8Ipe/Q12UMYZMtVLXnNVdcM2gjMKkJU7JxiNsSbFzJjoTaKQ4w4js=
X-Received: by 10.31.174.149 with SMTP id x143mr5744391vke.175.1503680021112; 
 Fri, 25 Aug 2017 09:53:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Fri, 25 Aug 2017 09:53:40 -0700 (PDT)
In-Reply-To: <593cd0d3-8e06-0992-c155-1322014c0477@longlandclan.id.au>
References: <1503418256-5215-1-git-send-email-oleksandrs@mellanox.com>
 <CACRpkdZePXyo8Q36mBH7OnJU3E=yWPWSGkGUOH=zJFMjM=Yrhw@mail.gmail.com>
 <CAPLgG==Jj=Ys=SvhOCspSfunbWnuqPySvW9RfuqE8HYnG4C=ZQ@mail.gmail.com>
 <CACRpkdbozWaL0RXyZXjzxYK3JHiqYziSkTGSgGORdptX-rwR8A@mail.gmail.com>
 <593cd0d3-8e06-0992-c155-1322014c0477@longlandclan.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 25 Aug 2017 09:53:40 -0700
Message-ID: <CAPLgG=ke+5kX5TuTtciVCxtCr6agpFMo-6peXfhbE0UCvy6M3w@mail.gmail.com>
Subject: Re: [patch v6 0/3] JTAG driver introduction
To: Stuart Longland <stuartl@longlandclan.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Oleksandr Shamray <oleksandrs@mellanox.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Arnd Bergmann <arnd@arndb.de>, system-sw-low-level@mellanox.com, 
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openocd-devel-owner@lists.sourceforge.net, 
 mec@shout.net, Rob Herring <robh+dt@kernel.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Tobias Klauser <tklauser@distanz.ch>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 25 Aug 2017 16:53:44 -0000

On Fri, Aug 25, 2017 at 1:50 AM, Stuart Longland
<stuartl@longlandclan.id.au> wrote:
> [Note: dropping vadimp@maellanox.com as SMTP server complained about the
> DNS server returning NXDOMAIN.  Apologies.]
> On 25/08/17 18:32, Linus Walleij wrote:
>> Gnah!
>> Whoever writes a slot-in replacement making the character device
>> take precendence wins lots of karma.
>
> What would such a replacement look like though?

See Linus's comments about using the existing kernel GPIO chardev
interface.  It already supports requesting multiple GPIO line state
changes in a single request.

>
> Some sort of system whereby you can read/write single-line commands as
> if talking to a GPIO expander over a UART?
>
> Would you access the GPIOs one by one, or would you perhaps map them
> into a bitmap (maybe arbitrarily, up to 64-bits wide) and perform masked
> operations on the bitmap?
>
> I'm no fan of the sysfs GPIO interface, but it beats poking around at
> registers behind the kernel's back.
> --
> Stuart Longland (aka Redhatter, VK4MSL)
>
> I haven't lost my mind...
>   ...it's backed up on a tape somewhere.
>
