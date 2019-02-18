Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C5s5SELN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="knZTUsi+"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442pBV2drFzDqHY
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 13:45:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D91692201E;
 Sun, 17 Feb 2019 21:45:18 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 17 Feb 2019 21:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:date:in-reply-to:subject; s=fm2; bh=ykk
 XeuDSg8FeW3Kv30ssrUp6+T9plJqMkj3m3A042Ug=; b=C5s5SELNgO4R4+xBHZK
 L4hdFcrNQaU3g66LA/0FMFlwEN1gdESeHcibyAXL4cN5VPuCNlsmPcNS2K+whrli
 FDvnq4AQsdvAUUZb6uUYkP26jA4NtnMZ4EE25uwnDJAyN7Zs0XyakmBXGoArQPgW
 JAHZMMAWGVzagFg4QKmGKq2IzROBmWHnim58eftUtNEG52KtHDVhwms73MjCAZRX
 cMpCZjysJ+tSw5SYm5KePSsCqyhbdcWlM7fK+XgZ+kKk98te6mS2uQxQGOcDhiQG
 DyuU6bGZjHteXqNU2f1x3TXUg4TWn53fu4kEq8dyF+CkL6y2NQpCA/+iwU2D2qPX
 PlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ykkXeuDSg8FeW3Kv30ssrUp6+T9plJqMkj3m3A042
 Ug=; b=knZTUsi+e9NsEOEFLG4NqE9cgJF/s8ckVBMP50bbdc12SeYXmYyAWOevg
 wPh71S7UsoPfzIcsi3KV0cUZX0N+hIvfE8iTWJn5AKFiGRm/Uh8/vLG80p2sNMDH
 VQL8SjKZMikBBTa7f2pHsfPZbib//+uUcC38mIW1Y6f24jzm8fr9nubLsrnsrZl+
 nwdPgqrnjZ3lwuwPI56Dzkq3XcBOtYLAsO2SBZl1qUXlNSvszr4UT2yP2ueaMQEb
 DQiiRoJmtxbf+hYx5Xc6aCd/c/1/ltGlNDAoNLrnaNqov7D0HVILiR3/vS4+IuEu
 Z/71nEmA2Eg2Y9wyUkfFIbimLly3g==
X-ME-Sender: <xms:PhxqXEKXTLatkYDJNtABuuDJtjR5I3Nk25RneNkE8JTrrH9J8li48g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudduvddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fofhffjgfusehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:PhxqXLYA0eKUFPx2bkHXl3f7-o-G7zS0coxFsPBbvfhxh0dnbu4oVA>
 <xmx:PhxqXPkY6QVXPfi1tgG9vavUu3bCIRAm-jcE63t4McrLfq4OcEtMgQ>
 <xmx:PhxqXBXgpQNwR4U1kz5RBbKBaRe3LIBDZdUqMzKMuxi1jjzZ9KQkiQ>
 <xmx:PhxqXGW8UyWOAh89CEgvU8083oauaRr1l04VsywCydG_u1Zz0BYszQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 90B9C941EB; Sun, 17 Feb 2019 21:45:18 -0500 (EST)
Message-Id: <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: AKASH G J <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
Date: Mon, 18 Feb 2019 13:15:18 +1030
In-Reply-To: <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
Subject: Re: Unable to read or write from system SPI flash memory.
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
X-List-Received-Date: Mon, 18 Feb 2019 02:45:22 -0000



On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:
> I just powered off the entire board. After that the data is not present in
> the SPI1 flash. But before power-off it was there.

How were you verifying the data was there before the poweroff?

> 
> We are using OpenBMC Linux version 4.18.7 and pflash v6.1

Thanks for the versions. Should be handy as we dig deeper.
