Return-Path: <openbmc+bounces-2568-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD2C79F9E
	for <openbmc@archiver.kernel.org>; Sun,  6 Sep 2026 23:32:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hdRM473Qpz2yvX;
	Mon, 07 Sep 2026 09:32:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1031" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788669553;
	cv=pass; b=mmhgkjxVcNsyHjDikjJ/FCMtL/WFAWbANcJj7AIXn8Ul3IOwEYj/+vsTfrGpJFAVRmPflHyEGjtt1UA5so7p/oAEdvpXqik0omc9rM7PAKq+e9vDdDD+BopkCkTNN9x/u8Ngn+ww+gCiX53V/cO7hUZ980jG4Wa5RkBhraGCzpA1RNxMgxiek5iD+JXMwZB1rztik325V/LUZdFPmqQWwx8OyK6EMvkuDzmNVGKkdzbR9AkSYxFM7/zFK56eduDxLcP/TjlwF9HrxdSYKVrQtgwpB9rBAqz3YDfYgSYB7j5LdANPrO+z/wKNTUGOBIDNw6Fs0UD47Vh05DF5LxmotQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788669553; c=relaxed/relaxed;
	bh=tzgo5yEZCleETOAGyuZipOHEFITTfnXHeZ/fKIiluWg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SXexZfTok0VDJ3FtpxV0aV4o0fH6Pcj4U+004tcDdhDBUazSXQU4xhpy9X36h6+KESoF4wZ2arF0H0QQDQlh/kqKsiACevIXfu77jTVQXQMi2qT7GYlM7v904WoCkFLePcZkebOBo3i3MNy0s50lBjjL8opeEGggi/yONQQxc7b3vzV4AJdq4zF/6z3cT7YZlTuDEPRrYEA5EzMZf0x/sL1Tyq0hLkYu+ldzFbwMMGnZnok8sLRwBl0UtInxWfvRZcgOWwtmpMa7DF2HdD77E7YQ7i9EtT2WX1j03nKKNP89MCZ76KV9guFup9o7HS9pMEVcclBUd1moalSiYyGuLw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f0qu+gyh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=tausiff1920@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f0qu+gyh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=tausiff1920@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hcyCN0hDxz2y2S
	for <openbmc@lists.ozlabs.org>; Sun, 06 Sep 2026 14:39:10 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1939319a91.2
        for <openbmc@lists.ozlabs.org>; Sat, 05 Sep 2026 21:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788669548; cv=none;
        d=google.com; s=arc-20260327;
        b=LU0QLolqXCp4Da2Zdw2dYoqGVqboo9QLc+ub66AE+DpQz5MV7ANfRGYwcxPrboMClo
         gDGompa/BeLQ/sPm7b27zQ+ybOBis5JBiWrPtLg7DUcA9NoOcln+O9FgIzfbRC0DZL1a
         w5FEXD0rykGVyejbgLRjdjjYBZWCAitWJM4CBI/BxI5QUZpowPkqQG2ETMKpCKLqL03C
         3gTw2tQfd+x8rPeoxi28nRnysJNnFmWLXuvYLKSMpJu6OQquSrqFMGrmOEs+KTULp+E6
         rHHxPOXF3HBsivcRdPLf3VZrfx51bcyWeV9uWFRcJ0xoanuXE1CfJ2CaQtgnf+WghaPp
         4WuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tzgo5yEZCleETOAGyuZipOHEFITTfnXHeZ/fKIiluWg=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=KgDMTVvAJdFKygoe2vc0RS+VLe8+MsyvYXN/9U2UE0t1nqGsieH9DmYslA0NY33lnR
         /8JzZ2Sqq+8PzyTx2A3xardhyQL3JaTZJrOghWfYmkD8rb3CJbjI9q5pj8BHRrolnYbm
         nsZ352rEtl21LR/T4uwmoXlSoDHQU9YUBrmI5E/XCYjM+tzAE9EzeIPhXYmj9fmvHm6k
         bGNPlD8zwZR7/zZNyejRtRhTDj8FLZrmUie8+B4tL58uib4RK9K1iVdtlFzUssafUOMN
         3R/wPyVkwXS5UWkP4/XK+3l29D+HwSTY9undB6HRBZtsGpc1595jfQ/KVThZMK+NqC1j
         iK1Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788669548; x=1789274348; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tzgo5yEZCleETOAGyuZipOHEFITTfnXHeZ/fKIiluWg=;
        b=f0qu+gyhAiKp6Npa3jkKZ1RlQdYX/fqm4iB9qNuKIMNXaS33NB6cH7aiWXUaT7XV7m
         LX3kB5haAdYwwi7qMStzmuquVHmSYQLa/CdYMzXbIRxHtJeTZYccUXsVIqkdy2zkQFY6
         aTaNBarwVUg4e+oCWsRWFhXUB1Z+mQjkwyfGJo4R6HRpWbMlVuvT2OsfZ0pdTdz/P95a
         g2xVhXbLyA/5PTH+KB1dQZ53TfnAjrkw3kchxQNIJXA3mbWWIqokOnO3SzCckqRZ7hrc
         P1gr1dPx/CN9kCCKCmYrrSnGBUgu1HpMyrdXpRgFiy7rCxuhzbI/tF5S2aSYM6TVLDLm
         mcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788669548; x=1789274348;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzgo5yEZCleETOAGyuZipOHEFITTfnXHeZ/fKIiluWg=;
        b=dVa5zyyHEDO82ZGUn/1FyvhhyU8A8oXtYiWrh1v11TafZ+tD5dkh/S9QVl3ZhvJPQK
         VN618CFlSTkXL/VEz7cR2JAklrAoAtN7cPsbscQ7PNqprUVufddYPnYjQs608RfGDWs8
         ZMNRnWykAgiJZILEGqjeD+D97FB7jDCoF2yYrQWvq8q/tBtBc5P6MA7KNwElDcu6ycHE
         wBWvLdh6ZdJRQEuV3v+EET4NNA4a4D7FFhhHbXVMg58np+ggVpunAeccWDxTfK7B5QqG
         TV1cLtG3Vr3oUNp6Cdk3KelzSEqZosTg0ukGxCYDJBATH5s5rI3kNgGiJ7i/NHNSz1vb
         MDxw==
