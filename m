Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22d; helo=mail-qk0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rfsZwCgu"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WdnuVr9q"; 
 dkim-atps=neutral
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wDFJ4SYvzDr4N
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 22:54:12 +1000 (AEST)
Received: by mail-qk0-x22d.google.com with SMTP id z75-v6so11315947qkb.6
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 05:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=ht2hEKtc8SAFN3CFSTwYE/1T4vrwvJ+jnQz+LiqDjes=;
 b=rfsZwCgu/zbxXO+nlvKyyqdf93xG0wJG+JV0X0HLwRR7xq2Xs460Q2qTOeeu+1gHR9
 M2obwblyS4edsLqYou+r341aGfZvwQs46TnAqAeeUkyVfg2lEm4vlTOhBdM97nJpPrul
 10MLGpXkAh8uwIwVpuSPpigGVxu+1O/N05/ABQuJ8sP9/WR2jWk0aNWUR1AXAK+dBvsr
 NpcMQU4ZgQ/P4f+EEI0fT0lijPRQ91SblERyYh+z0Z45sKsX9aDilM10kPlScunL7OYG
 hoHq76W5GVyXtuycdQ35strwJSY2Dz5/Z4X/BaW8pFejLmGoo3zokfsBkJroLtkKxBEp
 mVTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=ht2hEKtc8SAFN3CFSTwYE/1T4vrwvJ+jnQz+LiqDjes=;
 b=WdnuVr9qRAhYBRl4SVi8e0h9Vn/dGalVPH3+ABhZSxpQT7dG/DBpETXXxySGeOQEon
 V8mb+jhNPyl6pUCsEChg0VjYjUVCF/Fj+ozkNYsautnLUDxxwPM4L9jOsgUwRKyJ0ZDv
 yvcuh1aUXNQXY/QXcXRPKDzbPpbLSwqmLPulE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=ht2hEKtc8SAFN3CFSTwYE/1T4vrwvJ+jnQz+LiqDjes=;
 b=WotqpvK0xCp/IHryXaFPvIpaoIT8moQEMLng9eMyUWzLU1wNBmPH4iLaRksb03KrgJ
 2Bb13Oqj7Qy9QZg+aiTjZhr6tHipoHjc4WLegzfE3bCA5jTHxKjm1XEwrUqXxHhI7RF9
 TihRT5/Zw/db1cCBQhRDkx5S1iAoUt+LxU5CCX1/nI+G59c0BKCjFhpGjhvLcWF31Dhx
 Yiw5LbTG5jaLJwOhoLKB8ehIsSTMv0BzAXBczOzYQ7klgoOFd+DjmNUX4szY/UB49rig
 6TQiSCaBWr9Aqd+QPFwCy29fDDP+0sHJVYxvihIT9vgPryZCPvMWwnJ5egZPymPAezPC
 Cy4w==
X-Gm-Message-State: ALKqPweIBk5srR+ZS8E4s+DEkv4jpUZciQ3NxwMKduQfsBrpFGnph1Wl
 QIUMVjKUZeyNbcwfn/F/n4QRQCzk3z9f/c6ilDjigWSM
X-Google-Smtp-Source: ADUXVKJDyfIkn9GBhZFGiPxe5JtX3Q5HtLVrocK8gw0vdsDU7N9J1G8Zin6giaElT9HbvNebM8phylFDK+p2p084iQA=
X-Received: by 2002:a37:1904:: with SMTP id
 k4-v6mr14254832qkh.370.1527598449630; 
 Tue, 29 May 2018 05:54:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Tue, 29 May 2018 05:53:49
 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 May 2018 22:23:49 +0930
X-Google-Sender-Auth: kZJ82bYeQ3OB2SE_ZvAXTBC1MTU
Message-ID: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
Subject: Gerrit +1 policy
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 12:54:13 -0000

I get frustrated by Gerrit removing +1s from patches when I make a
small change to the commit message.

This is a configurable option in Gerrit:

https://gerrit-review.googlesource.com/Documentation/config-labels.html#label_copyAllScoresIfNoCodeChange

I would like to propose we change this setting to true.

The downside is someone could radically change the content of their
commit message that you've +1'd. However the maintainer still gets a
chance to pull someone up on this if they think someone has pulled a
swift one.

If there are some repositories that would like to maintain the status
quo, this could be done at the top level, so that all repositories
inherit the new default, but would allow for individual projects to
override the setting if they desired.

Cheers,

Joel
