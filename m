Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="xNYLsH/p"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="5pkcmmh0"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444lxS1JKSzDqJs
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 18:10:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D0F6E22221;
 Thu, 21 Feb 2019 02:10:48 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 21 Feb 2019 02:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type:content-transfer-encoding; s=fm2; bh=9h8Cqa6rVhliV
 cboPN8NJM6YFgNYWljXxRQOHw+PTWM=; b=xNYLsH/pZ2u7RWMZhK824bNlKJMDX
 9HGO3e/BJ4+Ml6WzEHtiND/rEcnNVVOi/dpS0rYa5+vVyYL6a2a79knkZVtYGUdX
 UiZNTQIlif5eQkXEYhajEY7JpY0imf2gfmRCRyOu7wUw/kNkkdXTHtUa4Benkqvq
 Fzrj9UZ19oks7nt+fgaxcQ+zN54EoN1EHFABIh6pKh/Yv4C+J/fGNNkOuh3YXMpf
 Vyf5WQ1gEGhIen/RbEZFM4Cf6NuHudm1/hdLC28Sx5sTm/bOouoxqlUoV3jGZrUb
 sFsTi4wpqwDq4jvHb+tKKHoWf63G+m11xOiGHUQlScPVMgfadDsxjdxMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9h8Cqa6rVhliVcboPN8NJM6YFgNYWljXxRQOHw+PTWM=; b=5pkcmmh0
 4vJRz8VKhMo/BbIN9Vw8zaVzxAZz8oxdVU1yL1vHVOw6fvqCqj4YFcVQZ0XXjXTp
 GgbGyzf52KUmpGaFJK2vxOqtpNE30mVO4u5jimB1sR/hy6n3SpsbXOyy8H37a080
 mJaMFt7YdNlSIYiVeqhgERj+Ul9xLAYbplHfPNx4opWC3e8XBKbErPAS6rp4SsYv
 UqyoOj4EDmPl3EmAbVyHIz2lAozdN0SIn4pYv942KOTfzDvoJVv0Uy4kRWhCsPoS
 3lRx02mKPea0prQJ/AOLJPSWttE0SH2FYaFSAJHBlq+n9w96ezFf5baU2SbOs1sD
 bx6sKViT7UmeQA==
X-ME-Sender: <xms:905uXHmTdzIQwEYfQraH2wwFWrdZiF-i6jv0JkgHgTD_UTp6pLZVUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdejgddutdehucdltddurdegtdelrddttd
 dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepkhgvrhhnvghlrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:905uXAWgkxdkSwYUNeblF60tJCJAUoVwzwnAEo2MA39iInM-QczkPA>
 <xmx:905uXF83VugTbmgVb2PTfT5uTkZF8oHSIGCrvmQcj23EGcAggAGa0g>
 <xmx:905uXNqsv2t2cxt14lQtVop3rWaq0_npRO4O2XdUAcHizqxEUTs72w>
 <xmx:-E5uXHaHjP-ARGrsGzFgfNAnGKaIAca0JCaQOeJX8q9iWF7Gdbtctw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6F81C7C1EB; Thu, 21 Feb 2019 02:10:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
In-Reply-To: <88e05768447d466ca674e12e20c650dc@quantatw.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
Date: Thu, 21 Feb 2019 02:10:26 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?Will_Liang_=28=E6=A2=81=E6=B0=B8=E9=89=89=29?=
 <Will.Liang@quantatw.com>
Cc: "Stefan M Schaeckeler" <sschaeck@cisco.com>
Subject: Re: ECC memory of BMC  
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 07:10:52 -0000

On Thu, 21 Feb 2019, at 17:16, Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89) =
wrote:
> =20
> Hi,
> =20
> we are trying to enable ECC on BMC memory.
> =20
> is there any exist solution on BMC?

Well, for what it's worth a kernel driver has been submitted upstream an=
d is
queued for the 5.1 merge window:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/commit/?h=3Dfo=
r-next&id=3D9b7e6242ee4efcd7f9ef699bf1965e3a5343f216

The patch does say it needs bootloader support though, and I'm not exact=
ly
sure what that involves. I've added Stefan to Cc, maybe he can provide s=
ome
insight.

Andrew
