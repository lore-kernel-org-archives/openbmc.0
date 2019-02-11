Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YIC4BbOl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zHKFaVOF"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yYS96Wy0zDqMk
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 15:57:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1500921C4F;
 Sun, 10 Feb 2019 23:57:27 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 10 Feb 2019 23:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:subject:references; s=fm2; bh=vNM
 glOR7VHUA039dnDRfsR0B2E5tNchU0WTp2LMepnk=; b=YIC4BbOlFkYUjHYIyuf
 oM/Oomv6RCVdLHxQEyo/vXm/yUNbA62HyEx6ATPPJ8DwZv2UmySOZrkjKu6ihOtY
 3T6tY3uBpLgwpc/My5+qscf9RNVwY1MUmRVC8DLq7GWRX8+cnK7HfQUZGxLvDnH2
 iXrKOng39vMokE6mw/AdxZW/Evq1A3H7KZ0pibw4BzcmS/UdS2Flx4o1r30FG/+F
 XIklheg65vqQTBDoSZBafylQeVubaT/MfxlpSQ5vhk2f/Lh8178NvT2Lg0CwrvOp
 DdBQXW4En1LT79XDbhYnLLFuPkDCUrGBm7APm5WHWHv5uh7lJtCjYG25dFg1A50Z
 CUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=vNMglOR7VHUA039dnDRfsR0B2E5tNchU0WTp2LMep
 nk=; b=zHKFaVOFbFI0OsHkyohmMS9KNCC9tJu4f/Ua56NG9BF9yGEQyY5aQz2Id
 Tm4FLpnZAEbrPHR5WKerIoqoimbowHny1amNVkgSl8qksXo1MsVoMUFE08lUQIbE
 E7/xXXSZvKuO5AQkzl3xMbY+cyj4/LvHLapptnEFTG3IJbF1JqPRw8MUKPG3deeS
 Hb4SYve80+lFEux7KnK4UcCqOxR7wbU9w8efP3sVgROj/KpYXUKONwqxf5NHD6iH
 gpe7zAmsM6T/q4rMd9zESnlT+O3QROIkzDCZWxLH248P7dDkIbo25k9yE9k4/pmN
 jgo/9497tf9A+SmwZqFowUNxouB+w==
X-ME-Sender: <xms:tgBhXIIKWL4EQUy0v34U6i-2IkEJJTMfh3Rk5VZupQQYeMkB3uRrog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrleejgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefkhffvggfgtgfojgffufhfsehtjeertdertdejnecuhfhrohhmpe
 etnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhush
 htvghrufhiiigvpedt
X-ME-Proxy: <xmx:tgBhXKhrN3T5PHY3mdquUyj7beuPr4ZlxEGzSUzhSacHQKX_gBGGJA>
 <xmx:tgBhXB_IxC4RLenboOQ7_Fp9_UlvBDnalTT2JD8USX1vxKIXdjA9Cw>
 <xmx:tgBhXIi66Z-M4kJnDIJskbNGDdZi9Ws9NsacO_vkqX5YwylsI9Gfeg>
 <xmx:twBhXOtrUTZsPN8drOcHtXivNfedDjSh69_P8-ASg0hUgmVCroMPcw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6E3559E524; Sun, 10 Feb 2019 23:57:26 -0500 (EST)
Message-Id: <1549861046.1162750.1655235472.36317B95@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
Date: Mon, 11 Feb 2019 15:27:26 +1030
Subject: Re: Secure boot for BMC
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
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
X-List-Received-Date: Mon, 11 Feb 2019 04:57:30 -0000

On Wed, 6 Feb 2019, at 00:44, Brad Bishop wrote:
> Hi everyone
> 
> Does anyone have plans to provide a secure BMC boot implementation to
> OpenBMC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who
> all wants to collaborate on this before I submit a design template.
> 
> thx - brad

I'm interested in secureboot discussions.

Andrew
