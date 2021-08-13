Return-Path: <SRS0=H2FO=NE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788D9C4338F
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 17:22:09 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E782A60F36
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 17:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E782A60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmVjW4Ly0z3bnC
	for <openbmc@archiver.kernel.org>; Sat, 14 Aug 2021 03:22:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=NqWQGouH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NqWQGouH; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmVhQ3XfJz3cHr
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 03:21:08 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id n7so16712922ljq.0
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08/QSH++W6xGyStwoxLPb41J8FQAzxEcefwI10HlVSE=;
 b=NqWQGouH2fXPmBxxHQolBTlUjJTbC0ODU6nnO9Pvitx0eKjtG/cyskhETptngewFHf
 R14xDM2h1e0AiEYPt5jlcgCjtskz5iopP6WdkVU/ywlsFcL8wDGSg7sO4iKQwyzER7pa
 FNP1MIvP1CubxkbbfR1wwOOXKrkM31D82fqZ/4mCaEiFb7rFnIn+ECKVJo6l8Q1ssjY5
 6v5LmBcimiwo/83g1vRGo1qTcxNBLBj26Yl/5QxXLojHmbn7trCEave5nnyhqfvIG2te
 JWl7xRn5gpeY/XlWSqRYD27OVLRcY0nfd34VnPSlUIXupPI0WtnyZVC9iYXercdGtINI
 KP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08/QSH++W6xGyStwoxLPb41J8FQAzxEcefwI10HlVSE=;
 b=jawMpcbBQ2Ldzz5n5fuOv7GdOwfLs5jY9fOxD0/vtUlYSL22OnQ8dTT9nKxsMjrNGr
 vMxk9kcqgyiDuIooTaIwTrr7qyRJua5KHN8dD9vl8mrnvC6aBo8NRPrXFWXMox+rF4sS
 s3bQfM984S20ruxFJ53WXoX0T853M9wwS/6fXXK9zrfjUU/c00jMf4LI/eCMwXtmkBhe
 PR7M0lQ8thIqOXOYcDVdzBm4SRlOX3zBhv6WduCpWZE9Z57zQc6+dpVHwK6AYynJMVwj
 ksjTxb+w6DUWJcOL+GcbWDinheqxChf3U+HkLLOXzPSTSo81THV/9uZiDvbySg4c50IX
 Zr/g==
X-Gm-Message-State: AOAM5336H4A75BOa7EYEUxfJpzgTPHmv0bGx55eOK1WVKqF1LDKZgHNk
 PJ/N+ZSy+KYpzLJ4/VvATODxFPkIXtbndiwwfTDx2g==
X-Google-Smtp-Source: ABdhPJzluSFqt5DwubjWEAh4Mc2eE8qWY45Az9HsQOXTcx/LQjJWZPKxFNz+zcv/+uvX2Nk90WopwrLiNkLT2GHhe4o=
X-Received: by 2002:a2e:a209:: with SMTP id h9mr2603886ljm.249.1628875261445; 
 Fri, 13 Aug 2021 10:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
 <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
 <CACWQX81EWvBY=g+weGJHbxA2NWzujeHrHFBA9Cbv0=0OMGya1g@mail.gmail.com>
 <e554b486-58e8-94aa-41c2-9fefb9aff339@linux.vnet.ibm.com>
In-Reply-To: <e554b486-58e8-94aa-41c2-9fefb9aff339@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 13 Aug 2021 10:20:50 -0700
Message-ID: <CACWQX80D52cDonLRLvJ-SiUcjoGELM37iW9J2iPpkH8NBNg4_g@mail.gmail.com>
Subject: Re: Turning off the D-Bus REST API by default
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ali Ahmed <ama213000@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "i.kononenko" <i.kononenko@yadro.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 9:05 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> On 8/12/2021 2:41 PM, Ed Tanous wrote:
> > On Thu, Aug 12, 2021 at 1:32 PM i.kononenko <i.kononenko@yadro.com> wrote:
> >>
> >> Ali,
> >>
> >> On 12.08.2021 17:10, Ali Ahmed wrote:
> >>
> >>> After this commit to use phosphor-webui or D-Bus REST, you will need
> >>> to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
> >>> and will not be impacted. Let me know if you have any concerns.
> >>
> >> As far I knew, the webui-vue uses REST API to retrieve the TPM status.
> >> Please, look to the link below [1]
> >
> > @gunnar @derick  isn't this against one of the primary design goals of
> > webui-vue?  Was it intentionally merged?  It seems like having
> > webui-vue rely on dbus-rest just keeps digging the hole deeper on this
> > initial thing, which is getting dbus-rest disabled by default.
> >
>
> I think when this was merged 2 years ago, when webui-vue was still very
> very young, the thinking was we will switch to Redfish when TPMenable is
> implemented in Redfish and there was value to having a working page.
> This does go against a core design goal of webui-vue.  I certainly would
> -1 any commit trying to add D-Bus REST API to webui-vue today. I think
> this is just a TODO that hasn't been implemented.
> https://github.com/openbmc/webui-vue/blame/6dba4be6125c10210bafa030ac17737d3a9b28b8/src/store/modules/Operations/BootSettingsStore.js#L74

Makes sense.  I didn't realize it was so old;  Thanks for the info Gunnar.

>
> GET TrustedModuleRequiredToBoot is available today. The PATCH is in
> review here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44044
>
> We will push a commit to switch this to Redfish.
