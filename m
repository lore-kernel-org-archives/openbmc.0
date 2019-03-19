Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RtMG48kq"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P4Fm3kFPzDqJB
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 07:21:32 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id q206so14634838pgq.4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IJWwLz4v7IDGi5ZIXX2BcziK1oazwr2bSb/B33KZ7Kc=;
 b=RtMG48kqkOpdNgSLk+BI7rsxyiYJa4rcIHIbgVH9k+SL8a62zGv8ECPiqKKwWUVAYO
 wsJcNfOhgBtrTPKh7n9BXuUIVnDgLxdmd2TpgNmyFeo8xsTx124YMVhg5SnnqI14Lckq
 hgcJudWPaBtBQdahA3GqhwNJv5KQLig5ZGXgwuDMvx8NysG+hyw5IaAA4le3AU2R3xjx
 BXdzm8eJWKWWscm4HUqc9J0IlYNLRDJ9O8KLro7LqVeO/VXld+cmZow4MVlXSGnuD7EF
 sxubOKtxmA0cznVx70/rciNkbJwutO6McVgXTOK/eTk5avN/huIAuxZuzG9scdwRvI5k
 AW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IJWwLz4v7IDGi5ZIXX2BcziK1oazwr2bSb/B33KZ7Kc=;
 b=b+SrL7+TrNFu2U17Tp0YJV5YcbqIHSU1SE7bGkRR27G73nFlJg9jhl8pecegF1x+71
 f0WsDj9SR8TwOT3iM3C3qVZaJxf58uOkpZKOBarrf/I+/gCH+x2zs4gqRs8yiTzRHfb+
 M/XfmbmJkVQK1IQCvq6ND7wm3yRruDlqf0/vjuXOA8R3SbhcnUaH5dr4d8yxcvHrOfh2
 DGlgISmNw7AbD5TeLAEN5lH7jaTD5zNi2mDP/mGgK44Dl2mdjlAkKR20aF7hyEFfD248
 LchOWEeCO2faR6MZB3/ykgyWF4B+IyUYQi898VkjsgXCiSWX3CPq3iI2WCkWFMZ3JBs5
 kUxQ==
X-Gm-Message-State: APjAAAW7N3T7TFwrZIWwB5KnJNiaHpbHEq7V9KA5ShJDCr0OlDgjyNjq
 xJGxD4cT9H/m2m3OPBQZmUtoD88jJ31pmb0TP+ZUhS2q
X-Google-Smtp-Source: APXvYqyYAd7W7Bja1bSfPphqF8KpqIOMrMPWF9mSJ3PVTFL/Y4C8oYGxXkhMnQO/JDZZ/XN7ZTAoqFSvmBawVmdi2z4=
X-Received: by 2002:a62:b25d:: with SMTP id x90mr8389178pfe.102.1553026888738; 
 Tue, 19 Mar 2019 13:21:28 -0700 (PDT)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Tue, 19 Mar 2019 15:21:17 -0500
Message-ID: <CANT4NrK2WC562DmkpFAHjhETeg5seo0nD1BWG3SiSPKwr_MoVA@mail.gmail.com>
Subject: GUI Work Group meeting TOMORROW - Wednesday March 20 at 10:00AM CT
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 19 Mar 2019 20:21:33 -0000

This is a reminder of the OpenBMC GUI Work Group meeting scheduled for
this Wednesday, March 20 at 10:00 am CT.

Web conference:
https://ibm.webex.com/meet/susantj


If anyone has GUI panels they would like reviewed, they can be added
to the agenda here
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Panels currently on the agenda include
- new Firmware panel layout based on user feedback
- Local User Management panel suggestions to follow patterns already
established in LDAP panel
- Network + IPV6 panel updates since our last meeting

-- Susan Jasinski
