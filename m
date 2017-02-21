Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22f.google.com (mail-yb0-x22f.google.com
 [IPv6:2607:f8b0:4002:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS7H93QGCzDqHQ
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 15:45:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kj9xQI9B"; 
 dkim-atps=neutral
Received: by mail-yb0-x22f.google.com with SMTP id u130so14077596ybb.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 20:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yZalW1wJthO/L0hz3EDKtC4XG8gUNL+0NrybRhAO1tY=;
 b=kj9xQI9BUjvye9wcwI77BDgwDoJ/CA8RagP0rlPNpxz26WTnyJAsEtTrL10OtLyhqO
 Dk7rsDQoLVZfnL3XwRAX5uh/3TIfCXhFHvJsyBroolh/99OkA21tQUHU6H4UsJDDn3ey
 ATPmR6FmdRZCrp8a42KJLTA/7euixyUA96gECyjN1APdXKakaEJZI0sJU2OtEczmu9Hh
 YVIy8viOdUKQ4Tpo9AZMCqOl6iDH6lEMqMa61cFlYI5EubNF6I2XsWwr3DEPfJeB1DBK
 vAI0TRSUOIC6BDInrVka/PUS73G3HCMAfGni+0p6mQCwl8trkBeFH80cnJtxoevMrjzA
 AIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yZalW1wJthO/L0hz3EDKtC4XG8gUNL+0NrybRhAO1tY=;
 b=It6F11WYhJHsWr2arX18dDLc3zSMR/qwNFgUj75wKJaTG5L/BVsUte67h4e0bJVOE4
 sbbusP+NDznVNE5DvRQQ+n4r1GskMKpskNQFjUQxMaJlay0dRwpq8mNhHTZUBaGmmsbM
 0GIDCPJs7+bvY45XbSKdHJIK+sK50RaK0MNN1IJUS9mN0eUcbe48aBxHQqmWoCfCg3h+
 fyT2xrHpGEEKRTFBtVg+RolcL92ZByXxsVF58TGG2g1I4Nomy1QU96FslZYXkaS1YbLC
 XfeWWcaxC56ofp5meFaPqySAdvvF4U9ODZrRdFxQn2xzQQ68qg9KyaWIrRCCo7+ksfUf
 f6Gg==
X-Gm-Message-State: AMke39nyEijNTkIM/7hkb4ftogyJcZmOCiDG+YhW0ZTYZba3ToR2yhUGq/+6/XXdEumBMWJjEypFbZNL9QHGrg==
X-Received: by 10.37.70.66 with SMTP id t63mr19107747yba.196.1487652354906;
 Mon, 20 Feb 2017 20:45:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 20:45:34 -0800 (PST)
In-Reply-To: <20170221041653.GA21380@heinlein.lan>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
 <20170216140524.GA5077@heinlein.lan>
 <1487299721.16373.2.camel@gmail.com> <20170221041653.GA21380@heinlein.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 15:15:34 +1030
X-Google-Sender-Auth: JJD5-KQfV7sycOj72_7Xi-JIiEw
Message-ID: <CACPK8XdiK4p_YkQJdroQjDtAgf89uO0dOtnMF8N2g8OspEFacw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for zaius
 and witherspoon
To: Patrick Williams <patrick@stwcx.xyz>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Jeremy Kerr <jk@ozlabs.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 21 Feb 2017 04:45:58 -0000

On Tue, Feb 21, 2017 at 2:46 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Fri, Feb 17, 2017 at 01:48:41PM +1100, Cyril Bur wrote:
>> On Thu, 2017-02-16 at 08:05 -0600, Patrick Williams wrote:
>> > On Thu, Feb 16, 2017 at 04:49:22PM +1100, Cyril Bur wrote:
>> > > -         flash_memory: region@94000000 {
>> > > +         flash_memory: region@98000000 {
>> > >                   no-map;
>> > > -                 reg = <0x94000000 0x04000000>; /* 64M */
>> > > +                 reg = <0x98000000 0x04000000>; /* 64M */
>> > > +         };
>> > > +
>> > > +         vga_memory: framebuffer@9c000000 {
>> > > +                 no-map;
>> > > +                 reg = <0x9c000000 0x04000000>; /* 64MB */
>> >
>> > Do we really have to allocate 64MB to a VGA framebuffer?  We can store a
>> > 4K resolution monitor with 32bit color in 32MB, so why is it required to
>> > reserve this much memory?  Between this and the PNOR memory region, now
>> > 1/4th of the BMCs memory is reserved.
>>
>> The reservation of 64MB is because the hardware is capable of using
>> 64MB, therefore the host can use that region of memory. We're playing
>> it safe here by ensuring the BMC doesn't use any of it to avoid any
>> possibility of the host corrupting BMC memory. This is the most generic
>> dts for the platform so we've gone with stability over performance.
>
> Is there anything the BMC can do to restrict how big of a memory map the
> host side of the VGA can open up?  If there isn't we're going to have to
> allocate this much on all systems because we can't trust the host to
> "behave".

Ben and Jeremy have been enhancing the host driver to be smarter. Ben,
what's the state of play?

Cheers,

Joel
