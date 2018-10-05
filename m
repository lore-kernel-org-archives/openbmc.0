Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HMZZpYRN"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42RXbR4vv3zF3Rq
 for <openbmc@lists.ozlabs.org>; Sat,  6 Oct 2018 00:44:51 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id 30-v6so6965878plb.10
 for <openbmc@lists.ozlabs.org>; Fri, 05 Oct 2018 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2TllLE/1gVuC7Xr+c3peyCPZcLZW+4M2oUJqnWELjW4=;
 b=HMZZpYRNqflaBu21P1W8QK+ymqHFGra9z4nebFQZ3hNWNeXGVIo1Vea+je0/Qwv8vX
 4EJya42Vc6Pq9xgrLeDK6uxXkcwISywOIiOTsVj4I8cIFmHgklufW3DsC1NamzR3zLmi
 hnJQhmbHz6ftZkDEEM6Svygp5AyC+NwJCGHmpg6QhygI1+FwXzETibgXUs3aaDFFIT7K
 Nx5xkoSL6pWn5E5BCd1KO293J2zBdTWjgtEx4woKxVxbGgLHSU6R94O5YGhFL3+8WVeb
 XL0gIrUFKIhohpRv8xb8679Lm3MNE6y/z+IityoKzCgbJmybE7OCP/W6sNlm8C3ZYLDZ
 Qxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2TllLE/1gVuC7Xr+c3peyCPZcLZW+4M2oUJqnWELjW4=;
 b=nYQQ6+QfqQC72WY4YF/R/V7qIsV0TJ2iEC6uSFRmFujkfLTi319ueH5HZHav4/No4z
 5Ea8qZPO9/XEpy2Fuhoj2y9NDUVeb2azAVe7ivgCtEpwap27YRJlXvJ1XKF8x5fesL7U
 DMoeJV3opT5kaLCpsE7R34B55KKjbL9p9E58Zqg2hCtwZwxpC4wsBC1UZEuq5JFO4Atb
 hGFHH3Mb0KDrJmrN4H1/RLAcWM7drhWVRoKUHunwR8+xZYC9vuXZgGSm7fThrHbao09B
 5Hjl95mh2PYeAqelVgJDWp8Q6Xe4VQwSsJ/ZVfWn+nCFJJ9nO3VvLZPbUlIlIZ40xwo8
 29Cg==
X-Gm-Message-State: ABuFfoiuRURbfoHawMGrBMd/nHajVwLBjZ4z5gBcRz4chr/iQtT6OcSY
 DoGs6DtkAoLpydzfHbwzC8ciO6f3ZP5GCZGV5HgsbXDhEFoCfA==
X-Google-Smtp-Source: ACcGV60kPF2SM1gthIOm5MuJbt3/wDANfRLOHpGr9WBvMyTQyMk+PxFPU1i9vehtiF74jhaQ8gxdHsYZWBpO08jcXUM=
X-Received: by 2002:a17:902:124:: with SMTP id
 33-v6mr12053334plb.205.1538750688794; 
 Fri, 05 Oct 2018 07:44:48 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 5 Oct 2018 07:44:37 -0700
Message-ID: <CAO=notxnKj28mUG_GtN-7aBcQvdiO4RaTynGEe8Zc3awb31C5Q@mail.gmail.com>
Subject: In-band IPMI Update over IPMI Blobs
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
X-List-Received-Date: Fri, 05 Oct 2018 14:44:52 -0000

For those who have been watching, we have been upstreaming how we
currently handle in-band updates over IPMI/LPC/PCI to
phosphor-ipmi-flash.  However, recently we also upstreamed a generic
blob interface, phosphor-ipmi-blobs.  Until
https://gerrit.openbmc-project.xyz/13620 it wasn't a suitable
mechanism for the firmware update due to an inability to do a clean
method mapping between the protocols.

I've written up a proposal (downstream for now) to port the
phosphor-ipmi-flash implementation into a blob handler that just goes
through phosphor-ipmi-blobs.  The thinking is to have more things
leverage the generic blob handler instead of having a fully separate
OEM IPMI command set for everything (although phosphor-ipmi-flash goes
over the Firmware Netfn).

It's now a pretty trivial transformation, and once the design has some
age downstream (1-2 days :D), then I'm going to send it here for
review.

Unless there are obvious objections.

And as food for thought, other Blob protocol use-cases in the works:
 - mechanism for downloading core dumps and crash logs over IPMI (no
network access)
 - mechanism for sending commands down for special hardware
 - mechanism for reading back configuration files for whitelisted debug
 - mechanism for randomly creating large files such that the flash
fills up and the system never boots again.

Patrick
