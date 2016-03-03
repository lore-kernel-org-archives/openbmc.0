Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id C22DA1A0060
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 16:14:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=FsAWcmYt; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 4E84B76C06B;
 Wed,  2 Mar 2016 21:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=CEL3KTGyY/q2F6m15KnWi
 QapkEs=; b=FsAWcmYt2iLmrS7sOeXj9svpSW2s9ogf3XzVcGpazR7aVMwHXC3J9
 cWFGGxb0kjIMdqMIZkPs209/SUwzwKMDvj7BorwKoZHnO7lPsKhCTjxKix5QOwdf
 2R3MN4oFi3VXxlz8cYmFrMIA6FYuocfkSr1lLQsMunHrhl4dEDpn2A=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 27FBB76C069;
 Wed,  2 Mar 2016 21:14:35 -0800 (PST)
Message-ID: <1456982069.10265.11.camel@aj.id.au>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400
 AVIC device model
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org,
 qemu-arm <qemu-arm@nongnu.org>
Date: Thu, 03 Mar 2016 15:44:29 +1030
In-Reply-To: <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-3-git-send-email-andrew@aj.id.au>
 <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-591C/syFYX7g9A77MvsG"
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
X-List-Received-Date: Thu, 03 Mar 2016 05:14:39 -0000


--=-591C/syFYX7g9A77MvsG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
> > +    case 0x20: /* Interrupt Enable */
> > +        s->int_enable |=3D data;
>=20
> Are you sure this only ORs in new 1 bits?

As in, am I sure I only want to take the newly set bits? If so, yes, as
the the following register serves to clear the field's set bits:

>=20
> > +        break;
> > +    case 0x28: /* Interrupt Enable Clear */
> > +        s->int_enable &=3D ~data;
> > +        break;

The 'int_enable', 'int_trigger' and 'edge_status' fields all use the pa
ttern of separate set and clear registers (the remaining registers may
benefit from the extract64/deposit64 helpers, I'll think about that
further). I'll add some comments to help clear this up.

Otherwise, can you rephrase the question? At face value it seems like
you're implying that I'm doing more than ORing in the new 1 bits?

Andrew
--=-591C/syFYX7g9A77MvsG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW18g1AAoJEJ0dnzgO5LT5rNYP/2qAbk2FUu5gsNohItjdtiIE
WZ1DnujXLW7XZApj45Zx2sWl0BPkYfUz2HVNbitxPJMNlBunTfXR1IKuMGDi7lU7
7qOzKmiWntdleG4W+1DBSALd/ypkDqaE5QGnpfZz3s9tyedXX4YB1g2iJUeZxzEL
xGqLmLtPu591tCWFmJNJ49QcstXCDLCDU4UVsrHfReEgzinrWXqhD5zDt+uhXxsb
WDKrUeKV2payBGUa++L1GiBJuCALwF42t3OdM0g9KY+Toq1oM92YStgEyagLDj1Z
QAXbp+NeRWqSFqoRUNmyNmGhR9IwzYF1epsjXnMKxflXzWItoVGTkkuCNWuTj8SM
+K7f0tof4jrIgFPPauUeaPmeOGJFU5kkxrmkuHxOS1Bmyk/hhnoN0Sv6VDW0kSim
JaZIA8cqRNpj0RXUM2z5Lip6jJXNkwDgvk2B2wc/fm+H083QjfB/inzYqNrqa8YZ
VlevIWVMvBp7D3bthzo08pTqlF0U2DBt6wId+EVTM0KUrwcVEKNc3H2bMB7eDLiy
0463rYqW93/hSJXd1vYUdYBeLXNK75WpMFVPH3Ri+uOmjA6WfEJutMEHtaBItueA
aKQeGHeMVxRsN3x+hPTySq6I0Ancn3ZqiWpOFMNzJigJ2YMAlViY3vw18YbjVZbk
W7YKoObxJoHSL3slUTEo
=FRDD
-----END PGP SIGNATURE-----

--=-591C/syFYX7g9A77MvsG--
