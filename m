Return-Path: <SRS0=MMz2=LI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F28C2B9F4
	for <openbmc@archiver.kernel.org>; Mon, 14 Jun 2021 13:36:09 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 601796109E
	for <openbmc@archiver.kernel.org>; Mon, 14 Jun 2021 13:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 601796109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3XXS4GGMz2yyt
	for <openbmc@archiver.kernel.org>; Mon, 14 Jun 2021 23:36:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gtNdw68h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=padathjayashankar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gtNdw68h; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3XWz6klmz2yYL
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jun 2021 23:35:42 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id i12so2813533ila.13
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jun 2021 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=drT1geoZfMMsINLoxPnd0oWiEYdNRg4ZMPYxk5mqWrM=;
 b=gtNdw68hioVrJK6t4zsRuZB+NWf01zQjiiNM0hNuUJ6RZ4Q07Q8GKKpmPhksBaxVo3
 w4+EGqNwB93RMuI1BNZF+tUnCprJ/b/namCFJNE20FlbQF5ny+7tjmQGfTqeizMUA1cW
 cpRIyIDbqDWGNLJJo5p7vEwsBS/WQOlGRK9mVeA96AUOqJyfTYNM65j+yWuTBgL3P5lE
 ApMUiZsUr8WoobaVRjm5XCHM9KF/TBH5QYSYvEQvQvco0RA9QNlZxmFicsyr0a4UD+I2
 UAvSzmjrzotzybhuu4Li1OcZIDawL4NIOgX8A9mEsd48sh6uDU01dQfLbpeGQYMYr4Ig
 qZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=drT1geoZfMMsINLoxPnd0oWiEYdNRg4ZMPYxk5mqWrM=;
 b=pjsRGYWKdGC4K8wi/GxlLNjg/8u34fIxFcWTFmVkxLcpNXw1yep+tKLS5cyhAyISsZ
 bbM7nYuUm8sVBJMHpwfzShsx++0SyvedrnXEeJq15SM0YOYfDFvtKq24iqbzM/CMfdyy
 7mXlwE98FNzLpKFqNU2q+W2opFbCFKCgfXz48/Wf6zjdhJlS7/F09CHe5ujuX9ONFEMf
 MDxP851eXUElvqOUNILtlHAQ/7ivBGbu4kqBOzMDT5JRLS2BdrURziqGfNmIcr9+97yb
 6Im2GlErHlmhjvUdeEvQtlPSinsS1IK6Ax0wjA4LUQOsKcf05HMiKrm+s4qrGZZ1oLZO
 mWRQ==
X-Gm-Message-State: AOAM5316x6g99XdqaiJWI2NdAJZjUMJ/En1EuhRoz9xpzDg02ZbOqTlo
 Ye5ktvCHr/iHV22tusrdZ7sULLIwZJpxJUvNBUi32/8HA9A=
X-Google-Smtp-Source: ABdhPJw5dbDvHtMK6ECgXQYt6/T2/txa9K2f6KyARXW0E7NKbAnNFqo3ozrCwRAsTMdBjNZrYBwYconcPLznfcu4S9c=
X-Received: by 2002:a92:c949:: with SMTP id i9mr13250956ilq.38.1623677737657; 
 Mon, 14 Jun 2021 06:35:37 -0700 (PDT)
MIME-Version: 1.0
From: Jayashankar Padath <padathjayashankar@gmail.com>
Date: Mon, 14 Jun 2021 19:05:27 +0530
Message-ID: <CAFRDoiwonNE5C3BQdbu9rYCiR_8mggrCMZd0j6nvZwD3L5Z4JA@mail.gmail.com>
Subject: Question on PCIe inventory item mapping to the PLDM entity data
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c867ff05c4b9ee65"
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

--000000000000c867ff05c4b9ee65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am trying to map some of the PCIe related new inventory items to the PLDM
entity data using DSP0249 Platform Level Data Model (PLDM) State Set
Specification (7.1 PLDM Entity ID code tables --> Table 15 =E2=80=93 Entity=
 ID
codes).

Since I am not seeing any specific mapping with respect to some of the
newly added inventories, I am planning to use a generic approach to map
like below.

1. PCIe Slot --> Mapped to Slot (186)

2. PCIe Device --> Mapped to Card (61)

Would like to know any inputs on this or we are good with proceeding with
above values.

Thanks and Best Regards,
Jayashankar

--000000000000c867ff05c4b9ee65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I am trying to map some of the PCIe related=
 new inventory items to the PLDM entity data using DSP0249 Platform Level D=
ata Model (PLDM) State Set<br>Specification (7.1 PLDM Entity ID code tables=
 --&gt; Table 15 =E2=80=93 Entity ID codes).<br><br>Since I am not seeing a=
ny specific mapping with respect to some of the newly added inventories, I =
am planning to use a generic approach to map like below.<br><br>1. PCIe Slo=
t --&gt; Mapped to Slot (186)<br><br>2. PCIe Device --&gt; Mapped to Card (=
61)<br><br>Would like to know any inputs on this or we are good with procee=
ding with above values.<br><br>Thanks and Best Regards,<br>Jayashankar<br><=
/div>

--000000000000c867ff05c4b9ee65--
