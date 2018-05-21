Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZM768Ogo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OqAW0v0z"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40q36r4ywszF0Vv
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 12:45:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CE70C22199;
 Sun, 20 May 2018 22:45:37 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Sun, 20 May 2018 22:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=FNWeUSCpEGuaweWwg2QTJvo/zXmJt
 1QsiC+I5SLpGdc=; b=ZM768Ogos07NLJspJPUqryAZ2jSZybSLQLHaVCa3aOMX4
 EJSGo5jRglu5tlhK1P+BGiQTSF1SXXJyWmhGmn0dHF5jXgod0W7hQZyonT7VR7Bd
 OsnOI7QbPmz3u0q7OGa/XU286q331YbwSEWd4CwV5GhNOZX4qFkuN/KDjgukK4OL
 RXuLQylxrhWwcXsHOQNaajMn9OfBkZhQrGc5a2FiebFFec8ufBfhX0hNmIEXut94
 Drvw3a6lickinUpxbDCvKPMQt1pVkBJhJIauOaLt/yCb75A9MmStG198ZjEPfqe/
 HAU1lY2for+klMGGShkZxHVqTeyfnpmL9ksDZo9Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FNWeUS
 CpEGuaweWwg2QTJvo/zXmJt1QsiC+I5SLpGdc=; b=OqAW0v0zW3PgOpVcZHR7wt
 SeFji2nlkj35x7kssVonWzT1zb0grBL/sAytGAHAAxxXB6qipfICeOOf+hL9YS1T
 ExUAoWKkr9SyepDZ6HmSQkXcml/JQuAhuQ29Qnq7ZtuADD9TiQQgNLYjjfK88oMU
 gbiOpq9Dj8E6oOuS8TxUBPz4JNDb0qy4FEWABxsf+FmNQ25hLEoj+XX//7iHFMW6
 7j+REDLToKQXD9jJg45ZSFx5yEyudAbS9nGnBjR5szB4hHERf8xgQckjEOZrQEQ1
 YrbtOmwG8h/pAd8GkDv3ce2YJ9nqkiAB2ZothsZGxB/rEH6WJP+EvRPUNGvUB+CQ
 ==
X-ME-Proxy: <xmx:0TICW3NqQ1Fk3BNxPEQDYO1gP4viH141McYTXEZEz3zWUzngut6KaA>
X-ME-Proxy: <xmx:0TICWzkEa0uuv3C4klGIfw2ehTbezTMScDH7DA2L29MzrLEZ-JRvCw>
X-ME-Proxy: <xmx:0TICW0-s2TgT2kb_lol3gmixzYr692HDmO2c8xQXcFMG8YSK5xNxzQ>
X-ME-Proxy: <xmx:0TICW0OvSNipQvVEsy0-Y-81JWc7XNiMYkSaPEoc2QcSi1vikg4zkg>
X-ME-Proxy: <xmx:0TICWwHo0Jnpe_cXBs4B6YpxoSK8Es1s5xYrT3918u0Y1Uefo4V4GA>
X-ME-Proxy: <xmx:0TICWy86VV837tUqGPWfQSCOfFHFZakzqO4xYe_cggNEg5e89omIag>
X-ME-Sender: <xms:0TICWx5mO0d5tyB60Z6fDH9_Gex3qtuiP5YYnJtCuc6hYO2yYxResA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 555FE40DC; Sun, 20 May 2018 22:45:37 -0400 (EDT)
Message-Id: <1526870737.2605431.1378859312.7251F6CD@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
Date: Mon, 21 May 2018 12:15:37 +0930
Subject: Re: [RFC] AST2500 video engine driver design
In-Reply-To: <ff0a9c9c-2b09-00e5-3f04-4406b16309e3@linux.vnet.ibm.com>
References: <ff0a9c9c-2b09-00e5-3f04-4406b16309e3@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 21 May 2018 02:45:43 -0000

On Sat, 19 May 2018, at 01:12, Eddie James wrote:
> Hi,
> 
> I'm working on a driver for the AST2500 video engine; just wanted to 
> post up the plan in case anyone has any ideas. The purpose behind this 
> development is to be able to use IKVM with video from the host and i/o 
> from a remote user.
> 
> The video engine is a piece of hardware in the AST24/2500 that captures 
> and/or compresses video data. Typically the input is the host graphics, 
> writing it's RGB output to the VGA memory on the BMC. The video engine 
> will capture and compress the data and store it in memory. The driver 
> should provide an interface for an application to read that compressed 
> video in order to get it on the network.
> 
> The driver interface will use the Video4Linux2 API. This involves 
> standard file operations like open, read, and close, as well as a video 
> ioctl interface for configuring the device. Configuration options will 
> probably be limited, as I think there will only be one mode that will 
> provide enough performance for IKVM. I do want to be able to configure 
> the video source; either direct from host at the BMC VGA memory or from 
> the BMC DRM driver.
> 
> The most substantial part of the driver will just be the hardware setup 
> and manipulation. Intel has done some work here already (thanks Ed) 
> which has been useful for configuring the hardware and doing the 
> capture/compress loop. I'll be following what I think is fairly common 
> for video drivers and only initializing the engine once a file 
> descriptor is opened, and then allow more file descriptors to be opened 
> as necessary without further touching the engine, though changing 
> configs will obviously do the necessary engine operations. Once the last 
> file descriptor is released, the engine and clocks will be shut down. 
> The read operation will trigger a single frame capture/compress for now.
> 
> I still have details to hash out regarding streaming, user-space 
> buffers, etc, which will probably be necessary to get the performance we 
> need.
> 
> Any comments/questions/concerns?
> 

Sounds reasonable to me, but I don't have much experience in V4L land. Keep us posted on your progress, and pipe up if you are looking for opinions on the driver design.

Cheers,

Andrew
