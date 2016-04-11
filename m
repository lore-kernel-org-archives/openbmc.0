Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjwqr264szDq9m
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 13:42:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=OA5HFTsL; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id vv3so855764pab.0
 for <openbmc@lists.ozlabs.org>; Sun, 10 Apr 2016 20:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yd5/bFEft3F6VDiOC884jWisWDNBAKuF1ab6o63S24=;
 b=OA5HFTsLKQwoGk1bhcVgzY+h7EeQC23yjtrmaZaz80NWE3sMo4aIUoWsVB8DLglu03
 vdX0c+mNHY6V8/6TULNZHXuwzZgJHmxBiUbVePsRGo6gKa6WJTHvAerhz8AGydGIVEBt
 Xk7Zu56sXQsTm/yi3We9nntLXHBuHD5m3woDY6F5ooNhdGAsceweggbsJ0sYQcPDLa5T
 Knt6JowRfwAjJo5eYRyB/iKTKDGilrYt1Cpb+fBfcTZkK1NZwOgPm1lnbryl/E/EYKwM
 fhZoaZyVZ9doYuOyZHHicbjEPMXx0uzPFRd5Wei5wF9fw5mJmnISXQgaluN8leFWMxVJ
 f/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yd5/bFEft3F6VDiOC884jWisWDNBAKuF1ab6o63S24=;
 b=m47HSXd4EJlUmC1H/gO+sDv7ViYwlPLLqzua3YYsvhfTffdGF5ExxoqSA3g3neUh2R
 mvVxnVGZ9zJBcumX+VxXFlom66cbnCysxr7NxdwDBc9PJ+n0r1OOlGlH6A4a2Jah2sPQ
 sw5uFuJ+8LUIZZwTkCJipWiemYb3KNJgx5SxZcRI9gUSRf2t/0NjwAm2hR8Gvn0FHk4S
 2/BLlCAuwjDq0WcW59ltpV4YIHmsw9zWMbM+aXcQll8MLsbdsOjbHFzZiftA9fsM5aFV
 7K5TSmRUcM5+OFAvbTNJvhypw8o246LGjQCzJSe6LgSc6jDpNaIUaIucHaqZhujtvzyV
 V0IA==
X-Gm-Message-State: AD7BkJKKhb/BRhRbrANric3M61WLBMECu/H3P4dLqK/cyyo9P18GMMzR8LF6DoWziMMKqA==
X-Received: by 10.66.118.106 with SMTP id kl10mr29675356pab.78.1460346150196; 
 Sun, 10 Apr 2016 20:42:30 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id v74sm32127356pfa.7.2016.04.10.20.42.27
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 10 Apr 2016 20:42:29 -0700 (PDT)
Date: Mon, 11 Apr 2016 13:42:18 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@fr.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc v3 1/2] meta-phosphor/u-boot: Move to newer version
Message-ID: <20160411134218.68c9d659@camb691>
In-Reply-To: <5703D8D5.3090203@fr.ibm.com>
References: <1459778435-28142-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459778435-28142-2-git-send-email-openbmc-patches@stwcx.xyz>
 <5703D8D5.3090203@fr.ibm.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 11 Apr 2016 03:42:32 -0000

On Tue, 5 Apr 2016 17:25:09 +0200
C=C3=A9dric Le Goater <clg@fr.ibm.com> wrote:

> Hello,
>=20
> I have given some time recently to the OpenBmc U-Boot and came up with
> a first initial port of the aspeed code on a recent version, v2016.03.
> Here is the tree :
>=20
> 	https://github.com/legoater/u-boot/commits/v2016.03-aspeed-openbmc
>=20
> There is still quite a lot of cleanup to do, the code has warnings, some
> configure defines are probably obsolete. This is clearly not finished yet.
> But it is usable.
>=20
> These compilers on jessie generate a u-boot.bin file which boots a
> palmetto bmc with success :
>=20
> gcc version 5.2.0 (crosstool-NG crosstool-ng-1.22.0)
> gcc version 4.8.4 20141219 (release) (4.8.4-1+11-1)
>=20
> So if some of you has time (and a flash programmer), could you please
> give it a try ? I will be glad to have positive feedback. You can curse
> me if not :)

Hi Cedric,

Took me a couple of days to get around to actually booting it, sorry. Now
that I've done it though, nice work!

DRAM Init-DDR3
CBR0-1357135670123456701234567
CBR134Done


U-Boot 2016.03 (Apr 08 2016 - 14:53:05 +1000)

I2C:   ready
DRAM:  256 MiB
WARNING: Caches not enabled
Flash: SPI Flash ID: 19ba20=20
32 MiB
In:    serial
Out:   serial
Err:   serial
H/W:   AST2400 series chip Rev. 01=20
Watchdog: 300s
Net:   aspeednic#0
autoboot in 10 seconds (stop with 'Delete' key)...

It appears to work how we want it. By default it just boots exactly as befo=
re.
I tftped a kernel and initramfs and that works fine.

Thumbs up from me,

Thanks,

Cyril

>=20
> Then, I would be interested to see how we proceed from there to include
> more changes.
>=20
> Thanks,
>=20
> C.=20
>=20
>=20
>=20
> On 04/04/2016 04:00 PM, OpenBMC Patches wrote:
> > From: Joel Stanley <joel@jms.id.au>
> >=20
> > Fixes from Milton for u-boot leaving ethernet device running after
> > loading linux:
> >=20
> >       net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
> >       net: aspeednic: Do not start hardware in initialize
> >       net: aspeednic: Remove extra spaces before assignments
> >       net: aspeednic: Do not fill in a random MAC address
> >       net: Implement random ethaddr fallback in eth.c
> >=20
> > Backports from upstream from me to support building under modern GCC
> > versions:
> >=20
> >       common: main.c: make show_boot_progress __weak
> >       ARM:asm:io.h use static inline
> >       arm: board: use __weak
> >       net: Implement random ethaddr fallback in eth.c
> >       compiler*.h: sync include/linux/compiler*.h with Linux 4.5-rc6
> >=20
> > Signeo-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb =
b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> > index 6070fbf..f2434ad 100644
> > --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> > +++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
> > @@ -10,9 +10,8 @@ LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a56=
51ecb \
> >                      file://README;beginline=3D1;endline=3D22;md5=3D78b=
195c11cb6ef63e6985140db7d7bab"
> > =20
> > -# This revision corresponds to the tag "v2013.07"
> >  # We use the revision in order to avoid having to fetch it from the re=
po during parse
> > -SRCREV =3D "4b44678c11ac82c7c797bb115e276181752ad54d"
> > +SRCREV =3D "44f1262bdf39ad93032d39f17a298165372be82e"
> > =20
> >  PV =3D "v2013.07+git${SRCPV}"
> > =20
> >  =20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
