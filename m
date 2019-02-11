Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="APrHBil8"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yrDg3QxXzDqS9
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 03:03:31 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id z10so5139159pgp.7
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 08:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rzx6fZb92L0fNwuQ3F12ZphNTswDc3pVHlaYMsnAQno=;
 b=APrHBil8KcnRPFXrbF6PdWXRzSbAqLg74bqMgUBALGnj6o5wZdxfn0SRhDFAI9iknr
 ilwy4ATyKYnpw4jjAbV+apvIX9+6rJB9bpfF99NGAA2VZkUwbTBim4LQe+hr4yXRTfzO
 gACKUjRg9Ugy+KyeNZiKDYj7o/ycQCv349GqI5OABu1tny2PjSCW/wFJtJ5gLcrxKUBg
 /k1jaQEHfqqygheHJj4EUTuPWUV9OO513G0i59+APmHhQROFnLX7hp0C5681IKmhqMw1
 co+o1aHOcWs9IvLHlXsKXKjTACENRivYb3F8OO69FXhBanWl6n/02y8BtREgEwYK4wpN
 Iiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rzx6fZb92L0fNwuQ3F12ZphNTswDc3pVHlaYMsnAQno=;
 b=p3CWe/SyzquH13pmvjq8fLHS6dNsctEt37MD50G02ZlmLw4LCKHTB40ooNLsfmZ0+b
 Ce7gPNIfISfqy3lB1wjh0OyzYmUuper1YLlMc5BZOraWHEIWfbOv0K7PJlf1RKMXbq7w
 vQvvmpYh9WwnoT21kUopn8pgtbRbify5rhCh4U8FKm8cO9GmIhcIt55n70shfZe7yCGA
 B5cpnP6LRHqBM5tKuUJSwiN7729qLGuiS9a7HSijUB9XLIMMPROJieRQQgjP2VtLveXx
 /NfRLfy3yGPricry00KH7Q/gsRXXF1tXfCGCqN+duIK9MPvk5IM/ZdxpWGKj5gMh2ze4
 VoWg==
X-Gm-Message-State: AHQUAuaC6506JQNtWM4VUpBxxTVEcc10VRM6YYpWd7gQI1dEcEsWaMXC
 CoDJ9iQy1EqymUofvAYClKL8ZV4IEqX6wd4sVci4XDpkNYw=
X-Google-Smtp-Source: AHgI3IbzTmw2I2zDWUFHRoBbrvKdnkk+pdvC/9FEW3XKIA5AWN59lUDr4ulzBg8Wx1Ihg6unHUj7ukm0DklXL4GBCK4=
X-Received: by 2002:a62:7086:: with SMTP id l128mr37333329pfc.68.1549901008499; 
 Mon, 11 Feb 2019 08:03:28 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 11 Feb 2019 08:03:17 -0800
Message-ID: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
Subject: Host-side tools
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 16:03:32 -0000

Brad,

It's my understanding that host-side tools that cooperate with
bmc-side tools should be in the same repo, hence why the host-side
blobs stuff is in phosphor-ipmi-flash.  However, if I add any
dependencies to the configuration for the BMC-side, those get in the
way of configuring for the host-side.  Would it not make sense to
sometimes have it split?  And if so, I would like to propose creating
two repos, a blobs library host-side, and a flash tool host-side repo,
so those can be neatly split and not have anything in their
configuration file that's really bmc-side specific, like ipmid, or
phosphor-dbus-interface, or something.

Thoughts?

Patrick
