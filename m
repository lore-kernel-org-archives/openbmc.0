Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AON+OG08"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="0J6Dq4Ll"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444gd95GfczDqLM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 14:56:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2F4F422F5B;
 Wed, 20 Feb 2019 22:56:26 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 20 Feb 2019 22:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=j8FdIrAFWcXqUn/Sy0BN6+U4J4QPbj0m/ky+q/D
 SkiI=; b=AON+OG08UkBNp/xAyw21D5ZZgljsaKU2v3ztADwWOQYnmGZAt0KVSvQ
 SMAGiAWfd2nT8uf4ZD9Ve27KV9zxQ1M8nJZ+nEb3/X4A7lUXVsHiD8Z4Kd5/0D3e
 V4HiSH5nG+wXNGnxy80yARQCJ2SGDnf1fECJIFnhC5+iCuXdDynH+gmHJ1qfT7QU
 vmwqf1dX+wHiNhN6OV7ttK/7bv3qXkOibDHw0iubtmmE+EoTMFhDncojodwckg8i
 OzYrm0jUjOavZD55CIUqbhL1Vd/S7J07dqySA77t7MALHGsM2SvoQ/VT2C8+fhs4
 3ARYiyDrfnR0qUThsbp8d+XGV+2OOJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=j8FdIrAFWcXqUn/Sy
 0BN6+U4J4QPbj0m/ky+q/DSkiI=; b=0J6Dq4LlTvQocsTN3wl9cIHlZaOzRHWW9
 qJlk1zcPanm0SATtbe7Nr7+SqJw0VGLysniyoDfde1OnTsz8TdpSiaZ9Rc+p5dHP
 P6SmWmackyfP7d6PpHbjxHBwPIDU2r3euXpB/3L2OpY1jaycTwf6mmllCiBFO8Ef
 0to31bdPN378BNbIYZeaNnjxBNqHc37mEX39JG5lrya+iyzsR6De6K3E89NV/6qA
 JvzXUja9EVOzz0C26YYIZTs70qtDXHb07kc5RdOHqSDjTBfJm0Z/CGtetMpzp8xb
 87lYNcGH4Ute+lrYHfw2n10ST8yTbSWhSEgeBRqhVE6pkel1DKH+g==
X-ME-Sender: <xms:aSFuXIJihK0_LFNdhSDoeQIiDeyuPEX8qvymnDhhCAzhNYjsOatCGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdejgdeiheculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:aSFuXMZZsStynjQVvXs0-O0RBqTpvhFijLf7VGKi5hHBKhw59xwjZA>
 <xmx:aSFuXMQQBGrIHSKq1W1X1BwvgLPiJNaAZXZBQxCsBzMVmsMbrEIJUg>
 <xmx:aSFuXEhMp49hAfQUlKubVCZpMWs51OudKlb8d3Q9PhQILh6kCeqLMA>
 <xmx:aiFuXPianX4VUm2NpFVTtK8nRHXTgl3rZMihdFPITlxwOTFNQGqaqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 537AB7C1EB; Wed, 20 Feb 2019 22:56:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <16fc4075-fd43-4d3a-b0be-1e2239e8085e@www.fastmail.com>
In-Reply-To: <24741baf-40ba-31c9-98e4-f229c4df7323@linux.vnet.ibm.com>
References: <011d0902-7189-4562-86d3-f50e7f249e12@www.fastmail.com>
 <24741baf-40ba-31c9-98e4-f229c4df7323@linux.vnet.ibm.com>
Date: Wed, 20 Feb 2019 22:56:24 -0500
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
X-List-Received-Date: Thu, 21 Feb 2019 03:56:33 -0000



On Thu, 21 Feb 2019, at 14:10, Gunnar Mills wrote:
> On 2/20/2019 8:42 PM, Andrew Jeffery wrote: 
> 
>   Can you please create a cve-2019-6260 repository under the OpenBMC 
> github organisation to host the tool?
> >   
> Why a new cve-2019-6260 repo instead of openbmc-tools?

No really good reason, just felt it was well defined enough to not get lumped
in with everything else in the openbmc-tools repo. openbmc-tools was
intended as a home for ill-defined scripts and bits that people had lying
around that they wouldn't have otherwise published.

Andrew
