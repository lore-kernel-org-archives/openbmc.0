Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XU3+g0ne"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ms053stkzF374
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 06:02:45 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id i4-v6so1360695pgq.9
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SL2xkmXdGn3RQ6uICf6iR9nxzUaT2Dk+Mu6+mxtpOyU=;
 b=XU3+g0ne9lFVBVOBk5h6O3f9ddftiz3glI9kPKWd0woFHkgB/x61saAx608NjpbJXO
 MTmPM+HyyXEmEpE5DzRmHA94i5ybFy4Tnspo2ucpcEXD5jWEoLtZFKW5CpULddI9Cn2K
 6U3PX7yXwb2x1eiDHG4xx+E/u7KRvnTx1BZyEM7nHmj9YVbwDsd612RVJwUK9dRRAhD8
 lEGU5hhM4KeuZuzRbRdZDSDEOR7Gmu3+fvmUAlqMltGkJgQN+cL9/B6+AaN29b6SR2PT
 8IAh/QuNR2lw4hE/cMd5IvuSbP8+KuQfri1qWpIECpcumlUtlbiA9GBI7MAso9d2mWCz
 qxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SL2xkmXdGn3RQ6uICf6iR9nxzUaT2Dk+Mu6+mxtpOyU=;
 b=RxxXtTGt3gkRhwTb/aCokn4ZIqV7VWlaBwtbtaY7PPGPLg6GVzpWEd+hfBkhjMIkVy
 zXZhtgOdDC+qFeCS1U/+8QUgu4ht0sdpSUgtYcULDQ/URjxVptsG7gAD+sf5tEb+0zjl
 4+rmAaRj+oyqPulfMprT2wMw+51bN0Ao6vWLGIW8Kz5aEEXcypIDPIcqAi1tg/oJ8XdR
 aUXZpJPJBGRSZIYFRHHa0EXK9teOvjzCsvenzuFFl7FZ54jTF4YdqQWLpb5Qc7FolvMl
 mW28V/DEeXwL4bOviEwHCwHW2gwBDsCZcZ1t794AbS0yi7sCryodQfEwiPjOc4bnI7Uw
 4f/Q==
X-Gm-Message-State: AGRZ1gLANQ1tohaanAU5F3oN3a4k2gpGOzdC3CtR2/hFlSA24zWIh9IR
 APs2WLoC9cH7d6/oDrf9eplGQUwX/TpqLDjQSNlA9k8bVTWhWg==
X-Google-Smtp-Source: AJdET5cUrj1ARAes3OKqe86UKAcL0egSQNzoY5tAiXMGOyMgMG1uNNNtDGUYGtz00d524AXyLPiLQxsZyrUOUPQyD2g=
X-Received: by 2002:a62:9f90:: with SMTP id
 v16-v6mr12922313pfk.207.1541185362769; 
 Fri, 02 Nov 2018 12:02:42 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 2 Nov 2018 12:02:31 -0700
Message-ID: <CAO=notwzpwtUf63=0yna6eHJgwQWQW8k=FQLtZ5pWKwUoUcrsQ@mail.gmail.com>
Subject: Firmware Update over Blobs
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
X-List-Received-Date: Fri, 02 Nov 2018 19:02:46 -0000

Hi, I'm looking to see if anyone out there wants to review it as it's
built, per design here: https://gerrit.openbmc-project.xyz/14444.
It'll be a fair amount to review in very small patches over a few
weeks to start with.

Patrick
