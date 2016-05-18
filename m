Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8n6B0c1fzDqCJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 18:14:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=j3HJZJBO; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id 8E285334076;
 Wed, 18 May 2016 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=lViFlmHTPWpzB8Yuw+OWF
 64OF8Q=; b=j3HJZJBOrbSgtt3FOf49rq/crcjkl8leI7EcSkgQFB25Zh4Jfp/sv
 4W4PTNDXwaIerA71iJw3kTJshpMrnHAML0aAlO16a21tUmTh0FuD7PTmlVNrmJIy
 ohXROTZ/Np0kzGeBK/SzFgSsNZh+5Cq4pZhblGgqdOzdET75bXvBGM=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 743C7334075;
 Wed, 18 May 2016 01:14:05 -0700 (PDT)
Message-ID: <1463559230.2703.118.camel@aj.id.au>
Subject: Re: [yocto] Extending runqemu/runqemu-internal with new machines
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>, Patrick Williams
 <patrick@stwcx.xyz>,  OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 18 May 2016 17:43:50 +0930
In-Reply-To: <CAJTo0LbX7qrAc5e0OSJzTJ=ish7rLuGzm9LA7LbKF4DK+jy+PA@mail.gmail.com>
References: <1463447715.2703.112.camel@aj.id.au>
 <CAJTo0LbX7qrAc5e0OSJzTJ=ish7rLuGzm9LA7LbKF4DK+jy+PA@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1IaYjFqGZjdMFM3fQtVv"
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
X-List-Received-Date: Wed, 18 May 2016 08:14:11 -0000


--=-1IaYjFqGZjdMFM3fQtVv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

On Tue, 2016-05-17 at 14:20 +0100, Burton, Ross wrote:
>=20
> On 17 May 2016 at 02:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Is there a better way to work that might avoid these issues?
> > Alternatively, should we start looking at reworking the
> > runqemu/runqemu-internal scripts such that we don't have to patch
> > them
> > to support our use-case? If so, what sort of approach would the
> > community be happy with?
> >=20
> Dig back a few weeks and you'll a RFC series by Robert Yang
> refactoring runqemu for exactly this problem.=C2=A0 I've not yet looked a=
t
> it myself but if you could see if that solves your problems then that
> would be much appreciated.

Thanks for the pointer. Is this the patchset you're referring to?

http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118982=
.html

A brief look suggests it might get us some of the way there, but I'll
take a more detailed look in the next day or so.

Andrew
--=-1IaYjFqGZjdMFM3fQtVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPCQ+AAoJEJ0dnzgO5LT5brkQAJaObLVIrRnT/+H1lDX6o7yG
8d44sg7tdi60XRZcb1QsKRtbCSttYo0X8SipoUqkwCQDdIUe8K9vm0XlFtHtIrBr
4G3/tkOfkZZp5o0XeNoq9wcDL1RIx03HBNRPlIc2sjD2s+IcVAX7BVAeGwNX2GIT
zv0WAxOa3SuL+VhzPvLgtBry9doGqd92B6Ii2Aspn17prrdWUUELFM3S0QCQr5HB
mMt1U/bR4Qw+gl6DQ981aS+crzzOMhTyMigAcQos2HEoh6RsP3S5kobxBOWaM45g
3fViPf0+A+RdAGVIlY8Bj5YBzDdM/840Z1sDlelujAIOMUruAPP0KpK1Bogb3P28
DJ1xFYzQu6pS/IcM3v6x9xfwvTdv0rfU/q27vHVRkJ2Q9e46awljJN9v/GPMQr5l
MOsba3FgaZPKihkEyBsFPKIEk85M4w/5GOAqaQNJGkNGR3F/FAawlll11DSmyXg+
JH1qB8WXgnykkhk6kqo1NuSWuqtdHWK8/K3OqynsTjvNdjv1bskYXm7lN/B96XxZ
/eQzQfRDWze30VY4D2PB2o2HrGcsgCGzdkDLuYV7NjzNVBVutS/CtTddwEDty7Ui
/4zE8giPYCgeO+QPh7FnF2Dx+3/jo5I8yuK4GcmPcqPCrXDi9GDbtsWYFTk/oH37
PKw3/OlEA8tAMIvNLn/6
=SLs6
-----END PGP SIGNATURE-----

--=-1IaYjFqGZjdMFM3fQtVv--
