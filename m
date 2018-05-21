Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::22f; helo=mail-ot0-x22f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tx42CYMt"; 
 dkim-atps=neutral
Received: from mail-ot0-x22f.google.com (mail-ot0-x22f.google.com
 [IPv6:2607:f8b0:4003:c0f::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qQFV4y60zF18k
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 03:07:41 +1000 (AEST)
Received: by mail-ot0-x22f.google.com with SMTP id 77-v6so17661065otd.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=eYhsfzA5hFZItaKs64RguLiMCXTq44tzCP862qkTaRI=;
 b=tx42CYMtpi0COW5sT5TiQs1Tp2dgBiZTQSyp2RMAL6nMvClEhjEFFfme4fLh6XEwLx
 3T/eATx6uljsRj0LHwpzmSXA278nBZYNL0wwRqiDQUWqDcEVGjKyMpHpXdDokZh/TLdq
 7REjixd4DuqdW8M8OmzXkawyRBnHZO3peJDCnKZGuj5aSX0+Gx7rMwmvdvkYq5qo9aPd
 z47O275IZkMfRK1t1hrAr5ztb2xg9r7XRFh7xJKchUt5HLFMLiLSbgWko6NgSyfeWFcW
 JXn6rW7WwiAQfRS7sIayEqywn9uJOXmUNwdB0J+W/9sWVBSB2oMy2+2TmyVIWQB5msvx
 ggzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=eYhsfzA5hFZItaKs64RguLiMCXTq44tzCP862qkTaRI=;
 b=YfiYVh2Ff6srUZTuzvfKT1ZOtZ1QiczhqlP8n0XFi18rXStCoG7sZAGiuOQQ6x1Bp8
 7khZLxDFf9h0dppBCCX/b982qUaOub+ec+7fDmwIhUgwJxp0cAqp6abfgv2u43ZnXDyK
 z7hXqvrDuUZjWW3c/W8+LqMq5PH3B5Cq9q5akdDGGIe8BWoIT4JKFzV3k2tKNS7fVSBB
 BtEgSuKr5fHtQi18lDnrQZbQxvcp9zE+XPgHeuiqm85jUtHvcwfEKQKQyvhpVnEhgYr0
 IB3cK8hv6gGUKyu+7GjAkkIiDxT384Y1XVZ8mn/zNBbqN8q38H27s7ogz2nwotvVixnL
 XVJA==
X-Gm-Message-State: ALKqPwcO0UulV3/Zd8b21sfP69oUD0tC1vwgrYO6GRSUArkbP+NsjnM0
 6A87cSLStQOyeWGh81gf1KXH6C1T
X-Google-Smtp-Source: AB8JxZqqgrr8sfMDggom4K8SS4+9pA8ndRuYmnDR36UqrJ+Oz/VLwvvZpDn+dkJhAD9MIToi5p8W/A==
X-Received: by 2002:a9d:48c6:: with SMTP id
 a6-v6mr13349230otj.359.1526922458504; 
 Mon, 21 May 2018 10:07:38 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n14-v6sm8031929otf.8.2018.05.21.10.07.37
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 May 2018 10:07:38 -0700 (PDT)
To: openbmc@lists.ozlabs.org
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: Proposal for OpenBMC releases
Message-ID: <f25e143f-dce7-3f6e-3d4e-72ce7fe51ee4@gmail.com>
Date: Mon, 21 May 2018 12:07:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Mon, 21 May 2018 17:07:43 -0000

In order for us to facilitate all member companies in the OpenBMC work 
planning process, I believe it is important for the project to adopt a 
formal release schedule. Release cycles allow member companies to plan 
on content being delivered, get a read on project priorities, and 
exchange design ideas on the best implementation. As with other 
projects, release dates would be fixed in time. If a feature didn't make 
the release cutoff, then it ships in the next release. This really helps 
drive prioritization of new functionality.

As Brad commented in the community call today, let's start off the 
proposal with aligning with the Yocto project releases plus some time 
for project testing/hardening. Yocto releases are every 6 months, around 
May-October[1], so if we allow for a month of freeze and testing, that 
would be OpenBMC releases every June-November. Since June is next month, 
I'd propose that we start planning now for the November release.

OpenBMC release ? November 2018

Questions:
How do we number releases? do we want to code name them?
Do we want a stable branch/working branch organization?
How long does the project maintain a stable branch? n-1? n-2?
Do we want project milestones for content proposal, code freeze and release?

[1] https://wiki.yoctoproject.org/wiki/Releases

Kurt Taylor (krtaylor)
