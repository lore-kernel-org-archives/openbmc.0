Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NS5Ewbli"; 
 dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZbHz5NjRzDqSC
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 04:11:10 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id y1so3853166plp.9
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 09:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rC8hFwq52JQveZiYTrWtwYtQ6SAkJQTsARvATl3d+fw=;
 b=NS5Ewblih1H3YX9j5st8wEU6dcSRdJ7XNaV+6ftVPJPxwRFa+iAJ4lndm4i8OzwGl/
 0TFeNbJO79BGuKn1iw41yU9d8eJM3ci2PvKlaxycP0F1cX5r7TbsgZPj/3M2gfLS0D2w
 oroK6hZjwx+KKZGdYaRagk5gFi6Sz6wPfKNKUMgFW8tFd3FxaJgxFQr30gS/cBAukgrG
 ZCu2P60GMcBetLhhPGXjRlVNHwYLfYpyhzu6UaE2+i5zueoXeloE612SgO7+9Wf/Wuqz
 r26aawcld4lQb6Syn1n8Valxow3ibcmVRXBdR81HfFz1PTcitUM1LmjNB/6DTt5gR3Qz
 rqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rC8hFwq52JQveZiYTrWtwYtQ6SAkJQTsARvATl3d+fw=;
 b=ZAB5CCgesf3u3q2GcounnsYaI17LyxD8+vDwB506N+J7juDUFrsZQ6iPyhPS0dg3CL
 GUJnSmOEl3KMqotb7tGd0sHyE3KDjDoA3biKVD35zdjFCFm9e1E9HxWzRNhzLblwcaiT
 p0XtG6xSwOO8W5DRlBPvU8TPcDl59VdEgDUnFmRFLvUm702XAfcYCynMgH5K9ykuiV3X
 FW0oaGTE3y5Lq8xoWZsqQLiAUC3P/ydAYCYANJXXMLa4CFMko6tNtuHqexJg+3Psg1Ra
 sx5AZLx3XJ4uCFmfikPk0+dNLa0D6lPryDANM3pSYibNLp6tXYtTKqFeFbpXAOorXDHz
 2LyQ==
X-Gm-Message-State: AJcUukcu2YzR0zGEjpRRW4BGHmyY9mIQIZVa/laTMI6Vdk14j6hsk73p
 0EogmxdMZsMOWcapJgtUWkdMcF7idBq2CFL1PmuTm4aRGv+ikg==
X-Google-Smtp-Source: ALg8bN5KjMZmuGRuCSZO+Jf4nvMzVVycDgITirX0ZqTPzOQ5YL937+oC24FNfYDRTPs6m+WhHoQpNSq3EtXEyLX0Xvw=
X-Received: by 2002:a17:902:468:: with SMTP id 95mr6756864ple.3.1547053868226; 
 Wed, 09 Jan 2019 09:11:08 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 9 Jan 2019 09:10:56 -0800
Message-ID: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
Subject: Packet Size Mismatches
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
Cc: Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Wed, 09 Jan 2019 17:11:12 -0000

Per the maximum response size patch
(https://gerrit.openbmc-project.xyz/15743), the goal is to know how
many bytes can be returned by the channel.  This can vary by channel,
per the comments, and other related changes.  However, presently,
we're seeing a memory corruption over kcs which has a limit of 256.
So, we're copying way too much data onto the response.  The code
itself has no idea how many bytes it can send.

https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.cpp#L409
is a 64-byte buffer, but the ipmi message could ask for data beyond
that, and leads to a blind memcpy situation.

If I'm reading that patchset (not yet merged) correctly
(https://gerrit.openbmc-project.xyz/16285) it lets the IPMI client
request channel information to know the maximum it can request.
However, what lets the code running ask that question?  How does my
library know it's responding to a legal request?  Or is the idea that
with the reworking that's underway it'll only be able to provide legal
responses automatically for the channel on which the request came?

(Also, unrelated, but at some point is the goal still to have one
daemon handle all ipmi traffic, including network ipmi traffic, via a
bridge similar to kcsbridge and btbridge?)

Patrick
