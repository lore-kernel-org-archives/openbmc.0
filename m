Return-Path: <SRS0=a1Tx=DU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF798C433DF
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 09:49:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046582072D
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 09:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx4JSa5H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046582072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9W3Y66HZzDqLn
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 20:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=dhruvaraj@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Dx4JSa5H; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9W2912QFzDqbh
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 20:48:12 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id gv6so389078pjb.4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VSZR+jKKnHHShSg0FRV+IqkAxuFgiDEROzXqT5tuvYU=;
 b=Dx4JSa5HVp0N5fB6NuuAn5kPApeMD5eBRyCFrors2+GfUcIfsII0vM03/Xtihp+4DW
 MoAIKhIFV69PmKG6AI3HKZJVjLMG3cPWSGiUZ8LW99111dxy2peVGWCt+WvSdNjL0ImW
 S/PGj1hSrz1aoonrDjgvoN4lDouGFhnYGJV1Rl8XutrqJzELaxacE2sQwLgxkHOlUbos
 Z8IlrWEkHRjEIRepl1Db2JL4B0RrWaGmoikCRfbgu4sbf7DrIdBGLG+WO0jXYnAP6DYs
 CcEp7zd9wG2FoAPvtK6yo0V6nZeHok9i4UQaK1JyD9sRkM+Z01aeooG5raFUmFlQ9jUH
 SngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VSZR+jKKnHHShSg0FRV+IqkAxuFgiDEROzXqT5tuvYU=;
 b=XYjvPvxbBrmbBYsSBOUTCDzm3WpIRlmFU9qqedpCbkZ2hs2W8qm7olu6Y7JuhuRO8s
 WR9wY7dxJfIDIqEHwovMAfKD+X1fE9egwXDuOwqsFB1FTtqFkNPoYvM0A440KbZgqovq
 aey+tz+893MiIbop5RTqxI6NOAhUu3xuKOPKQuSZh4/KtlWn9Db3lnmWFKfbpoMKc5+7
 yquPsElqc2CFGDcRns5ZzyKle9g9nuUQ8JIBn3iwarL149o+pxwNqBsLMpk+7bV8NMW5
 kPIe4eJbmxROEeInV9iGtO3zWsX4BzOzoB3cEL4VeDM/amMx5/H2iYy9h/e7+jTCdwQM
 lhEA==
X-Gm-Message-State: AOAM5328XplkosxuEkoclXyFry5TzZADE24M7v/PDwVxauY9yMlkW1Im
 NuF+yeyXYucPboKO60ZhAgXzXNgIqGoPdYdCLfmcTNvwKKoOLQ==
X-Google-Smtp-Source: ABdhPJzfp9kwEtS/DPOLYhVWfhLSRFvfqXBBbAKVXpZFKGHz8UKGzB3KBF3esX5QqXBV+2OIesGfdRVKD0H941ZEvjQ=
X-Received: by 2002:a17:90a:ff06:: with SMTP id
 ce6mr24197449pjb.38.1602582487187; 
 Tue, 13 Oct 2020 02:48:07 -0700 (PDT)
MIME-Version: 1.0
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Tue, 13 Oct 2020 15:17:56 +0530
Message-ID: <CAK7WoshQO3XocueCAqsOS2CPG4cDz8UexzAVRYx=PVsk6f9jDg@mail.gmail.com>
Subject: Update to the xyz.openbmc_project.Dump.Create
To: openbmc <openbmc@lists.ozlabs.org>
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

Hi,

The existing method CreateDump in xyz.openbmc_project.Dump.Create
doesn't accept any parameters. A type of IBM host-specific dump
requires additional parameters to create user-initiated dumps. To
solve this problem extending the existing createDump method to accept
additional parameters in Key, Value pair format. Details available in
the review link

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/37355

Please provide the feedback in case of any impact after changing this method.
---------
Dhruvaraj S
