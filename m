Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p7I009Hc"; 
 dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431SCn0T5bzDqS8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 18:11:32 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id v10so2471400ios.13
 for <openbmc@lists.ozlabs.org>; Thu, 22 Nov 2018 23:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6g3b2FmCgxS8JVNz/QahW/2olf4eHzUBadXvdgorGJk=;
 b=p7I009HcxkXIUGd5FmHtW+OCzzxNCiRjnEvc1IKhDo7f3ZNpVgXLC5r7I1aXOX8KED
 6ytzE52qMcRb20pWOhODsFy8rRiifoSwwKZAXbgYlbJHihQWg0ietWt8yaCrbYTSshdo
 W7JWFIgK5nH7VQ61x65Xx+53VrPXutjChQUXlIOKq2oi2D9ICoAjBH5Z4Z+wehhhA2r4
 Nzqpzvbke+/T5StYY+jBAC9cuTgFsnUMeM1QjCyczdV1/qQYMH8grkeY9O10LrSNu881
 XVasNqmQLE7N1aMMGgNlg4UbR33AW9ydIKeSVGPq5OKDozV1qKKHvpjv1w/VOOfjKxeE
 1Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6g3b2FmCgxS8JVNz/QahW/2olf4eHzUBadXvdgorGJk=;
 b=VYXy36T+S4ajqEa1OEoSsYbJX/o0uW9m1IDFFfCxMz38Mn4ze/GZKjvwwWAND4eivz
 MH1PDW8ZGTh8toeHkxlXASjOaKZXmOK4OD6G15/jfsG/Bo0wWul2jYmcfUlM8ZtllOLq
 s81pz0CUPvtX5JipOHI84+ZCH9xQQ6NdfC7gmhEtElav9HdG/Mp3J8HMYNBCwaw54HjJ
 x8i5jaI8Sm870XHe2NYFRwwwPvAv4PJ5IjN5eFMHvZx+zxpOLRCOOhfnyO1wIMMQpcT7
 j4oK6wKtrdIxGoe0oohuFTnrwMlNjdx3Ap6ftw3iboq2r4pCwlBrbX3IJaOcOuwjwUJ1
 bpvg==
X-Gm-Message-State: AA+aEWa0xokMi0jwcbokaFanidDQsWR6yDSoTA31JvcBM/2nOozDxqlM
 +aH1DRAhc5Mb5Pk5AHwA4WeR1BtQ5saZ3uApekPmn8poyds=
X-Google-Smtp-Source: AFSGD/VKatyxdArlLN67eMOO/HGulfBjx8IT246AgyEP6B19ag6nnva6e27KMxoQaB6MKJca+JnjBdGvibEBgobaWn0=
X-Received: by 2002:a6b:ba0a:: with SMTP id k10mr10904198iof.40.1542957090094; 
 Thu, 22 Nov 2018 23:11:30 -0800 (PST)
MIME-Version: 1.0
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Fri, 23 Nov 2018 15:11:18 +0800
Message-ID: <CAHkHK0-jQe7SnUcmNeNT2i9DyOgbUALKN=RFePWkUXbHSvF9jA@mail.gmail.com>
Subject: phosphor-hwmon failed to start with aspeed fantach sensor
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
X-List-Received-Date: Fri, 23 Nov 2018 07:11:34 -0000

Hi all,

On my board,when host powed off, the fan would stop.

then,phosphor-hwmon failed to start

debug:

cat /sys/class/hwmon/hwmon0/fan1_input
        read error Connection timedout.

edit the config file,
        LABEL_fan1 = fan1
        REMOVERCS = 110 // 110 means ETIMEDOUT

when host powerd on
        1. echo add > /sys/class/hwmon/hwmon0/uevent
        2. phosphor-hwmon started
        3. host power off
        4. phosphor-hwmon did not exit.
        5. cpu usage of hwmon-read would be 4%

when host powerd off
        1. echo add > /sys/class/hwmon/hwmon0/uevent
        2. failed to start phosphor-hwmon.

I found when phosphor-hwmon init

   Sensor::addValue would read fan1_input(there is no fan1_fault in sysfs),
   and it caused read timedout unexpection.

   so init failed.

On my board,I  want to boot the bmc with phosphor-hwmon when host powered off.

what should I do ?


Thanks



--qianlihu
