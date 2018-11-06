Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lpXT4nnn"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qJ3V3pblzF110
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 05:29:10 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id w24-v6so6601353plq.3
 for <openbmc@lists.ozlabs.org>; Tue, 06 Nov 2018 10:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vtUuZaR9hYrStNd9owv8Gp28aKlD5j8omd50NB9Z3FI=;
 b=lpXT4nnnTQEFU2Q1fRSxTqxL4zbmjboioECkJQpSNaMwDo3d5zeQ9RdKE1scpIemwu
 9Fl40WSQNqc620dqLXtX97Y2OBbbIlUfgKkTUS7nZ9/PwQP9MrG9opncbs1Uii22Bu3H
 dbKQz0L9S6IRYwNgu9wOBf12oOehFAzi2av0llG1LrYIL6lbnAGcbHAMfWA7PatVYVGb
 KNp9OzRv2kNL4jLKm5lW+WnvZ96QTaiP/PcuzREw2ZwfIBDNyyf7EvysAj1m6wacJTg2
 fmKemaTGFkhuPW0lTIhVFOFVxoQAlYAzXq8VC5nGbpEURflnVv3+EWeWe8o1axGXWyuI
 RyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vtUuZaR9hYrStNd9owv8Gp28aKlD5j8omd50NB9Z3FI=;
 b=FC7JKPq+lko05B8YjGcyrL/4eyHqSQ4pO7vd2y0I6kMnKVKC9O+9ynLn43yTYsOHp2
 51SZapL7S2Ea1nM6JkkekkIMcAQH6+ZpptLaFQKMWr+wJOwlbSvE2RFDZpjTnuGhPDzI
 efkbacBDrez+dIPZfzFn0HN0rAL4TSBaW9NjJZJRDeE8k+laRel9MKOHS2o1BHBkam/N
 YcYsbU8ofZc/ND9pQo8gBGoEo0kC59D7A0XGr1zs68ppm7Xdfs35DhAs//8+tOVv/6Wo
 yyZAn0FaFFj7SjGbFMaOm4sdjer/2ol61W5FfwrhHVaPJbncxRoNEgKFXItf8l5DDjFS
 orDQ==
X-Gm-Message-State: AGRZ1gKdyjobrXGvAaL9LiGGphE/AfMZ1/Fgb978HLmTTDRnzFK+/1lz
 +2ddiFfqYaPDFB4s43smraTav9X2GVRrCqD4VezrbQ==
X-Google-Smtp-Source: AJdET5f66/VDEazA5voJiJBrptd3YJKNPAuCy8Q2ZvMwvqeHE0sDTbK0rVvVzhiyjWekoosWpPCW3G+L6q4a4oO8hjk=
X-Received: by 2002:a17:902:7e4c:: with SMTP id
 a12-v6mr27066208pln.149.1541528947977; 
 Tue, 06 Nov 2018 10:29:07 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 6 Nov 2018 10:28:56 -0800
Message-ID: <CAO=notwujLvGAZ6iRmzf_msw43333Cn6kWx1UtfguDVQ7UNyhA@mail.gmail.com>
Subject: Deprecated & Dropped obmc-phosphor-license
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 06 Nov 2018 18:29:11 -0000

Community,

If you're writing new recipes, please don't inherit
obmc-phosphor-license, but rather point to the license file in your
source. If your source doesn't have a license, you can point to the
one provided by the meta-phosphor layer where appropriate.

Brad,
The topic for this should have all the patches it needs given the
state of openbmc when I started a few days ago.

Patrick
