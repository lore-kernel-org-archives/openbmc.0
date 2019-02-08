Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ixIQ4yXd"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43xB3g02g7zDqTq
 for <openbmc@lists.ozlabs.org>; Sat,  9 Feb 2019 10:19:58 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id y126so2379976pfb.4
 for <openbmc@lists.ozlabs.org>; Fri, 08 Feb 2019 15:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=hY0T1COrfedTM1EcINkB2Gc9SV7YipSCGN52KpPbq6M=;
 b=ixIQ4yXdM1Q9LmHoFuC9Tg1JVDjco7s66gdK+vmxmbxSNjAkCSXUZ+kJT5LZf06MPE
 6ckZxyxjWCP4BeL04uLDDHQmpqNW3Duezf0WQdSSoFwWRPwkTq5Oqqy9dZ+eVmHFN035
 Xt5uD/Jj6+cqnhF6zoRX0zpcVb39QmXQraxNk7uERdg4toSz9WgkmZTzW6Dxa8I7ZZLP
 K8UADky1abXxHF6iyKIS8behwpCGBCS9C2bv2uuePqwWxJcArCWeBchv5Lsa6bKnHkR4
 aunNjcbJrX4H24CodAxOWp4uikV0n+6aIYtBFqI/Z1qJpfTpcCIJkilC0MhGaqmVk9Yc
 c+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hY0T1COrfedTM1EcINkB2Gc9SV7YipSCGN52KpPbq6M=;
 b=XzzYAIGvYtPMeqjUS7kuASKt+obNGC6Yo7pKgabz7ssAN0C4MJtfbXOY9B6sKTxKnB
 zxvmmY8hfV4gQEo6Wu5mERCmByDaJALa4vqSckzm54u5t2xNqKCucVSWf6xMk/lty8In
 c7uAcEvB4fYRAE8ANLxNr2so+PvvnW/Kv1vRYWJUJ4L5XJdFIA6edYWcVzkeY8VLvllJ
 ISSFIQkxvzLqcFiqz2XMzj80HYbzAOReCp8SIa+YPIv02EWTBYGZgEWPlL8nOmzLIuZ/
 vcv5Ugcdgxslcp8kiUWKsA1j0M0dc3ODDPaMa3pkru45vGlQ6MlujIQgxGbwoI5V4jhA
 7QOQ==
X-Gm-Message-State: AHQUAuatF6oW8CiHCN08bEksMD/BWzTdmoFkgXeY0+7KcJ/Gq1+mp+Ti
 lqVGlwNOIo2SIoO4seBG054APXXyrmUS03PZaXoai84emHw=
X-Google-Smtp-Source: AHgI3IYrp/sqbXkRBY3KrT33OGIUyNYdJsD9Ce7FPLI8CtCeHCi0bKP8op6uDF9DfmqceEXoofK6OAN2MIO4GQ1OVAY=
X-Received: by 2002:a63:125a:: with SMTP id 26mr14311251pgs.314.1549667995812; 
 Fri, 08 Feb 2019 15:19:55 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 8 Feb 2019 15:19:44 -0800
Message-ID: <CAO=notz2DgLH8JSUeK9CWz9jLF4-3VkfqimrwT1u8J7B85C=Og@mail.gmail.com>
Subject: phosphor-pid-control dropping libconfig support
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
X-List-Received-Date: Fri, 08 Feb 2019 23:20:00 -0000

In favor of supporting json, we're dropping libconfig support for
phosphor-pid-control.  One doesn't use libconfig for normal builds of
the daemon, there is a yaml configuration (or dbus configuration).  So
this should only impact a team using the libconfig option to test
different coefficients.

If you're currently using libconfig to test different coefficients,
let me know and I can help you transition to using json.

Patrick
