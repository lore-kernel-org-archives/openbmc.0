Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ha3XX5B6"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43G6sg4SCGzDr5Z
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 08:54:47 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id y1so2902751oie.12
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 13:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eT/rLYKOA4pIJOGXvPkx0pslyI9l5m2OlEnvOEvvSz4=;
 b=Ha3XX5B6Hmrknx8F+YGq/7AGlH7/mB/cV4/0RBNNwGbEqzcjUn76d33S6fYo4GJ9/G
 DfWFFRtvxrYDZs4STyYJeYTeh4M4W8m38vYYnXU1kRSz06NNHG0JEEI6rWOy89C+KDEv
 fuUht/KbtV4Y22XTUtcey+lwUoHMtSLKjywkToPnKeL/rzZBFOVajllcV4TVwT8qPrcg
 3tn3Cij0Ul5YST5bb08L2/jJ1lqxPwJ2r/vtvsdv6iF68KjD2rgYAoZygJFH8prhCUyB
 i5b2wTK2czwglNXHqySnQc2S5PDc0/BLqkibLOOePVe2xLquHmRQbzqxoXnFF/9xl9yd
 wTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eT/rLYKOA4pIJOGXvPkx0pslyI9l5m2OlEnvOEvvSz4=;
 b=ip4TvwZkGimye6EtBpyixUQh7XTqWtsXALol+cvL1S/Jw77T2gzJdgtbK5+BQc5Dpj
 RWv7I2rAmjKJGAbbRj3s+CzaFhd/Q4mLUU6cD/yftdqcRck9fBq2WjzYwn8yn0rb5CEF
 kaAYU9xT54/iR/Ea5QrITiyg/wC75gE+tacZxNLXc5Vn/9UK4fhteIoCECjFVHZIp4gG
 diXkoPdl5SoFuzeVtnN5BCr6aiLNUH7Zt7qmgf3ee71GH3lZQMLgEg/a4+Ij3SlG2orY
 12WcfQFeNHXsoGfhaqH5aG53aaefnC5t3aeqz7ez8EHIV2S5Txg28lYaciwMO1uf6juE
 V7gg==
X-Gm-Message-State: AA+aEWa0ID0UTDY/rOQ9e0XapqMu3I3DWncFoIzoKVXQxwKEN9BBMQu5
 5Em/oWbhmhjBaeLHH26RqmwcXl67vlNoiTzoEjotN1de
X-Google-Smtp-Source: AFSGD/V0/b4f0QowXoVw6iM6sFlNMfsQr7R+BmKDQ6195E8yz19AOkGUlVqAQ+Ru5CqptOXujTgOTvjRi5Dd/apD2Uc=
X-Received: by 2002:aca:b9d6:: with SMTP id j205mr320531oif.294.1544738084470; 
 Thu, 13 Dec 2018 13:54:44 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 13 Dec 2018 15:54:28 -0600
Message-ID: <CALLMt=o-AdAhB=w5xWq8Kq05sJiRtSktzGo9yC9EWb1K+-TR4g@mail.gmail.com>
Subject: Jenkins Job Refactoring
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
X-List-Received-Date: Thu, 13 Dec 2018 21:54:48 -0000

Greetings,

I did a bit of jenkins job refactoring today. Should have minimal impact
to everyone but just wanted to get an FYI out.

I put some details up at
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#jenkins-jobs

The main reason for this change was to be able to create and use
a dedicated QEMU node. Still haven't gotten to the bottom of
https://github.com/openbmc/qemu/issues/14 but overall it seems
like a good idea to have a dedicated QEMU node. With this change
I was able to bring builder1 and builder4 back online so we should
see our build times get better.

The only impact I see to users is that when your jenkins jobs
fail you'll need to do one more click to get to the new build-openbmc
job to see your compile errors.

Let me know if you run into any issues.

Andrew
