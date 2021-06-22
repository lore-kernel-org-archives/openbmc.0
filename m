Return-Path: <SRS0=Es6Y=LQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA91C2B9F4
	for <openbmc@archiver.kernel.org>; Tue, 22 Jun 2021 21:46:22 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4CBC61002
	for <openbmc@archiver.kernel.org>; Tue, 22 Jun 2021 21:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4CBC61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8g2P2N0Jz305r
	for <openbmc@archiver.kernel.org>; Wed, 23 Jun 2021 07:46:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dxWa9REo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=dixsiew@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dxWa9REo; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8g1w5jKbz2xfP
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 07:45:55 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id s22so184661ljg.5
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IsIoeySNqKdWF0pS5ICsYHwWeiCQUqNc3LofIV/GJtI=;
 b=dxWa9REo8OMD/TVEilJhyH/fVnHdBHaDd96rmXrb9k4ba+oaO7/gbTgwD4VD2X+0Qg
 km6uYpDt0ZEQb0GsqLKI+ek7O5/V1fHJYTDU8jU1BDOOoID1CF4zYWfNsQcd5qRe/SEi
 KmW2iY+qjKhgQC1Bsqwr/3Hp1mjG8LtJxe8VyQ3l5ms/hrcSzMXZuIt1Mn56KR6z+sAE
 XlTfFr7cH60rfeyAbnkoecT6Wg3KkG89DB8rxJmfi7DSTGQ9KYFKXFrU6VwpsyONv2Db
 e8nSWYY+tH35uSAQqvO9vb2+nKr4NCJfl+RFvJi3dmqXKBJl/GwMw03W+RKIg+u66d/f
 F7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IsIoeySNqKdWF0pS5ICsYHwWeiCQUqNc3LofIV/GJtI=;
 b=dXA6Q1QHmZsb13y0DQzHs0MQpDvINx469kdM6CZgqYxcrj+ba2Na+6/twcaHE6GgED
 YDvAcIb/qQHjN82t3q86flld0QmGvMVAg101l3U1efHFFzBn2v4/LyhH4hRTWfH0Jwz0
 lrUo4w9RPuK5iJlpHe6dUAAllHNnIoLs5Exo470218D7/QFBdjuBei1ggRguwg0EXP0V
 MJNj6P2HpPmLbMN9s6iz2bIOrUhyRwXsOjvpoQw568cCbtkp3DJjgTiS6xpLzbYvKyS9
 JOFQHKROKejt84+xFGma6SPGD1WOKrI25oY2P6/QFMrBNbOAEw8lpsepnlTllHczt5xy
 utiQ==
X-Gm-Message-State: AOAM530jAd8Gx8T5UM50rVl57HxEkG9fDef6fNKTIu4pBz7V60UiFzkG
 Y190MF6YV9LEiaAGe6NAf2+6M5nlhyuvImFINMktVgED42LHsw==
X-Google-Smtp-Source: ABdhPJw/p4geUb2nZTkrdFBDfu+OdsJoe3Shv45H8DgXbiwMSE6+hXt6PuKKv0mTlyjKFFHw0A/HlYi6+fwYwOTrg/8=
X-Received: by 2002:a2e:2f1d:: with SMTP id v29mr4932767ljv.44.1624398349946; 
 Tue, 22 Jun 2021 14:45:49 -0700 (PDT)
MIME-Version: 1.0
From: Dixsie Wolmers <dixsiew@gmail.com>
Date: Tue, 22 Jun 2021 16:45:39 -0500
Message-ID: <CAE+bT3HwZrHQPCu+syb=dQDn2xNS7Q7RfxnFheX1CqkpK-wbZA@mail.gmail.com>
Subject: UI Design Work Group - Wednesday, June 23 at 10:00 AM CST
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello,

At tomorrow's design work group, we are planning to review:

- PCIe Hardware Topology
- I/O Enclosure Settings
- Login screen design
- KVM Bug Patch

If your organization is interested in these topics, please join us!
Feel free to add a topic you would like to discuss in the work group
wiki agenda.

Meeting information and agenda can be found here:
- https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Thank you,

Dixsie Wolmers
