Return-Path: <SRS0=2jgY=GP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF74C433DB
	for <openbmc@archiver.kernel.org>; Tue, 12 Jan 2021 14:55:45 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541C6221EC
	for <openbmc@archiver.kernel.org>; Tue, 12 Jan 2021 14:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541C6221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFYXt2L3mzDrQL
	for <openbmc@archiver.kernel.org>; Wed, 13 Jan 2021 01:55:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ggYH/oin; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFYVv5cWCzDr7d
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 01:53:57 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id j20so2488009otq.5
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=E9zrLTcVZFEBe2lhkKO0J4vDLusT0OEl7LDKrSldHJE=;
 b=ggYH/oinJqa3Ubc8DHDNQ0szCB9XnhatIO+SClpdgKNh9YhGBkm9wlJ3+yKBRIwNco
 JeEu1FoktjkxQNQKotCISOEC2KiJTGH2qwoggK84Ad0kmUHG0w+bl+1NW147eb4mx4PT
 RVMxPfn3ix9tJy6nrj5ViQokdoUYnQAV0NqFkKIAB6EUndDbz2sGoiJdILh2YrDj3k3e
 rC/6fBeOofY4VIqONiW79bkBO+c+c+naVRiMBSKDdlYwwRwv6KMmADM6CilHgp7kle+/
 QSOJ0YX+/Yu4Csqd3n1O+s5/yu4ALLfpZ7xC+ajDR3Q4Kn9TDWuje6UA/hxlCdvCmMcV
 HCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=E9zrLTcVZFEBe2lhkKO0J4vDLusT0OEl7LDKrSldHJE=;
 b=ZwcQbR0dhBwIMGMmHnGqRpYPIiNjg+ZfgBLIKw9Qr6SNeuS7CncMsMhgg0Mj/TpGKo
 p/KUY8K8TIgWV5f5n4KQzUm+A+eg7KFgbqoXZaJvOnhvDGHslVVMPz2+bof8FqOYDpeA
 8ChUlhKLYNhUPYZIB9M8lAKI36zac90x3G4FEI4LxUuwVUpibi/PFsZYuQLnVBckgghY
 pkwzpdYDQNYHgt36YdzvIQ8LkPWfrnpD57I91lTy8yMJLY/pDGdtIqFR9vBLJ8jCjH21
 ZmWe0+RShi00blIoOg4yZSnSXuTFQkWM5OxEO9t1ddAL+bf+HjjVOhojGtUv+vExuyi2
 eGbA==
X-Gm-Message-State: AOAM533T1UEbygF8aY8xVr3f0nRgGxGLXEKGTBY8RUnBQ25jmlAg8nsp
 CvqEnKB+og3Oz3anPjxQ7O0fAgAY74Q=
X-Google-Smtp-Source: ABdhPJxM7ZAC4PjFz0m8oCBYZImGNJJO213z+BcI8ccD/iuoXieXoaIZfKkhgdYgGiS/X43Jjygyig==
X-Received: by 2002:a9d:7c82:: with SMTP id q2mr2997964otn.205.1610463233369; 
 Tue, 12 Jan 2021 06:53:53 -0800 (PST)
Received: from ?IPv6:2600:100e:b055:46ab:e0a4:8a40:c0f2:2eb?
 ([2600:100e:b055:46ab:e0a4:8a40:c0f2:2eb])
 by smtp.gmail.com with ESMTPSA id t24sm611507oou.4.2021.01.12.06.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 06:53:52 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: OpenBMC add sensor in IPMI interface
Date: Tue, 12 Jan 2021 07:53:51 -0700
Message-Id: <CD702A7F-2999-458F-A036-1CC12D5FDC03@gmail.com>
References: <f44e378cef750f1bfa21a353a138ff8d635c5d7d.camel@yadro.com>
In-Reply-To: <f44e378cef750f1bfa21a353a138ff8d635c5d7d.camel@yadro.com>
To: Andrei Kartashev <a.kartashev@yadro.com>
X-Mailer: iPad Mail (18B92)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Are current designs using the PMBus AVS bus of this device?

Sent from my iPad

> On Jan 12, 2021, at 12:10 AM, Andrei Kartashev <a.kartashev@yadro.com> wro=
te:
>=20
> ISL68137
