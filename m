Return-Path: <SRS0=mnE+=DB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF27C4346E
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 05:21:09 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739FA235FD
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 05:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="MQ3oai6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739FA235FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxk0f4vLpzDqZm
	for <openbmc@archiver.kernel.org>; Thu, 24 Sep 2020 15:21:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MQ3oai6B; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxjzB4H7ZzDqYk
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 15:19:49 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id ay8so2049209edb.8
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GC/h9X3vEMEXFhnNT10s5YvKKR4llcqlQHTUhDe/8D8=;
 b=MQ3oai6BecsyfchB14SA6Jkuvhczm+UGvWk14By6oZlWWO4Q4QMRVBW+M4MOgsIWyH
 vIRK1TgGkjOYzxEDPRmNHshS7Uu8lP2CUe0lypa/2ildVQEkO23g1gOmwHBxZah5XWx+
 DckaPpVYtxCWMdcNkhPKF/uwuvKvq9ttB8hnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GC/h9X3vEMEXFhnNT10s5YvKKR4llcqlQHTUhDe/8D8=;
 b=gIJdYnkGVF2NDShedfI0XCnuSTGbouml3Z6zcapIgr7WsVx6CFhY6o8NAJ0IBsTiMK
 gCBoubrMGqFgjGhrcmURoiOUY7HLgfk00pFPH72I85eH7QjoGHBVK8zT9pNahBrnvN3I
 ryJfgAO1bRsLyKCxNEYWE/oWPgryVICF4cpyHh5p6eoSEVcgMigkzlsje0qsA8HnQmsc
 gmks0zzKlf0NSg+YlFcSuDy9Ezk8/NqwzNCS6SL+J/Fv4hEVZ4pziyp8eXtdl4v/ldAm
 eDnWgzoI8GESpo+AvMGr2UWz2Kv8u34S0mQqqoPr2FyLWEDHWGp0MukkZkRsPzXuY2tz
 ahLw==
X-Gm-Message-State: AOAM532/3VUsbWbU8lam82X0REAnGbx3QIXZ3HGCYmaAoYNs+kUr72EJ
 hx52/CyzBcwhoyT9Ua/FIt33p9jctaIucW70GB2jj40dIxw=
X-Google-Smtp-Source: ABdhPJy7j2/sbMgFUbGDNUMhO00XFC3+P6U+/GFFmbsLf3geHi9lsrAYX/67jE9/u0iiQKW06Ed72BK/3TSekTkcA/M=
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr2764475edb.260.1600924779024; 
 Wed, 23 Sep 2020 22:19:39 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 24 Sep 2020 05:19:27 +0000
Message-ID: <CACPK8XeB3r+-6MaAO30xsj4iWpS55d7K8weUDVDAH1rw0FjOBQ@mail.gmail.com>
Subject: u-boot branches
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

As Aspeed develop their ast2600 u-boot features, we've had a need to
integrate changes from their tree into the openbmc tree. In the past
we lined this up with a major version bump (as with the kernel),
meaning we could create a new branch with our "out of tree" changes
applied on top. However, in this case their SDK is still based on the
2019.04 release, so there's not a clear way forward.

I've chosen to rebase the openbmc changes on top of their branch. The
old branch is still accessible at archive/v2019.04-aspeed-openbmc-1.
The bitbake recipe will continue to work as it uses the nobranch=1
flag, and specifies the version based on the SHA.

The new branch contains their aspeed-master-v2019.04 tree as of today,
with the OpenBMC changes applied on top.

I've boot tested it running from SPI NOR on AST2600 A1 hardawre, as
well as QEMU, and it reached userspace. I will bump the bitbake recipe
to integrate the changes into openbmc.

Eddie, can you see what changes are required on top of this branch to
support eMMC boot, and rebase your patch series? Please include an
emmc boot defconfig based on ast2600_openbmc_spl_defconfig.

Cheers,

Joel
