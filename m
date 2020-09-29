Return-Path: <SRS0=CIyz=DG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379B5C4727C
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 17:55:22 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48810207F7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 17:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UWlB2LEZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48810207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C16VZ3H8ZzDq8g
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2020 03:55:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=pparth@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UWlB2LEZ; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C16Rt0Kk2zDqWG
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 03:52:54 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id l24so2228589edj.8
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=F84W3UnjNzg4PzK54Faj7L3rmt8hjDAXc2lbv1QoLBM=;
 b=UWlB2LEZ+2dCUWpvqWpxK+l65wxx1iiSyX4BfrFT7rvEeD7KRImpJDtXyJjWqnYhGc
 ocu/nvbcNKTPOnn9vjiDm+zqOt3/JFl2iRwschHQehsVfD/Uq0ZjBJn5DOCWeKwMIPoK
 4qUI9iIOCf+85WYInhhnE0UiCB01BmIKqYAA0KxaiwQqPTsXGH/RkFlk+baOv49FptOS
 4cSvljZHUyl4YK8xkmBJiT+r6A2QrPndZ3bv4JwxWX7UYQRJac1Mj/b7g1eAXqNBwRpH
 QVZpGNU7RPex6HH8D+5Fn8Cg9u/MUNWpMe+zLMgiKpavQ1LBGFznU5szExEz+9LeKxbE
 F+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=F84W3UnjNzg4PzK54Faj7L3rmt8hjDAXc2lbv1QoLBM=;
 b=J0cLaMIHz9+yColy55M9cZ1u2lhMAVedoFPeOj722FtsdjBYPFfRTLm3zJTdkU/Gv3
 aebDX7v+0SX36hk9vpxePqVJ/QWKuHnf/peH6cy33JyNfrt2zCI+nqXpUMTjJ+ArQl6L
 qF4eiSiXqSACqeCaCFxecmTZka/oOJAO42tS+qLEm34fDACWxXJut38fNyMhLf4PH+jT
 QjN60XSaQ9lB9j8NVWcC54L5EtNhmUk7Mru4Tfghx8xNNmujFZExvei6dMFgILVTA6aj
 kGD+pv3hHAxAWitdRCGVAvxAQw8dC/mIhxaXAgT2jZuJMoitKI48ZefWqtXOrpHwAfvf
 jk9A==
X-Gm-Message-State: AOAM5336xjm5D1iak/chN7dXKyODvVy7Ug+5WMA1WxUW7Z6quSSikvVR
 kCPVCdYKBvUuG742HGe7rnNU/RyBzCVJh3TbH1zEI7afjdwbJg==
X-Google-Smtp-Source: ABdhPJzt83CGneHV7V2brX6ZrXzsHJqOWfRvWSZLT1DverVw6kM/4tWoWgXTBIzNf2Htc3EIaLBjKQnhiLqZ3UBZUk0=
X-Received: by 2002:aa7:d417:: with SMTP id z23mr4416355edq.62.1601401963271; 
 Tue, 29 Sep 2020 10:52:43 -0700 (PDT)
MIME-Version: 1.0
From: Parth Shukla <timevortex@google.com>
Date: Tue, 29 Sep 2020 19:52:07 +0200
Message-ID: <CAC1Cx+sLnCCWG3UVqaO0ohpsy4ggTQvzQhZHJQBV+EUYb33cQw@mail.gmail.com>
Subject: Security Working Group Meeting - Wed 30 September
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002a4f5e05b07773c0"
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

--0000000000002a4f5e05b07773c0
Content-Type: text/plain; charset="UTF-8"

This is a reminder of the OpenBMC Security Working Group meeting scheduled
for this Wednesday September 30 at 10:00am PDT.

There are currently no items on the agenda
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>.
Assuming no items are added before the meeting then we have the option of
1) cancelling or 2) joining to see if anyone wants to bring up any topics
for discussion. What are people's preferences?

I'll assume option 2 as the default and dial in unless we get some
consensus on this thread to cancel the meeting instead.

Access, and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group

Regards,
Parth

--0000000000002a4f5e05b07773c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a reminder of the OpenBMC Security Working Group m=
eeting scheduled for this Wednesday September 30 at 10:00am PDT.<div><br></=
div><div>There are currently no items on the <a href=3D"https://docs.google=
.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit">agenda</=
a>. Assuming no items are added before the meeting then we have the option =
of 1) cancelling or 2) joining to see if anyone wants to bring up any topic=
s for discussion. What are people&#39;s preferences?</div><div><br></div><d=
iv>I&#39;ll assume option 2 as the default and dial in unless we get some c=
onsensus=C2=A0on this thread to cancel the meeting instead.</div><div><br><=
/div><div>Access, and notes are in the wiki:<br><a href=3D"https://github.c=
om/openbmc/openbmc/wiki/Security-working-group" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/openbmc/openbmc/wiki/Security-working-group<=
/a></div><div><br></div><div>Regards,</div><div>Parth</div><div></div></div=
>

--0000000000002a4f5e05b07773c0--
