Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6SC807SXzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 11:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aZHTq45P"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RMG+RD8P"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B3FD209BC;
 Mon, 17 Apr 2017 21:26:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 17 Apr 2017 21:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=+hQBOAdfKRGX0X44a5ChyeDMqzBoGQGC2WDG8qBYf
 uM=; b=aZHTq45P1GutAncuAsH6hnUp1m8CIhWKHxLGAZFrIrJeyR0QmdSfEs8wh
 fb/gKUJ+ZYLItqBtYIEwV4480+HdIxz9pN7JczTpMJ3+c/jPXFQZSZGBToncya1J
 BiSBZZ97KH0G7S/X1FgRE1F+eJjwGbrrQKWNUMNLFVqswUz02EGvg4xrBVBybKix
 nqNRMQgKMTBWp3FZ+CwGQtSSfFjcPeUBzu3SHvWbs07c/wlH0Pw4Tt01DDrewhtf
 wtfhrJm/JTLNuKZOpQyBJ8eId/VDBuEKoxEYuv2z1YTfQBaY1vyHzNm67/zIdBHK
 Ar/QHfPJvat5xhceRUxu0rBWwJ0QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=+hQBOAdfKRGX0X44a5
 ChyeDMqzBoGQGC2WDG8qBYfuM=; b=RMG+RD8P2q0AzKLaUBSyrt5AeJZdLFDy25
 saX4ce9ZOQQot0y8P2jkdUYngQW2hn6uw4j95sPoIz8dRNZ5UwTEYvjW9wEfEIGf
 Yxjzm8XIVehCo27/r0O9mIAF/eCfsqX5Ooy3kW8jDYUA6yacotsHuyJSCD1lG1Jn
 CwgtfjgSsmA7xp+lrsSvE3HcVb2Vbffo6KxwMBY+nljI9cYzzBwbvqTdMUop6Gef
 XYjKcdnaqoeU8GBSFaHC9j0E7w3kXEj8UtIRZBfrOwi2a8DjFXpvV9g03InC63ji
 4+nRnZQd153FT04gsJXen7LcPoxVSNr8c+Eu1oO/jrhBpmSZrrcQ==
X-ME-Sender: <xms:QWv1WOlIRU3spSJxni-3hME4xnvo6Gvt8uuGpRwW-1NywiSnbCSR8w>
X-Sasl-enc: yWiYjMRcRyeu854q20Hj+WSPyTXzitM1UNx3TpSj3Fgf 1492478784
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE03A24216;
 Mon, 17 Apr 2017 21:26:22 -0400 (EDT)
Message-ID: <1492478775.1011.1.camel@aj.id.au>
Subject: Re: Discussion on GPIO monitoring and design thoughts.
From: Andrew Jeffery <andrew@aj.id.au>
To: Kun Yi <kunyi@google.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Tue, 18 Apr 2017 10:56:15 +0930
In-Reply-To: <CAGMNF6VXasVL65b4G4vmBGSLvMD5QkgA3nomKLp0Ed8f3GWA+g@mail.gmail.com>
References: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
 <1491524060.5817.8.camel@aj.id.au>
 <7459b361-8c6f-aeb8-e434-f3725549adf3@linux.vnet.ibm.com>
 <1491793973.3829.2.camel@aj.id.au>
 <CAGMNF6VXasVL65b4G4vmBGSLvMD5QkgA3nomKLp0Ed8f3GWA+g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZXlhOXtnFPBifLtskesu"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Tue, 18 Apr 2017 01:26:29 -0000


--=-ZXlhOXtnFPBifLtskesu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-04-13 at 16:24 -0700, Kun Yi wrote:
> What about applications that need to monitor and set GPIOs rather than
> monitoring them only?

The proposed approach isn't great for that as we have the inconsistent
interfaces, but we do have functional debouncing. Ideally we would be
able to set GPIO pin configurations through the chardev interface, but
we can't do that (yet).

>  gpio-keys won't be suitable, and new cdev
> interface doesn't support writing to GPIOs yet.

Writing GPIOs through the chardev interface is supported as of v4.8-
rc1, so moving to 4.10 will enable it.

> Also could someone point me to 'libgpio' interfaces mentioned here?

=46rom my conversations with Vishwa what he meant here was the chardev
interface, and there is no actual 'libgpio'.

Cheers,

Andrew

--=-ZXlhOXtnFPBifLtskesu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY9Ws3AAoJEJ0dnzgO5LT5apgP/ivUlBUQgxdgbtuRyGZ4h/Pf
Nt/dEz2bIOi6/wha5nKUQRitPjk51JOyDC4A10SFFTBS9rDcJ50ETxDhhiOxk6I4
Eohozpfzxmt2lRMI3+bozRJbul3GxubFTsWG+aAVRTgexYuVTJ/q/aQWGImb+HjJ
JzZ48TytLCuSwXVTS7CsBLXtuFb2OmqHcBSzf4JbaIB5E35xHdrU0pMIvvTVA/7q
cvSR1XM5dqmxzw4ZXX0as23Q38iSf/R+15ZmokjIM6uVKVC2kLuDuC/MrPlTw4QL
MmeGnNjbhpNwF1a1ijuMf+jDjIWtRFBAryMIrWr9ezyKQVZD2F3kPUY6P0L5+g78
n6rcVBuWS8n9/G4H1Fynb70kTkNpyJG3vaC56TF8fw3tvYbY6FLRSsEkm6aNgTkk
dTjvlUiRNZdRD5/odSm+z+kPVPFYx37lhwbedNoZ5HNm7XMbQoOn6sKJEq3FSESK
C+TXuUi2I/du1RWR1IjkuNXnhglUPDtmQOPTxXLTQEtAg8Ht2+CTsHEinX0wnoFD
+NT0sdA6aP7heK/6MT88HuVbUE5kIWKvvWUyMkLb/0rdbrUuTfdp/mcVoACuLKT+
hQ+TV6GW12j5YxjjAs56KCUn4xbfs/4O8RN7xKTtUT0u32ukTqQfq1XOmISDg9Kc
hrxWvvthkqAelyLPBQIv
=bdPX
-----END PGP SIGNATURE-----

--=-ZXlhOXtnFPBifLtskesu--
