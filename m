Return-Path: <teddy@prosauce.org>
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com
 [IPv6:2a00:1450:400c:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qptY64QjqzDq5y
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 15:16:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=prosauce-org.20150623.gappssmtp.com
 header.i=@prosauce-org.20150623.gappssmtp.com header.b=Z8ZqLiwl; 
 dkim-atps=neutral
Received: by mail-wm0-x231.google.com with SMTP id a140so147210205wma.0
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 22:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prosauce-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc; bh=PhhBbC5cUbNgT9sDSzk1Dn7mi/IWWknIbo+ruJAUw3c=;
 b=Z8ZqLiwlBToLZ/kNuFDTkdGTpD3K9HBE8qp+/wqlKFq9g8B7FNG9AfWrx4lQdjncY5
 CsAszS6PATku+nTlgJEU81kAwD4xmkho97SMS6ecKRLJJPs4a3kx2hLDS3qmt2VawDJh
 Y5r8kas0cmVENC6Q4xCpuvps2BFjxD2POl7xjHyJOeg5ec0ae4gMLUScCQbCNYgkabeO
 nMP4Xzl2ixtYxxU7Z3VyLVwkIeejoc7/+Yo2dTJ70l7xVVNYVXrcNhNl93uRnVbW8GC9
 /S5qo/TPAnkb402I3P6tnW+S6IpnBMshOsHO1P6/OijhoyTwaBlXK1M01fNvK6/ivCJw
 lZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:date
 :message-id:subject:from:to:cc;
 bh=PhhBbC5cUbNgT9sDSzk1Dn7mi/IWWknIbo+ruJAUw3c=;
 b=AalUos4zC9oJqBgTZQRP1SFnPu1Hbw9YhqhXdzDfRZb2pUVeB1FoMGuBRV2Wz4ioHh
 PiyO60hHErhFkmzAtVF7OViEXAPfBSAOg8cuU1b2DWDzd4sl9eCm/qZ7R+XrbC8ghvBg
 y3+KJXOUm1A8vajtDDsIVMs7DcQ8vVpWnv6gygJ3bad6SGVFvFJB1V7hraF/7/wmmark
 RNcyOC6nvC3IdHBCy0WwkAUScp7A6uuMuN2acbDxoY83N+IAxBqXzeyqYm6hrqXqC2jk
 9vsejM4O8m3Y6lH+DEr1UI1nLR39mMmz8hVO+Sj0T6JJha65puUIRyg6GUosQrbX0NOl
 +s7A==
X-Gm-Message-State: AOPr4FUwErAGSuSTSX8G4vG2n9il7yNLoZ6rTvu2uAMhyFYbB7KKebVPNcgrhYyLx9sezZh9l3eQiOxST6fVXQ==
MIME-Version: 1.0
X-Received: by 10.28.141.18 with SMTP id p18mr1269683wmd.57.1461043013812;
 Mon, 18 Apr 2016 22:16:53 -0700 (PDT)
Received: by 10.194.94.163 with HTTP; Mon, 18 Apr 2016 22:16:53 -0700 (PDT)
X-Originating-IP: [24.6.55.56]
In-Reply-To: <CACPK8Xd47ADhTRR-EEdmnLKrf6qUjPW+yMYDWOU2f3XgaFY9RA@mail.gmail.com>
References: <CACPK8XcnceWNFUNijp7haUvaBn9H607ceaMQN+pvKxYO0WuJVA@mail.gmail.com>
 <CADUykeqpzJfuk5=NXYMdLweBat6ujVLx_P-hfq063gCU80qLTw@mail.gmail.com>
 <CACPK8Xd47ADhTRR-EEdmnLKrf6qUjPW+yMYDWOU2f3XgaFY9RA@mail.gmail.com>
Date: Mon, 18 Apr 2016 22:16:53 -0700
Message-ID: <CADUykeo9-FXACRRdCEYBcNbP5=gmT3jT6pHTF-fQXRadu8e=WA@mail.gmail.com>
Subject: Re: Aspeed u-boot trees
From: Teddy Reed <teddy@prosauce.org>
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 19 Apr 2016 05:16:59 -0000

On Mon, Apr 18, 2016 at 6:57 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Apr 16, 2016 at 4:20 PM, Teddy Reed <teddy@prosauce.org> wrote:
>> I have a lot of time to spend with u-boot and I'm happy to help
>> however possible.
>> In tandem with the QEMU and kernel work you've done, it would be best
>> to begin upstreaming to u-boot.
>
> Great to hear! We'll let you push ahead with your work for a week or
> two, and then see where we're at.
>
>> I'd like to organize 3 patches to upstream:
>> Patch 1: I can attempt to bundle the most basic set of patches from
>> the various trees which are based on v2016.03 for the 2400 boards. My
>> goal for the first patch is the simplest possible bit of code, based
>> on the 2400 SDK.
>> Patch 2: From there we can iterate with support for 2500 and include
>> the fixups Cedric has to the ASPEED-provided SDK code.
>
> This sounds good. I recommend taking a look at the ast2500 support
> tree, as I think we want to move to using the g4/g5 naming for our
> platforms, and then we have the specific boards like ast2400-palmetto,
> etc. I plan on doing something similar for the kernel; you can see my
> current hacks here:
>
>  https://github.com/shenki/linux/commits/ast2400/base
>
> This is the u-boot tree with ast2500 support:
>
>  https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500
>

Ok perfect, I'm aiming for something you can test in two days. My
initial refactors failed miserably, but now I'm doing a CB
(continuous-brick) on our most complicated board, the Yosemite-- and
making a bit of progress with the SDK cleanup and SPI driver refactor.

>> Patch 3+4: Finally, in a perhaps another two patches we can add the
>> Palmetto and Facebook board support.
>
> Let me know whenever you want some testing. I have a palmetto with
> socketed SPI flash on my desk; it's handy for recovering from
> accidental bricking :)
>
>> Any recommendations on how to support the SLTs within u-boot, or
>> perhaps recommendations or examples on how folks "vendor in" these
>> sorts of tests? Ideally they would still exist in the output u-boot
>> code for validation testing and runtime debugging.
>
> Could they be standalone payloads that u-boot runs? I can see how this
> would introduce it's own challenges, but it would decouple you from
> u-boot.
>
> I had a poke around the chromiumos u-boot, and they appear to keep a
> top level directory with their own hacks in it.
>

Good suggestion, I'll take a look!

> That's a tough one. Perhaps we could start a discussion on the u-boot list?
>

TBH I haven't researched or dug at all into out-of-tree application
builds. There might be existing tooling already. :D
I'll reach out to the mailing list after I do some homework later this week.

> Cheers,
>
> Joel

Take care!
-Ted
