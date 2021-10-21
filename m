Return-Path: <SRS0=jPo4=PJ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340FDC433EF
	for <openbmc@archiver.kernel.org>; Thu, 21 Oct 2021 05:23:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BF4D60FD8
	for <openbmc@archiver.kernel.org>; Thu, 21 Oct 2021 05:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BF4D60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZbVn2G7nz3002
	for <openbmc@archiver.kernel.org>; Thu, 21 Oct 2021 16:23:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PyngDX9d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=patilkg@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PyngDX9d; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZb1D3Fjrz2y8R
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 16:01:35 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id e144so27421875iof.3
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Jt95gQyUogy7qK1xxB3TIOgff8ZrmELhr/BC7hpiiiY=;
 b=PyngDX9dRJ9a62Ep1jIPb3dR6cLboXtu5BTqtCWVutzmyPiffqCmlhFYekXWQ2dFGh
 /+ThEbSlUbK6n2XegDa8CBZW6xe9y8IoO9BEhop3XzwBgbJ20NOVqKsGbGVuMTHiW8l2
 oz/Awq4kvyyU0aa8Qy9qcwdVR3m8GOR7YPUs5xRpmLZKiGnDYEl5KXssB/TfX/3G+NwX
 V5/piyn2Ki4f/65PF/R6e71rzvczvAgKKh0q1G7TrbdtVfGim479gu6YtTcBatTUcc8U
 PnIz3yHkbHi3M2A8G4/t6UpXwAErWHHngQVnM4FZB+FroVImaOT8K6v9G001kat1i7HK
 bIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Jt95gQyUogy7qK1xxB3TIOgff8ZrmELhr/BC7hpiiiY=;
 b=RykHOCPdJVnUtNmG/uobghzInH1YZxHvheBcii6uTYeJxy+DEHyQu+yxMpkCQQLAFz
 +/e4Bh96Gl9eTN/sYTPHevLMQeHAtkNm0R+t7bQDj3CyuDVgjiZBQlIG302tX91vyPaj
 j4KvY8OOBDSFXrTySFYPT5Se9h0B2qKDchhE4EF3SdvaBGV1FwneRnihpCf7ERhsFLAO
 PwNIJHJHrhcWJZcwVFYa/4cEe5Fzsnw+Ygd/efryA9XV91dFo5DefB/Q1JKS45SkVUeO
 yEC0TInDCe8JM0upYbC6GYnznqwxJHHJuvb3U9pcjZH2PnFK22mttJG3VslAWSxk0xWg
 0hVg==
X-Gm-Message-State: AOAM531xnqYVziMLFzlOVbXLjnDdzimINTd7xxlfK64EbRrvwc3/bgzN
 8xpFGIPyTXAohIrQFFstMXUEip3Ll4ydD7NotY6y8miB
X-Google-Smtp-Source: ABdhPJyWarVqAU7+tXdtu0Qle68TnQmSNqgkZ4d7cABdjWj/XSRVgMUjSVrAQ0LvlMBydjGH7vurGp20d7OqMfDbmBI=
X-Received: by 2002:a02:6987:: with SMTP id e129mr2432505jac.136.1634792491450; 
 Wed, 20 Oct 2021 22:01:31 -0700 (PDT)
MIME-Version: 1.0
From: Kiran Gopal Patil <patilkg@gmail.com>
Date: Thu, 21 Oct 2021 10:31:20 +0530
Message-ID: <CALGk7QU0mNzuS0M34RE1PhjhYKUjDTOf7wLZoG8DYvjArfS9Xw@mail.gmail.com>
Subject: Open BMC Jenkins information
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000bc034d05ced5c9a9"
X-Mailman-Approved-At: Thu, 21 Oct 2021 16:22:26 +1100
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

--000000000000bc034d05ced5c9a9
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to understand the OpenBMC continuous integration.
I would like to know more about what are the master hardware configuration,
server hardware information, number of slaves and various jobs
configuration. How the docker images are used etc.

Also, what kind of tests are run in the CI.

Also, through my github account I can login to https://jenkins.openbmc.org/
however this does not enable me to see the job configuration.
Is there any repo where all these configuration is versioned?


Please let me know if there is any contact to check all these things or any
document which explains all the things.
Thanks in advance for your help.

-- 
Thanks & Regards,
Kiran Patil

--000000000000bc034d05ced5c9a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I am trying to understand the Op=
enBMC continuous integration.</div><div>I would like to know more about wha=
t are the master hardware configuration, server hardware information, numbe=
r of slaves and various jobs configuration. How the docker images are used =
etc.</div><div><br></div><div>Also, what kind of tests are run in the CI.=
=C2=A0</div><div><br></div><div>Also, through my github=C2=A0account I can =
login to=C2=A0<a href=3D"https://jenkins.openbmc.org/">https://jenkins.open=
bmc.org/</a> however this does not enable me to see the job configuration.<=
/div><div>Is there any repo where all these configuration is versioned?</di=
v><div><br></div><div><div><br></div><div>Please=C2=A0let me know if there =
is any contact to check all these things or any document which explains all=
 the things.</div><div>Thanks in advance for your help.</div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature">Thanks &amp; Regards,<br>Kiran Patil</div></div></div>

--000000000000bc034d05ced5c9a9--
