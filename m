Return-Path: <SRS0=/yhw=E2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE30C5519F
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 07:29:16 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF63A2158C
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 07:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="1+UiBDX5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF63A2158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccp884NrZzDqwy
	for <openbmc@archiver.kernel.org>; Fri, 20 Nov 2020 18:29:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c2b;
 helo=mail-oo1-xc2b.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1+UiBDX5; dkim-atps=neutral
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccp6c2K58zDqkJ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 18:27:47 +1100 (AEDT)
Received: by mail-oo1-xc2b.google.com with SMTP id s11so1170739oov.13
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rhjWnw9a3Z6OYQ1f9LFs7sc5omS5HxrhwKP9IvUzEdM=;
 b=1+UiBDX57Ac0BolgXu9AoQMWTOA5sHNb3oJ8tku6QT3FSQuAsj0bWGXjWSLKrgmW2r
 D/4zjJwp6dPy/tXOPOZQY8QeHrdeOwPw1LeoM+vH88sEoxOxfX872aODyhn5SOGnz1YR
 2OfgJEm7aOaBe9u4sZxHxBrGoN4AS75DYuJBoxR6nID2kRDWYZUcGk6JmwORX59G5WAo
 oI7R2JKEJJZYKiKISOnjwDQ8EjldoEvBlif36YhIvzijExCAeARawhvMBdCKCP+1YJYY
 nzUcbhI5yHDrbfkDSRVTQU91x+jhhdX3g1+g+8oBIK9zQ2a4D37VnRIGjt08HfYlPpwO
 rgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rhjWnw9a3Z6OYQ1f9LFs7sc5omS5HxrhwKP9IvUzEdM=;
 b=Z5iKfkuSsj/LJWU90lM/3WWDMovVc1ArCdygpfByOyDN57tdGx9NArp4LFOqTDr5X3
 eUBYB5OODzXwpON/+uvkzWolemhb2dibdL3VrZ92d730fChnfiXd5aoxt89jjaCn8Nr/
 fJ4Ihx7w8ThL59f5JGmMz8XYtMQSLzMzxbdlEqN3Du8ehg5vz/jomjD9tXp10mZzw41N
 NtQQU9DhzAjrcgfXE6+76dkfDzK6n6V+hzlHdz58OSn6FCaaGtT1+3i5Q6y3YuzFVv4n
 qncAtptcikLCczXwy/qZPtmfIUEnOTIjDxVoV+o9DMZC7VH9ONIdyRrW/ZAAEzY+LANP
 GR5g==
X-Gm-Message-State: AOAM531VMx/voDeWYM3+khcdjsg+oSoWtBpAay1y3GtERmd3sjN7dyxm
 UMLeQ8OAwZPe9qrjDR0dxQLmf0kqsVlAkshD0CV6Mu6qC8ESzg==
X-Google-Smtp-Source: ABdhPJzP72EwrDr+9CQV7UbDKvuc0ltuAO9hPSWI4sLZzKNrVOEmLRowwF9DdsZVmRQGDdUGDMjqCZbc8hafpQ2aD0k=
X-Received: by 2002:a4a:5557:: with SMTP id e84mr13080197oob.75.1605857263317; 
 Thu, 19 Nov 2020 23:27:43 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 20 Nov 2020 15:27:32 +0800
Message-ID: <CAGm54UH1tt84oGoEFDfD0KrDcei8auO6J5F2a8VRjdU7S8WpSw@mail.gmail.com>
Subject: New repo request: inspur-ipmi-oem
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 openbmc <openbmc@lists.ozlabs.org>
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
Cc: =?UTF-8?B?TG9ubnkgV2FuZyjnjovlhbTpmoYp?= <wangxinglong@inspur.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Brad,

Could you please help to create new repo inspur-ipmi-oem?

The repo will host the code to handle the Inspur OEM IPMI commands.
Some of them could be shared between multiple systems made by Inspur,
and some may be specific to a specific system, which could be handled
by configuration.

Thanks!

-- 
BRs,
Lei YU
