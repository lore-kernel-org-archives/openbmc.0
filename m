Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::22f; helo=mail-pl0-x22f.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uG/BVEL/"; 
 dkim-atps=neutral
Received: from mail-pl0-x22f.google.com (mail-pl0-x22f.google.com
 [IPv6:2607:f8b0:400e:c01::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgJ1M6f1GzF0q8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 07:58:43 +1100 (AEDT)
Received: by mail-pl0-x22f.google.com with SMTP id f4so5548671plr.10
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 12:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wHlVTPflxT5RNPU81sJWjFvCxIBGrKRJP5AW13+Uo3o=;
 b=uG/BVEL/Cm0nJ5GOt6856+cLeoNv2i4wqYR3sw9yjXnrtapXCJOLJOwt6NW3lmvkSO
 U62O9PGAoU2L7pAlbiTZmZ0gSEX8ukUz2XgI+th7vr2Y94xnzHixkzt5B+i/emNgUQlt
 rQ/Sb6roGzouLYQZr21jtPUqESc6q5ke0gztd8aEM5TqcBE/dfZ1E3s4hjQVQMrQo5tc
 SDPK7UzcK/IlnzRdmTU/nhRXuiIb8rJpAl6gsgi0pQ1XgWH01wz2dRPOP0ZSeo1HO/Xf
 Gz3IJO4vcoCqNmOytJKAJucT5RBeEMTcSuAmW5ZVmgC8AgVxrYBZNG/lgQVdbDkh7wlt
 Dtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wHlVTPflxT5RNPU81sJWjFvCxIBGrKRJP5AW13+Uo3o=;
 b=J3aCwzPrJRBqHyqWnIBcueUjwhoWt5ZYgDfe8vDl3WzZV9x7pZ8pjtCoEEqwkSzJa+
 MlONS0LFk41Um7Tj+PWnBCBHWVJu/Gw/2u9vVMAFwrvUzIXuEEXxeWdTILwwXS540u4u
 NnRqZd9fbsg8HnyCluti/8iL59QmUgS5ivQ5mSIxcOgbb6h1SXtEwLu+jqTtppXou0/q
 nISK9VOv0Ihm9uMJNjCbenKy/Y7fT+GzA5IRx1RjKN/X3yR08Mqf9fMOmg/mr7eKKPOg
 h4qtHoKjBEZvOpHhkglLcIVcOv5rZF1XitE4VlWTQGsqZJqTORoF7hHQ0bTnrQpvTUFY
 effw==
X-Gm-Message-State: APf1xPABsAs7jAMYYPnJ4XJmiDIbzElgAJqQsOI5JU2NSE3jWBdWiQrv
 MQexpesc4kNsNhqafJJ4DEFRTg==
X-Google-Smtp-Source: AH8x227mw+4t6ujuIx3oe8i5itH9r3ZEpQusWQIGAaId9QWnrcOqeSfL3nGnGvuX/SXdCqQZ7ekHgw==
X-Received: by 2002:a17:902:6c0e:: with SMTP id
 q14-v6mr11928675plk.445.1518469120953; 
 Mon, 12 Feb 2018 12:58:40 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id q13sm24629005pgp.76.2018.02.12.12.58.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 12 Feb 2018 12:58:40 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v1 0/2] arm: npcm: add low-level debug support for NPCM7XX
Date: Mon, 12 Feb 2018 12:58:31 -0800
Message-Id: <20180212205833.151019-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
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
X-List-Received-Date: Mon, 12 Feb 2018 20:58:49 -0000
X-List-Received-Date: Mon, 12 Feb 2018 20:58:49 -0000
X-List-Received-Date: Mon, 12 Feb 2018 20:58:49 -0000


Adds low-level debug support for Nuvoton's NPCM7XX architecture.

Change has been tested on Nuvoton's NPCM750 EVB.
