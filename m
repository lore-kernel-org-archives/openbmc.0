Return-Path: <SRS0=myNV=I4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D67C433DB
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 18:02:40 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D398619BC
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 18:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D398619BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8y306cNTz3cN2
	for <openbmc@archiver.kernel.org>; Wed, 31 Mar 2021 05:02:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kgYgBPSt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kgYgBPSt; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8y2Z5zDdz3brV
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 05:02:14 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDDAE619BB;
 Tue, 30 Mar 2021 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617127332;
 bh=Y45/WrWYteUQd+k3a9s1FlymTzr+5CIVLdESSGSdwF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kgYgBPStEvsCMIrKhgF21xVDdGzCOn1xcuRLwHRqpqabpfBf/1jdmaEsOBzpWz5PK
 qbGG8MCDcrvegDrLOcPxzngYY405ZCcshIWROJkkKBB/cLO0MsStdA3CQolyQyvaq7
 fTCfdaR2PLx21Juk+7JqdWOy+Oe2SnVmcnFwiaNop14N9w09DeifCvLUlq2zcyDD+O
 6tCFQFt6BvYxiJqRUPAwaTjViBq9x3eoWOfTIc8uon9uzYAjpEigz1CgisEurWTRX2
 vwZ93G+pwV8ZrHH8a95pi59NsCWCUgbKORH6285tJwYf3Y1iJK9fSOZIl2hnND3Qtc
 VgUvBl9eTmHiA==
Date: Tue, 30 Mar 2021 19:02:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: Enabling pmbus power control
Message-ID: <20210330180200.GK4976@sirena.org.uk>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DozTQjXnjm3C9Xhk"
Content-Disposition: inline
In-Reply-To: <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
X-Cookie: Memory fault - where am I?
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


--DozTQjXnjm3C9Xhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 12:56:56PM -0500, Zev Weiss wrote:

> Okay, to expand a bit on the description in my initial message -- we've
> got a single chassis with multiple server boards and a single manager board
> that handles, among other things, power control for the servers.
> The manager board has one LM25066 for each attached server, which acts as
> the "power switch" for that server.  There thus really isn't any driver to
> speak of for the downstream device.

This sounds like you need a driver representing those server boards (or
the slots they plug into perhaps) that represents everything about those
boards to userspace, including power switching.  I don't see why you
wouldn't have a driver for that - it's a thing that physically exists
and clearly has some software control, and you'd presumably also expect
to represent some labelling about the slot as well.

--DozTQjXnjm3C9Xhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBjZ5cACgkQJNaLcl1U
h9CdzQf9ERC9wd22hEhQ19B796qXQvItxatpQ4MJaOUZQsXyQ4k2FNls26aJN2x3
luvG+wp65djxDvvIecDshqf+Jc1dKsfvLHWUX+BF2ITaFCUujBRPqqozGeAvtjrv
wFaIMt77lymSGdd24bh7JzeM9QAuGzKcbgPu4SHdW1KRT24z+PY1+fxW2XjJFTlV
4R2+TmHe3cfJEclZ9U3MpCL+CloA0WmNsvVfQA1aS/byFl4gd9IfDpUcelDHpyqd
Rr3hExzCdIiBTczMlACJMQzBF3KvMY5gvX1cGav99Z8P4t+kiJKBlxkw/HNgnAVK
4twhdleGMXt5++WJ4sHJKvk9nfSw1w==
=ZTCR
-----END PGP SIGNATURE-----

--DozTQjXnjm3C9Xhk--
