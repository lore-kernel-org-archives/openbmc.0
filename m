Return-Path: <SRS0=kQGr=P7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF28AC433EF
	for <openbmc@archiver.kernel.org>; Fri, 12 Nov 2021 22:55:56 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF00F60F5B
	for <openbmc@archiver.kernel.org>; Fri, 12 Nov 2021 22:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF00F60F5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sandelman.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrYpf1CcLz3c7D
	for <openbmc@archiver.kernel.org>; Sat, 13 Nov 2021 09:55:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 338 seconds by postgrey-1.36 at boromir;
 Sat, 13 Nov 2021 09:55:26 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrYp65J27z2yHX
 for <openbmc@lists.ozlabs.org>; Sat, 13 Nov 2021 09:55:25 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 7F0DB18029;
 Fri, 12 Nov 2021 17:51:42 -0500 (EST)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qxGtKtNWTwoT; Fri, 12 Nov 2021 17:51:39 -0500 (EST)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id B7CD318023;
 Fri, 12 Nov 2021 17:51:39 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id CA3DC40;
 Fri, 12 Nov 2021 17:49:31 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Unix-mode newlines
In-Reply-To: <YY6TjcddpoYGmEK2@heinlein>
References: <YY6TjcddpoYGmEK2@heinlein>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22447.1636757371.1@localhost>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Nov 2021 17:49:31 -0500
Message-ID: <22450.1636757371@localhost>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Patrick Williams <patrick@stwcx.xyz> wrote:
    > Generally we've had a preference for Unix-style newlines (\n) and no=
t DOS-style
    > newlines (\r\n), but it has never been documented.  I've recently fo=
und
    > a small number of files that are either DOS-style or mixed-styles an=
d I've been
    > fixing them as I've ran into them.

Check out "man gitattributes"

You create a file like:
% cat .gitattributes
# Set the default behavior, in case people don't have core.autocrlf set.
* text=3Dauto

# Explicitly declare text files you want to always be normalized and conve=
rted
# to native line endings on checkout.
*.yang text
*.txt text
*.md text
*.mkd text

...

and then git translates in/out.
Which is the default in the "repo" is up to you.
It takes a hit where many files with the "wrong" line endings have to
tweaked, but then it's done.

--
]               Never tell me the odds!                 | ipv6 mesh networ=
ks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect=
   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails =
   [






