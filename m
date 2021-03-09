Return-Path: <SRS0=GYqG=IH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D0FC433DB
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 20:35:49 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA23265253
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 20:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA23265253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw6RR2ZX0z3cWQ
	for <openbmc@archiver.kernel.org>; Wed, 10 Mar 2021 07:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qWtvrQsW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qWtvrQsW; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw6R30KXkz3bcv
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 07:35:24 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 75so10893282otn.4
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 12:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=pL8cMN4XBABqNT9ZEB/uvtSxeGYUPuBzhM094cSVIsA=;
 b=qWtvrQsW2bBvzeyrKJCO2+mGz60lEB2m6Uub7LodU4bSnKys9MeAnCye8r7bULfhRq
 Eu9kpVd11iQ3K8hcwSJfv3A1W3g5yMg821rMGCalbLinjJ5WVB7tpqnCwHw3vrPbfNt0
 h4yAMfxe0PeL8OmVYMfbUGD0PNIBFoaWIWzoHNEJ2icQlcUf3TbTOwp1R1qBPScXqELx
 HI0e45YRLrS3zWx/QU3ticULqKeF0mhh4pWVfJzIOcZWa23w53x6oULZxAA0rt1Q8THh
 GC3IU9TMwFltBaPvin64h0k6KxPN19XFzZHalb8ng2oNLY38UPgS374SG+aO9B04HoVk
 avew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=pL8cMN4XBABqNT9ZEB/uvtSxeGYUPuBzhM094cSVIsA=;
 b=KJLovN6Rmofi13rLm5XRsMWQI1dJNXyjBQoY4ydcri6GDhgSDLqOXOeldzmqO1zuPh
 +Th2sRdW4R2aEz4/EW29e3Ngq3Fw8o33QrZDy+JCvR3TSOEmNCnFc7/wKUMh7l5KgfV2
 8FH7VkkXBlWnovIV07mAVhkBVOdo2ZJcfaf54HAYZwVLnzAqMTG/46xI8bfoFygagT0j
 he0p5IHklXYH95iP9LUli/eBdZiDk84FCYyAekl+oK7kysSiiW4AQeiWxBneLyxhIdI6
 Ln7zKlvGS81PS2/vVB/MgEKi+KAqtiOq+dlsaLaHqUqu3Qe6jcW8SUPXlQGXctTHNfhI
 ZMOQ==
X-Gm-Message-State: AOAM531gZ3N6xTAgPkkbPPlPoxgM6VJq2eXXKzAY0tuuXCp299YS/jQ0
 HgmOlZQw3Nvv7LNUtgVi2OBiSmBggpHfnw==
X-Google-Smtp-Source: ABdhPJwRgmFbbXFPqdxNoZC8RnPG3GKD4LkljiojeDA0M+d+VkcWDtNxfzCwcDKRD4R27C4t7ImZNg==
X-Received: by 2002:a9d:561:: with SMTP id 88mr2505265otw.150.1615322120945;
 Tue, 09 Mar 2021 12:35:20 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:543a:143a:2678:bc79])
 by smtp.gmail.com with ESMTPSA id v7sm2961078otq.62.2021.03.09.12.35.20
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 12:35:20 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: grok.openbmc.org
Message-Id: <1F6BDD6F-B0CE-4BF3-A458-3B7572DE8137@gmail.com>
Date: Tue, 9 Mar 2021 14:35:19 -0600
To: openBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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

At IBM, some of us have used opengrok over the years as a quick way to =
search
source code. It=E2=80=99s a useful tool when looking for things like =
=E2=80=9CI wonder who
calls this D-Bus API within OpenBMC=E2=80=9D.

I=E2=80=99ve got a cron to update and re-index twice a day. I tried to =
get all of our repos
but may have missed a few. Just let me know if you see something =
missing.

https://grok.openbmc.org/

Andrew=
