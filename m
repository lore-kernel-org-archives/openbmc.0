Return-Path: <SRS0=cMHj=G6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC67C433E0
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 02:00:00 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00000206A5
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 01:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00000206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQRct0d0hzDqvN
	for <openbmc@archiver.kernel.org>; Wed, 27 Jan 2021 12:59:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=nL/PYQHs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Nx80O/u0; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQRbG6BpwzDqfY
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 12:58:34 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5FA48B36;
 Tue, 26 Jan 2021 20:58:31 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 26 Jan 2021 20:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=VxyXj
 1rVoQ3Tm1KRu5auI+208wPrkLbPlcqkT/1vpXE=; b=nL/PYQHsqKGb2PBsT/jZg
 2UNtHh7FyqgJPD/0ObbxkMxl0E0rYZzRsgGUhgQdnR1WmKUmUh5w/a33yliKk15M
 oX078qFjPA/k+awcXT5/zMI6JK6SIsUcYX7YNe+I+/EDjatya27Xo14Cdae+oZSk
 NDPat9OFKQC8dhKXswZw+UrjUYfDLuuty2wMb4SaPBF7njqBxgLmLfsw0RFpqgNn
 hah4n/k4rPKI1q7Jc5VFgfMcGdK+U7hteCe3aKFHlEep8iiJbJdoZPdtXbx3qy74
 uJzLF/+17hZn1uNTZIoW47U7BFAFkenaycwXolukELaYJ9G9QMMIFe+WcIFHMhkA
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=VxyXj1rVoQ3Tm1KRu5auI+208wPrkLbPlcqkT/1vp
 XE=; b=Nx80O/u02s2GbL1NNVJQjVS2/YhbKpic3xZ5qH31vSvK72WaeZTTvzEle
 o0buzReP6vi3P/2WV/z1MTZMs3UkMtI20URc0wcXDmcZC9v3yOo8HypIzoC1n2k1
 OnGIYWMDAfLpDi6Ilgk1dCuilzwCADHlAIIAC8SPbIhbOuIvb+u0zaRZoFtyetGp
 aPNQbGKRyWXctQwHEQiUI/lGa0CV78M5ZBYimvvIAAEKPlRxM/WVTf0A6tuhgrIF
 LyXaJeUSIU+6cQFukUGb6I/xKByOjobOaKUroF8il4LaV0eTT0QeipoBdkOJYYKu
 P98gl6gq+QQx4aYfUWKu8L9h9p3qQ==
X-ME-Sender: <xms:xsgQYHOpiPBcTEO6a6ZjfgUhUclTebtM3LsMJ5lZI9it2S7isEUGtA>
 <xme:xsgQYB-UZ2pNbYP3ARd3_L1I6o22lgYPMROTrqEj7z5rUT9lOYPj35ufvAN-g6c4y
 gDfRp_-aSoOdH5QYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvgeekheegfedvhfethefhud
 etteegueeggfeiieegueehkedugedtkefglefgheenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:xsgQYGRDIsM0HquQECT-ZcM08TdHFtxAC4rjFVajLqFW80cys2-KkA>
 <xmx:xsgQYLv1NfumT2RaATndiY4aZPx-NuI-pZR9sKspXJm1yXIPPSP-AQ>
 <xmx:xsgQYPdmZ1-hkarMuc73UjPSCSczPvEzWmoElczw01lpeEK0qry5oA>
 <xmx:xsgQYNqLmCV7umEPFsRUZqmXeb7rDZRlFzqvETxizJ7t75sX36lQsA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5638AA00060; Tue, 26 Jan 2021 20:58:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <a523848f-2f6d-4e42-b471-94d5d5b2e9f7@www.fastmail.com>
In-Reply-To: <000b01d6efe0$9f864d20$de92e760$@yh.kuo@aewin.com>
References: <000b01d6efe0$9f864d20$de92e760$@yh.kuo@aewin.com>
Date: Wed, 27 Jan 2021 12:28:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "prince.yh.kuo" <prince.yh.kuo@aewin.com>, openbmc@lists.ozlabs.org
Subject: Re: [OpenBMC] - QEMU link seem like can't download
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hello,

On Thu, 21 Jan 2021, at 21:01, prince.yh.kuo wrote:
> Hi,
>=20
> I=E2=80=99m a beginner of OpenBMC and I found QEMU link seem like can=E2=
=80=99t=20
> download, is right?
>

Which qemu link are you talking about?

Andrew
