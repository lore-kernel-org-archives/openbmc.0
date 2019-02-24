Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YEdZsXoT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cPJ/Ssgt"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44715t21YnzDqMG
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 10:10:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 64FB822083;
 Sun, 24 Feb 2019 18:10:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Feb 2019 18:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=xT0GmMEvjUkVXczmmSEzt23cn1/ejZv7yG3NI0R
 kVZY=; b=YEdZsXoTRKJcTiXSvqt0ykZo6/r4NvXF+/mLN1P+0KbfjZj6w54/9ut
 17/LC9FeBZWg+c6EY1Ktcn1hysGiWf9lSopBGXrP86dEuJZEtdG5Y6cIX3agpJg8
 xj6L+l8elLO7XO5//HI4EYI4vtzGI82wWuOG9aNzhDctAxDmywXcinHjRzMDeKcO
 vb/Y7+/3YxR0SJEWHEKsFalmY1sJNdIQ4vYN0whGAvtGZ5Rvufx7THtmINXO6Rwz
 am50AgQgiGOliwkYVueBKV7U/AySesqoIaiEKcg816hPF+gxuwz6e9OXuwiBS/+D
 tOWJ8R3siB3N8mjfWENIZ+Zzw5lfs2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xT0GmMEvjUkVXczmm
 SEzt23cn1/ejZv7yG3NI0RkVZY=; b=cPJ/SsgtFEtC7gf3YR4glt3yzgxf+ATBg
 Xi+QwA6dDkCLlWfXxWKmfmJ+kRlZcfW1S8E6dn34gW3nuxN/5WL3ei5vNcVrNeOp
 9eHnviZFn+J0gQ79KvBw8heWf3KNX+qLI5pNYweHtp+KGUvG17Q+KpxPaayjI9UG
 LEu0bfBjOJQtAjmFrrQMiCwhGI7fGE0hDcCH/xnaryRFkW611IsEBZTBJyOl2q+q
 zZvhtqtyECXyNRtHOIZOuudxqEBgWl0ahVmqDLdRtc4knPPt97EDvJnDI62zHlce
 kmhNn4kQZDNG/ZYMoqfC33+WZVYit9kYG9gyB/G4eI5VJ0htODzKw==
X-ME-Sender: <xms:eyRzXGGYt-P6SOwF6ATqGLCBlaF2MuK67TCgodRK62eStLXylYpQLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudehgddtgeculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eyRzXOOC4OlPmNxviT4siadPweEwfNLELrzTmadJHcEplNq0SdNYZw>
 <xmx:eyRzXNEtBdgNIO_t4TSE1sksSISPiB4GmWXNp46zZf25W_1OO8bGRw>
 <xmx:eyRzXNNR3Yk9jPM37Vnd-YS1W9wIzaKJ5xcFd2S_BTrss2SePc99iA>
 <xmx:fCRzXKVtWgaMtrybG7CZoJSFeSIYtE0niJZjhdfpIFioF_JbmqB2xw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4DE097C1EB; Sun, 24 Feb 2019 18:10:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <c650b738-f8d7-4508-9f6d-8cbf40a66e33@www.fastmail.com>
In-Reply-To: <16fc4075-fd43-4d3a-b0be-1e2239e8085e@www.fastmail.com>
References: <011d0902-7189-4562-86d3-f50e7f249e12@www.fastmail.com>
 <24741baf-40ba-31c9-98e4-f229c4df7323@linux.vnet.ibm.com>
 <16fc4075-fd43-4d3a-b0be-1e2239e8085e@www.fastmail.com>
Date: Sun, 24 Feb 2019 18:10:51 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Gunnar Mills" <gmills@linux.vnet.ibm.com>
Subject: Re: Repository for CVE-2019-6260 test tool
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
X-List-Received-Date: Sun, 24 Feb 2019 23:11:02 -0000

On Thu, 21 Feb 2019, at 14:27, Andrew Jeffery wrote:
> 
> 
> On Thu, 21 Feb 2019, at 14:10, Gunnar Mills wrote:
> > On 2/20/2019 8:42 PM, Andrew Jeffery wrote: 
> > 
> >   Can you please create a cve-2019-6260 repository under the OpenBMC 
> > github organisation to host the tool?
> > >   
> > Why a new cve-2019-6260 repo instead of openbmc-tools?
> 
> No really good reason, just felt it was well defined enough to not get lumped
> in with everything else in the openbmc-tools repo. openbmc-tools was
> intended as a home for ill-defined scripts and bits that people had lying
> around that they wouldn't have otherwise published.

In the mean time I've pushed the repo here:

https://github.com/amboar/cve-2019-6260

> 
> Andrew
>
