Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rGDhL1J7rzDqZZ
 for <openbmc@lists.ozlabs.org>; Fri, 27 May 2016 15:14:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=DByijBRX; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 60C471030063;
 Thu, 26 May 2016 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=R+tTIKqjP68InTIx2gMje
 6ht2Ls=; b=DByijBRXArQjQBqmGgX3c/Kb7W6GHD5ZbWm9U1KK2dczRVBsWiFb0
 /9J3iaSsy+feH+M3K33o+hhehYlOAZMLXcYfmoNQolXwcr980S9QAKaVhMSf6GNF
 B1gjCZHUlrKEA+6OKXpM4c07RAlou9LYpABxhQVr0reuC0IsES1ud4=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 4D0251030062;
 Thu, 26 May 2016 22:14:06 -0700 (PDT)
Message-ID: <1464326033.8430.34.camel@aj.id.au>
Subject: Re: [PATCH qemu] hw/timer: Add clock value matching support to
 aspeed_timer
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Fri, 27 May 2016 14:43:53 +0930
In-Reply-To: <CACPK8XdAJ5U-mrWgb99-SQdZTrn+WoZKV9qbPmOpXhyJ7YCDtg@mail.gmail.com>
References: <1463713461-5444-1-git-send-email-andrew@aj.id.au>
 <CACPK8XdAJ5U-mrWgb99-SQdZTrn+WoZKV9qbPmOpXhyJ7YCDtg@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-TO6RcbJE2EWajcYcTz1F"
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
X-List-Received-Date: Fri, 27 May 2016 05:14:11 -0000


--=-TO6RcbJE2EWajcYcTz1F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-23 at 17:00 +0930, Joel Stanley wrote:
> On Fri, May 20, 2016 at 12:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Clock value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=3Dy on
> > the palmetto-bmc machine. Two match registers are provided for each
> > timer.
> Thanks for implementing this.
>=20
> We also boot much faster now.

I've sent this to upstream with fixes applied for your comments.
Thanks!

Andrew
--=-TO6RcbJE2EWajcYcTz1F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXR9eRAAoJEJ0dnzgO5LT5VugP/jO1E6JmDo+T4HirfSuDJENd
WuGG8mg/8U5cjWSIM4zsomxYMENkJaabDoxZWQum028r1fDXDqM8LtghYqFDXVOa
YRqF1lbLSpY5mFvJO0210gLxyI/Gmfx/jEqOh6/V84x1wlGJaQC7O6PlMgi5e0rI
pMc2xV2ePvNVJkq0QKcSHGnxefLQxgudOc5qBCWcAD3KuiWhrDsR2w389Hgm0vhK
9E0ebsxykDSDbm6HUREpEFGeQeSigcjgg/pehv2nfzXFIexLTHrU1hjs0LyL+fUz
w7jtKLG+kyBzGCc5QYJ7NFAyjOJy57o0rhvzAOuwIUwmPygpbaq/wgyGB820zf4f
0V5MNhog6zJXmvlyBJ/bw1jiBDNe4JfCdBZqgs+1FDMPjhxLocS5pXGon3KQRjKM
p2+QJJ+IrDQ04+JdXZWM3frivDs8iTrXMDsleuZT9E/emMLCVJKOiqmEB8FB7bas
8XT5NroOuRzvMHQj9nFqhaRQy+/DQaEO1XKWY3liYnP9gbzAg/SZb4K/SOA5ScgX
sAcBULTpPuS3J5C3mo79QYpPgOa1GW7ebpUSXQ7NiqK/jXCvZ+xwkcZbjmKzSp6M
U3A9uFwmyuZ63oy+Ofb6si/DMnv+kNqDKhTuEN+m7VKamfNkW61Vo6IsPdJKoaSW
29GNDWgQooN2+N5EbeOt
=nW0S
-----END PGP SIGNATURE-----

--=-TO6RcbJE2EWajcYcTz1F--
