Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qR3DL5B1YzDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 09:38:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=hNYGb/HU; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 7B0AD4B0063;
 Thu, 17 Mar 2016 15:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=cqSiTP+f081ogCDcMI99R
 IfS9O0=; b=hNYGb/HUrl46vCd2mOELNP4RIt9zcHi5l1+rOfYYG8o7TmDGJnPrt
 fkBuXjjIxvxeuSKXBzDBGx6v4gLgxgjSuA0tpBqJdTp487JIaBe8rNpuw1dP7itX
 biQoQ9TmYO0vK2aCVXAwgzmXkzTWoMf7dyEHXMuEUN9tj15zFUxB/I=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 865B64B0062;
 Thu, 17 Mar 2016 15:38:40 -0700 (PDT)
Message-ID: <1458254316.27546.21.camel@aj.id.au>
Subject: Re: [PATCH] runqemu: Add palmetto target
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Fri, 18 Mar 2016 09:08:36 +1030
In-Reply-To: <201603170742.u2H7gVIF013244@d03av03.boulder.ibm.com>
References: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
 ,<1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
 <201603170742.u2H7gVIF013244@d03av03.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XJZvUZ3ZEHlYBqV5wN5L"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 17 Mar 2016 22:38:43 -0000


--=-XJZvUZ3ZEHlYBqV5wN5L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-17 at 07:42 +0000, Chris Austen wrote:
> =20
> Add your command to the same help file here you see the existing
> qemuarm target
> =20
> You can now run 'bitbake <target>'
> Common targets are:
>      obmc-phosphor-image
> You can also run generated qemu images with a command like:
>      runqemu qemuarm <<<<<---------WHERE EVER THAT COMES FROM

Yep, thanks for bringing that to my attention. I'll fix that.
> =20
> =20
> =20
> I hit a build failure, but it went away the 2nd time I tried.=20
> Probably just ignore unless that is an interesting data point.
> =20
> | ERROR: Function failed: Fetcher failure for URL:
> 'git://git.qemu.org/qemu.git;protocol=3Dgit'. Unable to fetch URL from
> any source.
> ERROR: Task 71 (virtual:native:/home/causten/openbmc
> -barreleye/meta/recipes-devtools/qemu/qemu_git.bb, do_fetch) failed
> with exit code '1'

Interesting! So the same thing happened for me also, but I tweaked a
relevant part of the .bb after the first run, and the second run
succeeded. Correlation is not causation. Who knew?

> =20
> No network yet :(   Makes things hard to use.  Can you add an
> ethernet device?

Baby steps ;) If I have time I'll take a look at gluing an adapter in.

Thanks for testing!

Andrew
--=-XJZvUZ3ZEHlYBqV5wN5L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6zHsAAoJEJ0dnzgO5LT5RcUP/1svFmAolAygpp7zYt7PU6uX
1csN1gzn0dQ106FPrVGcFxs6nnCvPbVCzgKcNv3Rq0rjRB2e/UavR0oyUKz0PPaM
cKPl92wlOA58AP2vEFLqoICS9TCUDUf9717hh/zryinCciwmfzTHo9SV1IEroWDw
9crQIivURB9pEnkVWfAv6zUbr5S5k5VkJjEPa+aRAbDk8eh6vAw+WHYDlFlWTIe/
dnNffDyJOrNzETuXWVok7MTkgPeAoDBqpjIYHy9PW9SIk3PkoXxlBg8msIVnvr4a
jXQRV5JBApxy+OcxEuvkGHACvVBcOtqNaTD+DmXYvpRPuK18n5PwlWDxfGl0eC4Q
/boCX4axkOqiQ17IhqCq9lhYWtuozjav8hCet7v7TrpxN1RzY1ZFtrNYC0C1Ev+S
plDOUhKg4QUeCrtLtfuQ7A/IkXwcXR6JJMTCpJ1SoxP8Knvr4J1MEL95Wl/NRcbh
DGIbv35ZUyce8R4nS0shauOlfshXc0XBMIaQpiq2jGGfPfTC/BHMpbQ1hiDbR+hv
iFFR5XtCQm5ADesS4TgeBXksxOf5HaLToC66cU51pPtItfSC23NTTfpO4s+GagCe
MltTih6tu9HXGGUQQKQ5d1oGEY6+vlYcfYqlKBCIoV464jDmOw5ospNWM1yW3w83
EkoJiLe+E/YaQ1FGvvch
=cYNj
-----END PGP SIGNATURE-----

--=-XJZvUZ3ZEHlYBqV5wN5L--
