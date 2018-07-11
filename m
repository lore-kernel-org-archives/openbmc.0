Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="phNAHq3V"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KxrsxR9M"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QhT41JQXzDqgP
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 00:36:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9999C21C93;
 Wed, 11 Jul 2018 10:36:04 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Wed, 11 Jul 2018 10:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=xR5xkdFwrv2MXBwUCGazZNtX4B9i4
 GypInz0BmCjGdg=; b=phNAHq3V0p4PMATVL+g4B8ODy/YTGSziVjeRSQ6A0g69R
 PRvex7qVFZflQKfMSTcGVGUsbts5pmgPRVww3SwQ5c1QImeucICj8qyfVpVHBpqo
 gqlpQGa5K/NBFV97Rb3InRK7OaaLYsnaAboNnhaW1mFUAkQ3attZ76U7vvGC+Uh7
 dLyFzhqdKBKJ4klZAxNogSNfwpXLNxZarmTKsrkwgBO8VLw4lM+q/R8kPQMI4aFC
 kwMvNCax39Tamx7lPaWnw4ZvFI/HrglYGTEvvWe0j3bq7SRXgaIIN6r1dSW6NqsI
 clqgDOkxl7VHc5J9uw1nmfSC0W00yK+qU6EeVrj+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xR5xkd
 Fwrv2MXBwUCGazZNtX4B9i4GypInz0BmCjGdg=; b=KxrsxR9MiGlCYzLOl6IQJS
 efqtj5FX+zuHtNq9znv+4GVn+ZodZ8izsaJVvGG5zn6jPz/3GHf7Go5Fa7EYp1JR
 u7lx2WF8yiiiHwLU5hBu8Kwp/rNNUS8n1BSBZGvy168moYV4/n9Kr4iP7osRXdw1
 ZOle+StNoYdFT3irPtNLml33K3QYKL/cRVVJv1vwCDtzKF5XTw4E3OxhX5k0dANS
 PGdkgjsP6xD0Q2nVOpV+oHXwAW1fqmFAP6fEpxGwV8h3Wmjt5rIS+1CiYknNuFgr
 U+trZC37xgG9FC6xci87kss/F4SyOA1lA8iBRAqHv+/A05Ki5XwX6gfj5g+zTRYw
 ==
X-ME-Proxy: <xmx:1BVGWxTd06Uow5UavkI-c3kz5aTiN3crpW9jH6tzNKqG_2ZeqA5FMQ>
 <xmx:1BVGW-JSrcaXX0tY_EtOOJDlYHK3vYbzWORirWL1h4Lwm4vtDYmtbQ>
 <xmx:1BVGW5_V7EJveyJIef7H6pcLA9AeSvGEESn0sBG0WZk1gYsGMc8dwg>
 <xmx:1BVGW84edQPq99iaxBtTGAJM0zPgZPj0trHcevfxWO4n8oK88GOdJg>
 <xmx:1BVGW9OO5Tw68umd0-nOyK9E6kbdq_1-5ADD0IDiVk1O5-u-vcF_CQ>
 <xmx:1BVGW0clnRzqICn_o31PJNbHLj1BEIrWERntYwzCDnp6FHwQ-2RFxw>
X-ME-Sender: <xms:1BVGWzM7iV47Tt9VqE19DR0HiExpEc_iMdQh2UhMMaadrE9EyaBg6Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 16C3D9E0D5; Wed, 11 Jul 2018 10:36:04 -0400 (EDT)
Message-Id: <1531319763.4184525.1437335200.4879B6DE@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>,
 Kurt Taylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-957169fa
In-Reply-To: <CALLMt=oO7x9MtCNrmFzrXCrmYEiVys31cLJJat31N1y89nSZEQ@mail.gmail.com>
Subject: Re: gerrit server update coming - 2.15.2
References: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
 <b562920a-329f-d5c4-28af-555e4bb3bc33@gmail.com>
 <CALLMt=oO7x9MtCNrmFzrXCrmYEiVys31cLJJat31N1y89nSZEQ@mail.gmail.com>
Date: Thu, 12 Jul 2018 00:06:03 +0930
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
X-List-Received-Date: Wed, 11 Jul 2018 14:36:11 -0000

On Wed, 11 Jul 2018, at 21:40, Andrew Geissler wrote:
> On Tue, Jul 10, 2018 at 4:33 PM krtaylor <kurt.r.taylor@gmail.com> wrote:
> >
> > On 7/10/18 3:13 PM, Andrew Geissler wrote:
> >
> > I'm planning a gerrit update in the near future (this Saturday
> > maybe?).  Anyone have any issues with an update (or know of any issues
> > with the 2.15 release)?
> >
> > OpenStack is still on 2.13.9+ (we're at 2.14.7), is there a problem we need fixed? No issues, just curious.
> 
> A few months ago someone asked when I was doing the next update 

"Someone"!?

I'm crushed!
