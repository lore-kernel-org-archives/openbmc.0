Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r03Nf5dR3zDqBW
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 13:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XoROH4p2; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 145so3776516pfz.1
 for <openbmc@lists.ozlabs.org>; Tue, 03 May 2016 20:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TFpHmsKAtJ+OEv8daforHy13Prgl1oUpZQyX266KWo=;
 b=XoROH4p23LcraKOuFRcTI1gQZEbUBu5rsPTrpEUZc6zKU5d1f9vPhOigL+hxk9M4q4
 CC12VvgUx7SMTFYc1aBKFiDzWGxWJS/o6UO19cgJmIPJqvJu7ZMS4HzAj27fgmPjjy8o
 VHVlAgDOnHlC4+cbqDJYqU5B40McB33khQwXIiTPpF5q1l7MT6LB9vKxf5S8jQaUrNKy
 J5ucpaTUQi0y88oB4K7XQ2LU77Lyk6h0hLSFh4hbt1hi/1V3dsADm2wlHxjVBNaZQVFG
 v/vfrz+ooAPOflgpffiGmhtZeUPFd4GLipbNteTEO7B/IvHxFZYM9DX8N5BQC6W5wfzp
 N9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TFpHmsKAtJ+OEv8daforHy13Prgl1oUpZQyX266KWo=;
 b=dpcPbek0jJrvPD476Prerh2lYM7hwkhYE5KOWQ6Q98leSft4+vfN6M98ef1VuOWVSe
 GwR4z25Bdspto8jDRf6PL2gDC7QFKv1BIdrE51BZ76YEwqvY9irFX1qHlYvpzcUl3rab
 bc0mJErX23bePBd87vyilvucXUuDaDTLA3Vs3pkDnnwKGbJk6qM0PrwAQm5OrMxTx3m1
 gq6Fgx9K3ac58oNp75shB6sq8qD7tG9dPHdnn04iF7GO4t6KU+vA6off64AQl07Yjka6
 YnukPSW5IgVQPNSJIEj6wGCPDCwQxzRY6dK5qYkJtlDDsTXpsVyJHgT0PdXoLsfH4cm1
 EPsQ==
X-Gm-Message-State: AOPr4FVyuCt1Hs9A43g6gqiHbQFhyqV/yeKhkTd9HWFdFH24OfXjjWZTDImwARV4oJmwYQ==
X-Received: by 10.98.91.3 with SMTP id p3mr8907293pfb.64.1462332384960;
 Tue, 03 May 2016 20:26:24 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 7sm1515930pfe.88.2016.05.03.20.26.23
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 03 May 2016 20:26:24 -0700 (PDT)
Date: Wed, 4 May 2016 13:26:13 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH btbridge v4 0/6] Tests
Message-ID: <20160504132613.58a56d31@camb691>
In-Reply-To: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 03:26:27 -0000

On Tue,  3 May 2016 20:10:02 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

Sorry about the noise, github is such a mystery to my, no idea how this
happened.

This one looks good.

Cyril

> Initial tests commit. Adding a framework to add more tests
> 
> <!-- Reviewable:start -->
> ---
> This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/btbridge/12)
> <!-- Reviewable:end -->
> 
> 
> https://github.com/openbmc/btbridge/pull/12
> 
> Cyril Bur (6):
>   Initialise variable to avoid using it uninitialised
>   Increase debugging output when receiving a response to message from
>     dbus
>   Add travis dir to keep all the Travis CI specific files together
>   Initial set of test.
>   Travis CI: Bump to Ubuntu 16.04
>   Add .gitignore
> 
>  .build.sh                             |  23 ----
>  .gitignore                            |   5 +
>  .travis.yml                           |   2 +-
>  Makefile                              |   7 +
>  bt-host.c                             | 235 ++++++++++++++++++++++++++++++++++
>  btbridged.c                           |   4 +-
>  ipmi-bouncer.c                        | 131 +++++++++++++++++++
>  travis/build.sh                       |  32 +++++
>  travis/org.openbmc.HostIpmi.conf.test |  20 +++
>  travis/run_tests.sh                   |  15 +++
>  10 files changed, 449 insertions(+), 25 deletions(-)
>  delete mode 100755 .build.sh
>  create mode 100644 .gitignore
>  create mode 100644 bt-host.c
>  create mode 100644 ipmi-bouncer.c
>  create mode 100755 travis/build.sh
>  create mode 100644 travis/org.openbmc.HostIpmi.conf.test
>  create mode 100755 travis/run_tests.sh
> 
