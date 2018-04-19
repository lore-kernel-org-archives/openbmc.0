Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22e; helo=mail-it0-x22e.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wquvmvuk"; 
 dkim-atps=neutral
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RRZQ5TDpzF21F
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:58:06 +1000 (AEST)
Received: by mail-it0-x22e.google.com with SMTP id t192-v6so19502869itc.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lEGyxlTlEKRgnp+TsU6HqjBhUT6z9Qcu7ysVxFXE2nQ=;
 b=WquvmvukQwEkA6e2e8ze/HqxPP4hICv22innke4ETL+esoQ3WeqtWZGhj2wSiUMtkK
 dE7izd9kUeyuW76KgCyspeH5NrNSkQfFpdSAI2qPTHJeWd/32dtik8JTEyuJNm6NnmaO
 BVEWhUaldGUfKFs4h51oBrcayHxfBS5Cm2NEDP0EGj5bhLIyJn2nkk8VJJJFAnoYxX36
 bp6526/8kQXB96eAKurF+Sr5MfUuoCZhbG2V+t+zqvfNRjylFYBBfjbab+u7EkrIUYaT
 GLT1EeG4t4pdWInWLVVg+tQdu5PlBqqQUJkK0CYiTGNbcw4qWMNT5yrnDuAwinyq9jAp
 FpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lEGyxlTlEKRgnp+TsU6HqjBhUT6z9Qcu7ysVxFXE2nQ=;
 b=D9SaN8DBoBltZR4JfeIgnBGNBw/OVG7/rs5yQB6jtI5TNusAP+qpDa/QM7LRZSCHA0
 pHET6nH/fxnc9T9s90aflvFR4Wc445vNV9IS7Jhf8BiiwUwUkI3B9i0Cyn65BjiwESM4
 BXH9mkI5Z4iH5eaNOPvv8jFyR17vV5jpRcEh1wlzaAwPOX8bvEN9oaguS5G7x8i3fjle
 tjybuCI7p/qJNcqYKlzwK3ILVNRq7SU/xN3YcX28hCHVNCVm5+5xy35bpZkqManb7oE8
 UqppicXElrtf5+IOT9M9fayFQKfShuAKz9idqAeKyxDwOfO8e9LKWfq4mTJa1Lf8C7ys
 PHjg==
X-Gm-Message-State: ALQs6tCn/BUtVIB7CM6QazzvIQ+FKe01it0CedernzGQR2Jy+VZEAv0C
 2E+JKWGrdehY8rmIKTiH6CwE7k1C0fuAXkwIKxM=
X-Google-Smtp-Source: AIpwx4/4ZBgWBelxKs/YuvEPVJOQqMATn4W5nmBja9v6ZAcYkE1NP1h6nAQjZj7LqFzOo8BHtIbKtlQq7XUpaWCacjA=
X-Received: by 2002:a24:d09:: with SMTP id 9-v6mr5370705itx.144.1524113883570; 
 Wed, 18 Apr 2018 21:58:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:1f84:0:0:0:0:0 with HTTP; Wed, 18 Apr 2018 21:58:03
 -0700 (PDT)
In-Reply-To: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 19 Apr 2018 12:58:03 +0800
Message-ID: <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
To: Mark Brown <mkbrown32@hotmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 04:58:07 -0000

On Sat, Apr 14, 2018 at 10:10 AM, Mark Brown <mkbrown32@hotmail.com> wrote:
> I do not see anywhere in your documentation information on
> how much storage should be allocated to the
> /Windows 7 64/VirtualBox/Ubuntu 16.04 .vdi.
> Also, do you know if it is possible to increase the storage of the Ubuntu .vdi
> or does the user have to start over again, creating the .vdi ?

You can create a new volume, attach and format it, then you have extra space.
E.g. I have ubuntu.vdi as the system storage, and extra.vdi mounted at /extra
to put the large data.

>
> ==============================================================================
> Virtualbox reports  Virtual Size: 10.00 GB    Actual Size: 8.12 GB .
>  ==============================================================================
> meta-palmetto        = "master:acff95b917b051a71ca3979793cccfff724a5821"
> Initialising tasks: 100% |###################################################################################| Time: 0:00:31
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: The free space of /home/mark/openbmc/build/sstate-cache (/dev/sda1) is running low (0.972GB left)
> ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!
> WARNING: The free space of /home/mark/openbmc/build/tmp (/dev/sda1) is running low (0.972GB left)
> ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!
> WARNING: The free space of /home/mark/openbmc/build/downloads (/dev/sda1) is running low (0.972GB left)
> ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!
> NOTE: Tasks Summary: Attempted 102 tasks of which 0 didn't need to be rerun and all succeeded.
> Summary: There were 3 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
>  ==============================================================================
>
> Mark Brown
