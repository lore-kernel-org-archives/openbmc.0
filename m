Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qyybb2qHDzDqbF
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2016 18:47:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=G+c3gbyH; 
 dkim-atps=neutral
Received: by mail-wm0-x22d.google.com with SMTP id n129so98696521wmn.1
 for <openbmc@lists.ozlabs.org>; Mon, 02 May 2016 01:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc; bh=Z+YL3D+KS7a2V0WmOfGVnuarLQ/tdrSSZZ4cAX+KJV0=;
 b=G+c3gbyHXIeI8qcuv6IX02+VTV09xLfysjkLotUZt5NVhFr1P1EvVLeRSbvn785Lpc
 PBQhb1RyZXFLQx0vp5hkwS6x8qKvQh9+xhpmM7drDFwZ3sBfI12VPuLAYjSRfzF4R2bh
 5CtFxqsWIWnU9C9VmWEv9CM3qYOkXF9+8dp7uLuUfoVQzXthdKfcEuN0DCQ55Qud0OiA
 ZriMRRdvKajGkGvKYSkVD/Nk/0iUK6eutVdnJTgmHAvQO16wfMoIMs3YatJInWPV5zM+
 9N7QF6pbGQsG/ZBM7eHNbSgRvVlr1iZB4PP0Ijaj7c0bMvmFkY3YNM6BFfacmVxgSR3F
 JIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:date
 :message-id:subject:from:to:cc;
 bh=Z+YL3D+KS7a2V0WmOfGVnuarLQ/tdrSSZZ4cAX+KJV0=;
 b=Z5uYqo5bS0IBhdD6vSoG1wPTuo2UYDiDK5FBMLsh1K2hHilugUAsT2l23hXPBNlkqm
 +dm+I013kj3v/oLUc3JQ5EVg6f2Wo2f2U2rPPuuTXpw0U6YdYbyAMJlPMatK/yd1Z93f
 /0VwNX7TEvM5YG3m/ovnLWopUSEf9iDnAqmHs1SVgalZ9PnYTqX7SxqwdpLpT1xJdppa
 FnQjynVGs4/cvKres7XIp4CVj5cDcStLlS1grI3f/nG+g/ynyAS4kSkfjM9OM2ufr1oQ
 4UQpzO+u/uHMFijtnpWU8s+J178QyHsMjDdxeTG3jst2t/4OITWyvkbizDnFGOVaBUOp
 dcqg==
X-Gm-Message-State: AOPr4FUXRxZOyq3L0lBCaF5F8c494T4T94x05uKIt+zVacDMpC8e+c+IjGswniJpYGRPzQ==
X-Received: by 10.28.72.132 with SMTP id v126mr17838159wma.49.1462178822886;
 Mon, 02 May 2016 01:47:02 -0700 (PDT)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com.
 [74.125.82.41])
 by smtp.gmail.com with ESMTPSA id k133sm17611199wmg.7.2016.05.02.01.47.02
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 May 2016 01:47:02 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id a17so131195589wme.0
 for <openbmc@lists.ozlabs.org>; Mon, 02 May 2016 01:47:02 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.194.173.161 with SMTP id bl1mr12531012wjc.11.1462178822165; 
 Mon, 02 May 2016 01:47:02 -0700 (PDT)
Received: by 10.194.94.163 with HTTP; Mon, 2 May 2016 01:47:02 -0700 (PDT)
X-Originating-IP: [24.6.55.56]
In-Reply-To: <1462173181.3462.29.camel@aj.id.au>
References: <CADUykeoN5=KtG7FKuCOrDEY5u46VjJN3mvqmuC8CpkaemFrMNw@mail.gmail.com>
 <CACPK8XeO=pANLMuVKW-1MkJ3eRymHMynH0Q-PjjJNnTX-TeLTg@mail.gmail.com>
 <1462173181.3462.29.camel@aj.id.au>
Date: Mon, 2 May 2016 01:47:02 -0700
X-Gmail-Original-Message-ID: <CADUykeqs5FwXsZat1vv6=Znnhsid_Fb0rcwaPt7251CQX2GtsA@mail.gmail.com>
Message-ID: <CADUykeqs5FwXsZat1vv6=Znnhsid_Fb0rcwaPt7251CQX2GtsA@mail.gmail.com>
Subject: Re: qemu: Question about including Facebook's Yosemite board
From: Teddy Reed <teddy.reed@gmail.com>
To: andrew@aj.id.au
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 02 May 2016 08:47:08 -0000

On Mon, May 2, 2016 at 12:13 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-05-02 at 12:06 +0930, Joel Stanley wrote:
>> On Sun, May 1, 2016 at 5:57 AM, Teddy Reed <teddy.reed@gmail.com> wrote:
>> >
>> > I'd like to model the Facebook Yosemite board in QEMU, which from the
>> > QEMU model perspective, is almost equivalent to the Palmetto. The only
>> > requirement for the board, outside of the AST2400 capabilities, is the
>> > inclusion of 2 flashes.
>> >
>> > Here's an example of what I mean:
>> > https://github.com/theopolis/qemu/blob/bc20ef6a7a17f8424571234d4429e7e6b67f17e8/hw/arm/fbyosemite-bmc.c#L78
>> Great! This is really useful.
>>
>> >
>> > If you don't mind including those flash definitions in the Palmetto
>> > model I can save some QEMU complexity by not adding another board
>> > definition, which IMO is ideal. If that's the case, I can also submit
>> > a patch to add the flashes ASAP.
>> I'm torn. Similar to Andrew's work to get the GEM ethernet device
>> working in the palmetto board, I'm not sure we want to add hacks to
>> that don't represent the physical system. OTOH, it's nice to be able
>> to boot a flash image in Qemu.
>

Perhaps the AST2400 can emit an EVM board configuration (QEMU machine target)?

Then we will not cause derivation for the Palmetto, it wont set
precedence for adding several other "slightly different" BMC
configurations, and should facility hacking/thrashing/"evaluation". ;)

The existing ./hw/arm/ast2400.c can both create the SoC model and emit
the board, that shouldn't affect the Palmetto and will only cause 1
additional ARM machine going forward.

If this sounds cool, let me know and I'd be happy to throw up a branch
on Github that can be pulled into the openbmc/qemu repo.

> I think we need to be a bit nuanced about it to avoid throwing the baby
> out with the bath water. We haven't yet modelled the flash controller,
> and the hack (almost*) gives us the ability to boot the bitbake flash
> output file. Regarding the GEM NIC: we have a ftgmac100 QEMU model, but
> it has issues; having networking is an advantage if you consider
> running automated testing[0] as part of a CI setup. It's better if the
> models reflect the hardware but since they are not ready to go I think
> the benefit the hack is reasonable.
>
> We're in the right place if we're making an up-front decision about
> technical debt and having a plan for paying it down. With networking we
> can resolve it by fixing up the bugs in the existing (but not upstream)
> ftgmac100 model, and ripping out the Cadence GEM. In the case of the
> flash controller we have to write it from scratch, but we need to do
> that regardless. I think what we should push back against is bad code,
> which we can do with code review.
>
> Andrew
>
> * Should, with the DRAM-training-SCU-bit-workaround
>
> [0] https://github.com/mkumatag/openbmc-automation


-- 
Teddy Reed V
