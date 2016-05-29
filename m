Return-Path: <teddy.reed@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rHsyp3hYmzDqP9
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 07:17:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=oFJY0GCP; 
 dkim-atps=neutral
Received: by mail-wm0-x243.google.com with SMTP id n129so16888535wmn.1
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 14:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc:content-transfer-encoding;
 bh=eElnxGy5PoWOKByJ0tpnGL8w6EY0i+YTXtvlB6D5t1g=;
 b=oFJY0GCPaXReXa9D4aueYdYYfs/X5XMG7fLyVWArjwHbu0L0LepQQ/VKW2RWOoD7BW
 FLTSIV80oFVN5D3cqu6OE3pqqN7qLbS9ZRyKDGklxUfkU4NSBPI7SrPuHQOnCJPqaliu
 ViNvqmU+VjhLaEzP715gmMeBwlfK9P5fR1DpUbR5ghedM/Bmy+ZILkjeBSCT0FrVQzxv
 GLiojbe2/QLeoin3HJrqUsBA6Immo49iJqDOrj8xTYEU5OCB6+eEDe3msrYnEE7+KnBe
 NLv6VMVFuIXncUbZHk9kyTLiNEQH7mvOY7pF5M7n9B0zD5DbeGtJz4BcfaxMecx1RN6Y
 ejrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:date
 :message-id:subject:from:to:cc:content-transfer-encoding;
 bh=eElnxGy5PoWOKByJ0tpnGL8w6EY0i+YTXtvlB6D5t1g=;
 b=TvMeuqg3J5EZ5pPv9a+y9LZtCy+QNN2ZmQgk3rPkl8wLO4Jfl4NalPn28iX1rYnTyR
 IMAiaQ/tzI2PhXJ8IucgKHls3/jqYau8iOJVkvziV/b36grznNWKK7t2xQvzRg/09qIq
 aa78WZdivLw8v166XptErz1VbVJRDbzjpoum+JZj/fGy6LriOULP/YLc+Cn5Xk/OUnAI
 3aTmMHEZI2eR4S/PmjDvYj0I0yypnNzjTdZHHuvR+Hb3deNVlup1Bxhj0TOy//aLIFXD
 P3CBGHgSseGmM7uMMR7yR9B3awaCLGJFMMmQWOB2mnVecmZVzUUnmgQ5oau9j5Os1prd
 8hkw==
X-Gm-Message-State: ALyK8tIIhoXrznK7UI1xkZgPB3VpnZiAWs38QNHLC7jSJj931G9tl5TIRwBSwW2RTp55Pw==
X-Received: by 10.28.230.200 with SMTP id e69mr2691310wmi.53.1464556638027;
 Sun, 29 May 2016 14:17:18 -0700 (PDT)
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com.
 [74.125.82.41])
 by smtp.gmail.com with ESMTPSA id j6sm30933715wjb.29.2016.05.29.14.17.16
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 May 2016 14:17:16 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id n129so60880527wmn.1
 for <openbmc@lists.ozlabs.org>; Sun, 29 May 2016 14:17:16 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.28.168.71 with SMTP id r68mr7464303wme.44.1464556636382;
 Sun, 29 May 2016 14:17:16 -0700 (PDT)
Received: by 10.194.94.163 with HTTP; Sun, 29 May 2016 14:17:16 -0700 (PDT)
X-Originating-IP: [24.6.55.56]
In-Reply-To: <1464135594.20948.16.camel@aj.id.au>
References: <1463638966.2703.209.camel@aj.id.au>
 <20160521223211.26848C6042@b03ledav006.gho.boulder.ibm.com>
 <1463981199.2703.286.camel@aj.id.au> <57431FE2.3000506@kaod.org>
 <1464135594.20948.16.camel@aj.id.au>
Date: Sun, 29 May 2016 14:17:16 -0700
X-Gmail-Original-Message-ID: <CADUykeqC1BzLXmCzySK+oLQ3euPGm=PJ3cpb_74LbuybaMG35w@mail.gmail.com>
Message-ID: <CADUykeqC1BzLXmCzySK+oLQ3euPGm=PJ3cpb_74LbuybaMG35w@mail.gmail.com>
Subject: Re: Aims for BMC emulation in qemu
From: Teddy Reed <teddy.reed@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Chris Austen <austenc@us.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, patrick@stwcx.xyz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sun, 29 May 2016 21:17:23 -0000

Wow, sorry for lagging behind in the discussion! But I love all the suggest=
ions!

This 'hybrid' approach definitely fits my need for boot testing and
enabling rapid development for the more-dynamic userland and
non-driver tweaks of U-Boot/Linux.

If possible, and I think this is the current MO, can we use the
openbmc/qemu as staging for changes to be up-streamed?

On Tue, May 24, 2016 at 5:19 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-05-23 at 17:21 +0200, C=C3=A9dric Le Goater wrote:
>> > Any work-arounds included in the fork should have an obvious immediate
>> > benefit and a plan to phase them out, and if that's not the case then
>> > they should be rejected. If it's more work to maintain the hack than t=
o
>> > implement an accurate model, then we should do the latter.
>>

To fit the hybrid-approach, the development board models for the SoCs
can be the machine targets for the non-accurate models. Then you have
an ast2400 target that may include some work-arounds or devices that
allow for more-rapid prototyping, as is common with devboards. This
fits with several other qemu ARM development boards too-- like the
vexpress suite.

The board-specific models, like palmetto-bmc, can be held to as
absolute of model representation as possible. For these boards, no
work-arounds should be managed/merged, IMO. This makes for healthier
and more-manageable up-streaming.

>> Are we planning to use travis to boot the generated flash image with qem=
u ?
>> and eventually run some tests in the guest ?
>
> That's certainly something we should be aiming for, in addition to
> something we can use to smoke test u-boot/linux as part of the hack-
> compile-test cycle. With a view of using qemu as part of CI I had a
> pull-request open against openbmc/openbmc that patched the runqemu
> scripts to integrate the palmetto-bmc machine, but Patrick had concerns
> about my approach there so the pull-request has been closed for the
> moment.
>
> I plan on taking a quick look at integration again shortly as some
> relevant patches turned up on the openembedded-core mailing list.
>

--=20
Teddy Reed V
