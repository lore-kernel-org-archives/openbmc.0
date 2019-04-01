Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mnQyGDEB"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xwxb6RRvzDqMV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 02:19:45 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id b3so4741553pfd.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mH4wDv4SNNxQR820SWy8/XsopNoZVIbbTxBIjydVdgs=;
 b=mnQyGDEBq2hPeaqlW7ygRUTrff4D36mQVOX4JyvTW6Ui8V1h8XZgWI9xV1q32jITnB
 iqG53d2ScE+KgAgP3bRHkWdEOmF4TNlOdFOxq2gQM3DDBNulSNmsKMZoxrPYk1GHdmKW
 /iAoMSoUIsT31tdbkFL1lV2RvxyMxfF8IdFVXouSIyWlSJYu6LApvWWMu72DIgJtIhJg
 7HyCPUDq8oORBKHb1YEB9E3J9UzMaAUUmsn34zCfFbYgjV/f7071ACfaGPcUXTU2L/u/
 xg3NVSxkZeTMXGdcR5vQ6wvOZrAsmC4jgtBHPkffAhCoQBmcQfs+HmJV7fkDB+qoiaJ0
 gcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mH4wDv4SNNxQR820SWy8/XsopNoZVIbbTxBIjydVdgs=;
 b=SA7PpZUWXzQ5ZF+EgyXi7g5h84d4/0zguGScbBovweNIypkQsqgsH23tsw4/Ds0Hid
 szdtuR8RRZKVP9NHvf/f/utm0Hyi48S0TNnuy8JkpmI/RHvoHYS/eoVDo1bVlGay4uLM
 LA+NF46wJOQmFA21wU1EN/5VPwYnypmleXFEBEW6/rqTLxvyKvJg/8f2eiBXvZ75lf2I
 pqAt4Zs8wgAL3hs9RXjFvsM6z4mnBYkd9osb8G7yy0HOPbIqAo/lnD0bTUlQLe8jdZNd
 SidNYkjQq3nlMXy+NB5El2qWfPWKHhy1euYjzUsg3hOqgPeixKBHNEAr4ifha33TO6Sk
 yVvw==
X-Gm-Message-State: APjAAAXT9gDVwPlBIHfSMgiQI2QeVvlNpTGKBXO/DI/BNXiL0lZHlvJR
 ROORCYGTJ3f7TucNbaF8CpGgOPrDnwmjsPbKbqQj47F5Yfg=
X-Google-Smtp-Source: APXvYqz3Xc+2NddxjQysEys3ljt8Gkh0I4qjw4cU7CkUoTRvHQK7QamWDpNqs323a+Ewu41aB/kBIKPFTrw6tKOf0+w=
X-Received: by 2002:a63:4342:: with SMTP id q63mr60461805pga.6.1554131981597; 
 Mon, 01 Apr 2019 08:19:41 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 1 Apr 2019 08:19:30 -0700
Message-ID: <CAO=notyEKDUdTWOzJRGiGD_gFycTJbSW=GzF=YCbUW4XJswtpQ@mail.gmail.com>
Subject: wantedby target
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
X-List-Received-Date: Mon, 01 Apr 2019 15:19:49 -0000

When moving service files to the repo there is a choice.  To hard-code
the wanted by information in the service file, or providing a variable
for it that can be set via configuration (via the recipe).

There's the default which is obmc-standby.target, there's the more
popular multi-user.target and basic.target -- I was curious if there
was a consensus or a best practice here?

Thanks,
Patrick
