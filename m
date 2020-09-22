Return-Path: <SRS0=PhQT=C7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC52C4363D
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2020 17:19:17 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2949923119
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2020 17:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="liCjvBNZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2949923119
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwp2951b3zDqWf
	for <openbmc@archiver.kernel.org>; Wed, 23 Sep 2020 03:19:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a;
 helo=mail-yb1-xb2a.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=liCjvBNZ; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwp0c2VJVzDqQ8
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 03:17:48 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id h9so5849477ybm.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hVD4qn5PiPsKiFMg2p688VNP1StwqwXi7AmpzfljL+s=;
 b=liCjvBNZjkRZ8axtjO0XVMAsMXnFy/ypydtPDOt7dPJskrKCjFgNcqlCAl3QbCTe4B
 tCN2QM2UEXqaqMVrP5vu6CZTy0InbwlMMjJGe6+H/m5g/+eV2CFAKYQQc1lrKkmJ62dK
 W9xLQc9cx+jVjAb+DGLs7zQda3DXrrvYVYY60fbZP8QKkV/8v+sHFD32SOG1yiwFTKYg
 WvCFysqqDoe+Yj+qEn6hZg1+UY5dOP7ZdCZY7Q4eqRCzg1RH5vi7sHJWxpZJqOMnBxJ5
 1Dj+ZP08lBGGtk0ohM1p2c6FqrcCLNv+sgqGeYb0dfY8Fg2MZ7q71oIRNc2113VBhCn6
 v/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hVD4qn5PiPsKiFMg2p688VNP1StwqwXi7AmpzfljL+s=;
 b=sJo9OrlRdkf4QhIotXhFiJRo51AATQEmSlaFugitsMMTqptFV8bFLaxGTfTUrY98DX
 CCYNInn4OcrWXe4Ei0eKIom9V2sr0Oho7zntFMK48k9cqyd3ODjsiuhRY0tpqZogFZX2
 7bQgqH6oSJmQdoofCOc+0LaS8/azKVFQCg0eOBr0hLFeaEFUQCLOyQaJzeIAuyD3ttaH
 z+GG404m3LsYinWfM6QQUcIMISWCTQG22J7lshJqfl9dPE93Yntyoa7UGfF4Z7T7Vpix
 C1o2PTgCXP3Axvb8fKogM77aJQ3Lic3J33vtr5UuE1BDFdvmKXoW+FzvpthoFpRPjXQA
 F3YQ==
X-Gm-Message-State: AOAM532d1lv46K58JivfVf7ftap7qL2d2Ji5PHm+5r+29xv2odYBRAnt
 9KpbyIq0TFIQe91FkjSyLkaKKAwr8lwU9QO9JO8XY/QJ88E=
X-Google-Smtp-Source: ABdhPJzoiWIK00lLEp5wz7s4lC333R4a54iOKPPHxRBL6JhOOfIrZnb9NGtE3tsxSHre7G7UjN030SFSHUAD4qZs8fw=
X-Received: by 2002:a25:cb88:: with SMTP id b130mr8450235ybg.521.1600795064170; 
 Tue, 22 Sep 2020 10:17:44 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 22 Sep 2020 10:17:07 -0700
Message-ID: <CADfYTpFQoiQ6BcoVeT1Mi2oF+tORtjvbkmSkvyFB4FA_nR3p3Q@mail.gmail.com>
Subject: OpenBMC Office Hours
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

Hi Team OpenBMC,

As Sai stated in his learning series post, OpenBMC can appear complex
to people learning or evaluating OpenBMC.

I propose office hours, staffed by experienced volunteers where
newcomers can dial in and ask questions.  The reasoning is newcomers
aren't always sure what questions to ask and/or are intimidated by
IRC.  Office hours would be a more direct, 1:1 forum for newcomers to
get answers.  And of course volunteers would encourage the use of the
mailing list and IRC for follow up discussions.

I would like this to be low overhead for volunteers and I'm hoping to
have enough volunteers to do monthly office hours, in the volunteer's
local timezone.  Please sign up here if you're willing to volunteer.
Ideally we would have 6-12 volunteers so it would just be one hour
once or twice a year for everyone.  Please sign up by 10/16 @
https://docs.google.com/spreadsheets/d/1hOzYDq6kRl8RCj9Kk_kzpiUjt5bABxVRH87StK2oKnY/edit?usp=sharing
if you're interested in volunteering!

I'd also like each office hour to have signups, to make efficient use
of everyone's time.  If there are no signups within 24hrs, the office
hour would be canceled.

Thanks,
Nancy
