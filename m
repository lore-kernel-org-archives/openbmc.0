Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="wT1Opbvu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y6ub2HGH"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440syN1vSlzDqKX
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 10:28:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 10E0722005;
 Thu, 14 Feb 2019 18:28:09 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Thu, 14 Feb 2019 18:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:subject:date:in-reply-to; s=fm2; bh=sa2
 Zzp+X+ceKzgAHk8aZPo+/0FS2j7Egs635/0WFl3c=; b=wT1OpbvuQUcJnyxuA0k
 SjVqDRNpG/uuYMBLYNeUVJMjw6aF7K/uQMZkomhA+or3GnqkFtscV2usqWgXSZYr
 WBOtsIuDHNXkt1o2bXQgDXJsMTgyf7K9036v/c4x/FX63APbJhqgF0N0aggDoOtv
 tATXWN3l4SaPqs5IqvUdhUyva9wSV7ujZf0EXp7ouD3KBoz12BwizTXElii1wUUs
 /5UQKQZrAJ9SplK8JGgbIHbgCBVps4ZMstvCnmFfyMjDt407rEESKNF0j26+auOU
 HNTQ/QpVAwkYGudxE4JNgZijvzQsW26gWiWb1tr5/rvXsX4SnVZ44XRc0ndJZUjZ
 FGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=sa2Zzp+X+ceKzgAHk8aZPo+/0FS2j7Egs635/0WFl
 3c=; b=Y6ub2HGHDt+rAIhIXLiVsIpDCtMzuQI/EBxt75idGJMwcGL56cA4SkLjH
 RaXI1gYNXsz2aDHJ/rdb/l8VN5QEzePHZ9VdfEjcvgrZm3fpcuZSJN3FQlNYNtXP
 tHCl8gQ0HZRfUK9qKjrvI+i2Jkbq4Sv9Bz7R2wlIIKu7HSCtIqPh28eNhaBs/q8h
 RyFNUwR3Z0toytACG5LmkhvNSWMuRfnjRHcm5zzdA2wKlmCftQ6qskqABSwWvQug
 SX3I/dW8gi+ZAA5c/OnZRhnLqY6MWuBR4LmytrEWPDCX4tu37otIiNYTpPysUiSE
 9Ofwj3rOjZzLExvkBCVDAMQnJfsHQ==
X-ME-Sender: <xms:iPllXD-gVboW2ntQYbJ5DOS_6G31mqlSnb_w_2PhLhiVMWkGjn49eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtiedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fofhfuffgjsehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:iPllXGlQ4wpbHmVT-45n0738ZcyUKfr7-sVX8cukiHLKUF6Xq_Intw>
 <xmx:iPllXN8TZRb3OX0aJz4F_ZpGzd2bGzQmWBRGm-zD3prP7kvOdY6yUw>
 <xmx:iPllXMnZSnqlvd9eLuobQOkb4Yu0c7iSwhfnRk3l5xgJptVh5wAOYw>
 <xmx:ifllXAFc5FVFtgpmtjfIBi4mPmnvtfjF--bq7SD1eXUiCnCI4pwJCQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6CEB494513; Thu, 14 Feb 2019 18:28:08 -0500 (EST)
Message-Id: <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
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
Subject: Re: Unable to read or write from system SPI flash memory.
Date: Fri, 15 Feb 2019 09:58:08 +1030
In-Reply-To: <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Feb 2019 23:28:13 -0000

On Thu, 14 Feb 2019, at 14:59, AKASH G J wrote:
> I am using the following command to write data to SPI1 flash.
> *pflash -e -a 0 -f -p <filename>*
> 
> On Thu, Feb 14, 2019 at 4:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > On Wed, 13 Feb 2019, at 19:24, AKASH G J wrote:
> > > Hi all,
> > >
> > > We have a test board containing BMC Aspeed AST-2500. It contains BMC
> > flash
> > > memory, SPI1 flash memory and SPI2 flash memory. we are using zaius
> > machine
> > > configuration for building Linux. When I am trying to write to SPI1 flash
> > > at address 30000000 using pflash tool, the modified data is not reflected
> > > after reboot. 

A reboot of what? The host or the BMC? Does this mean that the expected data
is present after the pflash but before the reboot of whichever system you're
talking about here?

What are the versions of the BMC kernel and pflash tool that you're using?

Andrew
