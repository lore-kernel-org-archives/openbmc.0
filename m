Return-Path: <SRS0=flCO=KS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A449C47080
	for <openbmc@archiver.kernel.org>; Sun, 23 May 2021 23:35:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9316117A
	for <openbmc@archiver.kernel.org>; Sun, 23 May 2021 23:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9316117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpGtT6M8rz3074
	for <openbmc@archiver.kernel.org>; Mon, 24 May 2021 09:35:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=jaEmKAk5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jaEmKAk5; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpGt13XM1z2xYd
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 09:35:18 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id t21so13720151plo.2
 for <openbmc@lists.ozlabs.org>; Sun, 23 May 2021 16:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gVQEtuTu0e52e4NtnatW3R6uInLLQPdMwb2COXFpjoc=;
 b=jaEmKAk5pWvf7ozv5arFRRbjS5PT2CLHtqztL3txS0161jOc4DLEd1J7PZlpQiBhjj
 IqnxQUgRAOfZ8EvPqW/L6a3YXcHPrMlykpBnVmwyixoEIjoc9RCY+ODY/Q9/N6RMCZwY
 kRzccU6UESMaxRFKegxeiBxPDG9DYTSBVWgNpru6vLXwURMfvqkVYglaIoNS1VGU/IGK
 2b/dHrQ0FCFVwL82lSyzgQl2VsPE5s+n4HU6A9dbavRZYDKxYvh9VT7sIKYQmZ1uflp0
 JDbNLITq5G6gteq43BukcmCdjGoa7nbFbweKxjzRd4QyRatrH+cwa0LzTJTbLxBJTb+O
 1sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gVQEtuTu0e52e4NtnatW3R6uInLLQPdMwb2COXFpjoc=;
 b=iARSrSlkbqhx/9+opHE56JalSLWgW8GmuxR217ZFTZXVsxZs64NXxCos2uWGH5geDk
 /rqhcLuWKGptJ65uN6sX/Le4YlqRykdTDNYLF74rlNqaUEIZ0a+Mo0lDISuIG5aXrerZ
 GISBP3OZFp8IdpcI4IJwhbaK8Gef6atRuDckFD6+PfEWLI/P7fAc6r5A72rfsPvFG5W8
 Z0jwFNHPQH7cTQE/3EqXZlHG7Lw3X/9TskklSIs88jBSptw5J/w7GSkR1hqnN5BbDR4t
 hqwwnXZjxdHE4oGevY8Hw8jLCa2aDr56OJMFmMaoXFAp+CR2Ju5UETCI9FobwrrL45Jh
 4VFg==
X-Gm-Message-State: AOAM530sLrI+3fjO7Aug43o2RubqzEx5nyENDXA3ASm+ygpIP392/i0x
 qqzNiI++wjcZB5XYHpIxX6RiWk3bd2q9W3RdytHTNYde94RdSg==
X-Google-Smtp-Source: ABdhPJyjhhhDzv4FP0fpBSGH3/Xk+m+6Xc69MWjt8WUYLp+dYI2K96ZTjnE7Kn9FPq1SGvVW27UIc3cNd2lQDIOWCB4=
X-Received: by 2002:a17:902:c104:b029:ef:836e:15d6 with SMTP id
 4-20020a170902c104b02900ef836e15d6mr22835872pli.39.1621812913083; Sun, 23 May
 2021 16:35:13 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Sun, 23 May 2021 16:35:02 -0700
Message-ID: <CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com>
Subject: [Design Proposal] Additional Drive Properties for Bmcweb/Redfish
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009436f105c307be00"
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

--0000000000009436f105c307be00
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have a simple design document on supporting additional properties for
Drive and related resources like SoftwareInventory.

The main purpose is to have more control/monitoring functionality over the
Drive with more status, software monitoring, and resets through bmcweb.

Design Doc: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43460

Related D-Bus API:
https://gerrit.openbmc-project.xyz/q/hashtag:%22dbus-api-drive-wltu%22

Please let me know if there are any questions.

Best,

Willy Tu

--0000000000009436f105c307be00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I have a simple design document=
 on supporting additional properties for Drive and related resources like S=
oftwareInventory. </div><div><br></div><div>The main purpose is to have mor=
e control/monitoring functionality=C2=A0over the Drive with more status, so=
ftware monitoring, and resets through bmcweb.</div><div><br></div><div>Desi=
gn Doc:=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+=
/43460">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43460</a></div>=
<div><br></div><div>Related=C2=A0D-Bus API:=C2=A0<a href=3D"https://gerrit.=
openbmc-project.xyz/q/hashtag:%22dbus-api-drive-wltu%22">https://gerrit.ope=
nbmc-project.xyz/q/hashtag:%22dbus-api-drive-wltu%22</a></div><div><br></di=
v><div>Please let me know if there=C2=A0are=C2=A0any questions.</div><div><=
br></div><div>Best,</div><div><br></div><div>Willy Tu</div><div><br></div><=
div><br></div></div>

--0000000000009436f105c307be00--
