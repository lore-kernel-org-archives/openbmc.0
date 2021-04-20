Return-Path: <SRS0=1wl0=JR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3CAC433ED
	for <openbmc@archiver.kernel.org>; Tue, 20 Apr 2021 16:14:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3193E613C4
	for <openbmc@archiver.kernel.org>; Tue, 20 Apr 2021 16:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3193E613C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPpfB4kKNz2yx3
	for <openbmc@archiver.kernel.org>; Wed, 21 Apr 2021 02:14:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p72y/+C8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p72y/+C8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPpdl3ZZZz2xdL
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 02:13:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02DE6613C4;
 Tue, 20 Apr 2021 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618935224;
 bh=cD3y7b3kSrwWftJRkxx0RYSxy1zhp+eP+mHHMyD5znU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p72y/+C8zRB7jibKzZbKoTo/4uyciL4SpZsoR7nj2YJec0zW/MCB5DPdwwosi/2pM
 U2GgmVaYXdVJoucJvIUgePup+nRr8NSaVmI4VG6xl3Hi4GEcaKuKdbnb/3MlwGhZRn
 6YRNqNYBKbW7XhTMAz++sKLDXKnCXn8YuoifOVUJodf2hEm0ZXACnhRjPBvARLkmBo
 UVPlbEHHUb1bmAGvpqkfXtNmmKTnilvKc4djCmzP/gPch3f5XUHXy11DVceQhGqCh3
 0UxfV6M9+HBiNWxwXcVLwhdOhPltUygJRaw7SKNahQArEKMYUWMPhhqZL/BuI7+OI+
 xDN6Rzd+SqB7g==
Date: Tue, 20 Apr 2021 17:13:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: Enabling pmbus power control
Message-ID: <20210420161317.GE6073@sirena.org.uk>
References: <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk>
 <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
 <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
 <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline
In-Reply-To: <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
X-Cookie: Falling rock.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2021 at 10:19:04AM -0500, Zev Weiss wrote:

> Mark, do you have any further input on what a viable approach might look
> like?

I already suggested writing a driver or drivers that represent the
hardware you have, that advice remains.  It's hard to follow what you
were trying to say with your long mail earlier today but it seems like
you basically don't want to use any abstraction or framework, but that's
not really suitable for upstream integration - other hardware that looks
similar to the end user should look similar in the kernel too.

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB+/Z0ACgkQJNaLcl1U
h9A2Hwf/SWR76PMEbzeYJSpzqHxdwIVdQoQPT//JnsDvGXFKZpXK29a+gvAY9EW2
vR/O/no5OLWRaQ6DRjrNbg4y3kcNsGSIMBrl1g0+jO+Iznes8ZRqBkFYcsh2uHnA
b6ZHnLqIhfIoSxC2WfYKo1ZlHoJzZJwgD9tTIs0B6/jWJ0VmtWH1Vfkg7Efcwfq7
YQv84OLLrLaXPBCrF9U2Gekw+Ju9JHnH8fPIlyeHQHN1JW4M/nOYc7ri5R/islne
SLA9DkV7l/cr6YUDU6eKCB8F5I2XEpJOOLgGcnMYo0rpTZoypOUygw6ZxEXk34qy
2AmIyG9TTs70sV/hLjrJEXBh+PNynA==
=T6vq
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--
