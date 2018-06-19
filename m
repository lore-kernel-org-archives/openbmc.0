Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Kty7NY02"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VArXwIXH"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418wpX6TtQzF0Tn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 15:03:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9193F21D2E;
 Tue, 19 Jun 2018 01:03:30 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 19 Jun 2018 01:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=vwS+w72aMJ8pUVt67xnbWKx3STi+p
 myeI0l6Uzb2/W8=; b=Kty7NY02fWIyQVmG7H788K7FTHQyL070dWqpuAkPFYHLm
 FEbqQlOc/5Xfgr+vLgJr2utlU9KlICs7u7W17j1JK3gaMQTRqFPnVkfPGJf9eJgX
 qwe/QDF0Z2NgYugPW8KugPIpb8oSByoAl0/5q7ItzElOPZiGR//piQs/7NQ5N2fC
 lEcXAbATU3st1gL6gOZEADdixKftSUJmMt9/IF3RsK9niKAohXxWgkCrxEyS127Z
 9a8qmoVMUTBWUN3Dj1s/RRPvbhn2pmbaaE95etcEexgtI72f0Vd2HUarP9NKXUSN
 YH/xlsOHi4dN9M3cXwduD0P+mJf/ExHKeKvHmstUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vwS+w7
 2aMJ8pUVt67xnbWKx3STi+pmyeI0l6Uzb2/W8=; b=VArXwIXHt4ijSYth0ipbyK
 xMJmbiNtuK5lsQEj2DwnWozpCD5RkHYpbgGRwQKAqKTcXmdVaao/9pfHsVi2HRBv
 vxtfEfIlZseX1CTfH4ET9lfDX0tkb3ZouPKoeaePYjM+Cnn5yULQUZWsypjzK22R
 WdSxhDf9wVKNN9aKnHlz92EuspalpioBUoa1TjyUaNZlrmVWKXPqcgRdfyzBiCzf
 ygC0OWIFQBVRx5JMnV3WTKZU40zVMz+eRcY7Ctr8GWyovBTObCWZTlUvxss6VNIh
 RlUyT5RAikvgy99LwJvLbkWL1qtQqCfGK/JgFVLlls4vu/unfUuVg4tglvOUoPBA
 ==
X-ME-Proxy: <xmx:oo4oW0XTOIASYwfXpEGExTTFEB7zu__XgYg5-E8icG5Kwip-yXICVw>
 <xmx:oo4oW-NbPWxx_ox1CHNnFEY4FtcX_aHYBW5wvZcH_TpkSDz3aA123Q>
 <xmx:oo4oWwfHyfuEAvvVHsHd8k6NFjgz6dtxuWjbT3rJPYo4KRLyv1rTZg>
 <xmx:oo4oW8DifVjgglOhBWzTmf5bHf_-wy5Tgg4QehjQANtN5UjygaG12A>
 <xmx:oo4oW88IFSSEfTJLnIn1dgUebpz71tXbw-jv6mb7qUR9B902iyc57g>
 <xmx:oo4oWwFhCq_PAyXt8N98G2T0DHAkwHodGN2KQJZSEkHO47fqP_tARw>
X-ME-Sender: <xms:oo4oWxGOafjMm5AaXgSFQn2fsEjjUuDhgSHcgQ16GGxQC5OFJB6-rQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 4B601BA43D; Tue, 19 Jun 2018 01:03:30 -0400 (EDT)
Message-Id: <1529384610.3876807.1412670280.70BEC92D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Subject: Re: 4.17 kernel published
In-Reply-To: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
References: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
Date: Tue, 19 Jun 2018 14:33:30 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 05:03:33 -0000

On Tue, 19 Jun 2018, at 14:24, Joel Stanley wrote:
> The 4.17 based kernel has been pushed to the openbmc Linux repository.
> From gerrit:
> 
>     kernel: Move to 4.17
> 
>     This brings the dev-4.13 development cycle to a close. By the end of the
>     cycle the 4.13 tree contained 236 patches.
> 
>     This moves all of the 4.13 based functionality on top of a 4.17 base. We
>     currently have 97 patches in the tree. The reduction of 139 is mostly
>     due to code landing in Linus' tree, with a handful of fixes being merged
>     into the base patch.
> 
>     The configuration is updated with newly landed drivers. In addition new
>     upstream security features are enabled, and legacy ATAG DTB support and
>     /dev/mem are removed.

Nice work!
