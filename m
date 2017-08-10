Return-Path: <sdliyong@gmail.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSlS00ySWzDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 20:56:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SfWH5Jo1"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id v77so1517586pgb.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kVu0pkjZjCNNJOMYeOxvpAMIJPzlUb6DnOMDbb5rVew=;
 b=SfWH5Jo1U0nt86974dlJ5GEbc3SzkrO0wxa8dmfJCxzRK/m+y8QtaX0Q9jb07dtxMt
 vlRUo2UcHhVRWvwPthUEPCaOc1GztB5oPNiqsr4njzFCcihO4tDbup25/kkCl/jt3ewP
 30CSM6Mu8h7nkhi22roTQTK4/2Z6j4sd9Lnaq93IzcfH2UfExZFmnKFYRJacmt5Bg5LX
 vmABonUaRIKqox9cMnrRhEsl81FV5r0zBqO9Ou4wgQV57wGo6yBtGG5XyDzdgSOK39Kk
 wnvXN2I5j9/tMfZanVLelS1JawdHk3yKZKKH7E2cZqkwz4kxjif4m7exAoboFICbF4Uc
 CODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kVu0pkjZjCNNJOMYeOxvpAMIJPzlUb6DnOMDbb5rVew=;
 b=E8d4XgB22BWOzalvG+fAeJyRGmff41LIjusqjfcyoTUpoXAw1p/qBu7TpgDsQsb5hj
 1itOCrQRoBkoB+PcYrhAKFhPh0M7DwbJH5uzzOYzQwyK297iLpg6gPTKlmhUTY7Y0ZO8
 hgvGOMShmgLsVnMoBw5laXTW/HT1hj6M6SnId39wMk0YlBppHH1HBHCyh5CWkLnL3A6u
 TX1B1lbIQQvRmhbQQnB3HfKHIfPpVii8a4TCvY8oVaZBi+o8vvY7dOIDdpFYbYYGu11W
 FENWga9vCg1fry5AZzcSywxElCSiq7HrcCuXJicAFYJRpD8jtH5e4KMx/oif23BbClfP
 R5Eg==
X-Gm-Message-State: AHYfb5hDJKr0hXMAWwL6wku5PGFEy8KVksxqXCxZbwsuYjPLw8B7iexq
 NvOHAlB7pqjIcByQ9HofJCrvCZ0rJ2Foeyc=
X-Received: by 10.84.130.108 with SMTP id 99mr12376002plc.76.1502362574391;
 Thu, 10 Aug 2017 03:56:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.170.77 with HTTP; Thu, 10 Aug 2017 03:55:53 -0700 (PDT)
In-Reply-To: <1502359910.7946.17.camel@aj.id.au>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
 <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
 <1502359910.7946.17.camel@aj.id.au>
From: Yong Li <sdliyong@gmail.com>
Date: Thu, 10 Aug 2017 18:55:53 +0800
Message-ID: <CADO9-pe3Q6ZrODj9cfPEYPBVoidN3Mgj9ek++vXMnTrH8JC_qQ@mail.gmail.com>
Subject: Re: AST SOC gpio pass-through support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 10 Aug 2017 10:56:16 -0000

Hi Andrew,

I am thinking about "DYNAMIC DEVICE TREE". Maybe we can use it to
change the gpio pass-through dynamically?

Let me study on these docs

Thanks again!
Yong



2017-08-10 18:11 GMT+08:00 Andrew Jeffery <andrew@aj.id.au>:
> On Thu, 2017-08-10 at 17:01 +0800, Yong Li wrote:
>> thanks for your quick response Andrew!
>
> No worries!
>
>> i will read these info deeply. just a quick question, is it possible
>> to enable/disable the pass through dynamically after kernel boots?  how?
>
> So there is the concept of runtime pinmuxing[1]: It's possible for a
> device to have several pinmux states that can be configured/selected
> from process context. Alternatively, a naive approach might be just
> unbinding the driver for the device you used to select the pass-through
> mux function(s) - this would free up the pins to be requested as
> regular GPIOs. However, you'd need to request the mux on a device node
> other than the pinctrl node, as unbinding that would have undesirable
> consequences :)
>
> Hope that helps.
>
> Andrew
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/driver-api/pinctl.rst#n1385
>
>>
>> > > > =E5=9C=A8 2017=E5=B9=B48=E6=9C=8810=E6=97=A5=EF=BC=8C16:28=EF=BC=
=8CAndrew Jeffery <andrew@aj.id.au> =E5=86=99=E9=81=93=EF=BC=9A
>> >
>> > Hi Yong,
>> >
>> > > On Thu, 2017-08-10 at 15:50 +0800, Yong Li wrote:
>> > > Hi all,
>> >
>> > Welcome to the list!
>> >
>> > >
>> > > AST SOC supports GPIOE pass-through function, I would like to know i=
f
>> > > the kernel provides such API/interface to enable/disable pass-throug=
h?
>> >
>> > Yes, the kernel's pinmux drivers can configure GPIO passthrough for
>> > you. In general, all the functions are documented in the pinctrl
>> > devicetree bindings:
>> >
>> >    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt?h=3Dv4.12
>> >
>> > Specifically, you are after functions/groups GPIE{0,2,4,6}. We already
>> > have these defined in the Aspeed DTSIs, so to configure them you can
>> > add something like the following snippet in your devicetree:
>> >
>> >    &pinctrl {
>> >            pinctrl-names =3D "default";
>> >            pinctrl-0 =3D <&pinctrl_gpie0_default
>> >                    &pinctrl_gpie2_default
>> >                    &pinctrl_gpie4_default
>> >                    &pinctrl_gpie6_default>;
>> >    }
>> >
>> > Specifying the mux configuration in the pinctrl node is probably as
>> > good a place as any, though if you have somewhere more relevant you
>> > should probably use that. Naturally you can remove any of these
>> > phandles to only select the specific pass-through configurations you
>> > need.
>> >
>> > If you want to pass-through the whole bank you can also set the board
>> > strapping to make it the case right from power-on. The strapping
>> > register *is* writeable, however the kernel's pinctrl driver treats it
>> > as read-only, as really, the system designer ought configure it either
>> > via pull-ups or in the boot firmware.
>> >
>> > The passthrough capability is a bit of an odd case - despite being GPI=
O
>> > I chose to represent it as a pinctrl function. Hope it makes sense to
>> > you.
>> >
>> > Cheers,
>> >
>> > Andrew
