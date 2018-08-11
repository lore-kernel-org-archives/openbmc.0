Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Yp7BFx4M"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HMCqEXm7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41nQKd3K7LzDrZC
 for <openbmc@lists.ozlabs.org>; Sat, 11 Aug 2018 12:04:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CB2AE21C5C
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 22:04:32 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Fri, 10 Aug 2018 22:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=3U0asTp3N/dx1mPTsidRcHwNup8DM
 lRUNFkE+OH6m3U=; b=Yp7BFx4MpRl1Hd0Boo+JslFBImMHWrkjwCUOmLxProB1d
 VSRmxymJ0NosRxyOkvTnPcGPErLRq1VQh6o+F11tcbn4snfL2LlPraY7koco8QZ4
 zWFuF2CQ/wkBlHkF/M2Fvg0Z8Xwk/lVEwJn12bnRA9zvYkWI+7f1r8LPzRc8YeV5
 S/gHPdNzNASgxL5OsK3DHgiEN4Q7hIGe1MzmebMQBF7AI5jy+YAq1KSb+HQz9VpI
 qzI88t+pNHMegIdcodOx8cY7hEBiWGdq2GPVpkLaiCfU25KjMGXmcyoQp3fjkJmO
 Zx3HEeWvOVpZa3TWYQriJm3I3GO+UR1UjXH3f/DvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3U0asT
 p3N/dx1mPTsidRcHwNup8DMlRUNFkE+OH6m3U=; b=HMCqEXm7wnxMCrE8CpDnlW
 ONCRlmwMIT8X+lStHe7jEQ42fzQDMCGP/pODpmCxcqyxLMNjnrx5IJerB3+w7Ei7
 lDHQ5doAr7pNeWxzcVPl/IXujDo76zuduMolXPnM9462gigocvg5Yhv7jG6YFIJP
 Fynvu5LhscQM2K9KAozgdyDWmkyWl7i9SFpY8EXSKI6imbzfAOXK1yQUS5Eudcmy
 trPcHmDwgfOUz6xxiHKId8xQmp5QmcWps/xTF5eXcrKnTwhTYbplaGSQVVtDpbmO
 ewROham5ReG+4VZ1MxY63YBhUsJDqLxhVjndujmBqJHzusB4HzXQZUpSv2ifRmRw
 ==
X-ME-Proxy: <xmx:MERuW1XesapQuNBRqvmI6-muMW1MbIIJitJ12jBHOAZpt3Y_O7Y_rA>
 <xmx:MERuW7KhloccogWQ8700D6kaFO_y_WKQGayVf0iFC-D6znTaFtLemw>
 <xmx:MERuW1TBIeQHURsmc426IJAfzY9BRmkdYcu8fjXTawMIJklw5ruclA>
 <xmx:MERuWwWd6H-3F3b8dixWmCHadv5NTAziAdmdlMc2_DQkGixbBofO3g>
 <xmx:MERuWwxPQqwKEuJn5fM1xYxgXPKQRry2cSbajpO8dJCAzEg0i68nfQ>
 <xmx:MERuWx4vY59IIUgz_igzg0eP61RAHQ1M83sxYsa9ft1IK9Eom2zFgQ>
X-ME-Sender: <xms:MERuW697hrunbWaYfHQVXvlB4K9FtrnVlkydecm0r7t8I9DU_bCiaw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EF4644187; Fri, 10 Aug 2018 22:04:31 -0400 (EDT)
Message-Id: <1533953071.109496.1470523456.12077484@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-9a5384d7
In-Reply-To: <83549CAD-45BE-49E7-AC88-A1AB46597988@fb.com>
Date: Sat, 11 Aug 2018 11:34:31 +0930
References: <83549CAD-45BE-49E7-AC88-A1AB46597988@fb.com>
Subject: Re: A question about submitting patches
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Aug 2018 02:04:40 -0000

On Sat, 11 Aug 2018, at 08:17, Tao Ren wrote:
> Hi,
>=20
> I=E2=80=99m preparing a few patches (aspeed driver fixes) for review. I=
=E2=80=99ve=20
> verified the patches on ast2400 and ast2500 physical hardware, and do I=20
> need to test the patches again on qemu (required in =E2=80=9Copenbmc/linu=
x/wiki/
> SubmittingPatches=E2=80=9D page) before sending out review?

Please do test in qemu. Qemu is used by the CI infrastructure to smoke test=
 the build before applying it to hardware. You shouldn't limit your drivers=
 to what's supported by qemu, but you should understand before you send out=
 the patches whether there might be some spurious failures. For instance so=
me releases of the ASPEED SDK spin on initialisation bits that aren't prope=
rly modelled by qemu, and hang as a result. We should fix qemu in these ins=
tances, but again it's good to know before you send whether the patches wil=
l cause it issues.

There's some relatively straight forward documentation on how to use qemu i=
n the docs repo, so it shouldn't be much of an effort to set up. Certainly =
Joel and I test our u-boot and kernel changes with it and find it very usef=
ul for rapid feedback.

Cheers,

Andrew

>=20
>=20
> Thanks,
>=20
> Tao
