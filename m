Return-Path: <SRS0=0X7Y=MW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05506C4338F
	for <openbmc@archiver.kernel.org>; Fri, 30 Jul 2021 10:41:12 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F02760FE7
	for <openbmc@archiver.kernel.org>; Fri, 30 Jul 2021 10:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F02760FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbkTK4s3Vz3cRR
	for <openbmc@archiver.kernel.org>; Fri, 30 Jul 2021 20:41:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ApBAmbJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ApBAmbJ/; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbkSr1YTdz2yyl
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 20:40:43 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id nh14so2809025pjb.2
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=UTtZdkpm1vWt54ID+uTCEVF3BUfkOuJMkZJ0KBXcS5A=;
 b=ApBAmbJ/CsYITPo0IojljO1Y7CJ2hSH7K5lSfQ+rYaBfeqc3PcL9c+KqHVXRRO6Rg4
 g4erTrVrtZiSkJx4bpkdamttRCA24jn8SFLPaJ51yBuMFzCgDsFyJbf3SpckQDtftwNm
 J7J28vgvaN2C/7PQ/6Qt+PchVL14evwr4465a9ZDrs3anFuc2Sag6DOSS/dyK3gOCDV4
 W8/YN0ZHypDyx35yvsrhazWWnyL8uqqk2PSG9nwWbJrfLysD8HBLazkzq5kniTvfWyhg
 heHcNAvQV09Dn8oLig60ZR99Xs/635bEHHOdfA4R4nBWqAqe5vxGdX/RDB+cP293hZ0z
 tWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=UTtZdkpm1vWt54ID+uTCEVF3BUfkOuJMkZJ0KBXcS5A=;
 b=Bjxop/Xr48Gdf/sYIKou/AxhxxGv8Sw0QLwMzo4M5t0HAcGv2FT1dumDMFxVkHwmYv
 yHGYh7+iOczwibcy17YGbuLtKRYGG9bWySlDJc7U+oG+kHOiCbgsHmIGdmx+L3NNltVU
 tJaQQ2NdekEIRX0gRNxgleK0ZzKzZE+D+kkT8SDQx3tak/LRIEyn7pM9Xd4S6OAyWuLp
 jHzcr+7BVMFjEtXYoXmCee6eW92a5oJPoRrfwOCHiiisoV7h5HpJL/EAzGl6Okq8bJMj
 tK2c4t5QxQsXTjZJfMEH/raBe9/aPiL4HLCrOoVb0ERvuT9mLIgGs+rX2OvJgdosY664
 Q3wg==
X-Gm-Message-State: AOAM530I9EWzoJKyTwk5v41HN15YtIWnPmPUAktiTt5XUF2KSDZsu38Y
 Jxy+Dun82Wg7eD7jt4Rd6Ptho/atJBdW
X-Google-Smtp-Source: ABdhPJxPQhlVZJ0Asa/b9o28zRYGY9CawZAVujnpSrdj5mMYY0nWmy0j2xBK2Ujb0q6UeBZpF1pbWg==
X-Received: by 2002:a05:6a00:7d7:b029:32c:b12a:d65d with SMTP id
 n23-20020a056a0007d7b029032cb12ad65dmr2224949pfu.44.1627641639672; 
 Fri, 30 Jul 2021 03:40:39 -0700 (PDT)
Received: from smtpclient.apple (220-128-110-82.HINET-IP.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id mr18sm1772089pjb.39.2021.07.30.03.40.38
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Jul 2021 03:40:39 -0700 (PDT)
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Module develop issue
Message-Id: <E8EC142E-B62A-432D-AAAA-661528534DAC@gmail.com>
Date: Fri, 30 Jul 2021 18:40:37 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi teams

I try to develop own module. I try copy =
poky/meta-skeleton/recipes-kernel/hello-mod to my machine.
I run the command =E2=80=9Cbitbake hello-mod=E2=80=9D, but it is failed.

The error message is =E2=80=9Cneeded by Module.symvers=E2=80=9D , =
=E2=80=9Ckernel-source/Makefile:1665: recipe for target 'modules' =
failed=E2=80=9D.

Please give me some suggestions!.

BR
Paul=
