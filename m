Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::130; helo=mail-it1-x130.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rTUKOFQa"; 
 dkim-atps=neutral
Received: from mail-it1-x130.google.com (mail-it1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43m9tR2qKNzDqLf
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 18:40:47 +1100 (AEDT)
Received: by mail-it1-x130.google.com with SMTP id i145so9189150ita.4
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3fhPAywFfZUI1t7yNKb7Zs6Ojl55FJ+9Y5DUQ7ZDLW4=;
 b=rTUKOFQaWJu+9Lz0ilLvUdTAk0kLlGqLuXxU0a02Jl+hvvXh2i6CElnQtX9DdVeViH
 WKdcz2vXqLF0eUr29vMSaZmXO3Dxo/f3hiqewF/aDxbr+S97zigFnYH9rlQaIXwkISC4
 gnJi8oWJGt9qwAV4P0teAUutBeOrRfgMJWd4oLHsEwRbYWNwnJ6FkA25DBlUMHPuUa47
 xaGvZ22gjBE7qxlH94hNyTXZSv6VDmUeUVc0mCjFRBLcvheX4HMJ+gd+GxUz4mpdVXhJ
 t/kVwbP4ZUZl7d3/qPl72zjglLMq3xEWnv+eSOYZhYyd4LcImJUVJ2mjRcbDTtely923
 n3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3fhPAywFfZUI1t7yNKb7Zs6Ojl55FJ+9Y5DUQ7ZDLW4=;
 b=GZTbPTC8o3l2cMxuPVX62af1FNnnDshlDG4YcyemVHZuqWL0Du8xinwnXmZQS2ZIBy
 ySiL74SF/2ydSNFnLFrZPbqJ5nepgQk+GIn44I0Rxw2K0kBHnmafMwsbJf3cEF0q7FGm
 XMKiDDI7u2C8j1gfTkvsUx5jxIRcue/Di/yRLEomr3pxYOqMNSkCPBGwEl/YzufttzH1
 MxH+BAb5Bc19lKFAf+aZTFX5im6bDT50Wmf3iPDBlrW54cwnq8+fCsxCfTEUklBnvx5l
 3lqmMKBZ0zziyZreHDDFj1YWri76WP5cWFFbsOAnSr0pwhyAADKDhqCjy3jXGf2qoc6x
 F8dg==
X-Gm-Message-State: AJcUukczyNa1lbl/zO3xP9sVcslQ8RRKb8JNZXMBvhVSbR8nCJCu0DG8
 YtVXEJTO/X1c7YulcNuIVGxdFTLvh+edFkZ2hS4JTlvYSyM=
X-Google-Smtp-Source: ALg8bN6qwb/E+PwwpMOwJUahEPCVQjMJhPWVHCXDCIPhoew2+LSBVkTuavIuTEcCD8JmeE+fbTwEH3o5w1CbYgZUqEA=
X-Received: by 2002:a24:4ac3:: with SMTP id k186mr2891789itb.76.1548402043059; 
 Thu, 24 Jan 2019 23:40:43 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Fri, 25 Jan 2019 15:40:25 +0800
Message-ID: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
Subject: Romulus to use Virtual PNOR
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
X-List-Received-Date: Fri, 25 Jan 2019 07:40:48 -0000

This email is to notify that Romulus is going to use VirtualPNOR feature, if
no objections are received.

It **impacts** to existing Romulus systems, that they must do PNOR code update
when the feature is enabled.

A little background on this topic could be found at:
https://lists.ozlabs.org/pipermail/openbmc/2018-May/011822.html
https://lists.ozlabs.org/pipermail/openbmc/2018-November/014112.html

I did not receive any feedback, so I choose to use VritualPNOR feature,
which has below benefits:
1. It requires minor code changes for a system to switch to VirtualPNOR;
2. It gets full features, including PNOR version, code verification, and code
   update via new interface;
3. When OpenBMC switches to Redfish, it will get Redfish code update for free,
   because IBM will implement Redfish code update based on VirtualPNOR.

The related changes are:
* OpenBMC: https://gerrit.openbmc-project.xyz/#/q/topic:ubifs-pnor-for-romulus
* op-build: https://github.com/open-power/op-build/pull/2578

Any objections?

Thanks!

--
BRs,
Lei YU
