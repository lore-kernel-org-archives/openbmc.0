Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sCdvn4N81zDr3S
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 01:00:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pRWo7SCm; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id q83so81718781iod.1
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=/QqoqTRdtpaMzga0qIFMVOGWBsoj1kfPL4az1/diCLA=;
 b=pRWo7SCmwxyGlG257MbhVqwfK3hJ2XbPNie+yWZPpUd8Wg9hwYKJt7te70FyB53b1h
 RbPOe1eoFu98aGUu9alP2GSCk510WFeeHfpbpjve1k2zh5OJHXADq5qlcuFAWDePcoey
 L8PlkAsFsaU3xb8VrxmJvDZy6mlAf+boVbzlF4ISo/YVHmMdlpTij9hT0GRrSq4D3kWI
 69C6ts89PCY29zfTW3W4QcM3RagoQ7cIr47TPldfMzcIInmhDENyz/TQgNvpzeXxfrKP
 gB5jpJEqCMW6gYpkngJ0tEriPo2uUuPNc1zkc3sPygs1sgxVr9R1FfI4HqJv9qQrDZBO
 aqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/QqoqTRdtpaMzga0qIFMVOGWBsoj1kfPL4az1/diCLA=;
 b=QHp4qZvPfsizt5u94FI07kPeqIEC23LxZwIWPU2/Z5LO0ErVU1b64rkTnrtVyh0biR
 EZqTB4aUXD+ekK7k4PpE2g0as6tiY5PyKTVQLm3fsRB4uCS1QU8WHFpYTIoQUGOWYqE2
 5uieWOnSfn4PzW4EI8RCKIE6dcrBiaftI4LzHwi5q7R4y0TyhYGxJs9dCIyFlYIYJsz5
 YViwEdgt7EaSh3FUZPDEHH9DdMx2nv8oQuTPw+rEVh9DcnO1cTb1B0EBZcA4Hiyeprax
 r9dattHANYSDiSJikE/ANlIyG2lNQv11M8J2GAWiX+uLPojXi8Cb7V4LLTU9q96+rMgj
 jChA==
X-Gm-Message-State: AEkoouu5AX/mdEw1RJh/A8uFZmZir2xZCuk4tKaSvnvUsqsyMVF5dguQPKnCnLxQpAcNKmN4znT/dpYokcJGwQ==
X-Received: by 10.107.7.94 with SMTP id 91mr38904609ioh.43.1471273219147; Mon,
 15 Aug 2016 08:00:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.140 with HTTP; Mon, 15 Aug 2016 08:00:18 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 15 Aug 2016 10:00:18 -0500
Message-ID: <CALLMt=qweXqtGwNAA33EEzNVj=117wbuF_CDcr8JBeORFusU0Q@mail.gmail.com>
Subject: Robot Tests in CI
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2016 15:00:22 -0000

I've enabled running our robot CI tests against all of the
openbmc/openbmc gerrit commits.  This is against the basic ARM based
QEMU model.

Reviews/Comments (or +1's) appreciated on the scripts to do this:

https://gerrit.openbmc-project.xyz/#/c/166/  (main script)
https://gerrit.openbmc-project.xyz/#/c/176/  (minor change to support
QEMU in docker)

The jenkins job can be found here:
https://openpower.xyz/job/openbmc-test-qemu-ci/

The test team is working on optimizing the test suite to ensure as
much coverage in as minimum amount of time.

Also, I've tweaked the build-setup.sh script to support ppc64le,
comments (or +1's) appreciated here as well:
https://gerrit.openbmc-project.xyz/#/c/196/

Next on the list is a real-hardware based CI job.

Andrew
