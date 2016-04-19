Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com
 [IPv6:2607:f8b0:4003:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpp730z0lzDqDV
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 11:57:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kGf/8ZOM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=AGGKR0rH; 
 dkim-atps=neutral
Received: by mail-ob0-x243.google.com with SMTP id 4so156692obi.2
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LcXkPbVTGp/Cjp0PGMSlWXn3PvGCgMjBiuwap9g5Nys=;
 b=kGf/8ZOMaNEtT4/LnyoAbx/rODciBkmbVtTf4LFQ7z03ruDzlsL7M7ZU+LhYyiFxX+
 DqtxxTzu/iJrrISRabLNToUdMsCWIsoha8WaFbBq5vpJpvpRqLJ9Pvo+fMbaJq4J2o8m
 DyfaLCCf+sWtCzNlRffsiCFWYHyt91vBf8KFJzaXlVMj6029LQ98jkBaueG/xv+Txtsv
 oI6LT9E4Knh77P6GDo0K3hIZi5+rtymWG8QAvQtimKLFLqI/eg0NHnILG4sPtWKL/Wyx
 c/W/v04y7iFH48nEiYpsiFBFJMNQmlmsNIqaPNh8Q8mj0eIBMfYgnMDwMc68xtX1vpE9
 LZOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LcXkPbVTGp/Cjp0PGMSlWXn3PvGCgMjBiuwap9g5Nys=;
 b=AGGKR0rHnS9x4SXVEce/SKK7wCqQqFHSlsFXy+Ao5iIIWlayH9oAGjBbAFVeICixB1
 b4x9MDPCGo9uZPniDvUSFYpx0l1kjyAgjZAWzQpF8jxo6hgSfG/ubSyHD9l2hjqjQ8wk
 3mpj7YTwILYn4cHqjLmRaJ+KqyIo8zEv8YfSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=LcXkPbVTGp/Cjp0PGMSlWXn3PvGCgMjBiuwap9g5Nys=;
 b=F3InUy4a8t5gCywxKC7eJFzaqRzANXPcpZKAW6RZjFa3V5NHHK+5BORJ1qHKRAIiPz
 GEa8n9R4LY8feZUyDEnDqOSV8CgkPg+6NyU44GTu4UOJ+OpvOzK3iJSHYwK6oMyrFPh0
 YSIRDWm3849MJranM8+ArykOVbnXgnUYzuO8cYLAw/+w1fjcQyzk5IPyBPRTxqwqVGD7
 IqiEQVbRjUkVi0l6kg0Sz+hDbvjVq+2ziA81aE2LHuGDE2X6WP4Be+2EsIuC3xucpUmQ
 0Pyo36AJr8I6RbTpkNLTZtBv7bM8j51X7YVb5gzVWNkXKdoKZk+wgxYaU51A5bYqEoEZ
 PeKQ==
X-Gm-Message-State: AOPr4FUF/VCC6AxDX5vAS6A1zE73qY4XhwV+nu8raMLu3Rlg8FQw7CXAZGyf8VdyULKNasGJSt6eIXVgjbio3g==
X-Received: by 10.60.45.105 with SMTP id l9mr109582oem.23.1461031052538; Mon,
 18 Apr 2016 18:57:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Mon, 18 Apr 2016 18:57:13 -0700 (PDT)
In-Reply-To: <CADUykeqpzJfuk5=NXYMdLweBat6ujVLx_P-hfq063gCU80qLTw@mail.gmail.com>
References: <CACPK8XcnceWNFUNijp7haUvaBn9H607ceaMQN+pvKxYO0WuJVA@mail.gmail.com>
 <CADUykeqpzJfuk5=NXYMdLweBat6ujVLx_P-hfq063gCU80qLTw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Apr 2016 11:27:13 +0930
X-Google-Sender-Auth: SGxZQoRafaORXPPdZR96Y9RTT7Y
Message-ID: <CACPK8Xd47ADhTRR-EEdmnLKrf6qUjPW+yMYDWOU2f3XgaFY9RA@mail.gmail.com>
Subject: Re: Aspeed u-boot trees
To: Teddy Reed <teddy@prosauce.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@fr.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 01:57:36 -0000

On Sat, Apr 16, 2016 at 4:20 PM, Teddy Reed <teddy@prosauce.org> wrote:
> I have a lot of time to spend with u-boot and I'm happy to help
> however possible.
> In tandem with the QEMU and kernel work you've done, it would be best
> to begin upstreaming to u-boot.

Great to hear! We'll let you push ahead with your work for a week or
two, and then see where we're at.

> I'd like to organize 3 patches to upstream:
> Patch 1: I can attempt to bundle the most basic set of patches from
> the various trees which are based on v2016.03 for the 2400 boards. My
> goal for the first patch is the simplest possible bit of code, based
> on the 2400 SDK.
> Patch 2: From there we can iterate with support for 2500 and include
> the fixups Cedric has to the ASPEED-provided SDK code.

This sounds good. I recommend taking a look at the ast2500 support
tree, as I think we want to move to using the g4/g5 naming for our
platforms, and then we have the specific boards like ast2400-palmetto,
etc. I plan on doing something similar for the kernel; you can see my
current hacks here:

 https://github.com/shenki/linux/commits/ast2400/base

This is the u-boot tree with ast2500 support:

 https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500

> Patch 3+4: Finally, in a perhaps another two patches we can add the
> Palmetto and Facebook board support.

Let me know whenever you want some testing. I have a palmetto with
socketed SPI flash on my desk; it's handy for recovering from
accidental bricking :)

> Any recommendations on how to support the SLTs within u-boot, or
> perhaps recommendations or examples on how folks "vendor in" these
> sorts of tests? Ideally they would still exist in the output u-boot
> code for validation testing and runtime debugging.

Could they be standalone payloads that u-boot runs? I can see how this
would introduce it's own challenges, but it would decouple you from
u-boot.

I had a poke around the chromiumos u-boot, and they appear to keep a
top level directory with their own hacks in it.

That's a tough one. Perhaps we could start a discussion on the u-boot list?

Cheers,

Joel
