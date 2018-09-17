Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bB1hb86g"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DbVT4YRpzF110
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 05:17:36 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id t84-v6so8126445pgb.5
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sqvb6YXqat4uZ+TjwyXiEyCc37SFMoL42mtskUsUNCo=;
 b=bB1hb86gIWqmunX5lTS1yIEV72iCMVpAX+x2X3bJXeN3lCe8pT4oSVl9ivao1GaOc3
 XLTYyDtDfU7Y7+huzxFgIbEDMaxFav03MtzjsIUqA2h+3iSxsHfBz/mUVNxFoHasXOCE
 YUrw38J7qDzo9kEl3u9PozRJgeJD+5DpUzSrzxLQjlUrH1b7RRSvt96a/1Yles/nYv30
 MbhIph7ud/NAP1U3Zt9hiO6hIDnIQFbZR2qI8HaW/2v/NJ3nwCiKftpGuGPwbwI/GAzh
 2BmRXlpsQWqZIK7X1lTt3uDU8DkHpNWJJefO8Qaejswd6j+dETvd96cH3LPtT5+y76Rn
 VrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sqvb6YXqat4uZ+TjwyXiEyCc37SFMoL42mtskUsUNCo=;
 b=SAr5ki6tpuT5brY94/S87VpPP5Tdt+mrQ8ZnZZ2Hv5RfVo7RGsNd868u1x6c4w3P00
 2HgI2BtfKLo74qx66j+zX8YJUJeh/UGTOu56z9wojvu6tZg44ILC1uvMMR98R8zBNou4
 FMGxlDc3WID7B0gcK3xJSA4EfHi3tOTWbl/do+BskGyjCqFUN3qYT0nxcSgeynUQk+ah
 K9zwvF7nCzCH7gKtPH3hBV41jWLzq7SrXKQVRGPM9NTlH0zz6akycfr7l8+aDPvAgaNg
 o3W3XkPVud8YF/msePx0KmzHSGKPttRSJJ8J4XMff2oiSGhOTd3PbfECDMlr8/glkRy+
 lfsQ==
X-Gm-Message-State: APzg51BU75iX7BLU9fgOpXKQeRhqYSewj4309mqfnYKi5WGCUnybnBy8
 lR/9lhtMS+eKzw65mgoJkKs2ECUs7i0z4U1HsTX+XQ==
X-Google-Smtp-Source: ANB0VdaHGSxrqtvNG8hSHKFB7cyzm2lYcCmg56ngq1CCDIwm3ddT9jrRR5K1BPfhqIBp36QqUuto6OiM71iJH2IK6KU=
X-Received: by 2002:a63:6c04:: with SMTP id
 h4-v6mr11880188pgc.290.1537211854752; 
 Mon, 17 Sep 2018 12:17:34 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Sep 2018 12:17:23 -0700
Message-ID: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
Subject: Link-up between Gerrit & Github
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>, 
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
X-List-Received-Date: Mon, 17 Sep 2018 19:17:39 -0000

The first meta-google patchset was pushed by Brad into github.
Interestingly, the second patchset which was merged into gerrit 3 days
ago still hasn't been automatically pushed into github.  It makes me
think there's some box we need to check or a setting to push.

Brad, can you dig into this please?  I don't have any permissions to
poke at it on Gerrit.

Patrick
