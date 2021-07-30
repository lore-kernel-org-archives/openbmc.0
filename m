Return-Path: <SRS0=0X7Y=MW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F8AC4338F
	for <openbmc@archiver.kernel.org>; Fri, 30 Jul 2021 02:58:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E72D60E76
	for <openbmc@archiver.kernel.org>; Fri, 30 Jul 2021 02:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E72D60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbXBt51Tmz3cQd
	for <openbmc@archiver.kernel.org>; Fri, 30 Jul 2021 12:57:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KCAGcyDl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KCAGcyDl; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbXBN1Zy4z30R3
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 12:57:31 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id b1so5505002qtx.0
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 19:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rU+C0vV0+EBEEAgbE5l12Ru4RkL2z39/OyXiREGOdRw=;
 b=KCAGcyDlJQA9UBggtMG+7fJpg3uqxLoTWytvrHgVhz1XvP1qCuvAcNuK3qQ/NjEjDX
 vGO32GgS8gSNuqvi5P9IEPI2Hlbf8M6Ep7yKbjKHmg0CkW3RGJV6Bj0SKu9iPdD2jJqJ
 5tV4oB4uua4gqm7T0//RyQRF+Z+Gc61YDp9osUtscFAZFmFarhCLLMF+GMkkC04dDT9c
 lVQa9AtsVwvZOADiZHR1FDiM3ZuGW5Q1XN2Uwwmq0VZxzoXUTrVPi8fgRmkyFWtFxMcV
 xE0qIGL3m0Bg0tpwqVO2EQTKPxEFeeb+qL+Yn9cPCLHK+sLXGPQ3g6L0qDlLu6PaWO+3
 eGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rU+C0vV0+EBEEAgbE5l12Ru4RkL2z39/OyXiREGOdRw=;
 b=D/CjmzHRAqseZXv6x62D1J9IDDjv6CJJyKovAe86nwb49R6gAqpBg74MNCTUlbCMH2
 Y2fUfTG/6aL5Yswix5hYfQeqBF0p4esRBnxKCurAPV9unctay0hJ7/dOX30KPRzyKjF3
 xuQY+7wM+Btq7RfmVnGDxXO6pXbgIkF21kX4i2rdCPF6XT3JmZRoQDaWN3508/zNCmg5
 256cQvVNCaABEHHF2vcJlQoREUHp0XBKLlrh8uJIMygAI3Wsx1KU34fisGNj/yMlloMW
 H7Ek66cCX61J+DAlDSaXBJqnr5EtqUxlph9MaANlAti/FShqK4JCqn5XOgDeZ5HAHiIT
 ZUNg==
X-Gm-Message-State: AOAM531w6z67J1KsXHxg8RreeU0+c+lsIDNZcma4hRe38/ulCAHjmeW8
 GndBwioHzRlp9CpN4h+3C8ZAI8mY0vMX4POXNsE=
X-Google-Smtp-Source: ABdhPJws4GbMQ1DE4vVRylj5YFU+iQrIbV5YDRV3geu9NYSU9qDyBXjBmIHGDAdhnt5F41AlBC0hXi9qSybOP8JoEHk=
X-Received: by 2002:a05:622a:1350:: with SMTP id
 w16mr495796qtk.182.1627613846278; 
 Thu, 29 Jul 2021 19:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB23393580CABB710F96FA97118F159@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <500141627309651@mail.yandex-team.ru>
In-Reply-To: <500141627309651@mail.yandex-team.ru>
From: George Liu <liuxiwei1013@gmail.com>
Date: Fri, 30 Jul 2021 10:57:15 +0800
Message-ID: <CANFuQ7D62VNCg5ZsYL=4fX3PE9D+NjAXpK6Agm6VcOj7YV6sBw@mail.gmail.com>
Subject: Re: Serial over LAN by phosphor-net-ipmid issue
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
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
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <george.hung@quantatw.com>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Jul 26, 2021 at 10:33 PM Konstantin Klubnichkin
<kitsok@yandex-team.ru> wrote:
>
> Hello George!
>
> Can you please check if there is /xyz/openbmc_project/ipmi branch in dbus=
?
> root:/tmp# busctl tree xyz.openbmc_project.Settings | grep sol
>     =E2=94=82 =E2=94=94=E2=94=80/xyz/openbmc_project/ipmi/sol
>     =E2=94=82   =E2=94=94=E2=94=80/xyz/openbmc_project/ipmi/sol/eth0
> root:/tmp#
>
> If it's not there, you need to add it via phosphor-settings-manager.
>
> 12.07.2021, 09:41, "George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)" <george.hu=
ng@quantatw.com>:
>
> Hi Cheng,
>
> I tried to use SOL for the latest phosphor-net-ipmid, but it can't work.
>
> I found the commit for SOL commands:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-net-ipmid/+/29703
>
> It removed "setConfParams" function and also disabled to register setting=
 SOL configuration parameters command. (i.e., ipmitool -I lanplus -H x -U x=
 -P x raw 0x0c 0x21 can't be used)
>
> Instead of that, it changed to use the dbus interface to update SOL param=
eters, but I don't know which process/service to generate the related dbus =
path/properties for SOL parameters.
>
> Do I miss something to enable or config?

Please refer to: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/453=
69

>
>
> Thanks.
>
> Best Regards
> George Hung
>
>
>
>
> --
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
>
