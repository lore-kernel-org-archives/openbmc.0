Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ihKefXWL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b0lxaPZA"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yFm0t3VGlzDrF8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 15:43:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2578620BC3;
 Mon, 16 Oct 2017 00:43:22 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 16 Oct 2017 00:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9Sv+ICJfygnxrRLIZyp1CsWosUaPQvrc8/0NX0t7gXI=; b=ihKefXWL
 bV1jY5LaCVRdopHWYsxqQIlesdNZMIlPqPZeQ4WFdanelJiETAGz3pV0JEgdAnVj
 Y3x99i01HU7gkBAJ1wqhYY18vuMj/BsDFHTogFf8/BYTAVxlrR6E4AdhZAr9DHeA
 Wp+gxyNil3TN6mOVIo+ZfoJx+VKbwytpcqfb5kp5eU2vgRohusWrdREvlPzwUW1f
 SEXaQV8zxt149zq1u7qFDhlQmZOUKTsNSWBAkbbEmhse0220dpGgFVz6cJuGvq/0
 tV+1dogjMqIceSGLVD239ohwBR93L8gfmz/S57npmvLjK7noXQEq4fA/9DA0Sbjf
 XvkoKL4196miPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=9Sv+ICJfygnxrRLIZyp1CsWosUaPQ
 vrc8/0NX0t7gXI=; b=b0lxaPZA3owHv6+C1ap0kMC7LYABKXD73i/36E1HTo+pI
 uJv7vAfebs3fC8ahVMcfTwytw9vDmd4g6pv5qco7gR1LuSF4HBvja1NhJYkUg29z
 doATxLWH7aeB39RGJHbROQP2nyOiUL/untSo/UOCZI+JZ/sKH1+schvuSi/qHxeC
 zIXZpU2l1U2jtMzv8+ElWbwq6GKPmESjdthw73moMy5vIks+a3xcPJY1g2pJmKhH
 hNsbquSDQdHW/l01LItOOOFmQuK0BAcwXun6W8B449T4ywP+WdsFtFIXEPUT0vbV
 IUrrSAYMgzh2yB8xheS6/o6xnQV7SA/KnzjhK5zPQ==
X-ME-Sender: <xms:6jjkWbfCXIp1eBKP6GPSXOJ3-0wDqVBlIvJAVpwxDAxKdP3fadzoAQ>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 95BCB7EC36;
 Mon, 16 Oct 2017 00:43:20 -0400 (EDT)
Message-ID: <1508128993.24322.3.camel@aj.id.au>
Subject: Re: OpenBMC on Supermicro X11SSH-F
From: Andrew Jeffery <andrew@aj.id.au>
To: Keno Fischer <keno@juliacomputing.com>, openbmc@lists.ozlabs.org
Date: Mon, 16 Oct 2017 15:13:13 +1030
In-Reply-To: <CABV8kRx3PVrqLGZ9=V9znSGvwo+rjv9WS8J1dxMTCvBZrvsm0w@mail.gmail.com>
References: <CABV8kRx3PVrqLGZ9=V9znSGvwo+rjv9WS8J1dxMTCvBZrvsm0w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BepW+x62l6pC0hw/XfD8"
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
X-List-Received-Date: Mon, 16 Oct 2017 04:43:28 -0000


--=-BepW+x62l6pC0hw/XfD8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Keno,

On Sun, 2017-10-15 at 18:33 -0400, Keno Fischer wrote:
> Hi folks,
>=C2=A0
> as I mentioned on IRC I've been working on porting OpenBMC to the Supermi=
cro
> X11SSH-F board's BMC (an AST2400).

Awesome!

> It's not complete (lacking most sensors, but
> does have leds and host power control), but there's enough there that I'd=
 like to
> kick of the discussion on how to incorporate this.
>=C2=A0
> I should note that I have no affiliation with Supermicro and no access to=
 the datasheet
> or schematic. What I know about the board was derived by poking the board=
 with
> an oscilloscope.

Great work on that front.

>=C2=A0
> The patch sets are here (just so people can take a look, some of them nee=
d a bit
> of cleanup before I submit them for review):
> linux:=C2=A0https://github.com/Keno/openbmc-linux
> qemu: https://github.com/Keno/openbmc-qemu
> openbmc: https://github.com/Keno/openbmc
>=C2=A0
> With that a couple of questions:
> 1. Are you interested in having support for this board in tree?

