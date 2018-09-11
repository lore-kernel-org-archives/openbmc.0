Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mBDwKTpq"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428pcZ68bxzF382
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 01:24:45 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id i26-v6so12387128pfo.12
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WsQczWnf+EtJM1QzJtCVzTrXyJ8Dy97gxMSi5lyDSCI=;
 b=mBDwKTpqT5CIMeBM/NRUlaaoID+Yrnv3gSHeRLXh/1/fXjXpBLIm8DGsDyQHrT8qCl
 Jdn2HhuE8XIHCDJlW6Bz0/JFdUdFMHufJbItY1qijyUSl4R3IyrpwLolk6cs8nIBadE+
 +gjhULhlagQmVkJNthSoa1j0qBUfHmxmC+Ha3Atm486Q/+zLp4HB7TWxLdSHxyJcQDUE
 Y4GW6DpRlpshcS8ABhvvP55nBRGBup8BosH26Z2t3m8/38bNV61gjUtHEDPr5xEZmOob
 /FshGVbu4tIp+wyxSXE19+JJHiShzypRovaVR+nv327RAbu6/vjv8VaRuq5dEdn+RoDY
 9E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WsQczWnf+EtJM1QzJtCVzTrXyJ8Dy97gxMSi5lyDSCI=;
 b=DK/jft7ZdPO1dBNyukoz7njlXydz83omaWLOBedr0pS9itsIxSkCgmgyIQOKtGjULS
 4M4GCfDaNbFUZZ4Z5IvKzeIx6GDdklkk8HG+fc1sJItFU4tpffBYi8NwezDKTXomfvdH
 wdTUF2amQ3ajtT3Ns3JCQQbc3UQrZIstJHbJThhvJfaOtXtAfMUgRdXmjns/ixGngbrh
 TqCUixv8C9vf7EGyyRrdvX+8QOo1jZwhw9rBJn7k1qaWD3NtwLJj5XsETYxjloBFl/8A
 6QiY6w+zt+5MuU4v2mqwlz55YtF6aWwXXNWtykaVFiFTOwRfgCTycZNwiF2vVv7Psugk
 P1hg==
X-Gm-Message-State: APzg51B3cDlasIDW27+AwpNGFV47wEeLs6fmyWW0C+5PtZdRwcyo2jFm
 NzYhpxKbgGUUceBC43bRIY2sre3j+yYts0W1kgSZHO/9
X-Google-Smtp-Source: ANB0VdbYTHaunC2VZPhOf+1qH77hSoyZy4b58BlytCKd5pWxRcLk8ScjDXrcRd1j4cDScoD4ENKHZtbcxnZWB1QU+Zw=
X-Received: by 2002:a63:1a1a:: with SMTP id
 a26-v6mr28896542pga.449.1536679482787; 
 Tue, 11 Sep 2018 08:24:42 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 11 Sep 2018 08:24:31 -0700
Message-ID: <CAO=notx6QwNkQJ8HgDFJWqDChVw9j4ye=1qSWz3yaFBFYAOEMg@mail.gmail.com>
Subject: meta-google
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 15:24:47 -0000

First commit.

I am a bit new to subtrees, so I was following the steps to get a
configuration into meta-google, and following the steps didn't work
because there wasn't a master branch yet in meta-google.  I submitted
a "first patch" to meta-google/master via gerrit, but it appears that
gerrit isn't sending that patch (yet)?

I'm just looking for a quick -- why did gerrit not push the commit?
Perhaps a configuration change required?

Patrick
