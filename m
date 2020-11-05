Return-Path: <SRS0=KBLK=EL=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21291C4741F
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2020 15:23:12 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 548DC20759
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2020 15:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC9NaNVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 548DC20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRnMx1lqkzDqkk
	for <openbmc@archiver.kernel.org>; Fri,  6 Nov 2020 02:23:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hC9NaNVQ; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmlR0yTtzDqfj
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 01:54:56 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id 23so1867285ljv.7
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 06:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=igutNeYaxSCveHp4DjYcQM9nKfEckuhFxOTa6EKXIcU=;
 b=hC9NaNVQFULlGuwudRJBlMUDqQHaqbAZG0pAaiYgTLLcLpu8wrnNF8Q1gFroCYWKAQ
 8sw1JGSWCYtAsoME46fVWrQy+aJZHJGhcwWT9dLz6EeyyUrEYEmULr+NphIfqvnGPwxi
 YTwQyGrCm7SorUa+OH4mXrgBU9rc4TAsP60ilIF9vSMvfczlOYGuS5QD1lCBpV2O2R6B
 t2tNZeAUoRuPlEKiojbH8SJ3w+B1KbLpMgpNksT3uCmhyioi4UGpoX//ah/CNeCvGXLw
 v2GWEPPIpmBvlM5W4SlN+77S/uIuiICJ8CJrqcyLvJgRaLc2PouGhwaZjXqrIylv3++A
 Jg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=igutNeYaxSCveHp4DjYcQM9nKfEckuhFxOTa6EKXIcU=;
 b=Nqq6adumYqoM42lpTUuU2mSjdF1ZZMRY3dbiFB7Zzpct3zJPf8P4VI0+86ZBOIe/0w
 sDL01fUERrjlsdkJLHO7N1TulBWIlN6Tfxyr44z8dy3jQTZv9eONnzhKD23PR2FWCRbd
 nD8bUtKCZYotKO/w/KFlvVKksRsASzjFjaBSX0mgZaLPfvXtHHKWRTIYifCryOy5M+V5
 krVbUu3jQ/rH7thbobNkfP7lf+dfBm2KBssC98AcZxDW0PRN8FEUkqTSMROWfwsoqyne
 j/e5bSpVNQrwBQH+3NXBmoFGlvLwXsP+2xjNggYuduRgXTc8Swv+5WERxHE+hnlZClvT
 y6Pg==
X-Gm-Message-State: AOAM532fclCnXC+uSjdaleBwa2kSzW/LHuCBaj5c9zwMWaNSIKk6Ago8
 Lp/b9G4U+v+9uVZLey6JEqzUdeaWS7C2qY3iZQKJLDT4SDdS/w==
X-Google-Smtp-Source: ABdhPJzcIUaLbMtCO7L7Pj3l9GNfrPGSaDUzj28FQuUPbKWFAgo/ofKxmITSjS713D4OBOjazTiFLv1CzWhxlGV5GXY=
X-Received: by 2002:a2e:a0d7:: with SMTP id f23mr1077050ljm.231.1604588090623; 
 Thu, 05 Nov 2020 06:54:50 -0800 (PST)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Thu, 5 Nov 2020 17:54:39 +0300
Message-ID: <CACSj6VUNsH5c=de2xmNq-KhP9q76xV_BPw8o1JZ72DaKjOi2ww@mail.gmail.com>
Subject: Dynamic layout for the Serial-Over-Lan window in phosphor-webui
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

Hello!
I was working on a Serial-Over-Lan layout in a phosphor-webui. For me
it seems horribly broken
(https://github.com/openbmc/phosphor-webui/issues/125):
- it is fixed in size even in full screen
- it uses only a part of its space for output in full-window view

I came up with a solution where a terminal window resizes according to
the window changes. Example:
https://i114.fastpic.ru/big/2020/1105/44/af933bbaa02d950e6164ff68dd754044.png
https://fastpic.ru/view/114/2020/1105/_2c94432100b3c3d40cc8553768b153f4.png.html

What do you think of it?
Do we still need a fixed layout, where we control its size through the
JSON file?
The only place where it is overridden is:
./meta-intel/meta-common/recipes-phosphor/webui/phosphor-webui/config.json :
"customConsoleDisplaySize": {
  "width": 100,
  "height": 32
}

So, almost nobody seems to use it. Wouldn't it be better to get rid of
a fixed layout completely in favor of a dynamic one?
Or should this be another JSON option like "consoleDynamicDisplaySize"?
