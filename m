Return-Path: <SRS0=jPo4=PJ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ECAC433EF
	for <openbmc@archiver.kernel.org>; Thu, 21 Oct 2021 15:01:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D3960F9F
	for <openbmc@archiver.kernel.org>; Thu, 21 Oct 2021 15:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4D3960F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZrKd6WLtz3c66
	for <openbmc@archiver.kernel.org>; Fri, 22 Oct 2021 02:01:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QLG9CIJx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QLG9CIJx; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZrJz4PwCz2yHW
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 02:01:05 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id o184so1378276iof.6
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=35/AJwYR8U5r5OJp0J9vQm3sbikA4rH/VTfAh9cbvRg=;
 b=QLG9CIJxYbUCzf3wvYpfb5xp3qINwHimWEXxQz/YMYxJwRYSyH5f8+BzUdtnSGnrJp
 dJOyh8qyg1zHKqHM22NHYceQ19OoZoZlmPSsgz/mecfg6FjOtm6FN7Q+kXdlpGJOO0g1
 jOygK3zcJLfnp4p0FiCJmcJhDU8hJ+Gi1acofHRb6owklZaopzpO8ljSlOMYzdMBe/gX
 HtPB/gG8SZ2YtHeTq9Cz+tuaWsFpK2DPqGbyqNOvdg+dMwu0mrkj82oPUgpenjqxW/Ex
 qxVeLnA76K7xucjeFPqKYKw9ukD5+HiqKfeW569umKEW0P11Lg6uyYFysw0JnbalRA6N
 cmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=35/AJwYR8U5r5OJp0J9vQm3sbikA4rH/VTfAh9cbvRg=;
 b=B61FMmRTvnUJp+B8Ibm+yQgan+ZedDGR2P0UWaC77yvj+HUL1awzVvQfgc+6s832u1
 abn6lmn+yEDW3xGaJwRyqkUrZtNQ4F+6b5yXIpnv8aFI0rr7JG1mYgzSguVJdFvk477p
 8fTgCRqu1fwkcAlMN6JxqEzIIrPl4uR3re6ns8Hl+GgLVJwMW9l6xdI8ojEq+LGECSmZ
 1D/t2AWnPGz/PQZ6/2YM+VrfEfM7MMhIstOxiJbmYpyl471B8hbpSV8G80XPfR2p9wxl
 cmNijQ0u90j6GzvCM+RjI/qpgHiG7ZxDR+6aHOZ5QXqGDrbG38gIPmM4r2L8usmJngZq
 AEmw==
X-Gm-Message-State: AOAM531obd1O8O3ZNNE4kalMVH/H7O/iRDtF6eDW49UYmmgT5Gl4ZpAo
 Zm0QBoFWDkQP45jomIqV39xHsmq8JdWPUuPEPXp3whoos1k=
X-Google-Smtp-Source: ABdhPJywe4eWuKRp1UTmQNoDmyFfU9iVnFHvxLTOILbsB5uiAwQrrP8+kd4Vd8hcHilds4AxqGgTJqiGCcQvKzrXWt4=
X-Received: by 2002:a05:6602:15c7:: with SMTP id
 f7mr4210664iow.116.1634828461618; 
 Thu, 21 Oct 2021 08:01:01 -0700 (PDT)
MIME-Version: 1.0
From: Sui Chen <suichen6@gmail.com>
Date: Thu, 21 Oct 2021 08:00:00 -0700
Message-ID: <CAFaEeaG7ALuM-dLeZ6wYWtgD2oVJyZ1NNVQw+wOv7wmFMw_GQQ@mail.gmail.com>
Subject: [Request for comment] DBus pcap visualizer tool recent updates
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

Hello OpenBMC,

This is about some recent updates to the tool that could be thought of
as a visual version of Wireshark geared for OpenBMC; it is a desktop
app that runs on a host, opens a DBus PCAP file that can be obtained
by `busctl capture` on a BMC, and draws time lines. It draws a time line
graph, and draws some design ideas from other profiling tools.

The tool has been iterated for a few times and recent small
improvements include:
  - Prompts for the user to install dependencies
  - Ability to display overlapping DBus requests
  - Ability go group sensor PropertyChanged events together

Intended use cases:
  - Grab a PCAP on a normally-running BMC and understand what's happening on it.
  - Grab a PCAP on a BMC with problems and see if it's possible to
find a problem form the DBus point of view.

Some comments we're looking for include:
  - Is the UI intuitive?
  - Does it make understanding the operations of an OpenBMC-based
system a bit easier?
  - Does it address your problems when developing for OpenBMC? (It has
been helpful for us in a few circumstances)

The tool can be found here:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/34263

Thanks!
