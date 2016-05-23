Return-Path: <andrew@aj.id.au>
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rCn914j1czDqCj
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 15:27:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Wr0JMexs; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id 789885EC07C;
 Sun, 22 May 2016 22:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=tnoPhmER6ngsjjJYVao+j
 1lIhVc=; b=Wr0JMexsE8G9QmEeMDvt09f9tWsQDHUbbV04T2nXGa1WKFbUaScFZ
 T6f2o/g8mBfjHMp1uZuAGiFX89ZyKaW98t/LQdLiQG+Y+qjDUKJ8zetDaeg/EaIP
 BQyob1yi70VSUGFypdmCe4n5jPB8JLFiD/b77crwPcx/026JnOAbGI=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id AF4525EC079;
 Sun, 22 May 2016 22:26:57 -0700 (PDT)
Message-ID: <1463981199.2703.286.camel@aj.id.au>
Subject: Re: Aims for BMC emulation in qemu
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>
Cc: clg@kaod.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 patrick@stwcx.xyz,  teddy.reed@gmail.com
Date: Mon, 23 May 2016 14:56:39 +0930
In-Reply-To: <20160521223211.26848C6042@b03ledav006.gho.boulder.ibm.com>
References: <1463638966.2703.209.camel@aj.id.au>
 <20160521223211.26848C6042@b03ledav006.gho.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-AD6RH4UGZPVQ+jcTSbos"
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
X-List-Received-Date: Mon, 23 May 2016 05:27:02 -0000


--=-AD6RH4UGZPVQ+jcTSbos
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Sat, 2016-05-21 at 22:32 +0000, Chris Austen wrote:
> So in short I think we want to create a build environment that allows
> for inaccurate systems.=C2=A0 Over time that environment should grow from
> palmettoish to wedgeish, Zaius and witherspoonish

I tend to agree.=C2=A0

My thoughts are that in general we should try to work upstream first,
and to only send upstream something that's an accurate reflection of
the hardware. However, sometimes there are work-arounds with desirable
short-term benefits, and we should be able to accommodate these too.

As an alternative to a number of machines with different levels of
accuracy, we can give the qemu fork on github a defined role: To host
our integrated short-term work-arounds as we develop the right models
to send upstream. As a concrete example, whilst the ftgmac100 model
isn't functional, have the fork provide the Cadence GEM as a NIC. Once
the ftgmac100 model is functional, send it upstream and replace the
GEM.

Any work-arounds included in the fork should have an obvious immediate
benefit and a plan to phase them out, and if that's not the case then
they should be rejected. If it's more work to maintain the hack than to
implement an accurate model, then we should do the latter.

Is there any opposition to this approach?

Andrew
--=-AD6RH4UGZPVQ+jcTSbos
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXQpSQAAoJEJ0dnzgO5LT5XBcQALegtxDRSCvB3iTqUS2r6zHX
wc6fW9KuD3SCES2dcxfoEuhnMXf8cu07pQzyO7BcSBTRdEK9H1N37Su/dlsamkek
kq8c6xDbE6J/hvOHuslk60j+jexu+Nw2bi6HjzZEENYOV7guZm95gYrhg6WAHeOK
4ZYSBEO0VRC6LmV2BNjcLmCxeFvXCc9dA/KnbajMe4+hRaeXRNI3WKQOuM9EJxq2
b1TnxlCkQ5vQcA+AUNNHjPJP448xNeDQ7iho0gwCOfRZk/iaxuC5HIhFIaHzTnem
fYt8RV/3k+0ZYTt7u0RauUmEvpmGZJ3B/IMHyqICMVWqUycVIdGrYUhfRrUN0qDu
jvXj3wGSC/N3G5e/jbC9aSxuSxL66sqmGxxBhBwyzDGU8aHZI6S80dA3T8ptyG6G
n3uR+xhu3738I44/gi8w/wzL1E+/2d8DDqI1j6lJ/9667I3RyqB6gRVgwXSWNtoU
SSLKtlYokprVZiqEyRTVpVTxyG8RYQxJ/xbcIgHenunNcY+jcpDThxZRSSYCrjNl
+QuYWTZsqrsHNqjeJa2jjLfT/5wnvMN3vBS7cNlapu3EfoHEtHolmirqWlEXvWvx
It+Fy1YVwSbjUMltgqPvJaZMyB3dQ6uxphTVZGhcXgskyqeWg6kDiz0w2I4+81z/
AtARJuBAU/xjohOOsVyL
=QX1M
-----END PGP SIGNATURE-----

--=-AD6RH4UGZPVQ+jcTSbos--
