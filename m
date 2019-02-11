Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IuLpVYfd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H6HWMa7s"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yYlD75ClzDqMk
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 16:10:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3258522040;
 Mon, 11 Feb 2019 00:10:30 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Mon, 11 Feb 2019 00:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:date:in-reply-to:references; s=fm2; bh=5OK
 nCojHBzZKy9KwsvG7vVAOzd76kAW8vxhV57NTLdE=; b=IuLpVYfdF4fNQUY/5rW
 3djbGIPSFrb75t+IrJwa30zji0LNrBoQMxYZxJMlouxQUNY5f3klkV2mMOEWpCBa
 4vJBh9Qn6AaqkgdOZzvZRY0GD8e7tGfoPGGb2x6X9dEaBGkfI4llP4TAm4jtl2vQ
 izI3GFV0J6Gj/GWPE4c8uR9041eY45UYLek/tEvnsDV0caQdd6szCRkzLdj+fEYe
 SFtW52B12BlVjtn8rYFpjPe9TkROlVLCHZoapeLKAjzsJeT+HN44usKTEMMhrHpI
 0uUYGf1HbyeCWMcKdy5jS/YeeVvZFrjPJyy8NPqYmUrhw/KJVJWufkoU2asf7NMf
 I8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=5OKnCojHBzZKy9KwsvG7vVAOzd76kAW8vxhV57NTL
 dE=; b=H6HWMa7sZh+dSHpzchxMEBnLEL3/akgs1otu9gEO9S4YvmS9yNYQJ4rNH
 49Iik2svnWx6guQoLbC/SRnMeLYUpdKFmfOBPtPGgWaWeSAAjSO/WKlENg+rWbOE
 3sK1DAq/fDLzx+oh342KHgQL9wXT2NiOefpoimfSXEFKwYdnQoquUxgXwVlVysW+
 E/y1ehD/xvBCHoH2zD8+iGfMSkyaHMCjYTDT2jb94Vcio76UydYp0J2dh0wkPI00
 78Y6SRbhtqfnGzMhZSRSoubgk3yVjTpTewz4f6KtP1F4fXQpx11aHizSky1zQyJD
 qzL0EHaRaIf42JY3Omm0UZokGbVrA==
X-ME-Sender: <xms:xQNhXLRwvq0tupP87ohhrlf2-XtUXeE_EVl451Rth_-38Tyw8oRjeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrleejgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 fuffgjfhesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrihhnpehgohhoghhlvgdrtghomh
 enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xQNhXFsyDvufznMDK_aTPit7d23WRCzAA1vVQB9XteCQrJDGjoSXUw>
 <xmx:xQNhXCwexZm5nuxlZG49M4zHKENtApdIk2G1_ZScenVCbM5buOqcqA>
 <xmx:xQNhXH4TLmaGXERLRf4qRGJP0678gNS0IRphu7-Z7pTCnP3yr-ma5Q>
 <xmx:xgNhXO06g_Gto55cj9NH5N4fJOrJrtJsYRxm5d2QC04Q5928p3z02w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7CA229E524; Mon, 11 Feb 2019 00:10:29 -0500 (EST)
Message-Id: <1549861829.1168752.1655241840.69DC7471@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Sivas Srr <sivas.srr@in.ibm.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
Subject: Re: 2.6 Master test result update
Date: Mon, 11 Feb 2019 15:40:29 +1030
In-Reply-To: <OF2462F2B0.99064954-ON00258398.002ED4F7-00258398.003089B7@notes.na.collabserv.com>
References: <OF2462F2B0.99064954-ON00258398.002ED4F7-00258398.003089B7@notes.na.collabserv.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 05:10:33 -0000

Hi Sivas,

On Tue, 5 Feb 2019, at 19:20, Sivas Srr wrote:
> Hi All,
>  
> Here with sending BMC community test release update:
>  
> BMC Master community release test result folder:
> https://drive.google.com/drive/folders/1eBTVYVa6tOhzKlZg5iK10Y323UsJve8A?usp=sharing 
> _*BMC 2.6 Master community release test: *_
>  
> BMC Version:2.6.0-rc1-135-g16e11aa:
> Total Test: 173
> Total Passed: 167
> We have issues opened for 6 TC failures.
> File Name: bmcweb_redfish_2.6.0-rc1-135-g16e11aa_Witherspoon.csv
> https://drive.google.com/open?id=1jpGhs3SwcLZTpgSxD-zzDfPfWgwdOhKi
>  
> _*GUI Test: *_
>  
> Test Document located @:
> https://drive.google.com/open?id=1r6ywc3G5ZW4IBY6_iikvocJDTLRbvW2r
>  
> Total Test: 75
> Total Pass: 74
>  
> User Management related TC failed and issue opened, Development
> had revertedthe changes and retested and works fine.
>  
> _*Security:*_
>  
> Security related test done and didnt observe any major worrying issues
> at this time. 

What does this actually mean? What security tests were run? How can the
security posture of OpenBMC be judged from this?

Cheers,

Andrew
