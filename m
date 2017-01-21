Return-Path: <xow@google.com>
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v513t3s9szDqVt
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 12:59:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GhyIX92U"; 
 dkim-atps=neutral
Received: by mail-qk0-x230.google.com with SMTP id u25so28558558qki.2
 for <openbmc@lists.ozlabs.org>; Fri, 20 Jan 2017 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jMcDfYxQb52+rh7CBY0/GVWazTuGR+QlIMfZvoDF+Cw=;
 b=GhyIX92U9cMouVASfLLSvxQFbMcUYX7J9GDQLBJm7ACoVET1LZtjrF9cnNz73Bkuct
 XLnOmvqnWtZJnz4RFlxFm9xNUg3QPXhjnxc4JmRHB6r1ZRYakz8wd8bSkAev2E+re/Hj
 arsXx2KMVTpVVVBkP/y63vU1E7+nPRkaKk9wpte+/pJNskjg/QZVW2QtTw8VHcbSuecp
 j87CbnYzul4fBLeW5figVK2wnwQtIAiadTKezRuK0JcDq7vQr2mHjdlmHB5j5vq9BdRu
 ExXGFqfyUm85uPnH9pvdhZBccc7k/JeZXvfMq0p7m8VXKpYgq/Uhml+aUtycLO0GKykG
 yp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jMcDfYxQb52+rh7CBY0/GVWazTuGR+QlIMfZvoDF+Cw=;
 b=rRXNJOW0BpYJFJ8nWc9vhZMnq3QiMkL1Z/GdcgijTBkBCS0AKMYDWoSJWcHM1YVqQA
 ibbWhfxOvMTbfmbngNS8gfL8gfi/Wp1BXe4HstDDRiUAdom/zzC0/lM+IyLNhqxa08Fs
 0lKSojNRsiWqTJhUqpsl3y88bMLORvKJRWWk+J+60VqDA98aU55jQ4MVjJFTV04WTBw2
 32qgx1EMPTIJCkvZvbVd2I4Ao8jrwU3g8GnedYqOoWuTSrPW4n/IE4gjoL6Fc+2al7aF
 DTGV5gX14fthOd1UvIWaxZFnXB13q6NMfb211cbGZQ9W84RzOf7yPKtaKQ/Ek6v9r3bf
 u0jA==
X-Gm-Message-State: AIkVDXLmgfN0ME2tK4zPyZmP94LAOuq61bw99Cj4Wutj5bNcosoCi51wCSucNk7LImbFr7r4ixUGu1GbqFdZllgx
X-Received: by 10.200.57.27 with SMTP id s27mr13886510qtb.230.1484963989248;
 Fri, 20 Jan 2017 17:59:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Fri, 20 Jan 2017 17:59:48 -0800 (PST)
From: Xo Wang <xow@google.com>
Date: Fri, 20 Jan 2017 17:59:48 -0800
Message-ID: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
Subject: Does anyone tftpboot the userspace image?
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
X-List-Received-Date: Sat, 21 Jan 2017 01:59:55 -0000

Hi folks,

I noticed from this discussion
https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#2738
that kernel developers were tftpbooting the userspace image from a
obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.

1. How does/did that work? I guess you needed a custom init in the
initrd to load the u-boot container (?) instead of from mtd?

2. Are you still using this? Building the extra .cpio.lzma.u-boot is
kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
mkimage' every build, and it can't be parallelized.

I ask because I mailed a change to remove those image products from
the build, then followed the 'blame' to this use case:
https://gerrit.openbmc-project.xyz/#/c/1957/

cheers
xo
