Return-Path: <SRS0=JyqJ=LK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E0CC48BE6
	for <openbmc@archiver.kernel.org>; Wed, 16 Jun 2021 09:37:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE165611CA
	for <openbmc@archiver.kernel.org>; Wed, 16 Jun 2021 09:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE165611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4g7c0Kcxz3091
	for <openbmc@archiver.kernel.org>; Wed, 16 Jun 2021 19:37:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sAxK3HMo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=61a91bc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sAxK3HMo; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4g7619lgz303h
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 19:36:33 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id k7so2761943ejv.12
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 02:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jIvvceBrNuB0io9BynbLTqfPj4SDL9ALODaUj0c8GF8=;
 b=sAxK3HMoxD4KW+uF0WGo66ws91RiFk3BZ0/rQzbxipm+Jf4KPGpTry3pbWw/bdOop6
 I/5KqiVfv4CpX78Lkm+rxuKj/ckaDfvYkvgFg7/kGj5lzt2INjGtL8sdyvxMkuAUQfmZ
 tO2zKILK5O4hE5ID2MfC07lu8bz44Et6zAn5DmBPO4AZhvZg1ajhP7GaneYj6Jd/n4vu
 U3hHcMpj0NcGre+GClYebsgVa+yM6f7RrKwsgvjTVuBzZxvWZZxFBoBCrjwBGr81DsdF
 cXcVvsPTr6K7tNSB8jiNIQEmLgRbyeGPiHpEdlfrmanI+1+6hQ5ZE80woPkY3UzKBGiK
 A5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jIvvceBrNuB0io9BynbLTqfPj4SDL9ALODaUj0c8GF8=;
 b=MzKM/UC5Y0aeTbD2/gWd0QY+H794FwPbGj/0aMWe8RnBocggexx4dbRAKd/6T4IMyR
 lME1D1ncYEoTC1hEUavvwqba51Sx1KZZr5zLa8VEPXyX9qJq8ZxEplLqT9ZCJuiiqRkf
 sNF4kEgwPZCTyyVsMxKZevP9n+ZbgECgbQ2UQlORlIUw1UY2I783FZoAk6WYTKVf/mG0
 qiTh0anbOlLf+gD3jednEPgijR1m0lHhG39OMIgQU8D5ecailqvu1vy5Ha/Ttco+1RyZ
 TO2fiLD2fKiiQb3DwtviKkoAg5FcJILimRWsTw8Ky8e6JDrWJPcK0j325SbDTDB4zTj+
 i0hA==
X-Gm-Message-State: AOAM53199A0z1fI1+3bDu/85O1VypmOsxk6b81oXrnwDvzVz5RoV4xDY
 uVgSzWrOMNfwUbrpyasphZAZCTjF1i2HMH6f/8XndQWk88o=
X-Google-Smtp-Source: ABdhPJyX9MqTVaPUINt2LtXHmobktJz0lpY0teRVvIQIL0Z0muXjLiITyKM3azRmc1ewxJkRZHsA7Cw0f7fbdC4q5Wk=
X-Received: by 2002:a17:906:488f:: with SMTP id
 v15mr4260755ejq.428.1623836187901; 
 Wed, 16 Jun 2021 02:36:27 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Raih <61a91bc@gmail.com>
Date: Wed, 16 Jun 2021 12:36:17 +0300
Message-ID: <CAMqwjCAC_cVrD9kUEqCF3RxZSw0wh-tzA+j6U-epfBYVJgrcLg@mail.gmail.com>
Subject: How to rebuild with new local.conf.sample ?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000027456805c4ded37d"
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

--00000000000027456805c4ded37d
Content-Type: text/plain; charset="UTF-8"

How to rebuild with new local.conf.sample ?

--00000000000027456805c4ded37d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><table cellpadding=3D"0" class=3D"gmail-ajC" style=3D"bord=
er-spacing:0px;line-height:20px;font-family:Roboto,RobotoDraft,Helvetica,Ar=
ial,sans-serif;font-size:14px"><tbody><tr class=3D"gmail-ajv"><td colspan=
=3D"2" tabindex=3D"0" class=3D"gmail-gL" style=3D"vertical-align:top;width:=
auto;padding:2px 0px"></td></tr></tbody></table>How to rebuild with new loc=
al.conf.sample ?<br class=3D"gmail-Apple-interchange-newline"></div>

--00000000000027456805c4ded37d--
