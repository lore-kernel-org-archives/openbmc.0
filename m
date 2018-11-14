Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k1H0uIDk"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42w1FN5n5qzF3XD
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 21:39:01 +1100 (AEDT)
Received: by mail-it1-x12f.google.com with SMTP id m15so23113931itl.4
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Gx5Jb2zSRRi83AB4mM6WxJ0anqnqfw5YKFoWRBrwaaU=;
 b=k1H0uIDk+LHTjtU5ksELdotMyr6PcVM3wj9JjPwMZ8k9m6ZSErN/t3acH1eCi2B+Z2
 Eyd09zI8XLf5Lu8mkwEGIDGhQCCJ0xCVuJJG8bo9Xqiu/5BspjjS+sYQ8FZJ0GS9q5/L
 yqD8YIUhqNwlXYKid947xhz/t4VkDwtlhTMzwplBw6j1tzbZhgKC+k7CvIFpeLB9Zg59
 Xasr9XrJHTjOlEH+4AOJ+HcoPVWGsqYwbB1Ov6a/yvWFTMNYKHJ4HiTBZBKIoK1tD4KN
 OrYtOoT4DrENbHPTGtn0OzD8x6uyNy+cKh4qowaAjLYaTnZz95xO1V13pZFfDlNYGfoK
 W1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Gx5Jb2zSRRi83AB4mM6WxJ0anqnqfw5YKFoWRBrwaaU=;
 b=iYsnIvwtpygVtncUOFcS042QVCegyuCf9EN2jtcR6tZP/0BWB/wJbpuJD+7v8z+jbc
 sxNMWL3o4J3+zsdQ4zzkilpZHMVFQcj4K7PIpugFMFTsAnZWIz/h3ZDieZIHEbCw83CD
 qTc9HFt5CuZcO0ht3RjRzvg9gMf1ZxQKxgWnl3ciEuhyAhQzE24a4AQ1OY3/MWUP5Lbg
 JneWAoFngJtAtpD3XSxMn037SbJ8Qe4z9VnK95Hi3Ae5Xtf0CxUIn/G0h4A0AOJO1vSX
 B8V7FztTz1hydFjZhHFcc81P6HzjrPKU1t2GTMaNDgVmY8XBfkK1LmImkSaH/Bzd2kCG
 4aLA==
X-Gm-Message-State: AGRZ1gLCze4tDubjvNyko86QQlo/CmACudwV0FREd8ira5EfJKxFI6Rb
 oVPp4vKGkq0qojn0mVs6vD90NVSIoDD0Q+KQABGXmJnMz9s=
X-Google-Smtp-Source: AJdET5cPjg21STueBxOU+rrcEMd23vf/+43o1DXPtUEkgQyqrpLTeqoJidrmIB4EH0PtK0Q7d/wQrmWibHpGgXjwEdQ=
X-Received: by 2002:a24:41aa:: with SMTP id b42mr833074itd.148.1542191939273; 
 Wed, 14 Nov 2018 02:38:59 -0800 (PST)
MIME-Version: 1.0
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Wed, 14 Nov 2018 18:38:48 +0800
Message-ID: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
Subject: [HELP] ipmi-kcs didn't work
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
X-List-Received-Date: Wed, 14 Nov 2018 10:39:05 -0000

Hi,

I add ipmi kcs node,but it didn't work

here is the patch for dts.

        lpc_bmc: lpc-bmc@0 {
-               compatible = "aspeed,ast2500-lpc-bmc";
+               compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";
+
                reg = <0x0 0x80>;
+               reg-io-width = <4>;
+
+               #address-cells = <1>;
+               #size-cells = <1>;
+               ranges = <0x0 0x0 0x80>;
+
+               kcs3: kcs3@0 {
+                       compatible = "aspeed,ast2500-kcs-bmc";
+                       reg = <0x0 0x80>;
+                       interrupts = <8>;
+                       kcs_chan = <3>;
+                       kcs_addr = <0xca2>;
+                       status = "disabled";
+
+               };
        };

+&kcs3 {
                         +       status = "okay";
        +};


The device node /dev/ipmi-kcs3 is created.


root@sanjose:/tmp# ./kcsbridged --vv --d /dev/ipmi-kcs3
Debug logging
Starting
Registering dbus methods/signals
Requesting dbus name: org.openbmc.HostIpmi
Getting dbus file descriptors
Opening /dev/ipmi-kcs3
Creating timer fd
Entering polling loop
Processed 1 dbus events
Processed 1 dbus events
Processed 1 dbus events
Processed 1 dbus events
Processed 1 dbus events
Processed 1 dbus events
Processed 1 dbus events

but there is nothing output.
