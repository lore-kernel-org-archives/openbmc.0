Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iejxZ03N"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420LVz5TRSzF0Pd
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 06:50:35 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id e2-v6so1282788pgv.5
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 13:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=v8jCtFZ2Varmwsplb9a4tljgZcLuO6KLmrld90mTz/4=;
 b=iejxZ03N/7N2MkatnXyIg6GKMVc+TafBS9//aq1NZamD71hMlZw8f7pKB+eVhTFHdg
 kCq7Dg9rb4QEXBb772lKWv292riXnhvS3ELW2rURirPe2S4PIbsxrEgoRCln+DlNK5Am
 Cq9IyKFaZ8Q7c69yhTRXh9dsFQHZRZ6FNX7OjmPd/et8aPqgcvZTmpLO0G25AipeyOXF
 SgIUH/qUnzl/g3fS01/LI2mTZM03U/y40GmKr1whk0s9ZofQoSPzJ2kw8EiK4r5tnts1
 ukufM61AsPd74pKqBY4Cavh8ASiMNSNyBBBwweENndPSsjE6pUgxWPFAZX7oaQXZVZHK
 TcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=v8jCtFZ2Varmwsplb9a4tljgZcLuO6KLmrld90mTz/4=;
 b=CGaE1mZIVqU8eIxeZNRo3/GndJn4wcg7yDsSGKGd0Vvj89KaziJGFn2mVxOrIActPZ
 rxhwqNDkExMP2wkYV13hL6dmuni7y0qSuIN3mPDZqgdO+63oUw/URtRJbGFLOlIQspXb
 pTCy4CEvuF/N5wJVS0ySl7/ugfbkKjexed5EzJSqfw1kFjIyEIn6MIsB2/3Mia9AE774
 CfGJitZe76OEUDeThmwt4T+Ywc7mcCCKlOoTF9HD3HAtIrfoG2gH2EZrQBMOa8uX1ujj
 iXt2ZqS+kDcR0wmPbXuTDHsJdasXNgCLhRE1yu9Tk5zne99nszxtcRj3ekUNVhpyY3lN
 dKSQ==
X-Gm-Message-State: APzg51Db39PFuU0c5Vvm8NCUngOFFk2R3Fk/cSCp51mRwWY5QlCidEo5
 HaXEqQu3liftCPpvDx/zJHb6i6EIhqAHJa3uI33log==
X-Google-Smtp-Source: ANB0VdajoUlcz8ud0sbRifQQBTApIiLwDs/JzVhKcJhx5yC2xSdsvczGIs9MohELIg6/ANBcoxpS1Fc4YVCFxGwmUSA=
X-Received: by 2002:a62:9101:: with SMTP id
 l1-v6mr3041063pfe.226.1535489432751; 
 Tue, 28 Aug 2018 13:50:32 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 28 Aug 2018 13:50:21 -0700
Message-ID: <CAO=notx7e+sfKm3t07-kg3pjrk2H3E5p=jQsZsW=Ekosd7=yyw@mail.gmail.com>
Subject: Two Google-Origin Daemons
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 28 Aug 2018 20:50:36 -0000

Brad;

We have two daemons (to start with) that we'd like to send up.  So my
question is, should we put these to live under
openbmc/google-{reponame} or google/{reponame} and point the recipe in
meta-google to google/ or openbmc/ ?

I'm inclined to say the code can live under openbmc/ so that others
can see it, and because it uses openbmc stuff.

Patrick
