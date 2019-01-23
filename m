Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lZrrK3w+"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lBB56NdPzDqBP
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 03:50:53 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id e12so2512855otl.5
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 08:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=t6ashdodUeP/8/EALYamEynR/jk5w2364SbBbW84834=;
 b=lZrrK3w+W7Og0Xy6FGTk1o8mva2es/+nriZIbcvU9Yqw2Fwst9H7l/CbwAZNz5oFIF
 Lr8VXgHEI9axwd62WU4gmmOmcOQCUUzUFM9UcKfovZiygeObl4Gn23rAdY1/aFl0iqg3
 75iQrpFUBzAoFKT3+WLDUbly320GDxMO7sl35U0X34g2NSddJRkdbJ/WTOoILJXmSC+U
 rybmcO4+z/dA1BJk8o2WNIg298dJexYsSnRP8xbM0WgUsV0Oa4KmDxe1aeKQ1fUGYCr4
 XTm+QcokPBgoHkI0WBd7C0cIrYZ6pPuBHtybj9p3zM8lkW+uT2ea2YDGgMvnhojbQHB8
 481g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t6ashdodUeP/8/EALYamEynR/jk5w2364SbBbW84834=;
 b=IVJQWgkvOF1UUuEcaE1iPIo/lYfdhiYQ9qOkDCIUzCFh5QPcGJA9tmaH1rOb1Yui9k
 J068tAI8AN6jondteq/mx5+Dh2eLAV8Sje+gwsDfDbTI0wTjEO2ROqgvqeGYcw8DNVpi
 CcFrEMpkE1Bb5/+J6ZHI0miQ1Y0Y0/VzngwCOuPY5ilygIHH7PDJbexIJ+buT89rEZuJ
 7XBjn0pydzDXLUC5urwTSEdC4UAS7syadc1w1rsEFl58NjFatn6LZm7/jJdHkMkdU21M
 eCvUJVNO7mtvrF9NTJ4ekpah5u4pNE/JYdjgQZ11bJpFX1crWv1M63HqAdCLR2rkQPeV
 lz9Q==
X-Gm-Message-State: AJcUukc0CaD83Tyi1kRx2ivk4eCiMcb+jJbN6RgwzlxbPXjI/3gb4VJd
 yqmLuZqV6tfbLLbHWlda2qjHN1MNk9uqVhpy36F2wjoG
X-Google-Smtp-Source: ALg8bN4US/yjjNZmD5eBAt+OEzmAdTSVp1j2aLIPG3X6QJq1pIvZnItIcFaGMOmVeC2XNWiG2DPJD8Zd5CQ8EmIBJWE=
X-Received: by 2002:a9d:ecd:: with SMTP id 71mr1899048otj.155.1548262250931;
 Wed, 23 Jan 2019 08:50:50 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 23 Jan 2019 10:50:35 -0600
Message-ID: <CALLMt=p5adG8YL4HDq6BkpdDweCun+RMOkF4+ALOObXjG881EQ@mail.gmail.com>
Subject: Infrastructure Workgroup Today - 3:00pm CT
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
X-List-Received-Date: Wed, 23 Jan 2019 16:50:55 -0000

We'll be discussing thud branch support, some CI escapes, and priorities
for the team.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
