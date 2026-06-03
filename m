Return-Path: <openbmc+bounces-2032-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A7CD6E5D
	for <openbmc@archiver.kernel.org>; Wed,  3 Jun 2026 00:05:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSdX1Q39z2yST;
	Wed, 03 Jun 2026 10:05:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780445135;
	cv=none; b=exi+o0qOOwEqL0iaqvXp2mbHK3ildnk7q5qqvzgSIoXxOIislwqExSaMvTsvda9lUnBdexG9tyT/6NgM8cPgjIfgVTfxO9GIvZD1FgEgjAJuy9zHoc2p5m2qUDmWnCw7GTJX8i5HpfOTozBxC40BT2h4JU0/zwXSUnzdqLX1k0O9PfOAbUMHvg/AIkjAH619+NSH2nv80YtOMLIxOt19MUv0IVyN5XHVmFoubU+x6Gfo24Zy14P76ECmOIsyFD87mr/qRLIa219KT3WYmfqBlwmtidr1BWnkzb3zJA/I7cCcu+XD625BDZa4pK57eGCzJV48dCDhwJCJSe9o87Zwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780445135; c=relaxed/relaxed;
	bh=2g78+F51w8Vc4yzr/prJdG48Qy78+CSq9tkIV+yf0io=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KVvy35BXsfOwE2GhLNdO8mmWxmga+xo9kReg8Nq0SYlWCcZvGxg3kolrKK6dbvqW2wKFp7YNpDq8p/aZHRz0Xz8xvdXIG0rsBTgYdASeJK0/xqjtGwVWUg8XFFMqkaf0BpPQI2I7I//yeLVzq30PZse3eziGl9hxWaGYPlmAMt3gV++zdK5R55eU7kQDsSe+WRGqUULELS/cRtC5eob24DHdb/PAwV6BHXHElyn370m1HJHjckzUXEsn/MRp2wZRxXafiewTy53xz4BiKDOLQOWgV6UKIjySLx89GxpfE0jW7gmwAOMDL1QoFkgyxuy5/XzH8+fmzZfLFAd7Fmg6Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SIqcnkMs; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SIqcnkMs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVSdV6FNTz2yS6
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 10:05:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780445133;
	bh=2g78+F51w8Vc4yzr/prJdG48Qy78+CSq9tkIV+yf0io=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=SIqcnkMsTcQNMThB3+f/7Z2Cvy8YjWt5kajtUYlBbh4wnyyh7nRpNgA8I1XidOkPu
	 6vlPqPQH572jY4Re8TKR5fmEYuw04XbnGKC0VhUR7GOdYtMj9Fe/VZ58JtOIoahPXN
	 l3rPF7dkRF9bYuLN6bpFWFNhVdePoziMOaNZb7yqp2Tz+QfmqsAyCS+WmDMDHkQbVZ
	 Qfd1vtYzw+nP5up4+mNc8D+IKIE96KqYU2CjM762OFcqWuhBTyOpogdPAa1hAmoOQE
	 ZdzrISTkIHq+wf5TknvikWJhXhjdAwbP0k4lEmEhKrYMIJxix3hPet9vjmm/IUDYE2
	 8DLcbJqRfwAAw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F312A605A0;
	Wed,  3 Jun 2026 08:05:32 +0800 (AWST)
Message-ID: <29fcface8daf3e542bdae518bbbe3ef2eb83c9c7.camel@codeconstruct.com.au>
Subject: Re: [Vulnerability Report] phosphor-logging / openpower-pels:
 Silent Log Task Dropping due to Timer Overlaps in HostNotifier
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bhargava Naidu Gulla <bhargavagulla@google.com>, openbmc@lists.ozlabs.org
Date: Wed, 03 Jun 2026 09:35:32 +0930
In-Reply-To: <CAEPZvmNu--4-Fm0Kq1SVkkNByOB3SDR3MxRQ9Y1w4j28gUBAcg@mail.gmail.com>
References: 
	<CAEPZvmNu--4-Fm0Kq1SVkkNByOB3SDR3MxRQ9Y1w4j28gUBAcg@mail.gmail.com>
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

Hi Bhargava,

In the future, security vulnerability reports should be sent to:

   openbmc-security@lists.ozlabs.org

as per:

   https://github.com/openbmc/docs/blob/master/security/how-to-report-a-sec=
urity-vulnerability.md

Andrew

On Tue, 2026-06-02 at 16:06 -0700, Bhargava Naidu Gulla wrote:
> Hi OpenBMC Security Team,
>=20
> I would like to report a race condition and state corruption vulnerabilit=
y
> inside the Host Notifier state machine of the openpower-pels extension.
>=20
> Overview of the Vulnerability:
> Rapid, concurrent, or noisy host state transitions can corrupt in-flight
> task tracking for Platform Event Log (PEL) notifications. This results in
> event log notifications being silently dropped, preventing critical syste=
m
> error logs from being delivered to the host operating system.
>=20
> Affected File and Location:
> File: extensions/openpower-pels/host_notifier.cpp
> Line: 234
>=20
> Root Cause:
> The `hostStateChange(true)` method arms the `_hostUpTimer` but does not
> disable or cancel already active timers (such as `_retryTimer` or
> `_hostFullTimer`).
>=20
> When the first timer expires, it invokes `doNewLogNotify()`, which launch=
es
> an asynchronous PLDM file transmission task and sets the tracking variabl=
e:
> =C2=A0 _inProgressPEL =3D pelID;
>=20
> Because `doNewLogNotify()` lacks a command-in-progress guard check
> (`_inProgressPEL !=3D 0`), if the concurrent overlapping second timer exp=
ires
> before the first PLDM command's asynchronous response is received, it
> blindly executes `doNewLogNotify()` again. This second execution sends
> another PLDM command and overwrites `_inProgressPEL` with a new ID. The
> tracking for the first PEL is permanently dropped, and subsequent status
> responses are mismatched.
>=20
> Proof of Concept:
> 1. Force the HostNotifier into a retry state where the `_retryTimer` is
> currently armed due to a full or blocked state.
> 2. Rapidly trigger a D-Bus host state property change, invoking
> `hostStateChange(true)`. This arms `_hostUpTimer` in parallel.
> 3. The `_retryTimer` expires first, starting a PLDM send task for PEL ID =
A
> and setting `_inProgressPEL =3D A`.
> 4. The `_hostUpTimer` expires next before the D-Bus/PLDM response for PEL=
 A
> returns, and fires `doNewLogNotify()` again, sending a task for PEL ID B
> and overwriting `_inProgressPEL =3D B`.
> 5. Observe that tracking for PEL ID A is dropped from the queue and
> permanently orphaned.
>=20
> Proposed Patch:
> Add an active command guard check at the beginning of
> `HostNotifier::doNewLogNotify()`:
>=20
> if (_inProgressPEL !=3D 0 || _hostIface->cmdInProgress())
> {
> =C2=A0=C2=A0=C2=A0 return;
> }
>=20
> Legal Name for Attribution: Bhargava Naidu Gulla

