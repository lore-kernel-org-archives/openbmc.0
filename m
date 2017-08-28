Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgX335zGLzDqYx
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 10:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q2hMfP1+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MzMueCny"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 88A4120A74;
 Sun, 27 Aug 2017 20:00:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Aug 2017 20:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=B4RQLkmZmR8PCVXTpRDZkwjgNk+NUJCVRrmUiQVbG
 0Y=; b=Q2hMfP1+Gl4XGM6y+Z46LbSDC2Oulz2Xt9v5dmfF5RRSH+FZI0Kn/+Nyt
 dRoqStv/HocCx2WLclCKvlAxP60nM6J5i/CKXhtJ+tWOgYXn2JgPe2r3It+/Io4C
 tlILthQOKjuDqsXAS+1blswRdw/ImjQhdaG7tfF64yOBB9d5WagYmxIvfId6Vews
 NRl4C4LJwS+rrE1I6kEO6D0r7Md0xDeqCR3vzQt3bnAjsalBt5ID6P7/uDWsobKp
 +I829wEf6yNmqb47hSHYyeeGHND7Ib9A4imS3EClB9Ggt/0V2QDbQ6L9n6ea6crf
 VBbYd7d8yRmRe/quQFEqpkk+HL1NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=B4RQLkmZmR8PCVXTpR
 DZkwjgNk+NUJCVRrmUiQVbG0Y=; b=MzMueCnyGtY+mfzthMyYqDShhuKFj43aYz
 QShfHNggM/zhkhjdHqeRzOAMCdSu02PRmG53GmPAS1TBEBxXyje8XtRFAaoRhCij
 aFfbD5zoRkl4tStD6sX5LihS5vN+dkxQeqtMqHn9ykPyg0Afbra3QJTAumvh+onJ
 B50YPDqfpgJab17lrTkfNxRivof7AEpEuyZJH5w0+ujr+yqVkWdiLoRGDwbhx7Ly
 ZdWkCj761k4drDjReirzmBQsZ0RcSDZQOJ1aCNLF6Ww78AH/nsFn+K2b3MVdod2w
 5ftY/XqLneyZ6mlvGjVqHGl1V69lfrly9yDLZjlsMIgrJF1M7lMw==
X-ME-Sender: <xms:HV2jWYo0LkhFJqEarGJsmalKTgE3EyF8szx8WoKajPnMxISBMy43Iw>
X-Sasl-enc: VD3JN3/zTowV28fw+2csLeCTaX+93rnTUeNUdH1qobxs 1503878428
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9B77F248E6;
 Sun, 27 Aug 2017 20:00:25 -0400 (EDT)
Message-ID: <1503878419.32695.9.camel@aj.id.au>
Subject: Re: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
From: Andrew Jeffery <andrew@aj.id.au>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 rpurdie@rpsys.net,  robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
Date: Mon, 28 Aug 2017 09:30:19 +0930
In-Reply-To: <3b89ad70-7024-b4ac-bf4e-49a02d12da51@gmail.com>
References: <20170825063503.31577-1-andrew@aj.id.au>
 <20170825063503.31577-3-andrew@aj.id.au> <20170825073239.GB15494@amd>
 <3b89ad70-7024-b4ac-bf4e-49a02d12da51@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uxUCu/RNPok7omOLWy6A"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Mon, 28 Aug 2017 00:00:32 -0000


--=-uxUCu/RNPok7omOLWy6A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacek, Pavel

On Sun, 2017-08-27 at 13:01 +0200, Jacek Anaszewski wrote:
> Hi Andrew,
>=20
> On 08/25/2017 09:32 AM, Pavel Machek wrote:
> > On Fri 2017-08-25 16:05:03, Andrew Jeffery wrote:
> > > In some systems, such as BMCs, we want to retain the state of LEDs
> > > across a reboot of the BMC whilst the host remains up.
> >=20
> > I'd spell out what BMC is...
>=20
> I agree with Pavel. Please give the expansion of the acronym
> in both DT patch and the driver commit message.

No worries, will reword and resend.

Thanks for the review.

Andrew

>=20
> >=20
> > Otherwise series looks good.
> >=20
> > Acked-by: Pavel Machek <pavel@ucw.cz>
>=20
>=20
--=-uxUCu/RNPok7omOLWy6A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZo10TAAoJEJ0dnzgO5LT5rB8QAKaheT4+T4uH++dwNNuXJ5DP
PIFclCZ9oaFSkzyyMRecNMcifRRnhtMnQdlnOkQBzCaq10OxPFGKin/wr8BoANMw
Z4Y6wM90XuTJEayg1b/4Cf35zDEpXr+SJTNvXsf8VootjkAysK5Y+2yLSORbf9tG
v6ayMPmek4CYYMzZrDi1vlyFYJvKFsBe0eB/ngSCiwVZBp1GZG4CA7NhQ9+FiUYV
831oZjoRTMRtVCqMJZAPEHe++OAKb5FCy0gb1O7bfQjqn1HG9LfN+TbgiCb4CwMo
aabK2e+60NF+UpQ6r9j/HmMrDE3SOpxLyNoyj+/hR4DBuw+MQCqBY4B6f3xwHdTE
m9p1BgGdLEyAxHBhsDbeeAT+jCMHLC3inwZkiU1EWa5bO+6VABk6iQOH/yFHA/Ph
stuEtsY9koXiOxjciV9rx5CZRHzf54PcKkFbBGuZB52KkpwLrBBB1pIWE6ah/akt
eMS01TR+8L6wiJaZa3qtJH+PR35feGtzuRmWQLUzi898UWuEtGxaVJn/0dwefbkV
CKLSmMQLwzsrLCVZYO2zpUitEZkhOQzdSs5CEHyCiNtpuRABX4Zg5zEJuaHlsD+z
gXF4YGCrK1HGz79ekeBvYD1eQZLHw9BDWoi4xOxhrPYTHCpJkjVIs6t6TD2CyOk2
WdQrpgpyGwe4tg8zb0d0
=nw0M
-----END PGP SIGNATURE-----

--=-uxUCu/RNPok7omOLWy6A--
