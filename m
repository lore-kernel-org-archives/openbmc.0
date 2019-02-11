Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="au0EeWXf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CdO+l2gY"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z1Jk2lhDzDqZy
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 09:52:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D057322BCB;
 Mon, 11 Feb 2019 17:52:35 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Mon, 11 Feb 2019 17:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:references:subject; s=fm2; bh=Kn3
 +kOVYbTSADUmcPBdUie6J8U3XiEg+VvIRwwGLxmY=; b=au0EeWXfI+m+uZYCktq
 +4wGWkkbhaDDRmxNm9gdxejtYLmrMgpbzOVM76D7lfNKt48avv9xlvvHQi9o9e33
 MS31KpWPGdp/eboLgwgJ7J9GRcUhjk5cPPMA13C6R2+M+IKeUgxwE4fRfHNxvaeL
 prTj3WHim3Vv/oI7tnSmneN8GQFmG67+jFZGze0Tsw/udpzU3gqEueR1ntZmFkWg
 cdtAdIdFq34g0ouInAfAAGvYSqA9FIWF7hq6Q3SjKT5ZzvyG2BAWmXc3GxCIOVXk
 NZefCPZxIamywJG4WBEgjogATEYv7F8Mc3ns/MBLXEdYCRyoRs86UKpPPxp4a/08
 JhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Kn3+kOVYbTSADUmcPBdUie6J8U3XiEg+VvIRwwGLx
 mY=; b=CdO+l2gYmwVIRR84mHoZdQVi3FMyrpJatTgu2Sbrp7+kIZpCsTOpVBQ2l
 acHYNM01I1Qr0b7+qkyswZrY2SP+JL4tkMY+zLjRNziTb+L/Ohrr1OcLvCT9KjeR
 0Yg33WgaK1wYDFZ+/hx7vXt5sXKKa9Ym608fe8pcy24q8rlhv7DaLk2dtObfpNue
 L4rDW1diMvsWQtIIaQg6VcAH6JlxVf7ZmYqbMNm2PSW12ZxW/WYPKyFPS/JMBWbX
 1fv1kFGlgOb8bm7KN3954dxdwmcq9sQ36XV3VLHK9sjQU9iq6lkCk2CUcvVDNjx6
 wpMfWQZyPNZ+r2hJo4r7wWkaGBpIg==
X-ME-Sender: <xms:svxhXJtUtlBfV3PI7RK0prnL3cB9FXuRh1jN7gvBoNov0qXIRoUKlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddttddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fojgfffhfusehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:svxhXGiizuI-JjmCkYFFTxXOyHDi4k_p0SLifN4MqT1moaYoY2o73Q>
 <xmx:svxhXB8txE9E-Pn_FgFeJNC6lSNYiBo1gP0i6QXzxKDyKhYrxwKbnA>
 <xmx:svxhXAv2uwpaLR7uR37OH-Bm1Kzj0BuQ6ij4MUEEdO3FALRLOXczpA>
 <xmx:s_xhXMt5j2NlEJ2ZWRf-raxyql6VwtOQVNTjZvd5Ynl_2qUI8_qUUQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7A727942D4; Mon, 11 Feb 2019 17:52:34 -0500 (EST)
Message-Id: <1549925554.1671710.1655910736.5D2C2BD2@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christian Svensson <bluecmd@google.com>
Cc: Christian Svensson <blue@cmd.nu>,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
In-Reply-To: <CAEfeXvaYO4KRFYnsvfdEevzgNgCJTwY2EKsT6ow71hzK13HfMg@mail.gmail.com>
Date: Tue, 12 Feb 2019 09:22:34 +1030
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
 <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
 <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
 <CADiuDARPsPGkHP1HRm1RVP=G2scSLozSON3o5h_PuA3ngT5eXg@mail.gmail.com>
 <CADiuDARu6fwudJjcfJ0=sDpjQvtsog+GT5gUWu1WPTzPejFaZg@mail.gmail.com>
 <1547432051.2375740.1633677528.34818C65@webmail.messagingengine.com>
 <CAEfeXvaYO4KRFYnsvfdEevzgNgCJTwY2EKsT6ow71hzK13HfMg@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
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
X-List-Received-Date: Mon, 11 Feb 2019 22:52:41 -0000

On Mon, 14 Jan 2019, at 17:48, Christian Svensson wrote:
> On Mon, Jan 14, 2019, 03:14 Andrew Jeffery <andrew@aj.id.au wrote:
> 
> > On Fri, 11 Jan 2019, at 23:00, Christian Svensson wrote:
> > > Ping. What's left to be done here?
> >
> > I've taken Cedric's tree and pushed it to openbmc/qemu master, so the patch
> > is there. Did you send it upstream originally? That's where it should go,
> > but that
> > will probably require fixing the issue I pointed out last time.
> >
> 
> Ah, wierd, I swore I checked the repository last week but I must have
> checked my own fork or something. Thanks for pulling the patch.
> 
> As for fixing the issues, any specific concerns with the proposal I replied
> with back in November?

Sorry for the late reply here. What was the suggestion? I'll try to find the thread
in the mean time.

Andrew
