Return-Path: <andrew@aj.id.au>
Received: from homiemail-a39.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qTrBt1J9qzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 22:32:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ARPYTU0H; 
 dkim-atps=neutral
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id 168DA150078;
 Tue, 22 Mar 2016 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=qp9W5+KvFJRFk3sSs79g1
 eHEL7k=; b=ARPYTU0H0+SmhoEmn+t7BuIiMt9MY83djk4Dx+ixMTFg0LtDCAXwc
 auQbWeslbY4m+OVveoPpunWB/6MevpahVuhHkQvbrAXIwiGwRJWjSZ5whgkhk6K7
 JqlToiJJBFRR25ojsb3EukWiyBKj4hh0HXQZyNyU3BzXmnroY39gxY=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id F1D8B15006D;
 Tue, 22 Mar 2016 04:32:02 -0700 (PDT)
Message-ID: <1458646315.2336.23.camel@aj.id.au>
Subject: Re: [PATCH] runqemu: Add palmetto target
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Chris Austen <austenc@us.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 22 Mar 2016 22:01:55 +1030
In-Reply-To: <201603170742.u2H7gVIF013244@d03av03.boulder.ibm.com>
References: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
 ,<1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
 <201603170742.u2H7gVIF013244@d03av03.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RDsftUeWZimzUtSvdnKJ"
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
X-List-Received-Date: Tue, 22 Mar 2016 11:32:07 -0000


--=-RDsftUeWZimzUtSvdnKJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Thu, 2016-03-17 at 07:42 +0000, Chris Austen wrote:
> No network yet :(   Makes things hard to use.  Can you add an
> ethernet device?

Give this branch a go:

https://github.com/amboar/openbmc/tree/runqemu-palmetto

This time invoke `runqemu palmetto` (i.e. without 'slirp'): It will
configure tun/tap for full network capabilities, but you'll need sudo
powers for it to be successful.

Let me know what you think.

Andrew
--=-RDsftUeWZimzUtSvdnKJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW8S0rAAoJEJ0dnzgO5LT5B0MP/2nOrF6t6H0skwWdtWJ08ipj
4qzO4gRegev41jSqUmoW4IjJuKg3T5Tm3eXGmkxXComNSvz3Q1X4hqT4fKnlupne
cVpp27HzJ70NeLJh1B88Z0xqDm2r2dB2/GIe4hCKjBB/ywVZtQZWh7lHBySoX+X6
yczOCYlnj18kJEzf3l6DcpdzW6zGjQavJTjHtGqWlpRpck8xuSUB1FaE6Y0J40zJ
5sf6JzVtXtu/VcK+Ti7rm0/y3TvS/YXvhWfQgkNqupGCe3LO+a4fElR0osC4/rka
G54ziqftGwrIVrBW8e+O277tDqd0ZGUIFmihTVz/Q1N9OgdcB5Miv74x9vIv+ZzH
u6HqSkWQEGN42ZhcUpYgOb461V2ZtXGAMAL8c5xO520ugiOZJmRamQTrD/+JR+Wk
9mWOYjzutBPjD8ugs9fH21iD4pDLYc/c7dU8405T5fk+61Dy6c2ucJLueBEmn8Ln
nD1/qxvwKfI11do3w2gGpQhSywdEc/LkYEUx4zEhHiE+bJVOe1Jd2MN4TWHQ9ER9
f1sN5FbnnPCxGGAxciXJZWDasWyiRQN4VB6B0YZbCwBLpZ+iXqk/h0u8GLMUiv4Z
Q71RhYdEIRyGvkudau7LRRpBp7HIuodxwDKzZhZnNy7N5GCmAKBRSpBIuaaH9x5Z
06qm4LopUDJ5Ur7U5RKX
=VJ10
-----END PGP SIGNATURE-----

--=-RDsftUeWZimzUtSvdnKJ--
