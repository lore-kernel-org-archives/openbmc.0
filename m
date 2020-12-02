Return-Path: <SRS0=yaFm=FG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8212DC64E7B
	for <openbmc@archiver.kernel.org>; Wed,  2 Dec 2020 14:33:14 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 950FD206F9
	for <openbmc@archiver.kernel.org>; Wed,  2 Dec 2020 14:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 950FD206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmLzq27GSzDr5s
	for <openbmc@archiver.kernel.org>; Thu,  3 Dec 2020 01:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Cg4WxjHR; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmLxL6ZygzDqpC
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2020 01:31:00 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id l14so1789809ybq.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Dec 2020 06:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/hsbT4PTZ1J3fqiFpRUVgwULnt07WqPX6p3NHoP5LgQ=;
 b=Cg4WxjHRkjJhYdpN4eM50G06opgqV590O/e7Fm7ozSEt4GODZbD4QzRJrtMFn12PT7
 thhtqJM+PPjQ+wxUk0mpO61j1TycSCT5MQmGtuta8D2kNMPCnHSYQmd6vSSwhkJJHzc3
 KjOxCOLv2uXsn176+0hhAF6G09NhxXku+Xl6IqkknI6Au9qUreo3uwFj7ILoQjJXwuUv
 BMcBgO2P1414+SI+gjvhjwb7ILeoOEBrFwaFx31R0x3KZXLjjbgHz9s5+smiFoSxia6L
 M1ijPo8CTwz+iPnuQIZb1pqbKk+3aPu3w/KIucY+7CWWiNwXI2/t/v5ZUFWsSU53nxKU
 FsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/hsbT4PTZ1J3fqiFpRUVgwULnt07WqPX6p3NHoP5LgQ=;
 b=PtvkXDgJNKvY/07Q6ECqBs7XbKbSBrUtp/TfwyYEiOAHfFN5Wi9RC+y5/iMw9dfu34
 8FVyv9lUHoiEgS3quS4v1F58i3cVmwWHKWiM6XXrODr87c3HPQhKhgqNNPI5xkJPg59q
 GUtXdbW/RnhhFB4fP2ZRPA0Srx8Y0CYLF2fcdXP6VfNoNnO65Vd9J0zDKG4A6HZuqSJl
 fjPPtFqbKRnTs9pVE09iQpAVPKFKRDPwLlDvkxBdMrgEQc6nGBGDbPgBbLV2Vsv1vAU3
 8eOsUIL0aChxQC0ThoMjMaqER5SWpj9oVFLGFzjVs9wJLuU9WZs79e20FDbU06JWz5jZ
 8heA==
X-Gm-Message-State: AOAM533kDO2I+ceuoF6bLXPuW59K1SCGtoma3xdCA6MgDWkvXH0PGK1g
 /FJgMojvyb2u/O0621pFS1mRWMFaO5B07NgLe8YeUW1KF5k=
X-Google-Smtp-Source: ABdhPJydoNUzZitfHtSVHTdtEsRAosNXvN43qya2SWsV/4p+ZqNMJkxqK5FxJ+dtFiVhkcDkIswTO9B3Pub9f0Z7n9w=
X-Received: by 2002:a25:f816:: with SMTP id u22mr3761119ybd.505.1606919455308; 
 Wed, 02 Dec 2020 06:30:55 -0800 (PST)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Wed, 2 Dec 2020 20:00:43 +0530
Message-ID: <CAJCnuYkjJb52_0i5Gi41M8oVCjj0v3gSV4ZOG7dyna724c33WA@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs - Client Sessions
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000051010005b57c17b2"
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

--00000000000051010005b57c17b2
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration(1) of Client Sessions screens
in the WebUI:
https://github.com/openbmc/webui-vue/issues/46
Thanks in advance!

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

--00000000000051010005b57c17b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><b=
r></div><div>Requesting feedback on the current iteration(1) of Client Sess=
ions screens in the WebUI:</div><div><a href=3D"https://github.com/openbmc/=
webui-vue/issues/46" target=3D"_blank">https://github.com/openbmc/webui-vue=
/issues/46</a><div>Thanks in advance!<br><br><font size=3D"2" face=3D"Georg=
ia">Warm regards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div></div></div></div>

--00000000000051010005b57c17b2--
