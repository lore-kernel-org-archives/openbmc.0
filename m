Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dwe2TPek"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ShkH64S6zDqHp
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 04:55:19 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id p19so301102plo.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2019 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zgATO/VOZf1cZJ+jIUPtBd2LV8lbRsah2PDjv+Zuv7A=;
 b=dwe2TPekhjrtMJA26KhlBrmX2KGC8oegsEiIBG0DZJnVzR6FrYfacEFqH551TWhA1i
 CIzZoArMfzHHe8MUux/JrVEvqKtuXYBXzU5HNZDGC+e47jdquXGRThQA0s6EhzIvuzMa
 PUM58uZoTVhdQe0Zo5S1wpnyvUSxLbGo1eUha3dpa1MjejhaPw+2FYzvqbisUEw7cASR
 64T2Y9Ly5Znt9oc2tdswwZD358UshkLMnAl5wO2sw7fK8YGTTYm+6NUeC2Yq8AEUAOew
 KWpeXeyvRdC2cP3ezScYEmAPxd4F9aHvKBjk5EkPZOjWFebngHGFTjHwFMu+YtkfbUUP
 DazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zgATO/VOZf1cZJ+jIUPtBd2LV8lbRsah2PDjv+Zuv7A=;
 b=mPgipNo3gSJXTf2SxlpGT/Sdj1EaTLnNIpzxFkBI3YJwWL7O+1uXnlNQEPOyx6cegi
 F5voND7rlYv7gFdCFB7bnFwcNf6h99rRoYtG8uumk+fPPHsVhsinbPn3pfkupaRObHUh
 iShdxfekrLF84j7ZxsH1agKMh3ep0dGQPrQ0pPb3M9LnJYKHd+KqgDRlacBPrWo1Osqw
 3JFR4mSskuiU3774rKGjjhXlHyixb0rA8ZhVMIll1OOg0IzeO0MOkwt75i/ushtkE/aq
 cMGxJdYoWVXkBMmdNMAdWuOdwmazIR3Beu29Uw0a3ZS+OOVw0B5LON5Jjo8N2n9HX7uW
 BseA==
X-Gm-Message-State: APjAAAXosxxr5I6wKmFgl3p2O4/wr6vmcKm3adv1TCGfkVMWRQepKttR
 B4MHjoJmSZ2Z6QZ6FWItlkxtrvjj7mCsL7U1eMjYrlcP99pbuA==
X-Google-Smtp-Source: APXvYqzOuMUylo+afzibYDYCghHtAou7+0Qd9XECcU3FrdC7iKTPyhlgzZKpCuYBUZjx27omx12NAA2+XRESdffNpHQ=
X-Received: by 2002:a17:902:2aca:: with SMTP id
 j68mr26579139plb.233.1553536515889; 
 Mon, 25 Mar 2019 10:55:15 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 25 Mar 2019 10:55:04 -0700
Message-ID: <CAO=noty70BK52++Cj5TVg_xB-VbRy6-CnJ1zn-EzR7cwmBzxhw@mail.gmail.com>
Subject: i2c@ renamed to bus@ in g4/g5 dtsi
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 25 Mar 2019 17:55:20 -0000

With 5.0 linux, all the sensor configs that are under i2c are invalid.
They can be fixed by renaming the config path accordingly.

I've submitted one patchset for review along these lines.  Brad has
also submitted one of these, I think it would be helpful to use a
topic "i2c_bus_rename_patches" for these patches.

Patrick
