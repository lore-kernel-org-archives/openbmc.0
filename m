Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwJVN4fxkzDqB2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 11:03:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=0AGSB8KJ; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 9661323DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1461805401;
 bh=3oYoLKOFYbe+YIXXPO69m6HpphCF3ob2te13fI4V7vY=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=0AGSB8KJN9axp7I7A0DcQO3i3HU+MEW0okvPkcUK3QZj31mQ4wzKPCwf6BOSkEZ4o
 gIhp49NgWSvKcuEppp8NpOOp6z4b8ptpEmld13WqiNm0BFWyUlSSQUXP65PNoAlFUT
 8agnrRXkujxSjtU/KlII/RHAzHdz1t3Pga4+zsJM=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 590C223D95;
 Wed, 27 Apr 2016 21:03:19 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Several general questions
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <DB4PR05MB0941B0F2D2CD2DA0062F5C7AD5640@DB4PR05MB0941.eurprd05.prod.outlook.com>
Date: Wed, 27 Apr 2016 21:03:19 -0400
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD5D45A5-25D7-4734-BC84-5396E79F0A0B@fuzziesquirrel.com>
References: <DB4PR05MB0941E4F3E91B9059E718B644D56C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8XeFo0-=wTNH_qvbE-ujCe-vYzpR-z_0CRop-0cYWVH+kA@mail.gmail.com>
 <DB4PR05MB0941B0F2D2CD2DA0062F5C7AD5640@DB4PR05MB0941.eurprd05.prod.outlook.com>
To: Shay Slobodkin <shays@mellanox.com>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Thu, 28 Apr 2016 01:03:26 -0000

Hi Shay

the yocto-poky dir is just a snapshot of the yocto project so we try to =
keep that vanilla.

I=E2=80=99d suggest putting it here:
meta-openbmc-bsp/conf/machine/include/tune-arm1176jzf-s.inc (note that =
these tune includes don=E2=80=99t go in the =E2=80=98arm=E2=80=99 subdir =
in upstream Yocto).

Then as more SOC layers that use this core get added - for example:

meta-openbmc-bsp/meta-aspeed/meta-ast2520
meta-openbmc-bsp/meta-aspeed/meta-ast-soc-based-on-arm1176
meta-openbmc-bsp/meta-other-arm-vendor/meta-other-arm1176-based-soc

they can all reference this tune file.

The file contents look good to me.

thx - brad

> On Apr 27, 2016, at 5:28 PM, Shay Slobodkin <shays@mellanox.com> =
wrote:
>=20
> Thank you guys for you quick reply and assistance.
> We have taking your input into our design, still digesting, and let =
you know if we have more questions.
>=20
> We have also added a tuning file under:
> yocto-poky/meta/conf/machine/include/tune-arm1176jzf-s.inc
>=20
> Would you put the file elsewhere?
>=20
> We wonder if there is anything else we should add/remove from this =
file.
> Current content is:
>=20
>    EFAULTTUNE ?=3D "armv6"
>=20
>    require conf/machine/include/arm/arch-armv6.inc
>=20
>    TUNEVALID[arm1176jzf-s] =3D "Enable arm1176jzf-s specific processor =
optimizations"
>    TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"arm1176jzf-s", " -mtune=3Darm1176jzf-s", "", d)}"
>=20
>    AVAILTUNES +=3D "arm1176jzf-s"
>   ARMPKGARCH_tune-arm1176jzf-s =3D "arm1176jzf-s"
>   TUNE_FEATURES_tune-arm1176jzf-s =3D "${TUNE_FEATURES_tune-armv6} =
arm1176jzf-s"
>   PACKAGE_EXTRA_ARCHS_tune-arm1176jzf-s =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv6} arm1176jzf-s-vfp"
>=20
> Thanks,
> Shay
>=20
>> -----Original Message-----
>> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of =
Joel
>> Stanley
>> Sent: Wednesday, April 20, 2016 5:08 AM
>> To: Shay Slobodkin <shays@mellanox.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: Several general questions
>>=20
>> Hello Shay,
>>=20
>> Nice to hear from you again.
>>=20
>> On Wed, Apr 20, 2016 at 12:26 AM, Shay Slobodkin <shays@mellanox.com>
>> wrote:
>>=20
>>> 2. Several u-boot versions were mentioned this week at mailing list,
>>> we currently use u-boot based on 2013.7 with porting AST2520 stuff
>>> from Aspeed EVB u-boot. Can you suggest a u-boot version to merge =
with?
>>=20
>> We're in the process of cleaning up the u-boot. You have three =
options
>>=20
>> 1. v2013.07-aspeed-openbmc tree. This is the tree used in Barreleye  =
2.
>> v2016.03-openbmc tree. There's a few versions floating around, but =
it's the
>> barreleye tree rebased on 2016.03.
>> 3. wait for us to add aspeed support to upstream u-boot. This isn't =
ready yet
>>=20
>> It might make sense to go with 1 with the intention of moving to 3 =
when it's
>> ready, but it's up to you to.
>>=20
>>> 4. We saw that most openbmc systems are using jffs2 file system. We
>>> thought to use ubifs as it has some advantages over jffs2. Can you
>>> share the motivation of using jffs2 for BMC project and is there
>>> special reason for doing so?
>>=20
>> This was a design decision made when implementing this part of the =
system.
>> Milton might be able to remind us what the reasons were.
>>=20
>> If you wish to instead use ubifs I think that it is a good choice.
>>=20
>>> 5. Some Aspeed EVB drivers such as USB, PWM were not ported to
>> openbmc
>>> kernel tree yet. We were planning to port them and wonder if there =
is
>>> any special reason they weren=E2=80=99t ported yet.
>>=20
>> As Chris mentioned, this was simply because we didn't require them.
>> Our dev-4.4 tree contains support for the following:
>>=20
>> - irq controller, uarts and timer. these are the basics required to =
boot
>> - i2c master. Only byte-at-a-time, no DMA support
>> - gpio. direction, state, and interrupts are supported
>> - internal rtc. this isn't battery backed so we disable it and =
instead use a i2c
>> attached battery backed rtc
>> - watchdog. required for rebooting the soc
>> - spi-nor. this is the mode we use our flash in; it supports both the =
SMC and
>> FMC
>> - ethernet mac with NSCI
>> - bt character device, for in-band IPMI communication with the host
>> - vuart
>>=20
>> As we didn't use the PWM, USB host nor USB device on Barreleye so no =
time
>> was spent on these.
>>=20
>> If there is interest in writing clean drivers for these devices I =
would welcome
>> patches, and can assist with review and integration.
>>=20
>> I'm no longer working on our own tree. My focus is now cleaning up =
patches
>> and submitting them upstream. Last week I sent out a series that adds =
basic
>> support for the ast2400:
>>=20
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-
>> April/422110.html
>>=20
>> I intend to follow that up with some fixes as well as ast2500 support =
today.
>>=20
>> Cheers,
>>=20
>> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
