Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9C9l1cfLzDqCK
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 10:48:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=eMDEECqx; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id DE8B04B0063;
 Wed, 18 May 2016 17:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=d9XlnXgy1WgfZQp6xQymk
 IHvS9k=; b=eMDEECqxrWqyq7YXs8X13Agc0tJp3cC87RzxD+g5kb2Wbo9K5k9S9
 cicn/ogCsJHE6JoHukJGrsHWQdL3lk+A7typ+2b7y6AQnrkt+BRvfSnTW/xqLH+c
 PVi8tlNMf8ZTy9CcPrhOda4QxQBaTlrowPKz/8b88nwj4oE05nrh5k=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 48C8C4B0062;
 Wed, 18 May 2016 17:48:37 -0700 (PDT)
Message-ID: <1463618909.2703.124.camel@aj.id.au>
Subject: Re: [yocto] Extending runqemu/runqemu-internal with new machines
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>, Patrick Williams
 <patrick@stwcx.xyz>,  OpenBMC <openbmc@lists.ozlabs.org>
Date: Thu, 19 May 2016 10:18:29 +0930
In-Reply-To: <CAJTo0LayTmPkF9qO0SrybbLWVdQh_T7K-+xW_JYAF2K5=nM2fQ@mail.gmail.com>
References: <1463447715.2703.112.camel@aj.id.au>
 <CAJTo0LbX7qrAc5e0OSJzTJ=ish7rLuGzm9LA7LbKF4DK+jy+PA@mail.gmail.com>
 <1463559230.2703.118.camel@aj.id.au>
 <CAJTo0LayTmPkF9qO0SrybbLWVdQh_T7K-+xW_JYAF2K5=nM2fQ@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+AwUHkGjVvlduDd6RTs2"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 19 May 2016 00:48:44 -0000


--=-+AwUHkGjVvlduDd6RTs2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-05-18 at 12:09 +0100, Burton, Ross wrote:
>=20
> On 18 May 2016 at 09:13, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Thanks for the pointer. Is this the patchset you're referring to?
> >=20
> > http://lists.openembedded.org/pipermail/openembedded-core/2016-March/11=
8982.html
> >=20
> > A brief look suggests it might get us some of the way there, but I'll
> > take a more detailed look in the next day or so.
> >=20
> I was actually thinking of=C2=A0http://lists.openembedded.org/pipermail/o=
penembedded-core/2016-May/121180.html.
>=20
> Your use case is exactly what this sort of work is aiming to solve
> (put the machine-specific qemu knowledge into the BSP instead of
> runqemu) so feedback would be greatly appreciated.
>=20

Right! Sounds good from the cover letter, fetching the patches down
now. Thanks for pointing me in the right direction.

Andrew
--=-+AwUHkGjVvlduDd6RTs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPQ1dAAoJEJ0dnzgO5LT53B8P/R2uo9AfbWBGSnHTTMYMroiC
DktSZObXRIX35Ufe2auprGE1MdU+0U73RJoGO68nfaMJSfiH8s4lbMzeP1Xywd7Y
ewHVrBV5vFd1CjpHGfvNm0aPlgg58WOSIyHMLTAHagyFMG3zxfDlRnMdPKhPMOl1
Yu1ZQYv3SnIiEB2dkccAzxAujgtXtAhMOjzxj176jIj5MZc2iOZ/+nnjK5VJKDix
i/32sgZACd19oOV+qMMQ3qI3eciCVV1x0Gngl/BUCfFpySGitpAFpGVGADHzX9Pm
R4jIg0ibK9iQbDHHhb7DN+q9tDn6Tk3BGHAemtfB2Pe8Np4dtKC5nogzuIbdymJa
jSRu8z9vJNfV4TJ6jRTo2DcvSQBPXkxDCyVAgLYseSFljapqmRnIIWjALr4GpNrh
mbgb6wzyTX7LV2WlxBWD8IeYsrpKczLckLdwDAvx2U7qKj+2PzB3gb598LQ9/EPH
Z1GfHTZqmK/FnoN5rD/0F5lB0C8WI/cPaadIrGECMllCfeD9QqjpjE3gMkfHPiPt
sasp94wi/EMTsdTGUxQfgJBk3hqJsw2vzkSqAVlBQq6vghcSUlQiZYrT8KJLAD3w
bysAB8NIBHmLzBzrvofkcwMHqwVlPHrU+5x3ezeIjmWJrh0+PT4/rC8wqzWeOQ58
DkZt2VXk2U1ztlOq4cME
=ZW+y
-----END PGP SIGNATURE-----

--=-+AwUHkGjVvlduDd6RTs2--