X-Gm-Message-State: AFuF++lJMRA38Pw0lkhopqnJnpkBdSPJyjNlM4Nywh74vjOLm4nQm8g6
	EU4QVzmqzNXfW+Rhil0vCFcngIvyyeu2rCV5fTxIaLkJjczvnxzIVk9XPXkx+qm5eAHJ1goCoL7
	Z4hWOSlyj10D4rJDZ8siwRILrQ4u0yVVlhq3D
X-Gm-Gg: AYBFou0hj7Iu35gIhh4KoZZjo7u1f7/spaT5qaSqc3xNDOgLh07eKpLlC7AqLAe4vtY
	yh+XGgYETZ7oVRVCa9FzpKPlehWaynxmGUoWxx0f427lRE7JqGkCbNKJ7NS1HLh5k723BszkMze
	6OzLWnA0W9rE8rECgJ+C250z/3WbPCm5U5MxGAtjIK3bV1O9oyk8Q816fPJ1bLRyIjbpUUpp99R
	CLUQO1ABz0lOEqQk9rkm6N3dnJa1mSzbDKGyYBW2zwQAgdD6V4+AD7hBXRfqCndsevMjcMEuCly
	FUjPlCN3/WMP0J6gWu0g1x9VG+OESUzWV2UhLvVbvRC24jYGB8ZHvpvo2Wi9oQqaX5+AwMfRnIt
	x2Q==
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id
 98e67ed59e1d1-39b26272ef9mr26974168a91.12.1788669548204; Sat, 05 Sep 2026
 21:39:08 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Tausif Mujawar <tausiff1920@gmail.com>
Date: Sun, 6 Sep 2026 10:08:56 +0530
X-Gm-Features: AcwNN1XfxxY22IPHln6DV7m64K2XmmHAL8Kxvyt5ATo1jpZYxJZY2MnAkUQQ_XE
Message-ID: <CACk1-zBUcR7YZbVxxSOCPHeMKeMVzEQ5iB0QJS7Q3UrubF6yXQ@mail.gmail.com>
Subject: Request for review on the gerrit change 88298
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000000a947e065ac91559"

--0000000000000a947e065ac91559
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have submitted a Gerrit change for OpenBMC dbus-sensors issue #37 and
would appreciate feedback on the approach.

Gerrit: https://gerrit.openbmc.org/c/openbmc/phosphor-host-ipmid/+/88298
Issue: https://github.com/openbmc/dbus-sensors/issues/37

I=E2=80=99ve also shared the change on Discord (
https://discord.com/channels/775381525260664832/867820390406422538/15436848=
23342780556)
for review, but wanted to bring it to the mailing list in case others
working on dbus-sensors could provide feedback.

Please let me know if the approach looks reasonable or if any changes are
needed.

Thanks,
Tausiff

--0000000000000a947e065ac91559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hi,</p><p class=3D"gmail-=
isSelectedEnd">I have submitted a Gerrit change for OpenBMC dbus-sensors is=
sue #37 and would appreciate feedback on the approach.</p><p class=3D"gmail=
-isSelectedEnd">Gerrit:=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbm=
c/phosphor-host-ipmid/+/88298">https://gerrit.openbmc.org/c/openbmc/phospho=
r-host-ipmid/+/88298</a><br>Issue:=C2=A0<a href=3D"https://github.com/openb=
mc/dbus-sensors/issues/37">https://github.com/openbmc/dbus-sensors/issues/3=
7</a></p><p class=3D"gmail-isSelectedEnd">I=E2=80=99ve also shared the chan=
ge on Discord ( <a href=3D"https://discord.com/channels/775381525260664832/=
867820390406422538/1543684823342780556">https://discord.com/channels/775381=
525260664832/867820390406422538/1543684823342780556</a>) for review, but wa=
nted to bring it to the mailing list in case others working on dbus-sensors=
 could provide feedback.=C2=A0</p><p class=3D"gmail-isSelectedEnd">Please l=
et me know if the approach looks reasonable or if any changes are needed.</=
p><p>Thanks,<br>Tausiff</p></div>

--0000000000000a947e065ac91559--

