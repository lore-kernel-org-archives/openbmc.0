Return-Path: <SRS0=CX8f=LR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B0DC4743C
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 16:37:43 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA56A61075
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 16:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA56A61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G987n6Sx0z3064
	for <openbmc@archiver.kernel.org>; Thu, 24 Jun 2021 02:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BWu8Z6gG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BWu8Z6gG; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G987K5vXSz305n
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 02:37:15 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id h15so5064083lfv.12
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=X6T0cxvNQT+mZi506inNIxYvZHhr4Qe6DzMHgAdsxcQ=;
 b=BWu8Z6gGsotT0jFE7khTft9aZbyn2rwtI/n7tuosnlqE8KlYu75Yo29oMh+2CZYxCJ
 D0OKhNGLXAj02YVoHzNgPzPyOdKd6hdY6Wwml64Xc7rrokl1mu8OGpVYMloE+5Xd2tWc
 wKl6i/7OUc9Uk1Fi2S+ObR/hFkHbWimW5zwYev1eWqnnNApFsFGlWVO/uDHiG7rIBVqB
 DHtJQO9B6ircY9AYMc4OqLaFmLVX4nXgq6zMzkP+PrTctLFwf92sPX3O96S91wuhQ2ix
 GOYqbbgseR7yq1iBf6FrgkTzRX9CYzxE16Kgfgo5ZajHKII3EJ+aMrcGURHy0vH8S6G/
 eDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=X6T0cxvNQT+mZi506inNIxYvZHhr4Qe6DzMHgAdsxcQ=;
 b=JkqxZ5KGnKMi4jAJfoGoO9xX21SAPZe1FKT0Ljv/FSebVSKQXvNFoona9/y7DnS45X
 4J23ow8TgsuLLL+VDZX3tuRtHCnut1R9LqbO2dr+GNLo5UMKFJReyojJNC91ldKLOGQM
 pQtHOGnLJgfe3drGlhdX/vuylR3x4a+GQhlWEKZ2EWtoBylx07lQBZtyUT00JI0QO/Gg
 L0qAivHPn8noZqJELji+eAQc1DJSLAVC+QJvNQSQBGUpvVtrRhLI/6nYJIHQwgWYV3k/
 Zn0wGNu7rA21qwnaKPdDs2/owbgu8ZCauntyCR9wwG6Du+WLRS1Bx2Q+m/APs7TwsCVu
 ihdQ==
X-Gm-Message-State: AOAM532JONPxslvLQx5LphRBIgIUcR5/yf++eGUthYlbVQmaP/qR2ozC
 UL05l3TSl4p5oh0WFpw3vtvu8214Yw5kKSRPSW67Tkeru+r/EQ==
X-Google-Smtp-Source: ABdhPJxO3Pb6ndazi/HWzncWOfkExG+h9/d2wVrdfb2rWtBLXUOAgnUCmxbe+TDKP8UHMPU64A0iFJhDuGMYWWGumpU=
X-Received: by 2002:a05:6512:1022:: with SMTP id r2mr377216lfr.9.1624466225548; 
 Wed, 23 Jun 2021 09:37:05 -0700 (PDT)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 23 Jun 2021 19:36:53 +0300
Message-ID: <CACSj6VWKXnsmSAypRyCJ64edgbR1+KCZHy7rZpmcx5JXniWk+Q@mail.gmail.com>
Subject: Re: Boot Source Override feature problems
To: openbmc@lists.ozlabs.org
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
Cc: a.kartashev@yadro.com, Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

We need to have two `xyz.openbmc_project.Object.Enable` interfaces:
1) one that stores information whether the BootSourceOverride feature
is enabled or not,
2) another one that stores information whether the BootSourceOverride
feature is permanent or one_time.

The current implementation has only 1), proposed design has both 1) and 2):
```
 /xyz/openbmc_project/control/host0/boot:
      - Interface: xyz.openbmc_project.Control.Boot.Source
      - Interface: xyz.openbmc_project.Control.Boot.Mode
      - Interface: xyz.openbmc_project.Control.Boot.Type
      - Interface: xyz.openbmc_project.Object.Enable              <---------  1)
 /xyz/openbmc_project/control/host0/boot/one_time:
      - Interface: xyz.openbmc_project.Object.Enable              <---------  2)
```

Also earlier there were two sets of Boot.Source/Boot.Mode/Boot.Type
settings. But the second one isn't really necessary as the
BootSourceOverride feature doesn't fallback to permanent override
after one-time override. So we need to keep only one set of
Boot.Source/Boot.Mode/Boot.Type settings.

Best regards,
Konstantin Aladyshev
