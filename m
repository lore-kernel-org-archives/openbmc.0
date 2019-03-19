Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::132; helo=mail-it1-x132.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pRQOyTH4"; 
 dkim-atps=neutral
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NdJ015wHzDqLb
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 14:06:55 +1100 (AEDT)
Received: by mail-it1-x132.google.com with SMTP id z124so24743590itc.2
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 20:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNyXjpwoTFssm/lwLeXzKV+MVhnIU5sgcL7IbN9qNAU=;
 b=pRQOyTH4PuIxfraF4zD+KRJhpwVR7nVRl8qrQpuFIPK4Dwsd+uy5B0UrTCCARkvSDr
 TsyWNpY6NjqUY4tFjGUGV3dX453nVBFgEVdyY3QCwOlCE58RhlYbDRNjdki3L2Rhw7IF
 Ls1xkfZaO1va8RxOxLTl6laoF0BZm9/uEpby0HwFn52ifD2jRZOGDgaqs3uZRQ+Fk3wu
 tVkiP7iSWwhmJF8HfuiyRTUfiYfZyyxlYlbO1ak6U83k4F8eDWmrpn7G/ts+gD6A+j+3
 XGvPAP+2gu+zSv+8J4jlOeN58hLUeVA/Zzhcn51PIYj0J3zg9jZfUhXFAb7XCuMFyass
 D6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNyXjpwoTFssm/lwLeXzKV+MVhnIU5sgcL7IbN9qNAU=;
 b=bAG5u2nKWFF5mUUaa5rs+XsYuwy9EJI8x+IPg4hRY3y6Ufm+2WbJ4UgrOi8yojtLAQ
 Cf0bQpvOIOvEaZwZJeSzqnBxOk+28wSTgh7zJF6r93MiOvqJMDWc/9X0++2TKd+R08Vo
 mZOeZLrpIUViDOHOyjpCHzpbQPHl1V/DwgXTK46C+sjDw+zf7pptu514OEEKSWY+6rtO
 slPItWnL3daPJAraeLSUyFENuXDYSbEbSscNRSnty3jatNqOTQVIx5vJhc5zMJPhJaFJ
 gskT8s/83q2Uy1Zyy86LHu6Vfax/VqWy8l697cl8BxFBu1x+1DmxfdzjmAmkpzH4S2Ox
 srBg==
X-Gm-Message-State: APjAAAX6jgYLp11JymzfO6rCXWu42y8pB0iC/J3TAElZ3RrAuE0iIyJC
 fFJLnerRCUdHxmA6xXM9oAON1CMSC6aNR1cIiVc=
X-Google-Smtp-Source: APXvYqxzyhNh0CWfC+8bCc03UBPWBEcd3010JWMteWLtBHtpfJhoUD7QyJ6NotGnf9M/Ft1FY2v3ECCRa5m42ID5agw=
X-Received: by 2002:a24:4a46:: with SMTP id k67mr105646itb.178.1552964812569; 
 Mon, 18 Mar 2019 20:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cD-x3sAO_F+=2Qi-NKOoOmLp5P-i_vnzSgnuvr047xCUw@mail.gmail.com>
In-Reply-To: <CAG9c7cD-x3sAO_F+=2Qi-NKOoOmLp5P-i_vnzSgnuvr047xCUw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 19 Mar 2019 11:06:38 +0800
Message-ID: <CAARXrtkh_-bH+_DETtB0vUjQHwPUJmakX+p9tihaNgYcmnhoUQ@mail.gmail.com>
Subject: Re: Phosphor Hwmon not work
To: Henbin Chang <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 19 Mar 2019 03:06:57 -0000

> Can anyone give the suggestion?

The same issue as https://github.com/openbmc/openbmc/issues/3499 and it
already has a fix.
