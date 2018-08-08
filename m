Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22f; helo=mail-it0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R7NE97Kv"; 
 dkim-atps=neutral
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m61k4zJ4zDrbB
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 08:46:18 +1000 (AEST)
Received: by mail-it0-x22f.google.com with SMTP id p81-v6so77290itp.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 15:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gUKn9NVJjvo7ukYcB3qP8rqtdijvoe8NlI7zpsnAdDg=;
 b=R7NE97KvsPXmm5i7+enSnuMrQWiqlol4s+MUMATmnBHdCT7u6XZypM1R6/n2GPpIpx
 uL2uBZmsKrYh6ckuv9WgJgf/0/X9Nxv/Oj+ARZnW6CpX5QCzrpLJc2/Kl4zcRbsAdRxA
 gnCAx4sDEIM0kcrrFQdaBRQAryS+QgaaN0UYyq+feO+KGkLFBm9bRaj4FSLwhr9qwxfz
 QZSNcbQQQDQ0fEtsIUWtwHocnyRViB8yoRRq5qm2bxK/KfQ9NAJCXVIGYhQfCj+4uWIy
 UtFiWMyJyCil1Jx6XmMFdocHxVq8SHCNir4HTRNXHrZbHmTJG+Mledxao4WoqERDVdCg
 XEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gUKn9NVJjvo7ukYcB3qP8rqtdijvoe8NlI7zpsnAdDg=;
 b=hUfHEJ2CPqVLbaYRYjvq9KodUowxJprcwJo1jbEFi8RTIAPO/6TFG7PQyBcWx1hv6H
 JAH68XLGD7m4iLDCTa7sP6TJWM1CBsnu+jDPZ468+Sz2CZOqatmGTtD3WHogAk0G0f16
 tr+9NrflXuekmuu9sgdqBk5AZlhxhHhAQSv4SYLqebj1kMRDzf3RmxeA8AwPwxp7NLPN
 p72amyssdR7Wgbc2w6/wWKim847RsSzj1tMicgno4p1HOOtP6IcXq0NdIYu7bmia8jGQ
 YT0CPtb3MORGOA9crQrPSrp2wS2xve8breRQYG0WFHuOBxDy5DHXCLt9eF7O48dlIWwb
 Pu3Q==
X-Gm-Message-State: AOUpUlGhGo3NMx7IHAZ2Vg7fNBRHa5Xk4fc14vbJiEpDkx++ZE9pNqXC
 5VDkjjlFTVRQZSugwPu50UnyPJCHIWilXwXQzCeh/OVT
X-Google-Smtp-Source: AA+uWPx+VML9vMP+qWYuXL+CpNvAxvI0CQjZjXkW0Sr+kJVIZwB6HWVAVPkhKLoo+APrvKO2nb/TpfZBC/IAYeviVjE=
X-Received: by 2002:a24:83c3:: with SMTP id d186-v6mr53202ite.88.1533768375385; 
 Wed, 08 Aug 2018 15:46:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 15:45:54 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 15:45:54 -0700
Message-ID: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
Subject: Licensing Question
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 22:46:19 -0000

So, I've spent the last hour trying to submodule my way to using
ipmitool.  I've managed to get it compiling for just the one file I
need (or want).  However, then I try to link it and then more failures
for things that are missing, such as helper methods.  So, then I add
the file that has those, and then it doesn't compile because that file
doesn't compile.  This is of course, not compiling with the -Werror
flag among other things with gcc.

So, I can keep battling this, or I can ask -- the license for the
ipmitool just says I need to keep a copy of the license with the
source if I reuse it.  So, I can do that, and I can hack it up to work
-- but where I'm curious is -- how does that impact the license of
phosphor-ipmi-flash?

(Some of the things where gcc is complaining, I can go ahead and
submit patches to fix.)

Patrick
