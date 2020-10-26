Return-Path: <SRS0=h6B3=EB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECC7C4363A
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2020 23:04:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1BD20708
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2020 23:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmPAA50N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F1BD20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKr4g6HDRzDqR2
	for <openbmc@archiver.kernel.org>; Tue, 27 Oct 2020 10:04:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GmPAA50N; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKr2m6rLlzDqPw
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 10:02:39 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id d3so14135479wma.4
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 16:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=m2l5r/uM3RgXGfwS3KY+Y311JntPfXLa5baNa3SF/1I=;
 b=GmPAA50N8wSfyIRSw/o5X2vTC1ySh+XQr94/nZkb9FA0tuEwuA6D3nwf/xwCDQ8EMw
 XpIWFtZTCXj3zkPMsmA1E3dIoW9heGZs1Fs7LfqqDKOchRVrB5HYI0vCZp87W9/uqC3p
 KUByKtiQAyeU3hIovYAQ9eElMNcNeSin3YIcF6zG9/5PArec1TE0TbtrSCjdbaDPKZkC
 dvLjSaBdHDjZWD/x7rAVBbZCanIFsaQJ8m+kkY0EMtw7kgR+zhRO3mI8nD+0dCvCNKne
 +oHv4iyErgr52pv8xH15pVvqS0i0liZTzNOMMfKk89Qy9SYb4xF5QeSz4O2dNrj1q4cn
 EYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m2l5r/uM3RgXGfwS3KY+Y311JntPfXLa5baNa3SF/1I=;
 b=sN1DqXT8fmzpK4DUQyqByHPJb/I2nOi9xkGSePU9ijThQrdqStibCsYxmNrj32ntFr
 RnrQxOO6wR4Effb5IX33XXc4vV8RqYIQWtx91gIBI/YW9fqN8EXT7AVHBejxr+ar1Dz9
 IYeQJGaMitPdBbCvXVniQxXTz95xcDoP0oV7T5m1Iy4PvUs5EIU9MjtpiEsGeI++EYpc
 OyVfHQPdLSSBzBfpaDy7vNV6kxyaS9Y5loQMedxmKawr6DLaNT2GbeYFygFpZYPG0zSG
 J8BKA7hpIuTf5JVTxXAIBvbLqQbilJ8bVvNMTBjKX1w/nujSvAmLcvJGZiSSeU8/wmnw
 XWuw==
X-Gm-Message-State: AOAM532lRbjnE7b3j9uGBjcEX7WWndcNkouoZeTrnqvh6hMZLwega7p7
 F+1Sh8Wv9xGlpSCF4rVKB8kVhb7p0HIBghVW8kFqA1OBzLY=
X-Google-Smtp-Source: ABdhPJwqHOk6DSVn5pEJSns6zoz5BehmvZISawvAhiBedsI+sKQ/BOThEqLcLUQQQFaTZYmYngzxCxATv/I8RnFWSPk=
X-Received: by 2002:a1c:56c1:: with SMTP id k184mr17843056wmb.14.1603753354105; 
 Mon, 26 Oct 2020 16:02:34 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Mon, 26 Oct 2020 16:02:22 -0700
Message-ID: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
Subject: VR control from the BMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

In the near future, I'm going to have some needs for OpenBMC to be
able to control VRs.  These VRs might be on the baseboard itself, or
on detected PCIe add-in-cards, and controlled over PMBus.
Additionally, I will need a "hardware safe" way for the host to be
able to modify the behavior of these VRs (usually different voltage
settings), and to have that interface be constrained in such a way
that the host can never set a value that's outside of a predefined
range that's known to be safe for the hardware, which the BMC will own
the definition of for security purposes.

Does anyone else have similar needs?  I've been pointed to
phosphor-regulators which has some similar parallels;  As-is, that
solution won't work for me, because it's relying on fixed, platform
specific json scripting to accomplish its goals.  My hope would be for
a more generalized linux devicetree based solution, as well as a
representation on dbus that could be modified at runtime by
Redfish/IPMI in band.

Is there any other work I should look into that's similar?  Does
anyone have any strong opinions on how this should be organized or how
it could be built?

Thanks,

-Ed
