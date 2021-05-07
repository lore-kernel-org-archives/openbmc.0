Return-Path: <SRS0=4h5l=KC=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19077C433B4
	for <openbmc@archiver.kernel.org>; Fri,  7 May 2021 21:11:57 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904F561410
	for <openbmc@archiver.kernel.org>; Fri,  7 May 2021 21:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904F561410
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcNRv11g5z2ykJ
	for <openbmc@archiver.kernel.org>; Sat,  8 May 2021 07:11:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=eGEIG2H3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--xqiu.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a;
 helo=mail-yb1-xb4a.google.com;
 envelope-from=3-qyvyaqkb7usldpbjjbgz.xjhjkziwhxgdnon.jugvwn.jmb@flex--xqiu.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eGEIG2H3; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcNRN5Tzcz2yYB
 for <openbmc@lists.ozlabs.org>; Sat,  8 May 2021 07:11:26 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so11587360ybp.17
 for <openbmc@lists.ozlabs.org>; Fri, 07 May 2021 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=o34HVnXK7rOuKcARZETTkHEpvW8dunVjLrpynusX3kk=;
 b=eGEIG2H3obX7zE+tnCfqIvGltwxR3FtBGRLoiilJ6tz1/bonou5AG2zpV5uz5mz7v3
 gViXsrRqnCnCZqPuykbCwtKt7/eIqeT/iQ49WE547kEdv4CGYB7EdKr0pBiaYlPuhVp1
 Rh40Fnk+AayFzzmUalPq8LFrdFN7m+qmrC8L8j44Nu+I74++KVfP4HmkWahp6UGaqWV/
 EOU6ZN0BzF5uyCEyg4OHjbjmwx0eoLHL6dY06g8ITTkGzbRyPav3TSeMi9y/hhHGXeTb
 i3Eu85SeXNitzufDWB8INrdLBvqroQZpTMV7t06HS7LmlrN9MKZKonMeFwviYLJjrHe4
 xWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=o34HVnXK7rOuKcARZETTkHEpvW8dunVjLrpynusX3kk=;
 b=GtyRZixZUPTQC7QulA7uVsoEICfiauSlkejaK+tBZ6uu4qtMq7RZErAjELm3NzFa/J
 Sl9RfdJ+hxo3xNfGBxDmPPkP0p/HsB+nPb4p4/gxcAqWL/e4bU9603XvrfeyYkwiVdCN
 D1RU+X2xbBz2a0cxCdPyST3H5H4SM4j+g1oXRWP+jekDHHN7pmfhQhYA9t0+NSU7Wf8y
 85IZR/p4LyNphQzb5knoY841cC6cOtB4KVW7l2IHMP0tkZyAebUKnk3tWqIhoSXgPgpm
 jVm1h8U4VThwjhIFli1BaeMYFG7QwCDeyVvGrApLVHBdgrbjVZqAByKFAPjE9sm07xwH
 5o+w==
X-Gm-Message-State: AOAM5314sXVPvrPeki7B5Qsq/YHMfbHHdXS7I9IdjwNGc+oEKVsGoPzh
 6dtDJ8wLGqz3/42h7n2eP6h43ALO
X-Google-Smtp-Source: ABdhPJxUxE1g0UJJEQ7U1vbBa05sAGMuimQcjLnc5w4L4bh1GYj9fyO0GVOiGJNXtsWfcVqZdGo50c6r
X-Received: from alexq.svl.corp.google.com
 ([2620:15c:2c5:13:1439:fffe:f6b0:67bf])
 (user=xqiu job=sendgmr) by 2002:a25:8543:: with SMTP id
 f3mr15447913ybn.80.1620421882618; 
 Fri, 07 May 2021 14:11:22 -0700 (PDT)
Date: Fri,  7 May 2021 14:11:20 -0700
In-Reply-To: <514EAC3E-1CC6-4FCD-9C28-292E81C4C77F@gmail.com>
Message-Id: <20210507211120.1895980-1-xqiu@google.com>
Mime-Version: 1.0
References: <514EAC3E-1CC6-4FCD-9C28-292E81C4C77F@gmail.com>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
From: Alex Qiu <xqiu@google.com>
To: proclivis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, jasonling@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

> I think I have tested this and it worked, but it was long ago. My recolle=
ction was hwmon and other drivers lock the i2c per transaction, not the dri=
ver loads/opens and keeps it locked. But I am not an expert here, so I coul=
d be wrong.
IIRC, some function like i2c_master_xfer() in the kernel locks the bus. PMB=
us Page register and the following register access sits above this layer, s=
o they are not protected by a single lock, and this is where a userspace pr=
ocess can interrupt and cause trouble as Mike pointed out.

- Alex Qiu
