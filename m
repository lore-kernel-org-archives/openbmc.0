Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="V78O+PZY"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Bsrz5YT2zDq6t
 for <openbmc@lists.ozlabs.org>; Sat, 15 Sep 2018 09:57:38 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id g23-v6so4855220plq.9
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PzRYCPLNDhSLN9d7Q63dndsw/h55l7jx6Z+NMxH5SBY=;
 b=V78O+PZYJJaIr36/UJePtEQxpXSNE3W0ft2VPfRPCfYRmyX9vOaoxvFmocTHGza8Tk
 7PYmmLxav/op9QUYnGYT3WP9JE4fRnWoQyMOJfT2Rk+C0TZDSHPeK5ix15KCuoYKwuUN
 r2lV201qcUgs3+ZhSZPSklzTz3SRjq8ASEUjGS1jUFpJepmPNdKZSh/FMdn4H2sRCSpd
 MrCbIm5LF713aOjDNk6o4xQjEoKEyhLNOZ8JP/nVTZjW8x74Af+kaSG+D8B+75nk3txF
 gZubNeQZ1SAWHmgOqH79wpKMAqE/l8V+CpLiUPKkRI4ZD3ldE17te7R9wRudYhrpSXN8
 b6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PzRYCPLNDhSLN9d7Q63dndsw/h55l7jx6Z+NMxH5SBY=;
 b=MgvH+gV2Y50j6Ipg0whgWsVTYoM6SRXNTbqHhJmzTEMufbhawfaFhTXHdNBlGpYerK
 Ns4itvAcf49enlfrYS7wJJ+/TkvHhw9GEg8Sr2/hLBzVJYkXTkcNXanPJC27hRfFkrri
 NImfBUvu5W7yxAVFAWZhWsSotxcCllNiL35ekvm674oypmEeg3NywkmABlUuw3sTnjMw
 GrlAGXVs+VCNgN0GY4Nfl+T6RVEL0nrPrOKzPKILA761BWOkkEmZyb7bavWL9KJwf3fF
 KsLXgvhSPxCxLpjyzol8Heu0bpQagQKJExuZow3bAj+Ee+8QwBHu4oChOzWWeeCeS9zG
 kRpA==
X-Gm-Message-State: APzg51CuetmXN27pRFmFKleyuDOZmhsbwPWPOFhFA4NwYl13jJIt2Td6
 xlgvLDDz/366WGE7A/t2H0Edfx/3mnTJHmTUeIekkA==
X-Google-Smtp-Source: ANB0VdaFwgJYXE6o1upmncGXFzeCrtY5AOBhT+m6QjZE7cw24UlFbK89F2Irjs8TjHxpOmPdkf54kacP6Ew4tYhFKX0=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15-v6mr14595091pls.53.1536969456430; 
 Fri, 14 Sep 2018 16:57:36 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 14 Sep 2018 16:57:25 -0700
Message-ID: <CAO=notxkKpZMyPktPjJ+HeYYuOnwcGMvV6ewdEvdMBUqioLvGg@mail.gmail.com>
Subject: New repository Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Fri, 14 Sep 2018 23:57:40 -0000

Brad;

Please create: google-ipmi-sys -- this is to hold OEM IPMI commands we
want to share with the community and vendors, but dont' expect to be
picked up by OpenBMC at large, similar to intel-ipmi-oem.

Thanks,
Patrick
