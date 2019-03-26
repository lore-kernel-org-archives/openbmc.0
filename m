Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mcZGIFJa"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TJBN4KFbzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 04:33:15 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id c8so8378852pfd.10
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6Y7wMizfhlHrMmr1R4ciMbZVZ5M6k4i11kLJOYaAWs8=;
 b=mcZGIFJaBmnULxnRz4UOeH8Bdwb0eFfemWu6XjM7tbMSGOSo3Q3MlP/G051v/6lfjM
 mZHKEuDBULXJ8RWO2B5V4Ve0XSjdMVfWl4h2jv/Lv5J2UmAQFuSYaQowLf6JYmF9+YI8
 PGXUjSapcJWGma6EN7PWWbLuIynz4YOfjXKTHpXNcTJ0pEyaJiZZAki704oWQ1E9Odm0
 WkKcSCTEylceYlJL60bO0saaaZdRWX/0LRF7HZujjlCnjxdKY2b/J7142RbdiJIlYOA9
 yDwXUXiR1hE0Va9FciY8lY3IHt0Fx4iVXem2W7EU/4yh46nXxsrTeqU+EEa3QLrdGXH4
 u43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6Y7wMizfhlHrMmr1R4ciMbZVZ5M6k4i11kLJOYaAWs8=;
 b=rcmOFolPPFZyUTjao/4JG8jylEFTaqCSNI97ItS4kaF+FY7tUYTdoQA7U1tNnv2rF+
 u+Mrv66AFSAKJsHY+XVJbvw26GaEmjWjMJLpWpJXNj4fNJE5xEGhmXFM40vDWhoBxJca
 PuWG0tPtxTRZ1XvamXgCB/IvKf6UbQUHP54249+hVIXFd3I/yf8s8WXVeC4MyV4MmnW+
 vuJX5es3YFuQ+bT9fuytMTn75w/w4zRmcSCMpmDgGi+mp5JHjlDvCIBCABZVbz4As/T8
 I16Fvvxdry5Oyzq6fkmUQ0NmZYh0lz+0AEt53ucXGMs5G3Ru0hmj7H062xKqzBIzwZK5
 G2IA==
X-Gm-Message-State: APjAAAW7EhuvG8wWId4j7895kl69IzAkuDC7hJRsl2ODeSK96IDcZ3Im
 ynXvymrTSO+w/lv09Gq6qtXLn+V69TsarkuVQE8XYw==
X-Google-Smtp-Source: APXvYqya9Kohz4tmOcB1I0Tf3ED+uDMsxzHqUMSZ5bCiRqD41YGercAL792NBP14LdyrkDqDb0NgO6TPxhBVoo9ipgA=
X-Received: by 2002:a62:b602:: with SMTP id j2mr17944050pff.68.1553621592186; 
 Tue, 26 Mar 2019 10:33:12 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 26 Mar 2019 10:33:01 -0700
Message-ID: <CAO=notxq+sAhdN5kJ2BFYreCDeSo633KPZM1-f-M9LXdUJzS3w@mail.gmail.com>
Subject: usr/sbin vs usr/bin
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
X-List-Received-Date: Tue, 26 Mar 2019 17:33:17 -0000

Brad,

Reading the anti-pattern, I was going to start moving some things out
of sbin and into bin, I had considered why not just leave out the path
in the service file (as a step 1) - since systemd which just load the
first match in path, but the anti-pattern above indicates we should
use the full path in the service file, to make sure it runs the
correct one -- at least that's how I am paraphrasing it.

Please advise.

Patrick
