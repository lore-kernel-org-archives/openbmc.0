Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tnKs9Y3x"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44VYXN4LZZzDqPf
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 05:38:09 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id bg8so5345011plb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=km1+aOR9Ckp+dNOT3gFV8AG7zj2WXVG5NEGwIFeXhrU=;
 b=tnKs9Y3x9rDePq3nGKz+TviS0zmSYMHn3UggdZhP1jJZEUdHkQYg6iYRf7V0IP0gWM
 Zdh14kAZvYBIS2XKcIqZLRVzfj4kAbCFlXgjvoO38ZZIpd/bw+PdtMAOb6jih5o5V/DG
 sOxlyOuRF0O6RPmYnH4yOiI4kzYCiWQ1RpCAngKEfduU6/Gm42TaqosLtJt7z+BFxTJB
 nwrFdyZflSA9EVjYCSJ4KwBs5J/jSNtI+bKSG+viGllSkg7y6EIC2Z0+A58yVNUjQtz2
 U5mZHe4/TPuk8aNQxSMq7++cNNqyAc0ww+MKcjXgxK+ErOR0QZ0WDnK6FkjTfFUDCS8D
 o7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=km1+aOR9Ckp+dNOT3gFV8AG7zj2WXVG5NEGwIFeXhrU=;
 b=hofIb33ZZ3EdtfzeM4gILknUm8OMaBL5qrtK5RVDu31gajNNCc0L+sxVONgp1y/CuF
 FN0Kd0t2dhv6ibl48zvD4erITuLQwVN1h6Z6V2KpUeYE7+pL8mvm8v4GYi5AuhVIZSFB
 Lwwran/5zW68bwnyaEeUEJO2+1xMLJ6znwRiRq0cpczXuI45ldYAK3Fq5Z0AZih972UI
 73uwlhLZ9YbYKNBC7ze19XaBglaSfUCn3rpU4BBcRlzFHHHCNZ/NOy0B0nPUEwMgEaCX
 QrVQJNwElxS4T7aLc2xVdVtwCJ8P6KO2dDDF//m5E2TXake5TZFe5e+rKrsVPdKtHR1G
 A4eg==
X-Gm-Message-State: APjAAAWA9dw4clT2j+HHRtu62pSslf5gDNP7VkOXryt2X7NZYZHgMQbk
 xmSOTBo1FS23vMXwaLbNurDdvcTcqVG80MeR4IKRGxstsGY=
X-Google-Smtp-Source: APXvYqz2mpFTkFctCKqsj1Ml+/EY9FUWfX0EksGSMgti1bZVKuV+uyrPm2635oWZV6rITP2Z/muo7iBZ4l4mVWAdt5Y=
X-Received: by 2002:a17:902:e701:: with SMTP id
 co1mr44691238plb.61.1553798285811; 
 Thu, 28 Mar 2019 11:38:05 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 28 Mar 2019 11:37:54 -0700
Message-ID: <CAO=notyUi=12Xi+cWMVf6uK5dgvq-d5zhHunBanxZ9QwwzhDzQ@mail.gmail.com>
Subject: moving out of sbin
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
X-List-Received-Date: Thu, 28 Mar 2019 18:38:13 -0000

I've started staging patches that move the installation of daemons and
scripts out of sbin.  For each of these patchset I have verified the
service file is either already safe or I updated it.  Safe here means
that it won't break.  Moving the service files to the repositories is
a future step.  More fun to come.

If you've received one of these patches, please take a look.

Patrick
