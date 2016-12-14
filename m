Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdzf1746hzDt3H
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 01:36:09 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14817261630181008.767427433649;
 Wed, 14 Dec 2016 06:36:03 -0800 (PST)
Date: Wed, 14 Dec 2016 08:35:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Message-ID: <20161214143556.GA13350@heinlein.lan>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 14 Dec 2016 14:36:10 -0000


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:55:00PM -0800, Jaghathiswari Rankappagounder Nat=
arajan wrote:

Jaghu,

Bringing the discussion back onto just the OpenBMC list.

Thank you for getting this out to the broader Linux community to solicit
feedback.  As you see, even if things look good to some of the kernel
devs here from a "is this generally how the kernel does things" and "is
this code generally of quality to be acceptable upstream" there is a lot
of history and design decisions on something as large as the Linux
kernel for any of us to all keep track of.

When we are adding support for a new device of a type already supported,
like an i2c-eeprom or a thermal sensor, it is fairly easy to assume
we're going to go through the upstream community.  When we are adding
something new, like this 7-seg display, there is more likely to be
resistance.  Maybe Joel can weigh in on, going forward, how we get early
feedback so we don't spend a lot of time working on code that will never
be accepted.

I read through the current responses and the referenced email chain from
2013 with a similar driver and there seems to be two major points in the
feedback.

1) The chip you are driving the 7-seg display with is already supported
as a SPI-attached GPIO controller.

    It does look like that driver plus SPI_BITBANG might allow us to
    control the GPIOs on that device as a normal GPIO controller.  Is
    that something you would like to try out and see if you can get
    working?  Hopefully that would reduce your code to just the
    translation from character to GPIO settings.

2) The community isn't interested in a one-off driver like this.

    The thread from 2013 raised points about how a 7-segment display
    driver isn't generic enough to support "X-segment displays".  One
    of the authors mentioned how some displays have a decimal place that
    can also be lit.  This lead Greg K-H to the decision that it would
    best be handled from userspace.

    I believe Google has a desire to get post codes from the BMC U-boot and
    kernel, hence why you tried to put it into the kernel?  Are there
    additional reasons for wanting to put it in the kernel?

    I see three possible solutions, and there may be more:

    a) We use SPI_BITBANG and the GPIO driver for this device (which we
    probably should do in either case) and use device tree "hogging"
    of the GPIOs to set the initial kernel post code.  This will cause
    the kernel to light that display correctly as it is initializing.
    We can then write a userspace application to manipulate the GPIOs
    after that to change the display as appropriate.

    b) We go back to the LKML with some more background on why we would
    like this in-kernel, as in something unique to the BMC requirements
    that needs the support in-kernel, and see if that makes them more
    receptive.  I'm willing to help you work on the message here if you
    would like.

    c) We see how willing Joel is to keep this as an out-of-tree driver.
    It seems to use pretty generic and not-likely-to-change kernel APIs
    so I don't see this as a large maintenance burden.

    I suspect we would tend to prefer (a) but I don't know if that will
    still allow it to meet Google's needs.

Feel free to catch me on IRC today if you'd like to have an active
discussion on this to get things moving faster.

--=20
Patrick Williams

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUVjKAAoJEKsDR8wtAMEZUlYQAKAvUY8oZdF7o0eFMsFPbWFv
q4TNrzs4Qj/67dO2OzjS61jDUGhtXwh1jIhd/sdrStLJBfM6KBXuLtXoNCRJ1kU3
fKPvIAC5XdwXmURJSYY3QwsqQxLgkZPu5pxGNeBUB4DF8igoq34f0rOOzTZmTWW7
CJuH7EPiEPyrqLOqyeh2c7MkrGlRC9PdVfHhrTHEMNcw8sObOiKdR7RhEe9oECmn
DVdvZL+RufuN30oa6jEbqSHcOffbgh2ZvcFrtIqGdiRVRY9C4QLLZ70cH+EP1cMZ
ffuNVhkuofKg4CGZnV/j/ZBKiy1296Fnk5DSfjHsuNcJkbiZ/0EFuoq0CBpk8CGg
Dw4x4gJBl2GmZHoGk2ZnUJM2ROyaIQ1eNaoSlbMW/yxz39IlStFVKQZ3tp3TbY2g
7t7q74XdBLIVeixU3+WeCWI9LFzV1ljH5PkadI+c/J6Em6W2Dk/rwLjVAxgwBQny
Rboddo7ZnPIBPEEJzKtENJ+6q9mb5GI0d/BP+OWsWEXtHcPLINPD2Xt72oKZ3TxT
cB5fT2pTrptZfiEvQh2j3DwCkknZh89qlaqsc2Pz/LFfN1MqocT59C5a8ufPGGMW
I+wk27O0iXMY0OdgHDC3VQ+MaFCrMhCvHGc7yjblDvKxqPo29Ns5gc9IIRJLiHSg
3OMqgxMnz14BzXNFtrVa
=wsit
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
