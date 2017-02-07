Return-Path: <xow@google.com>
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHzG71fdvzDqDJ
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 09:16:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xn5oc9uy"; 
 dkim-atps=neutral
Received: by mail-qt0-x229.google.com with SMTP id k15so149057353qtg.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Z+pxwyslhBWJc9Df8qOSK+ZM43I0IRNLoY3CAue40p8=;
 b=Xn5oc9uy87Cc3c3qB5wyEOubdQvLUhL7ROE26KsNFzFsjSe93ApCzQKyuMYFWXZDfa
 bF4rGEe1S9+DrMuP1d2UeWQriYiD2o3TZfNbMWmB8GxXH0pLuEyPC+E7+WQeCrkEx3US
 q0tVReLWoV8ljYjX4sc1y6W24fE+Nz3wTO35Avqm8hRaF28HFSMH/s9MENKWgqcUfHo6
 3Csvh1LyUufpKVlYWERBAGxaw9XJbUiyaGGoW07wDsYCi+lLe5B674v+tZ+WVWDgd4vW
 jJPQykCgt7t9XjX7cIWF2GX/avFRl1W/QVluGtddMBi3ohBvEuGeqS+s2tE2/AciNpmB
 cd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Z+pxwyslhBWJc9Df8qOSK+ZM43I0IRNLoY3CAue40p8=;
 b=F9epNbnTB07thEZNggbMWRZMCLAntkN46XYG8o5fxwMLDbfYQE8BGSdiukNlBkgiQf
 gX2SdJeIqxMa5evVxIjz+UsnVPyezOM4fODfgQtRgJ4UVtbFO4Q5ZtIve7Yz5cjKJM1r
 QijQzU9dEX0/iLSAtsm9YVznLh47NoVXhWiDVLj39tXGHjTVPb8aX6seYvtBaTuu/Lw+
 SDgZTrK8aONSTzbvVsxMV5kH7zDKf9vpWXQH9sTLurbX98vW8kAYO+7FTnb7/cj/Y3Ts
 j1EksjFWHlKR/NiCFDILocwT76DeA1LpdA7V3XI94ZiW1mxDJSxPGsMKjC5stloqDTAz
 m5jg==
X-Gm-Message-State: AMke39lS82IZTGyJ0Rr1T7HmpH4Wrg1ETTX0UBkJxL/KTG4RP3ED3TBOdr11c3DUcrpyb+ceI1rFTJtmAIgfJ6G0
X-Received: by 10.237.63.28 with SMTP id p28mr16708647qtf.263.1486505804664;
 Tue, 07 Feb 2017 14:16:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Tue, 7 Feb 2017 14:16:44 -0800 (PST)
From: Xo Wang <xow@google.com>
Date: Tue, 7 Feb 2017 14:16:44 -0800
Message-ID: <CAPH-5w7reqNuPcbf48F+beqFyK=Te5c9rd+0hwvqt4nD0MQXqA@mail.gmail.com>
Subject: Patchwork lists submitters @google.com as "Rick Altherr via openbmc"
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2017 22:16:47 -0000

Hey folks,

I think Patchwork has decided that the email openbmc@lists.ozlabs.org
now maps to the author of the first patch originating from that email
(Rick Altherr @ Google).

So all of the patches from @google.com proxied by Mailman are now
showing up as authored by Rick:
https://patchwork.ozlabs.org/project/openbmc/list/?submitter=70875&archive=both&state=*

Since Joel is presumably picking from Patchwork to GitHub, the git
author info might be a bit unreliable. You'll have to peek at the
Signed-off-by: for the Google blames. :)

cheers
xo
