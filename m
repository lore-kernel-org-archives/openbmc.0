Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCS5F0wjJzDvPb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 09:38:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V3K9Ymio"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fUcgsSWV"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E985920740;
 Mon,  7 Nov 2016 17:38:06 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 07 Nov 2016 17:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=qYMPb/Yk4/WFl//6ysVO+3MAyg4=; b=V3K9Ym
 ioco+3GX/OJwogjFVzv40KzW0+TWQN8F4e/c63ItK0RidCz1bVvusekZzqcI3kbo
 0smyg0dB+z/wrOCKAc0JqeLBi2uLASvkpa4nQ82bqTMVXwLwyEogLk94ksYdizmE
 dkECjMjiLgKkaVEzozrnkES1X1TLl/Ar8AFrc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=qYMPb/Yk4/WFl/
 /6ysVO+3MAyg4=; b=fUcgsSWVYBg5Jdzr8TIklgy1SP4D3LDOiwfI1df31PBJFj
 vesUcuDN0JiBzqVaxE4PGuFr43fv8FvF8zinTB5ihBXAwuY/Mcpa/+cZxaH06roP
 6xHA8u8q2gGveFIBOixdKfyGl/Wi6VdfS8u2Lad8p2U5515Hpfxk0JUdNUH7U=
X-ME-Sender: <xms:TgIhWP6ZWGp-KqzpohuKj5byP9__vPzhpmrcE6so96RtOffsU_vWdg>
X-Sasl-enc: gTIymaiMGFLnLKKpWTpO/VOiHPlN4sSS806qWi5D0fyf 1478558284
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9589DCC025;
 Mon,  7 Nov 2016 17:38:03 -0500 (EST)
Message-ID: <1478558276.6206.2.camel@aj.id.au>
Subject: Re: C++ Feature Whitelist/Blacklist
From: Andrew Jeffery <andrew@aj.id.au>
To: Nancy Yuen <yuenn@google.com>, Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brendan Higgins
 <brendanhiggins@google.com>
Date: Tue, 08 Nov 2016 09:07:56 +1030
In-Reply-To: <CADfYTpFJc1qp1tmwjeex6S7JTxmCQbJ7QyaOfqbPqqtdzNme7g@mail.gmail.com>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CADfYTpF_MtD2v07Rmopu11_VVo0SnzTKN73A9NqyBvtsTkSE_Q@mail.gmail.com>
 <20161107034425.GA15757@heinlein.lan>
 <CADfYTpFJc1qp1tmwjeex6S7JTxmCQbJ7QyaOfqbPqqtdzNme7g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9v2Clscw+9HJDmyBj8K/"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 07 Nov 2016 22:38:10 -0000


--=-9v2Clscw+9HJDmyBj8K/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-07 at 02:26 -0800, Nancy Yuen wrote:
> > =C2=A0 =C2=A0 The rules are designed to be supported by an analysis too=
l. Violations
> > =C2=A0 =C2=A0 of rules will be flagged with references (or links) to th=
e relevant
> > =C2=A0 =C2=A0 rule. We do not expect you to memorize all the rules befo=
re trying to
> > =C2=A0 =C2=A0 write code.
> >
> > In fact, clang-tidy has a number of checks for these rules to encourage
> > their use.
>=20
> I would love it if we could install clang-tidy to enforce these rules on =
openBMC's gerrit.

+1 for supplementing whatever document we create with tools. They can
get us a long of the way towards consistency, and any manually tweaked
inconsistencies can be discussed in code review.

Andrew
--=-9v2Clscw+9HJDmyBj8K/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYIQJEAAoJEJ0dnzgO5LT5tdQP/AlTH48Nn0UIUz4FCj8DnKZw
2wZTTBPdTTbDdjyDapSQvdBkkNN3D2DfL7z+/qOJm6iH+tPtyZIdiYYYUhH0TOHd
frPGxgsmFtqGYwJH79P+/j97yF0V3tljmAVaAz7rK8xXYBM23fS2rxdDS8LcSmMC
vEK3mhKIur2TAFiUEt14K3/tv/aPjbsaTqqiJkF1fUyk8sTq3AepcPtTzI0qzluf
U02sM/sH+VianEEDpGmfQ5MdLSOhueY7q0GQLzYV6IKBClDpJZ89pLUAqdDLqfNp
QMppILtDWIe+oIVT8X/UkW5d+dD7HPkTfjnsHSGoN4ULgjdD6HFg3qmdJzHUaG6R
EEgyMVIbbMM4KsAhBErOflSKXNk+E4G6PZWN5DZPh0ATjqn6xqAtPMDXn4UyQEDv
Fm41p79XgKXImT1/WcJ4YQG8dAyd5hKze3+XqksRtImjcIgVDeZ8W7jr7HdkjBP/
qjheoYgrrK9vo/a1AI8cQXGdkDjK3sIdf+TQ/GVLnqKovqfd5qLKfPYNHgMWwgNc
kQ1hCx7KTrKhSuZx+J7rpen71lAb5yjdeTijBsSREZ/i/CR/p7QEBR89SOK0j6/i
8IP5A/60KTEpr2F8uqeGZ9PORCUgj7dvBj7lM+vyqCGqqAUyjLM045Iqwp1xW29/
TaatHWHf7H6ZEf9YSb+p
=JTkY
-----END PGP SIGNATURE-----

--=-9v2Clscw+9HJDmyBj8K/--
