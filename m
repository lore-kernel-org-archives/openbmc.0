Return-Path: <SRS0=F3M/=KO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADE1C433B4
	for <openbmc@archiver.kernel.org>; Wed, 19 May 2021 20:44:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF70610CD
	for <openbmc@archiver.kernel.org>; Wed, 19 May 2021 20:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF70610CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FllGQ21wzz307J
	for <openbmc@archiver.kernel.org>; Thu, 20 May 2021 06:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=wTCyQ2TR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=wTCyQ2TR; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FllFx3bMMz2yxS
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 06:43:47 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id i22so20966195lfl.10
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jwY9+zfu37jMPlMFunZao8Y8mU4QejuGpDWs4WiaGhY=;
 b=wTCyQ2TRPsK0ORYrpkDGiPQBvia+wy061KigqCxdNI7u4i4TM14VBfoVL5u/2TV+65
 WkIZqCM/c9dOVnz95zBWOVlJ1LkFTKTt7WXS7eZQtIQRiCbqrablNR/1A2dK9jM5TOTa
 rEZrK+9ateC943OLYuBS28OMDCZDPNwpeEimLxV35rCOjTGPEVeYWD+/KJ8HbQUWvOdS
 vKH1Bdg1BHwy5IURi1JbiTQSyfRON25cebn5+No2zNMYoyc/SWtjwThSpZIypnLYmtL6
 RaGQQJxJrLqOYEyepZRLJXP4W2K5QtlQlV1mYpQGqs5e7woUDhcRuGZDhh/hfDFvkv8O
 7tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jwY9+zfu37jMPlMFunZao8Y8mU4QejuGpDWs4WiaGhY=;
 b=AmJSfpa4Uy1VIgWVoDzBlSMcMVGYRpxhOh9Uejlymzuc1kQ85dcvOmH8Abac/zyQEF
 pdaFHnOxj5exJhYYIK+xtQv/iiQdwIfyTn/K5j+awB6YkeC2Hh3bbTwC4lkJ2nytAhBS
 3vvafWkSc/kmgSJTiPCVLGz182WdASRFX4gc8DdGPh1MQkJylbVGPrp3fcFmE9Xxh8vd
 JojuE+T3icahkg90p0vUOL01boZjc0mkbpACGwM5xNZb2NiN0yAefirU9ozGClgTmeZP
 p2IGc+A4BV6OShVJoFvS82t4ailgVeRG453p0LC1IMztoq5vGBZreFX2KwER444nk6I1
 mrAg==
X-Gm-Message-State: AOAM531MwS70WvHNTihI5FHsZl/4+30wSR2vJtS2gqSA01eUMujHLMXo
 vr+yEurYNnLcTTojJJ7rNLZZay2zuXhYCQSgerBQOg==
X-Google-Smtp-Source: ABdhPJybWQdCIJ05V5/dXdcwAsYFnOFt0Lj+jxy+t1Iau8KY6TkSPiS6dSiv5ULDfvZOc23WFRkJFBMG/BtJylkw8is=
X-Received: by 2002:ac2:5c03:: with SMTP id r3mr912626lfp.504.1621457019449;
 Wed, 19 May 2021 13:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 19 May 2021 13:43:28 -0700
Message-ID: <CACWQX81Xnpmq7x5S2E=wnRfx=0ob_0zfchA7azks=voVqQ9-Rw@mail.gmail.com>
Subject: Re: SimpleStorage proposals
To: =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, May 19, 2021 at 12:57 AM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=96)
<Jun-Lin.Chen@quantatw.com> wrote:
>
> Hi all,
>
>
>
> In order to implement the feature to view simple storage device status, s=
uch SATA HDD presence status.
>
> We propose to implement it on the Redfish SimpleStorage URI.
>
>
>
> As our proposal for Redfish SimpleStorage, https://gerrit.openbmc-project=
.xyz/c/openbmc/docs/+/43352
>
> And an new daemon, https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43=
351
>
>
>
> There are two new dbus-interfaces to be proposed,
>
> xyz.openbmc_project.Inventory.Item.StorageDevice: here is an empty interf=
ace just mark the dbus path that SimpleStorage Manager should collect.
>
> xyz.openbmc_project.Inventory.Item.SimpleStorage: it should have the prop=
erties redfish needs, and can be parser by bmcweb.


How does this differ from xyz.openbmc_project.Inventory.Item.Drive?
They look fairly similar;  We generally don't name dbus interfaces
after Redfish directly.  We should reuse what already exists where
possible, and only invent new things where needed.

You've also omitted what properties you're trying to target.  Could
you walk through a little bit about what you're trying to accomplish
with this?  (beyond just "implement the redfish schemas).  Are you
trying to get smart data?  just inventory information?  Do you plan to
represent connections?

>
>
>
> The details are in the proposal.
>
>
>
> Welcome and thank you for comments and suggestions
>
>
>
> Best regards,
>
> Jun-Lin Chen
>
>
