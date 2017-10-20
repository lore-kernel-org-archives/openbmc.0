Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cQukNJlw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b97mYB6H"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJJk55GzfzDqBc;
 Fri, 20 Oct 2017 19:24:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B2EA220E28;
 Fri, 20 Oct 2017 04:24:26 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 04:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=6nJlzMJNjN9OW/iwtKQJ2fK9GG1xd6PWymDu4OpLlGM=; b=cQukNJlw
 IpPMN1tfn8kEKYeCRXIJkY8JfT8Rc81MlnJof4udMTux6mUU6Mu4EW+k8fPAjKnx
 +Qnk/TV5joSsif/ZGnrubb8f7BJlZa6N0Jq5yx5I68CbtKBakb2ZZX/m+tAdVjCr
 t5Ld7a5fAIJOUeq52AYujDWe1JorVzckcrSB9rprw4bJnL3Op1etEBIHWLbVGoQz
 kQMIcL8Ge3+m57YOJKgNizO32KfAU/SzS6kXKcpbT0EChwk8ea9WLobi7ZnUgvUW
 UtqL3IjdwyS8+ROcKsyIyZkvh16FXUzED/q0M1umDDhZLdQq8evfWLHAQmK6qX5w
 2b6Z7WUyQ54mZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=6nJlzMJNjN9OW/iwtKQJ2fK9GG1xd
 6PWymDu4OpLlGM=; b=b97mYB6HBi5WKIgGjzOwGRSmj3hMGRAhvb1sHKegedUaU
 L2/HH96iqkRDEiwdXMDQ5zqW9qL+7+w++PXHlpTrfpHfrn5+wmuRHjy0Moa0nIVm
 +WfH+QYZvxXDWXUzGadbLi+xYfCqfKbDDm8qTznfZinwh5UN4wGEdgXnjmOzB7rH
 BRVNkc4QMLHZAQHflP6/vs9iBbkSjyqRmuzWcf7D51NBbyQwJ2lXHHjZUqqaUKRJ
 gdR0McmGb0k4HPokYUEMdgKjBQdOqdVuUZwlXiGWRKayXFsSkSAvXiCia+tuAazI
 /8mI4SxSEkT+OacmjxM7ELYxuBawUBCHMTJAJrk4Q==
X-ME-Sender: <xms:urLpWe2N7zag7o6dWjJq3h4mObsIBDUF79DNB428tVF3xN3_yIXYEw>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F8532484B;
 Fri, 20 Oct 2017 04:24:21 -0400 (EDT)
Message-ID: <1508487855.24322.49.camel@aj.id.au>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Charles Keepax
 <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan
 <ldewangan@nvidia.com>,  "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,  linux-aspeed@lists.ozlabs.org
Date: Fri, 20 Oct 2017 18:54:15 +1030
In-Reply-To: <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-2-andrew@aj.id.au>
 <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-d48CUOoV9VuoK6rPhecQ"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 08:24:30 -0000


--=-d48CUOoV9VuoK6rPhecQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-20 at 09:17 +0200, Linus Walleij wrote:
> > On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
>=C2=A0
> > GPIO state reset tolerance is implemented in gpiolib through the
> > addition of a new pinconf parameter. With that, some renaming of helper=
s
> > is done to clarify the scope of the already existing
> > gpiochip_line_is_persistent(), as it's now ambiguous as to whether that
> > means on suspend, reset or both.
>=C2=A0
> Isn't it most reasonable to say persistance covers both cases, reset
> and/or sleep? This seems a bit like overdefined.

I definitely had some internal debate about that. I erred on the side of
avoiding potential change in expectations for the arizona. If you consider =
that
overdefined then I'm happy to go the other way.

>=C2=A0
> So can we say that is this flag is set, the hardware and driver should
> do its best to preserve the value across any system disruptions.
>=C2=A0
> We can change the wording of course, patches welcome for that.

Yep.

>=C2=A0
> But do we really need to distinguish the cases of disruption and
> whether we cover up for them or not?
>=C2=A0
> I would say we can deal with that the day we have a system with
> two register bits (or similar) where you can select to preserve across
> sleep, reset, one or the other, AND there is also a usecase such that
> a user wants to preserve the value across reset but not suspend or
> vice versa.
>=C2=A0
> I suspect that will not happen.

A very reasonable approach.

Cheers for the feedback.

Andrew
--=-d48CUOoV9VuoK6rPhecQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6bKvAAoJEJ0dnzgO5LT5xb0P/3hJ2tqH7oYshUwTVEJjSLd2
xjGVSS5Vqrmn7FwEwmk1lYUlNSERaM1NtKwGKCVSM6Xvf+3MJ5TuXvxJRCHiSAxC
qNerc80lrTZKuVNOwlfv3YCPZj5MHiNwynWaUoPuSIc0Y7iIWoYQl3oI5IhVVjQM
f+v+QHSEa26NYwT8LJIpOmfKgwzypl1g6oTELB3g+Bt3Ff49Smr5VzCvborOFBNs
W/qBybuf1qaKs/dv2hGLKpEULhVP+Y2L6zEL2zMd3URGlAvtCxBv3OsJMfHyQLDh
cac0ciSAepA+SxsDu1fXHzrQ2X0A/62MpCsgVY97fjaU7yXGLjZ4hgbIrN6HAPAg
s4c/PYjJZxkD1a1KhEumify8dpLXbVFLDv678/v6kc2MdeuETq0LZWo4tJ4JY/UA
Vk3J0Q0Uf3T+P5+5ZI2ZgSAbfJL0JE9ngshPjA65eWP6UTvIuq/KmMZKxmd2nRv4
DGrfzQONzTU7sbezF7oUOF78FejXU15Qc4YEifkSph9VLgUMpLa3BpJXRRUxhy00
8a/fxb7qDjU/H4eB7fYgPVsXzxIn2l03vVzAX8VMGSxEsjerrqUn2EF3NKj669xD
XSbBDvaeqyGF0FiC3jH9sLZYREKno/Jigh5D3xyO5lLTbyLWrh4V648cnn/0dMEl
w47nA2cEGma8s58k+HHT
=8Vaa
-----END PGP SIGNATURE-----

--=-d48CUOoV9VuoK6rPhecQ--
