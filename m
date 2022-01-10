Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FF0C433EF
	for <openbmc@archiver.kernel.org>; Mon, 10 Jan 2022 01:40:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXGjj1gqpz30FH
	for <openbmc@archiver.kernel.org>; Mon, 10 Jan 2022 12:40:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=LaH/CCUe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HZZtmeuv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=LaH/CCUe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HZZtmeuv; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXGhs0Ptlz2yQH
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 12:39:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 39C363200953;
 Sun,  9 Jan 2022 20:39:35 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Sun, 09 Jan 2022 20:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=enj+oRJzsE+oexQthB3ej+ZTLKMF4lU
 OIF6crlc+nJk=; b=LaH/CCUertyl2nC6j8ov0VOBilDVEOwTyvKjXhTTzaS7SCA
 rJ+BRDR6clKWx5LEplLBT0q0RLYn+GbRqEYlnYJgHVzWWxdgKcZht6vilpZ7A/NW
 TgbRinjoSvZT/ZQEHz9fGojHzC7+QL3TkHmK4HM6ciZRxen8V7Vi/Peu+UWdRjbl
 zXpe6z4dIk0tTVzkswOZkEhkcYZGgLuq/3bacWaPIEukGf5GC0f4H7qKaaHb3IFH
 5yAN4fEiIp8/XC9Syl7FMkFJAyHrJDKYt7t0nAr+j5D0a46uVoibLXTokwI4IBa2
 QZgG6ZgyYKWd1y+5VaGt1aXdEJ4PVd8O76taKcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=enj+oR
 JzsE+oexQthB3ej+ZTLKMF4lUOIF6crlc+nJk=; b=HZZtmeuvgGY59VlGlnBXdA
 Dab6wVAAO44//1cDld8th4EF/PhxYlaV2zzFWlOz20LbXO4YqjBbJ8ndw9PLtHWX
 HAJYc+87EvjyijBHyyXtM0ET82/QppIjGz9PeRY0j85Dbd00WJf+LTvBKNufIQHd
 vJZPrd5EAkFeaB8wWlnoM0H/FSBQD4EnbkIHjHKQ8DhT/2P96T2mIpZcPsKVMhbc
 P2zsqrqi8WNmVMjk1arewwVjmhPj0M12loTgmoMPdSRJlqwGlONEHcQmqkJVdwao
 KmPyC2feKGhUrT0jRUHhhhSFfdRg/RKuxlkaoklY+UZugC1PJY7vk6fNxH+lyrfw
 ==
X-ME-Sender: <xms:Vo7bYV9s6K_ZemRfSPZIoi5d284eP_VZJQG9rvj_R26ENN4J-GdlqA>
 <xme:Vo7bYZua3Uj88KEXsmPag6PUON_MB3He3_VPElm3l9OypZP1ELbH-RuQd6u5ig6ga
 xfAFwLZUSSNRubMqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegledgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepleekgfffkeetjefhtdffgfevjeevvddvveegudduffduudekhffhkeev
 gfeitdffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Vo7bYTBuhgduURyGWbmm78FkgcaFdPFz98jTy08ySNX2QcRFnP4X_g>
 <xmx:Vo7bYZd2X3ThlOs6JgZFlFeqWe6YUPe1JfPm6dhFUdXw2f0PJlnorg>
 <xmx:Vo7bYaPsqNKSvx7AG5Hq1HcvbAlBSYZR_Aa2nO3j9rJcRjz8oCFxNg>
 <xmx:Vo7bYdZlwhQimbez26QgvbVA74Wr7rDnWhnqBaGyCwgw9Tk7FsRgjw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6D360AC0EA1; Sun,  9 Jan 2022 20:39:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <70ab9923-a976-46b0-8ec3-bbdd689c50a8@www.fastmail.com>
In-Reply-To: <YdiCUiwh1iD4ycr8@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein>
Date: Mon, 10 Jan 2022 12:09:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: Upcoming TOF elections
Content-Type: text/plain
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On Sat, 8 Jan 2022, at 04:41, Patrick Williams wrote:
...
> The most important data that people will want to see is the list of individuals
> who qualify for voting in the upcoming election.  The current draft (for
> approval with issue #9) is found here[4].
...
> 4. https://github.com/williamspatrick/openbmc-tof-elections/blob/main/2022H1/rollcall.json

How are the following terms derived?

* highly-productive
* active
* emertius (sic? emeritus?)

 I didn't see mention of these terms in the tof-voters patches.

Maybe I didn't read the associated documentation closely enough?

Still would have thought this would be captured in the scripts.

Andrew
