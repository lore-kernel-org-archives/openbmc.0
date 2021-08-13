Return-Path: <SRS0=H2FO=NE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0EDC4338F
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 00:52:33 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D629E60EE2
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 00:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D629E60EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm4lg0mFGz3bSt
	for <openbmc@archiver.kernel.org>; Fri, 13 Aug 2021 10:52:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iK3rN+pt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iK3rN+pt; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm4kv3M26z3081
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 10:51:50 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id t3so8947311qkg.11
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 17:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yO2bLZB9g0wjp3KDvmshxHOrFdm8h5AWV/bbp2iaAvA=;
 b=iK3rN+ptPmHHN+0cORTZb2AffXlzePfY6IbdamekFigk3A9KdqmHKw/KoPxyKTXkox
 GbFYEdBkNZq/B2aL90AQXstwuJVRxSkFNGG+cvOWYMo7Q6Rhlra0waWxPV4Pt791V06J
 wPmQeRjmvfdcL0JHNn8Wato3GMpQh0VXkRqyhpo7MbFe39xyX2ojGcKRRTnZ/qLA8/L/
 uSphDieh5sjHkqymHSLrCr2nJp88M7aJVol/ydliFwkYcy9p0U/edJIMKwW28erl8djI
 Vm63BdcGh070iWs4PiHfga8EALNPrAZDAAN0wlKb22xLGR22fXrWvQ9pI6Zaab1rADMR
 bxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yO2bLZB9g0wjp3KDvmshxHOrFdm8h5AWV/bbp2iaAvA=;
 b=VoElddO3cCFL48lcz8eBKhl48XRXOKfrqBLO+kN5kgZ23FqvC99vJ1PXbA/YzJNH/T
 JZf3BJXO1h6sld9MM07BCmz87AXA1i8n9LsUtWFbOthVdBSOOjMaBmb3Bl3pLPc0psOa
 +FQe2EFvY9W/dy0xXdmnkAdHRjeJJk1Kajzfk3rix7z5VMGAp8uI5Mh2yu/FHlhzk4YZ
 Aw30Gbw4+rnDYMYewJ57ougBj5ORIyvkG8NstjKDI6UXR2SMiydfwGP4LiDdLjY2cIVm
 meGxu88zAkMaJa7WT2+VodVrK9dVzzQvgJLnQjUILzirQAguO68BOfYMUDshXQxpCvbJ
 gxWg==
X-Gm-Message-State: AOAM531IrUsBB79Gvql2fStnDniUU4THbWtKDhUZ7qSBNjtMzIz3kXCH
 6UrtmcaeZhJdAmn0jt7D0bMr8O0p0mM3nShImKEloFfdHZw=
X-Google-Smtp-Source: ABdhPJxQ+V0TLsG981+SaajM4Nps7UuZdGO/xoy0boFt9Mh6FSRRXnQhPIRsvDG3CVgfvK1iLT3p1WqGybWRXgR+oxY=
X-Received: by 2002:a37:a482:: with SMTP id n124mr7433389qke.175.1628815902921; 
 Thu, 12 Aug 2021 17:51:42 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Fri, 13 Aug 2021 08:51:32 +0800
Message-ID: <CANFuQ7AOMpqhpa_Upn5toNeSDzZK_TADbc4ikqjbZBjmrMoBSA@mail.gmail.com>
Subject: Request new repo for Audit function
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Brad:

We have a requirement to implement an Audit function, I found that
there is a design doc[1], but there is no code to implement it.

Could you create a new repo for Audit function?
eg: phosphor-audit

[1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md

thx - George Liu
