Return-Path: <openbmc+bounces-2530-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41A4C624D6
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 01:53:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hb2gv4Y7Tz2ygW;
	Thu, 03 Sep 2026 11:53:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788400427;
	cv=none; b=YyfqP9hgZJ0iH6qM0pqMooA9rPp1NGl8ZTjyFzFlh9hc/rgrUWGc/shOqaS8n4oFxOsMw15RQzRR/YiCdvxUUqHonWFUzbbqezxROCI+EduF3rMY4sJq9KqNJQvge37eB1F45a3XBu+abeg42dwVZqk6i0Y1sUhAVJH/6WqknK+bPleQL7bChaUm9e3LgqKNt/nAE9RghIKtgdAKiSN4SQsafmaZfoQ27PDaPshRV1xXrTo74LWJTgdupferNzneqMF3VMjFFHYkSTyaEnjE1yFw7traMZxsbfNrux5bozZw3j15KiuGz+AqJYBDQxyw47VudhpwGB4BLho2Yf9CcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788400427; c=relaxed/relaxed;
	bh=P7vw+O2LJlxtwaiI7JNN4hfyqokmCmPR4IXiEDnVWec=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEHaaGDad9sMaky6v5O44/ebNnuoxlvOGQ+YyJGZUnIQNIm+33ONPOkU5KqgDA+3uAx49mUXiwe92E8cIZPaxOBb8H/sApjdKGEGPuuuQHjFE32VHNPw8nMhdWCrKKl/IETQNwau8cI90URf9g36RP+xIOHXNYpTeoIKi9OzKUFG7qWt3NkGkoC8mGOecDAQfKZcnVy74D7JWXGk1csfXBAnNw9NnMJHzuS5kbRxKsuC40FdGoZhFR7P2NifWavRDL/5wFa7P6TtVX513ZhPcuJMj8JkmcW3NytLehH+M1PUg79OEvTpd+gjAafj0s9WQsGYmwGagquRveptGVV8+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ilgT5YpE; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ilgT5YpE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hb2gt4JnQz2y2Q
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 11:53:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1788400424;
	bh=P7vw+O2LJlxtwaiI7JNN4hfyqokmCmPR4IXiEDnVWec=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ilgT5YpEb5wn5TZsafcZQLdozUtPgeWonirh/UdpYSBX3QVU1M3yVZxGK1PqEpNCe
	 8YtTdleew+DcUVDSeJhIKUZyKIUDi2rLjwXCdW1XzJxb32AhI/1w7xtsf1L1wE0T4C
	 dvZhgi9ifJJ+e0DkjowfyS/hPtxBJMkKX8De0WiyBAosOuatkG2YKkPNBEFw4/vDnN
	 smOnUNEshGJsfuwJZOrSpgJDBBbjr+98u14ThuizqIacnFu8TDMTgqY0mXz/xiiGhw
	 fzuDxjidv3teYwSPjOUGhaYf/G4n1F9r0ATF4OZthLC21pD6KNPJ296HOG7qPOrLZL
	 OoemInmB6UFHw==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7254767A89;
	Thu,  3 Sep 2026 09:53:43 +0800 (AWST)
Message-ID: <f2d729c0ca7f6587393c1a58799f2921f46c749d.camel@codeconstruct.com.au>
Subject: Re: libpldm: CI not running for new contributor (93691-93694)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Alan Tseng <alanhc.tseng1999@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 03 Sep 2026 11:23:42 +0930
In-Reply-To: <CAF=WuWzCph7QzJgrPO_XsOuAiAww_byW_sh1chkdOrqVwNXZsA@mail.gmail.com>
References: 
	<CAF=WuWzCph7QzJgrPO_XsOuAiAww_byW_sh1chkdOrqVwNXZsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0

Hi Alan,

On Thu, 2026-09-03 at 00:56 +0800, Alan Tseng wrote:
> Hi,
>=20
> I'm a new contributor and could use some help getting unblocked.
>=20
> I have four patches in libpldm that have been sitting since Aug 19
> with no CI runs:
>=20
> 93691 - platform: Reject a compositeEffecterCount of zero
> 93692 - platform: Reject a NULL field argument
> 93693 - platform: Avoid unaligned loads in value encoders
> 93694 - platform: Use the sensor data-size constants
>=20
> https://www.google.com/url?q=3Dhttps://gerrit.openbmc.org/q/owner:alan.ts=
eng.cs@gmail.com&source=3Dgmail&ust=3D1788454438947000&sa=3DE
>=20
> Every patchset gets "User not approved, see admin, no CI" from the CI
> bot, so Verified is never set. All four have Signed-off-by and were
> just rebased onto current main, so they're mergeable now.
>=20
> Do I need to sign the CLA first,
>=20

Yes, see:

https://github.com/openbmc/docs/blob/4998187c05e8d4aee496081d5a37fe71db1164=
2d/CONTRIBUTING.md#starting-out

>  or is this a matter of getting my
> account added to the CI allowlist?
>=20

Once you have a CLA with the project, you will be added to a group that
will allow CI to run.

Andrew

