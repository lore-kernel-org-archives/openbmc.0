Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RltV+ORR"; 
 dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yxF73ZNfzDqXQ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 06:49:14 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id e27so79742lfj.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 11:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36VMqsjZ2Bq9UN18guAXSjciGTcthGA2dTo9tStO8+E=;
 b=RltV+ORRSEV80FTMjhdyH9b+pwV+S6dH4FCnNAiJQgiJ46MUqGw2ivVNousvzY+OFd
 mFgR/II8Xm74wws4B/wExK6I6AaxQ8/SLm6NtquIH22ZwesvN40yqDgBHNR8YVW/jExH
 T9rGPsmhrpizZejnWdx8K5HuKJmRuib9Cd91vi5uJfCX7OHY1HKZaIoTapJKu6ZN5KJx
 0imbxkwxNNCniMuLD+6BIavGYjhKd5hFStxNvXD3xGUyF9n+WkeaJC1pUgNc1oWGr4uF
 jpG/yV8U4JbuoovkxP0VoVrTqlmjj5htMugoFcbVvo7hx23+jyXypVVuDrFm8bYitPqA
 I4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36VMqsjZ2Bq9UN18guAXSjciGTcthGA2dTo9tStO8+E=;
 b=INJg/Fr0zs3nBBBLzSSDvqa09Jhc5aaT+qZ5DZmO/esUL2OhB1ya4iEQSFDTEB2PVW
 zagCe3QgHHQrcNcxfMi5bH26/bLN8Z0++wB9VzmaUvxv6VBmIqXomNzUWYPnmweOmIch
 U/cUx9Qo/husPAXmd6ec4jqCbiwTZ5pFMvKKuvt5KVRqHQpGByenQuxXjVjfk0bGWo4X
 73BXhJiEfsFSNebgkCn1gZ5yE7G4OBuxzdeLCudpnQWKd9GrPVWD/i/WAwY5t6wAfWIM
 zZYjQfc8NPOMaPUWRIG2qjIswxMBdP2OXviD1DyDdx41cP3+P/nQe2YWSJS1ZS9j2msj
 J9dw==
X-Gm-Message-State: AHQUAubKkGSjD7qj4cFXJNtZ6lV5vOiTAS3KP9b1g2v+wRbvkp1FJd09
 sBopZYD8v9V1GS/YXLi1WgYgQfEM2JwtMOxmcmid9A==
X-Google-Smtp-Source: AHgI3IYM9zKh+Sn4z447ldhQlHAtcJZEeEPwzkGbh8lWciFx02hGl9iHgTlbMWRC+e3aKPxSIWSDIxA/tKJL1k5h1+c=
X-Received: by 2002:a19:f249:: with SMTP id d9mr327810lfk.83.1549914551360;
 Mon, 11 Feb 2019 11:49:11 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
 <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
From: William Kennington <wak@google.com>
Date: Mon, 11 Feb 2019 11:48:59 -0800
Message-ID: <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
Subject: Re: Host-side tools
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 11 Feb 2019 19:49:17 -0000

As long as it's possible to build the host side tooling without
building any of the BMC side tooling and vice versa it sounds fine to
me.

On Mon, Feb 11, 2019 at 10:51 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Feb 11, 2019 at 08:03:17AM -0800, Patrick Venture wrote:
> >Brad,
> >
> >It's my understanding that host-side tools that cooperate with bmc-side
> >tools should be in the same repo,
>
> Is this something I said at some point?  Where is this coming from?
>
> >hence why the host-side blobs stuff is in phosphor-ipmi-flash.
> >However, if I add any dependencies to the configuration for the
> >BMC-side, those get in the way of configuring for the host-side.  Would
> >it not make sense to sometimes have it split?  And if so, I would like
> >to propose creating two repos, a blobs library host-side, and a flash
> >tool host-side repo, so those can be neatly split and not have anything
> >in their configuration file that's really bmc-side specific, like
> >ipmid, or phosphor-dbus-interface, or something.
>
> I can make a repo if you would like.  Just let me know what you would
> like it called.
>
> That said, I think you can also probably do this in the same repo, if
> you wanted, by having different build targets - it might not make any
> sense to try and build both applications with a single invocation of
> configure - as you point out, they are being "configured" for vastly
> different runtime environments.
