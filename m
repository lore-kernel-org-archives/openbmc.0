Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XPO5pgKQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UqlHwCFj"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9yKR6nfbzDr4T
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 11:14:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 25C1121713;
 Mon,  9 Oct 2017 20:14:32 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Oct 2017 20:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=tyhhafPY3MqR5HmG4YUvDB046h2KR+iFhrWUxIno3
 ZU=; b=XPO5pgKQElxNPTDeQltJAJ2+TeRu33irbf1YLg7flMukiBqsm2jCYAh90
 mZI+2yDPw+sXh6K96DeI3Z2gmMxIjGJyXbXxA9Ff4d1OtoEw+3f+I/GJq7ZsC7ma
 TC8TSlaAtdvU1ludGLTwKp3zoXOJoIUSoHJpPZCOdp8BGoSrjT6oLnzcx2bGCV9R
 zS+kpkN4J792m43SkVBq0em4tmVYmdMu0pGedDQn9qw+69vHn14VAgnF/9omSsXa
 AxabRqegeXAR684mesRhtOsf9jiTAP2przP2a3Iyvv/hwKtSvet2ZbkaDR9ojE8N
 hST7d5QWXBYCfyCFWOV6oEvncU0tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=tyhhafPY3MqR5HmG4Y
 UvDB046h2KR+iFhrWUxIno3ZU=; b=UqlHwCFjWsmzBV1DUMsqLxMSzcgV4WXoAU
 aPT7fQnaSVJGc+jF+tXQDxTDO6MQ+j4S2+FUItO4Tk6I1Eh6SGS+sEGNNHHeVtGd
 Tm2SH9o7F+4LJcEGqY4JMAoYT3GN6/HBifYfIn0XeBx3OOhGJBOLJ68F+oQcKC/8
 lw4c3IgVc4sLeWz7PKy8J4BFfiR6tcFJwbP2py3/TCGccegAYWDbIuBHnLr+C00D
 DZVKj610Ll01JXOpG2UP5FLdbwtVa0/3KL/56ROEFMYjVInsVQM8rQmQsF1Ie2dt
 VGIcZX2dzrwEvNlyUUAIRERBmeHbaTmgHunGxPY+SfvqOSGRGESQ==
X-ME-Sender: <xms:6BDcWUaFrmiXvHuZtzp1lbCJWxYZWOQyK5btL2A1qcmwWYxapRRXlw>
X-Sasl-enc: T9zxwClhgQzFRJi0bsEyRNQdmbLgtytU/DaQ2QPNY/jC 1507594471
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 571EC7E3DB;
 Mon,  9 Oct 2017 20:14:30 -0400 (EDT)
Message-ID: <1507594463.5452.156.camel@aj.id.au>
Subject: Re: OpenBMC on Raspberry PI 3.
From: Andrew Jeffery <andrew@aj.id.au>
To: Javier Romero <xavinux@gmail.com>, Yi TZ Li <shliyi@cn.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 10 Oct 2017 10:44:23 +1030
In-Reply-To: <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
 <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
 <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BwF3K1wJlbAneIELeQnM"
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
X-List-Received-Date: Tue, 10 Oct 2017 00:14:38 -0000


--=-BwF3K1wJlbAneIELeQnM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Javier,

A few notes on how to make best use of the mailing list:

First, mail to the list is best sent plain-text. I see you use gmail -
if you're using the web interface there's a drop-down menu at the
bottom right of the composer where you can select the plain-text
option.

Secondly, I notice you quote both Yi and I below in your reply, and
appear to have constructed the reply yourself: the best way to deal
with multiple people in a conversation is to reply to their emails
individually and directly, rather than consolidating your thoughts in
one reply. This keeps the threads of conversation easy to follow
(though gmail's conversation interface is linear rather than tree view,
so this might not be obvious but it does affect others reading the
list).

Third: You have the knack of replying to quotes from the sender, but
this is best served by making use of the reply-indentation that your
composer should already provide (e.g. '> some quoted text'). For
example what I'm doing below:

