Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22f; helo=mail-ua0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dT4BmNpl"; 
 dkim-atps=neutral
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404jKZ3hKwzF1Vc
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 04:12:01 +1100 (AEDT)
Received: by mail-ua0-x22f.google.com with SMTP id d1so11376875ual.13
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NpNAcKUFVzlD/7y6RHhjDpS3IsDB8DyJ9nIW+zU3srs=;
 b=dT4BmNplqZHnumf3Gcb1IhIovXOTQEdBraT+n8GSx8XWbAphBe4ofGU5nLIKsjDI+s
 Gj8oj+aA6z+yw965fh+Bj/rq1Gv2JxkjqzWMfg8zHQnizBvtgOSxdNETjYvhICTiNNIr
 dnKG9etmFTZNO+UgiTP/lORzZReXoWsqYPkuIFZcJPeBpBhLsXHz222PGPelOtjqE2Kg
 8jB1ztmFgVnOwNwKVyCzV9yhhO1rwvLDNtYIGRDq/Xptllo5qc/a3vP0lejM1aHPVIdl
 mhX5JRZbDBu+74OErT2oO2CKBOwF5cIlJC50kRnqRX1c2XIL6dxNCGLxKGh5gwYR2zd9
 tUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NpNAcKUFVzlD/7y6RHhjDpS3IsDB8DyJ9nIW+zU3srs=;
 b=N6eEss2RSDudrgTWoUYpZi2VCdAOmxzz4PCnVIqQbnPEklvTBnrW2DVtFec1DcF+wt
 vkZSiAgzXdWQzSIYd2iW1HwHiaLNuAzKnoBngbNgEp7sMaUQrd2g034HjMTBXTTkXcny
 xxG4MSOGRreRTrrCOUHK1wFi+vTpPKIfTI2/M2iZ3O6FukX+ADedyN4vRvA/qumkl3t1
 P3o67J/nXVr0SZALacTjqQ1oobPvT+s8kBo1k+/2cx1uqvLtkI8M9kMUiSwqT0beOX3N
 dRqaQ+WJ7BJP24V59IbrdEc4QyLwoQC5PSWAxuV4WWsVMWcwHTk4yuJ6Zp5EXXDYhCr4
 DPbQ==
X-Gm-Message-State: AElRT7FVO/i+Qm6cJDPPftn1+qnbnw8gQlxneYAyVVlTbGE6k22/pmRQ
 JwYqgylV1mbLtOeWvHAiZaUdX2J+weDZhvLMsd7kvw==
X-Google-Smtp-Source: AG47ELuyVLS7CAdTQuA6/mCgfe9qbZ44rOjewcRvvQ63zpd+y3UMI7Hei/PbGNAQOVMNoq1JAtkfp7bUav1zl5JqJhU=
X-Received: by 10.176.79.229 with SMTP id t37mr8598777uah.70.1521479518719;
 Mon, 19 Mar 2018 10:11:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.79 with HTTP; Mon, 19 Mar 2018 10:11:38 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Mon, 19 Mar 2018 10:11:38 -0700
Message-ID: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
Subject: Sdbusplus-based Shared Library
To: Ratan K Gupta <ratagupt@in.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 19 Mar 2018 17:12:03 -0000

We have a lot of duplication across daemons using sdbusplus, and no
new utility library.  To avoid every daemon having their own timer
object, and their own this or that, I suggest we create this shared
library.

Thoughts?  We can start simple, just have a timer object in there, and
then the new timers being introduced to phosphor-hwmon and
phosphor-host-ipmid can be the first customers.

Patrick
