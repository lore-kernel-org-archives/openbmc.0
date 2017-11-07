Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::236; helo=mail-lf0-x236.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ds1Ew1NM"; 
 dkim-atps=neutral
Received: from mail-lf0-x236.google.com (mail-lf0-x236.google.com
 [IPv6:2a00:1450:4010:c07::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWHxJ4lHhzDr5T
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 16:27:16 +1100 (AEDT)
Received: by mail-lf0-x236.google.com with SMTP id r129so13023408lff.8
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 21:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=ENvFg0RDU27eq8dd2h32QiP705VdF7SjajFnMFQURJ4=;
 b=Ds1Ew1NMILGB9cDM/FjILcC2dW2M6bXAyVm8RT1YH/C92WqcNiCsN7FYl0rT3tUUdf
 fEs1QIRwbJ4sAVbh4HlUactc8c0hMnLV94VZCFjqDt2dCyYjMYyUNgWPPYnPmiim2Qn1
 WPjSvJAZdw2kGubyXbpoyp5ghDDASTJ2f9GimHrYoaQpMtjVvuFebMFztnSRKr4fRAma
 EQqj4tv3RuSU4pqfYP4N7BJexMMr3e13jKt0Z8QaA0QzGQOopU4nl5f1HEVYR0wFzzAj
 ShSt8VibF9YXxkN+JpEMh0l3RSSlut6OwEOWcfqWwxOxaRuPWkedgj3engztdcU8nGNg
 QULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=ENvFg0RDU27eq8dd2h32QiP705VdF7SjajFnMFQURJ4=;
 b=DpAWIAdCUm5qX4XFwZZ2UZ7k1v51/Vqds40zcuWkw0T41+0/Ngn4MZZOq/cp4862Zd
 xNXAzH6esEzLfN4pkjsBOeJfEs3IsKFUHWF1bh2V4moUX9FNVLX/85Md6iYvw2r2f5vd
 +UMr7gK7ayDRnpXWwVWeOMxisoUcmFCWVGHACKG501PBCBpDvZ5kmmV6e1ce5jtxqZlg
 rdgXi1NGE7qJxNM5kLXBBp96xAMc/nWAzKqLfUPjJykbdODTLxTX4wYNOQDp1EKKEPKi
 y6Tzi7GBrkJZQBnr8OefwetxGKLq/fZO40SV3s2pJsW25UOJmqZ1904I7bzs0lWg18x1
 jpaQ==
X-Gm-Message-State: AMCzsaVOPmaaS6dBWVHooWiKOUthBNKqDLWuXw1oHxxrmaWw73wM0f91
 ftrpjG8QZOsqjHBk35+Gop/46eM5Nv/DhPfHFIZBegBJ
X-Google-Smtp-Source: ABhQp+SWbuhkDfrl8Yajp4RSEA07xQI6L4IYgSatf7xeIkrOR60Q044zI6jJ2XpdWkzAvE7+MbRmuzb8TkeDn6PnX/A=
X-Received: by 10.25.83.144 with SMTP id h16mr6122050lfl.123.1510032432381;
 Mon, 06 Nov 2017 21:27:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.71 with HTTP; Mon, 6 Nov 2017 21:26:51 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Nov 2017 15:56:51 +1030
X-Google-Sender-Auth: fw2tfcyEpsgSttPDydb1W7lrJfQ
Message-ID: <CACPK8Xf0mLw=fGDEGwdvQ6Bycgmf3jUU8WGJJ3+8VcTUJ_9CUA@mail.gmail.com>
Subject: Yocto, Kernel and OpenBMC security maintenance
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Nancy Yuen <yuenn@google.com>, Ed Tanous <ed.tanous@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 05:27:17 -0000

On todays community call we chatted about security updates for the
project. Nancy pointed out that there tools in the tree that are many
versions out of date and have security fixes available, but not
applied to our tree.

To date there has been no focused effort on ensuring known
vulnerabilities are patched, weather this be backporting patches or
updating to newer releases. I suggested we focus on ensuring the
OpenBMC tree, as the upstream for our products, is where security
fixes are applied.

Taking that a further step would be to maintain security fixes against
the Yocto release that OpenBMC has based itself on. It appears that
Yocto does this:

From https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

> The Yocto Project maintains stable branches of Poky (OE-Core and
> BitBake). Typically, alongside the latest release the previous two
> releases are also maintained.

It looks like we should assign someone to ensure the OpenBMC Yocto
tree is kept up to date against the upstream branch.

Regarding the kernel, the intention has been to regularly update to
ensure we are on a maintained kernel. That hasn't gone smoothly to
date, but we will keep trying. We may end up maintaining a long-lived
tree on top of the long term Linux kernel community maintained 4.14,
in addition to moving master forward to the most recent releases.

Please reply to this mail with improvements, thoughts, suggestions,
objections. If you want to volunteer to help maintain an aspect of the
project, or know someone who does, please put your hand up.

Cheers,

Joel
