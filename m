Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bRO/Raxi"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DbWw0C1LzF110
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 05:18:51 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id p12-v6so8016734pfh.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SFTLId4TkjACD0md2WEPpPJYY8R7CzSVuM7h4PvnWj0=;
 b=bRO/RaxiVqujfdR6nohyoMpWwOD2+YjaRj+SPU8waR8lCMMKC1K0FBoBj0B9sN7Jpi
 0QwDFuVvLNtRSQXtrHtV4ODoxUJxx3Sd6H7p3qOi5V5w/OcmkrB+kdPJSp5j3gCKfgLt
 hfJrRGMvBmsdJMTUtutp2HiD/heYT3chMHw2921SWf7ufh6Cg1FHxYbRqsaGEWduoUrm
 f2kdJ11BoqVmfjBYGtc2OTG4q9tmORacT0B47Bi4WRMp8VZ6osoFEh3wVPjXknbk9ci2
 L0EIxPTcNwBRvDFcuxH+R4xhz/IK9QVkThl0wzGBApZtmLHMpr8XRXZG8267a5xF0CHc
 b/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SFTLId4TkjACD0md2WEPpPJYY8R7CzSVuM7h4PvnWj0=;
 b=BlSMy1pHi8NLHATKR6QUakf/cVx9lUbFBvMCPpUr3jVpwqlwODobcxrBJGMI9mw7rg
 zDmkb75LaoE7cbAtusNO7NFwDt6bMqFfae0tgkHBiZYMMZ7Ye31bgnkwVg4VRAneWqrM
 esGCwIWz4zfnB0c4ZicyQ2dIvsMMtjkjQHAKJvx984bgLdXbhoJwZbQjVaVGBCnFELQt
 lmFy81Lczrp/l5qHmp2PSMfnWKfJztvvPbRqN+WadsV8M+bDJeDX/S72RIBOrbrXBHm+
 nS+BukHYFBpUDvo/qyMsqxeF2rZ1NBkqdtZwnvrLfEzm1qrdFfJ9O/MtY2VO2XJE7VK8
 aHLA==
X-Gm-Message-State: APzg51AXaSZHgHXYxlcWrBY+dol92vhBJ4+mTJCsnv7k6h7OsoRzHpUy
 iOVn+WW92knJXuafac8d2BEWSwykZeeMdkBluKUXUv+N
X-Google-Smtp-Source: ANB0VdYv+JdLlsrOANIeMKIODN6tJkGnQCvVALaw3ZlKmFtJhV+sLzXBmh7q8ozQ5zZdtouzHh93XWGs+RMjL6nPLlg=
X-Received: by 2002:a63:1a1a:: with SMTP id
 a26-v6mr24632638pga.449.1537211929485; 
 Mon, 17 Sep 2018 12:18:49 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Sep 2018 12:18:38 -0700
Message-ID: <CAO=notwmqkF-8hdfjSSg81UrJTwHKscUPt+DCpWip915nhiUyg@mail.gmail.com>
Subject: maintainer for google-ipmi-sys repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Mon, 17 Sep 2018 19:18:53 -0000

Brad,

Can you update the ownership of google-ipmi-sys s.t. I can be
maintainer for it?  If this is something I should have permission to
fix, please point me to where -- I did some snooping around and didn't
see an option.

Thanks,
Patrick
