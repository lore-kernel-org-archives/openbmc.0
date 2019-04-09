Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HA7XItlI"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dw1000S1zDqH6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 03:54:57 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id q1so9726919pgv.13
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 10:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/RPdKf3nHNFjb8AJ94Yeelo3p0nYzOLxvmMDJ8hQ1pc=;
 b=HA7XItlINwcx06l9DHrmJQzzkCUm7ApCmJsBo6eMxlUCIdzMrh1LT+xgem2a2RBRmf
 Yqt3VkFlj4ZGzEatqrrkqUjnCWyCxadAE2TnWULTNQ5pebLcg5CcNgBsputPw3iIfVSC
 X0ExqkrBeDDt8W8255224XaAH1qVlVXrkRQ6lrziyk82aFWGDC8tAYCXbzNqh4QHkUsn
 dVduAMPIbQzEiGgSzrX9lLLGVZ4RrGb/RG8u5hSfHU12XeWvDky6V9rgb9y17SdnryAx
 Zn9wUjJ+tf5Pb+LKv5b6pERDqRrTN6IAx+tG3/byTQQTAgMU/EnwP3ONBZvRfzP/vqNQ
 xc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/RPdKf3nHNFjb8AJ94Yeelo3p0nYzOLxvmMDJ8hQ1pc=;
 b=gI3eJaO7fF1daVB0cSUSBx2quESEkmGEBCk67xTx8DVUfCS2H7MvdjeeXteOI6KJEc
 P9xQy9md00Fx4jELtY+j6ALbnjrPUA/FzSW0udRfhoTwYQkny75VklzoPpoimX8UuRM7
 Go95jLhgBcpN3vEmqDeVyXku/4eJDlPYwx3CvtKTApkAEsLnxE6iho4AdvCLNztcpu+0
 rF8atkJ5AkzFLGRPUpvQCI810HaQMQXQf6rY02VdrfsLFxZdGZNNRke6+E8mUojtuNqI
 5mdRpHb4JJByjFjOy4fxNn/mXvLocaPSm+sqkzgocDU6El37Y5hrLmdet4/USF1iGLWl
 ygyQ==
X-Gm-Message-State: APjAAAWBYEFz1xMFye+Hp9SiPEM3iczJ6ZoaMBfTZ/IOREOXT3uEMXwC
 VqSQWM9CSASGNjtRm4FaxMxFc1quNJtRzaOWrMMjIl+vAaTD9w==
X-Google-Smtp-Source: APXvYqwsMHR/uXC9T2z5ckKpu3bfkQB3iBmxLBLVx/K8lrXgr+JlpyB48OI5hyHd9U3Ios9IYs7q3kFi/fpujO1lAwE=
X-Received: by 2002:a62:1197:: with SMTP id 23mr38747559pfr.210.1554832493818; 
 Tue, 09 Apr 2019 10:54:53 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 9 Apr 2019 10:54:42 -0700
Message-ID: <CAO=notzK+HwzahD-7LPA_eRB_72RuBvN+Ses7we+9AX4NjbiKw@mail.gmail.com>
Subject: state of large-scale-tiny-changes
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
X-List-Received-Date: Tue, 09 Apr 2019 17:55:00 -0000

The sbin_to_bin transition is mostly done.  If you maintain something
open under https://gerrit.openbmc-project.xyz/q/topic:%22sbin_to_bin%22+(status:open),
please take a look.

The mutli-user.target instead of obmc-standby.target is also nearly
done.  If you maintain something under
https://gerrit.openbmc-project.xyz/q/topic:%2522multi-user%2522+status:open,
please take a look.

Once these are done and the changes rippled out to openbmc/openbmc.
I'd like to look at migrating some service files out of the meta
layers and into the repos.  This will be a much slower process.  If
you maintain a repo that has systemd services, feel free to migrate
them at your earliest convenience and I can take a look, or Brad.

Thanks,
Patrick