On Mon, 2017-10-09 at 13:09 -0300, Javier Romero wrote:
> Andrew,
>=20
> "More generally, knowledge of Python (Yocto/bitbake, some OpenBMC
> userspace), C (u-boot, kernel, qemu, also requires a some comfort
> with assembler) and C++ (most of the phosphor reference userspace
> applications) is useful."
>=20
> I see, but I'm not a programmer, have start by building an image of
> Yocto for the Raspberry PI to learn more about Yocto, Poky and
> bitbake. Links you provided are very welcome and useful!

Ah - so I don't think you've outlined why you picked OpenBMC for the
job. Can you give us a quick run-down?

Without further information and assuming you just want to get an image
you've built with Yocto onto a Raspberry Pi, there appears to be a good
unofficial how-to here:

http://www.jumpnowtek.com/rpi/Raspberry-Pi-Systems-with-Yocto.html

This should get you something that works without having to deal with
any of the broken assumptions currently baked into the OpenBMC code-
base with respect to the Raspberry Pi.

>=20
>=20
> Yi,
>=20
> "The original target was to build an OpenBMC image for RaspberryPi,
> but I never tested on a real hardware.
>=20
> I've the Raspberry PI 3 at disposal for testing on a real hardware.
>=20
> More work is required to run OpenBMC on a Raspberry Pi. The "meta-
> phosphor" layer has been changed since that time, we need to update
> RaspberryPi configurations accordingly."
>=20
> Something I can help and with this although Im not a programmer?=C2=A0

Not already having programming experience is going to make it harder,
and I wouldn't necessarily take queues from how we use Yocto (I'm no
expert but I feel that we don't do some things quite by the book).

Yocto borrows lots of ideas from shell scripting and is implemented in
python. Further, it allows you to pretty freely mix the two in recipes
thus it would be helpful to get a grasp of these environments (and
Yocto itself). Without some experience it leaves us with high latency
interactions between you and Yi if Yi is to continue developing the
Raspberry Pi support. I expect this will end up frustrating both of
you, but it's up to you both to decide.

There are going to be easier projects out there than OpenBMC to cut
your teeth with, but if you are keen to learn to program, feel you have
the drive to do so and Yi is happy to help out with your interest in
the Raspberry Pi then by all means stick around :)

Andrew
--=-BwF3K1wJlbAneIELeQnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3BDfAAoJEJ0dnzgO5LT5tDsQAI7rnFobpQEUF5ROzHQryffN
pPhaoW7uvraPu3ul4Q4CMAnnZ1gRwUPID9WTZzUfyXFq4rPmx5lpCTBg35+7b5Qt
2ZufcOH4oDeibtDQ0HaO0421NHlCkI/ObUrUWnnWJn9trgJxEhdmPnNcKdyjCAnd
bUYB8G2HPW9rBa8goooPj/hCd+thpn2f1Bx+0GmQCWj/LXC6ePlvd+TCBT4so5DU
XR0qqco8vRRbugIeuXsKSpQ3+j+C7EJM/l4qU8TZxJydBLIf4MEtM0pZkkQEpyWf
uVNP9trPu7DwJWsgnKEU+PZ7oeBylYLQCsm5ANPfPECqX44IoYcwU3C3RQefIvy2
KTMpeDvh6IMJqFJ99YdI1mQaHOMSAGs0HUOAQ+DmcY8kt7IvRK0eeQWKWLy5s2y4
fMAVLhukWoMwhO5qys7WJwq8weIXJzs8/f4XEmKQ7CuNcDrhdX0Z4SkfXQF1ofZu
7nQX173Ox33zHAY9/EluS9n9nAFivLgI8xelydrgU63gralrt2SIVWwjK8XBoUgn
X3SmL6H3mb2bwjVEdMI3LlwvDXCFVeMD57r34d1nNWJPyVvq+xw7jQPaH4GecoJ0
xh3n9Z+qxbX618nbsf+BLL4EXH9dTP9MdGNieNsz6WVSsA/vEdNWdihTWlsYYF0s
Kxy4m0JiW4eBhPiPz/mO
=7RwI
-----END PGP SIGNATURE-----

--=-BwF3K1wJlbAneIELeQnM--
