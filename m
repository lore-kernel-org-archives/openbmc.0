Return-Path: <SRS0=gj99=HM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A257C433E0
	for <openbmc@archiver.kernel.org>; Wed, 10 Feb 2021 12:49:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CBF64E28
	for <openbmc@archiver.kernel.org>; Wed, 10 Feb 2021 12:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6CBF64E28
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbKMx3zBHzDvZl
	for <openbmc@archiver.kernel.org>; Wed, 10 Feb 2021 23:49:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=S/+36pl/; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKFQ1Rj0zDsjV
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 23:43:51 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id d85so1425794qkg.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 04:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=wcNzjL6UnMhSbN9QEswpECoei4ELSG8DCdVatr+0cFg=;
 b=S/+36pl//W7b6K0rO7ud1d+laZeBIInzAoWgwKW+gXJlCPAV4zFoqZVAigJBSNLqo0
 adKKnQZ9RtMsDHgbBTP+KDNrNp7If0KgfqmOKpncODVekYltKHpIHF0VbfWg/fC4uvvP
 vbok7Pm9R3jOaTyiUJU6AheEvXNzVfgrO7zc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wcNzjL6UnMhSbN9QEswpECoei4ELSG8DCdVatr+0cFg=;
 b=TSKPIIELaxEzRdOOIVk+v1XCK8nIDzAHcYhLkoqOaj4DFhQZ40Zeeln8zCaBLz0F1H
 QxurN0qumfD5/B+n3NfKOTe3UTVol9hMOHWTbN3Lu4pavv9+tMX/HHgI7EMP/AFU9ZzL
 F5uPFzS1fG3aENXMBzJY43VYdaubOfQgOXsN1Kh1LQsRDVYREYWkfA2nKjgpCkUvJc0g
 290KHfmKwEyUWehG35DytDxDsN8UYB4qI1XPKu6NqoZEzjoqfWnIILFlybbsPU5eMhrU
 1kPRkHW1mD6WksJyHtxR2iCeo9pP9MLJuzJI5SjylIX3GM85cjSCeS9QCg3XD8f4wHZt
 nDNw==
X-Gm-Message-State: AOAM5337k6asBJQs7Nud1kspFQfiXCer+MSMWNAd4e/Oot8wwTlu84vc
 l0iyFG6AbIbg9+k+vLaOwIJzJrpE3pdLz7+RaXMNmiFywgckiw==
X-Google-Smtp-Source: ABdhPJwtHS20OEfm5c5TRj8iyUnUYWO5kU8jkE99EML9auhr3kxJAB4jn8uoINSOIFHHrp0fsSd93BnhVCx8V8byo7o=
X-Received: by 2002:a05:620a:1507:: with SMTP id
 i7mr3082596qkk.55.1612961027250; 
 Wed, 10 Feb 2021 04:43:47 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:43:35 +0000
Message-ID: <CACPK8XcCVmibRzOvrca87pzWzg0K5=ZBMeFQE7xorcLN8gxQdQ@mail.gmail.com>
Subject: Kernel moving to Linux v5.10, dropping PECI
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

The openbmc kernel will move to a 5.10 based tree for Aspeed and
Nuoton machines.

    linux-openbmc: Move to Linux 5.10

    This moves the OpenBMC kernel to a v5.10 base for both Aspeed and
    Nuvoton. There are 125 patches in the tree, with 80 of those patches not
    yet queued for merging in v5.11.

    Notably the PECI patchset has been dropped as the author, Intel, has
    elected to develop it out of tree instead of submitting it for mainline
    inclusion.

    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40404

Regarding the PECI situation, I raised it on the list back in August.
The conversation finished up in October with a commitment that the
work would be done as soon as possible.

This kernel config option is enabled by machines from Facebook,
Bytedance, HPE, Lenovo, Quanta and Supermicro. (Surprisingly Intel
doesn't enable it on their platform?). It would be great for someone
from one of those teams to step up and submit the PECI patchset
upstream.

In the meantime these in-tree systems will regress their PECI support
until the patchset is submitted to mainline.

Cheers,

Joel
