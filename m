Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VnZewOPB"; 
 dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QS3x0TY7zF38q
 for <openbmc@lists.ozlabs.org>; Thu,  4 Oct 2018 06:17:16 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id c10so4036853vsk.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Oct 2018 13:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u5qZojbxrmHjmEXHxuKGevx5pOjwH4JcqZb3tepL9bs=;
 b=VnZewOPBqVC7JSoA+eVKjn6aPkFrt6ChvIMMnkr+M0xhmgKzm+avKRxydB1hi6CcpW
 VSrjyxCpvm3t6yZu7s4wIeOudBUaSlke7PGa2ISkVHKWlRD9kunOvfMj6yx9oTVwK3zg
 qsMZ/RallBLEphWtA2Kyg8iD8yxzvYoOe5v5bM+KdK7UEhm+3sCpW/di/t8twQVRxpbl
 feGNuE/xKUPdndwW8dfumt6y29OX0P5PvQhh8Wb9Y3ShUixOiZVCXMDVksmNR2to1vOE
 FU9r6EpzpDCEgmSJKlvNMagyQmVXBxfHxJUpwYtG9J9SkaOxkjWcO35X1sQfreJpYF4M
 t1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u5qZojbxrmHjmEXHxuKGevx5pOjwH4JcqZb3tepL9bs=;
 b=QhDftjFhPtaP6InD4lhJHGBAfkiQ9evRAI6B0294tQADNvj9djWXvwm+fz4K1+sEh6
 S9Zon8St7C6hDQopoMDmajCmPVNpMo1C3l/32Qfl/OdiWpxxNo+vJg2oGJ1BCiNYnMp2
 lgFVMF3b4SOvRr/RvuWWy5FC2c9bqUAbbcpJ1ojPDNbSeNL7stj4Jo9v2EukRYKshOTR
 zda2oGwINskGCXB5RsXbzrnl1ZKd6sYLyDnjYM0N8vdhyqjMV8PXZ8L3bAzLVNk+hmD4
 ijo1IsexcPgphE/Ej5r4r1FE83m2eJebN/5Ro/XkXn8zCGENCX6FhQViCVei6ldXPdjL
 Oq4A==
X-Gm-Message-State: ABuFfohsKP7/5/t+RgmNU+HC8GxpHhoWgXs2FkoJehbcQVknsNfacvxi
 /ArCr5rh5a/wE8QHyaFcvJpkfX8x6A66dUgf95CvbKK6
X-Google-Smtp-Source: ACcGV62l5g9U8RvK5A5/pSIOnPbzpn5iPnvsy4eSqtcLXzMz1fcjtcoGOHI5tRf+KOsnknysBwAwnOgcnnFVJiDnaow=
X-Received: by 2002:a67:e28f:: with SMTP id g15mr1241553vsf.115.1538597833822; 
 Wed, 03 Oct 2018 13:17:13 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Wed, 3 Oct 2018 15:17:02 -0500
Message-ID: <CAG5OiwjdnjXFOEGhGMcPi3j9HfOnr6oTFuvvUhmJ+8YnXPFPXQ@mail.gmail.com>
Subject: OpenBMC Community Best Practices Series - video and slides now
 available
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
X-List-Received-Date: Wed, 03 Oct 2018 20:17:18 -0000

Hi all,

I've summarized the presentation I did earlier this year for the TSC
and recorded a series of videos running through the slides - basically
on how to be a good community member.

They are linked in the Presentations page in the wiki:
https://github.com/openbmc/openbmc/wiki/Presentations

Enjoy!
Kurt Taylor (krtaylor)