Yes. The more the merrier IMO, as long as you're happy to keep it in good
shape.

> 2. If so, am i correct that patches
> =C2=A0 =C2=A0a. to the openbmc linux tree should be emailed here

So stepping out to generalities for the moment, we want to work upstream as
much as possible, so the strong preference is to send your patches there fi=
rst.
How we work is documented here:

=C2=A0=C2=A0=C2=A0=C2=A0https://github.com/openbmc/docs/blob/master/kernel-=
development.md

However given your efforts so far and that the only kernel modifications yo=
u
have (according to your fork on github) is the addition of a devicetree, I'=
m
keen to get this integrated into our tree for you. Please send the patch to=
 the
list Cc'ing myself and our primary kernel maintainer Joel Stanley
<joel@jms.id.au>. Joel's currently away on holidays so I'm standing in for =
him.

Joel is also the upstream maintainer for the Aspeed devicetrees, so all you
should need to do to upstream the patch is rebase it onto a recent upstream=
 tag
then send to at least Joel and the linux-arm-kernel list (feel free to Cc t=
his
list as well).

> =C2=A0 =C2=A0b. to openbmc itself should be submitted via gerrit?

Yep. For reference Gerrit lives at https://gerrit.openbmc-project.xyz/ but =
I
expect you've already found it.

> =C2=A0 =C2=A0c. to qemu should be emailed upstream with the appropriate c=
c?

Same model as the kernel - ideally things go upstream first, and then we su=
ck
in the patches as we move our fork forward against upstream. However if you=
r
patches depend on work we don't yet have upstream, send them to this list f=
irst
and we'll work our way forward. Similar to what we've documented for the
kernel, put 'PATCH qemu' in your `--subject-prefix` so we know what's what =
(we
track patches with our Patchwork instance[1]).

In either case (this list or upstream), please Cc myself and C=C3=A9dric Le=
 Goater
<clg@kaod.org>.

[1] https://patchwork.ozlabs.org/project/openbmc/list/

>=C2=A0
> I'd like to thank all the people on IRC who've helped me get this up and =
running.
> I also very much appreciate all the work you've been doing in developing =
this in
> the open and upstreaming your work. I'm hoping my work on this port can h=
elp
> amplify the impact this work by making openbmc more widely available.

Thanks for your effort to expand our supported systems, and welcome to the
community!

Cheers,

Andrew
--=-BepW+x62l6pC0hw/XfD8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5DjiAAoJEJ0dnzgO5LT5O34P/RePckzYoyVRUlHxV8T9d15x
hA3F2f5rKiWA62/ApNutrKs5ClfG+dV6Drx+iPzHXgKVTk3USMU8Qjz/v4JuRCzR
7FEn+hgrV9h7UhWYADDgrTc7C1svfpVW4WJG7dEmcRSVraB5Qt/UiLE0ceDCoV7H
Fw5NTc0ncp39grhsyIGMgIau4ZXtmqdgIg+PnsiK6rGtA+Qtq1L84uitVuOREdoC
Zo4PTeG+FadUsirBk8nU2/e8it32TsM0WH1yhdG+NwgNZ03zho/cEJwA+wnIsNOE
P6+Jr1qkH79gESO9BgOCOr2P632Kw8lBC2ce+Y3CUfTVakyKMIIauAa9hP6181EF
DhcpxsRduZKbwD1vG+yH2FM8EaKPFAWfJ7LDNqe8WWtRP1hGWo3+0NVJgmUDhSpI
KuDuis1XbdDRf9aaoy1aSuXHyhNLcdLva3WxnFsVzYFz1XBW8A/RwRusFeUYMEpQ
YvNP8C+HoLq5lQSapi2aVtZsOSDWu+cFOU9b+1NyaXUkXwRGsoRxyI89mXQXS3fh
3gYJlRFLr7kWm5ojKolmjxbkghKU/sSBWt2NuKzU07S0FAenVMrQI0nkH5DFIvux
gDyhTY+R8809VCOxKwV4tHqVf44dWjEryumhBMZJNPZ6d+B1jeCWqRSDg8HgtbKD
98PyaVMc6J8IFbCdES5S
=34KD
-----END PGP SIGNATURE-----

--=-BepW+x62l6pC0hw/XfD8--
