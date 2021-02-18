Return-Path: <SRS0=03jC=HU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FE6C433DB
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 09:30:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B9F64D99
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 09:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B9F64D99
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh8Zy3k4Dz30QP
	for <openbmc@archiver.kernel.org>; Thu, 18 Feb 2021 20:30:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=k3q61lbu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=jk@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=k3q61lbu; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh8ZW4wfXz30J3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 20:30:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dh8ZT0Drrz9sRf;
 Thu, 18 Feb 2021 20:30:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1613640626; bh=xjrha/R47UIo/NSSHhPKw71rK3Kg9uG34DxysoyE78c=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=k3q61lbuuufY+bYpyE6Y21m94Gn9P1JL1xZhMkGltItHmC/JQjPgQfz2LY6rpToPa
 IyNj53M9rSLThryNYXaFzWygNX8rTS7aWdbfTnhiIusFuN57DnGg5I2JoC99RipZz6
 VG//RO0MMcqv/yiyE0WKZRtQ/HGPW08WOYxKI5qnqe9mR7kZTblXyoVg58CZ1HNwKE
 nvCDYu0IzDImqCpX+QCAqEu1NbN1q2c/NAjWifDmrn3oXAIkn++hF4Wg8PEpOSfYBL
 BAIQdLo8lvZmU4vRM6qQsI+aAtc4u2JIKPvsAt4oKhGHzs89v8a1aMxtL0gGzt0r3P
 O2Y75G332iuAQ==
Message-ID: <d86c9e7af760118af1ca2f44e370836414efe4b7.camel@ozlabs.org>
Subject: Re: ANSI Escape sequence unexpected output
From: Jeremy Kerr <jk@ozlabs.org>
To: David Wang =?UTF-8?Q?=28=E7=8E=8B=E6=8C=AF=E5=AE=87=29?=
 <DavidWang@quantatw.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 18 Feb 2021 17:30:18 +0800
In-Reply-To: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi David,

>     when I use the host console via uart to log in to os, sometimes
> some unexpected output is print to stdout, such as:
> 
> login: root
> Password:
> Last Login:  Thu   Jan   7  06:52:18  UTC  2021  on ttyS0
> root@intel-corei7-64:~#  ;153R     <-------  This is the unexpected
> output

It looks like you're only receiving part of the full ANSI escape
sequence there (I assume this escape sequence is coming from host
during the initial shell setup). This may happen if the serial
connection to the host is dropping characters.

Do you also see characters dropped if you output a large amount of data
from the host? Perhaps try a `ls -l /usr/bin` and see if the output
formatting looks OK.

What is the hardware serial connection between the host and the BMC
here? Does it provide hardware flow control?

Regards,


Jeremy

