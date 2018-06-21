Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22c; helo=mail-ot0-x22c.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9Na/4/N"; 
 dkim-atps=neutral
Received: from mail-ot0-x22c.google.com (mail-ot0-x22c.google.com
 [IPv6:2607:f8b0:4003:c0f::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BHld594TzF12M
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 20:20:45 +1000 (AEST)
Received: by mail-ot0-x22c.google.com with SMTP id p95-v6so2973507ota.5
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FGrKavXtJJ4yuiwGB69avYYWDGxYlcsUlyaASMsIqzo=;
 b=I9Na/4/NDyF3dRV3sYVYsmF9EwDYi0nFydr2h6CvwvwKJ+iiVznnUI/YZfgu99k1IR
 pzzM4HexxaIkmqzgTox6ubHL+a0tRmVzt9QTDzvd66J3sHBJFuC5X8QbMN1JMnUoBKsA
 IdStYyXV4b6MI+7UyFtN9QgmUXP4X/h7yY6aQbyLOz5lsDRD/RK9//ksuk5fjv1Riqbm
 LXd6nmp9CJxarA+OI5htmhJlDdS83H4C3G18BZCvOsQ28/HIY4uH2ZwIqyY5UJ4gSpuA
 LCELTas0QzQ+bP7YYtD8bV+7M/ACQXcjvoWrW1UYJFYMziM1LsgE819aN0i3ZAjvypIg
 PHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FGrKavXtJJ4yuiwGB69avYYWDGxYlcsUlyaASMsIqzo=;
 b=F0BCXLYRhQ3Jfz7RCVAn1unWh8Rcj7XD4CytIN+phaFBkMaOOJCFMiAyVdc07FjDgE
 Enn5vD/clQD9I9ILyx3nixEcZx3i3g0lEWgB7zHvYuP/w+roBZnG22lKmgItHfYz1dUM
 t5cBt7aebRoIsXXzLlrBb6xz1FAMiyqzfy+wiY/9Ib1W8CzOTe7KZywZb4HEo7tVQ0x4
 2ru7BvOyX6cdPXeYAFpyjsnbkAQ1YXmAQn0ME2rWSU3aZL9n26MRBfwHzZS5iu6l0qf7
 PP2VxxVdg3VKCklcdVTnVynmS2IvCv02BYKi009BzbDvDZ3Tm+KhQvH64Rl1IdN5ZKDL
 F98A==
X-Gm-Message-State: APt69E0dvJMmeJFjOmxezv90Lv3YCd3EeZeAVS6vAV+rsItlfMArCIEu
 gFDkAU+4DJBxIBeQA2WRPl20WWP0ITW5/vkburKdYiFd
X-Google-Smtp-Source: ADUXVKIdQn4+FAX13aUGEr19ZHPB2uYzPYfbyMFaJFprVdJUsmuUzTYAevZE2GvWThi/+QHZh69dpWE0w/0H3MY83k8=
X-Received: by 2002:a9d:2487:: with SMTP id
 z7-v6mr15987974ota.230.1529576442940; 
 Thu, 21 Jun 2018 03:20:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b05:0:0:0:0:0 with HTTP;
 Thu, 21 Jun 2018 03:20:42 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 21 Jun 2018 15:50:42 +0530
Message-ID: <CAE33tLHe9TnUaphWhBv6THyExHZJrr_aS+wQJnHowE7gKxdfCw@mail.gmail.com>
Subject: Unable to use ipmitool in OpenBMC Linux
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000089cfd4056f24442d"
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
X-List-Received-Date: Thu, 21 Jun 2018 10:20:46 -0000

--00000000000089cfd4056f24442d
Content-Type: text/plain; charset="UTF-8"

Hi Team,
<https://github.com/openbmc/openbmc/issues/3267#issue-334338630>

I added ipmitool into the root file system of OpenBMC Linux and booted it.
When I tried to execute ipmi tool(inside OpenBMC Linux), it is showing the
following error.

root@zaius:# ipmitool sdr elist full
*Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0. No
such file or directory.*

Please someone help to resolve this.

--00000000000089cfd4056f24442d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><div class=3D"gmail-timeline-comme=
nt-header gmail-clearfix"><h3 class=3D"gmail-timeline-comment-header-text g=
mail-f5 gmail-text-normal"><a href=3D"https://github.com/openbmc/openbmc/is=
sues/3267#issue-334338630" class=3D"gmail-timestamp"><span datetime=3D"2018=
-06-21T04:59:02Z" title=3D"Jun 21, 2018, 10:29 AM GMT+5:30"></span></a>


    <span class=3D"gmail-js-comment-fragment">
      <span class=3D"gmail-js-comment-edit-history gmail-d-inline">
      </span>
    </span>
  </h3>
</div>


    <div class=3D"edit-comment-hide">

     =20
<span>
<table class=3D"gmail-d-block">
  <tbody class=3D"gmail-d-block">
    <tr class=3D"gmail-d-block">
      <td class=3D"gmail-d-block gmail-comment-body gmail-markdown-body gma=
il-js-comment-body">

          <p>I added ipmitool into the root file system of OpenBMC Linux
 and booted it. When I tried to execute ipmi tool(inside OpenBMC Linux),
 it is showing the following error.</p>
<p>root@zaius:# ipmitool sdr elist full<br>
<strong>Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/=
0. No such file or directory.</strong></p>
<p>Please someone help to resolve this.</p></td></tr></tbody></table></span=
></div></div></div>

--00000000000089cfd4056f24442d--
