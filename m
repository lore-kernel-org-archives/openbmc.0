Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oVppqRtc"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h8q44VV3zDqpf
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 05:38:55 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id g9so6723182plo.3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 10:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tAMA//uTOvHa1/j3WSDmIKCl2tF1yKeOtTVkmhmngdQ=;
 b=oVppqRtcA6JtxdZ5H7B/OgZ1pn49xzFNS/LXeeoL9ffTNt1xd7QXRN4GZ0DHzPhI/0
 BLd1iItMAOvsZ/3HAE6zPE/WBZxKzj2BMAF7NbTdGQ18klWe+1dODVLQsjYxhtShHDlg
 AJ3dqoBNtWyfthbkHe/HEjYvGdWTj1/m3Fo1AohUIf/YcghGmpuFwmNV/eHw4t2k+iFs
 msPf0g66RqFFgG7eRhI3ColVRVZud75VAW/jEncHObjuXpredw5L7eDzrE8taP/Ezpjn
 EPE1BR0bumDNfB+bjxSbBBLSCFhFRwGWzkIFujCR8ZIaHDr2iz14pNVrgki3elAHSw25
 Fevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tAMA//uTOvHa1/j3WSDmIKCl2tF1yKeOtTVkmhmngdQ=;
 b=eNkC2pInR6q/CC7ApkCpuOfcMp2S7q0cThyvUcxC++VPrEu/06PqndCPI5LF/aStpd
 T/YKO6GYVMQB85uO+2RIAQMbfM8V1XAN5Df6lN9DblqUfscTioom5/lpxZlq8VTXI56y
 VAWFZDiyQ2FLJXNOnvAeZDGE5AV8mXNjuw9GaXrm/fy+BR0deNIjghEC6kHamHQ0dNrl
 2Ze5j2uETL/5S5GrucXZg7I62EETR/FzpQNzaehugi6Y9NdeHEzEFdE2GCI8V9rmhO6Z
 G0MBVbs3Tqz2W8CHXCk6+ORpzs1NdkObBGM9AGzDUAzZv4mUEba9AkqAIPgv78x/yHRE
 gBMA==
X-Gm-Message-State: AJcUukcJbVHz30NYs9k+IJ9qvKhCKIPKzmHwKCJmxbxeRURgXvS2Ovk0
 bHS1g0wO1HUojyQU+6NJI7vyJwd5779t1FTVry3ONtj9sjXwYA==
X-Google-Smtp-Source: ALg8bN7RU2YEBNQJhILzeSqeggmt8yG0OyBR2qfZ6k8fUXd4BTthVSr7xhuHUXsZNQ6H/iFLPJJa+AJCR5l+PiygN1Q=
X-Received: by 2002:a17:902:1126:: with SMTP id
 d35mr19161978pla.1.1547836732759; 
 Fri, 18 Jan 2019 10:38:52 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Jan 2019 10:38:41 -0800
Message-ID: <CAO=notxJck9xYXKv=BYADuZV1Ya771bS7Mc_-1OUfDp4iFTq2A@mail.gmail.com>
Subject: Using mmap against aspeed-lpc-ctrl device - weird bytes :D
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 18 Jan 2019 18:38:57 -0000

Just to give you some context snippets:

System DTS snippet:

reserved-memory {
 #address-cells = <1>;
 #size-cells = <1>;
 ranges;
 lpc_mapped_memory: region@98000000 {
  no-map;
  reg = <0x98000000 0x00800000>; /* 8MB */
 };
};

&lpc_ctrl {
 status = "okay";
 memory-region = <&lpc_mapped_memory>;
 flash = <&spi1>; // spi disabled, but needed for lpc_ctrl to probe
};

So, on the BMC, it receives the host's memory map address --> so it
can configure the window:

https://github.com/openbmc/phosphor-ipmi-flash/blob/master/lpc_aspeed.cpp#L42

Then the host tool, mmap's to the host set-aside address, 4KiB, and
tells the BMC to copy out the 4KiB:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/17505

Keep in mind, previously this was working by the BMC opening /dev/mem
and mapping against lpc_mapped_memory -- but now we're opening
aspeed-lpc-ctrl.  In the code above, regionAddress ==
lpc_mapped_memory, and regionSize is 64KiB.

Can you take a look to at least sanity check this?

It ends up copying out data that looks like this:

00000000  0a 00 01 00 0a 00 01 00  0a 00 01 00 0a 00 01 00  |................|
*
00001000

Patrick
