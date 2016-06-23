Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZtVq5s58zDqjb
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 17:33:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rWNSzdKo; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id l81so14518134qke.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=DopGg3wNsRaSszzbGuK0u33wI6o/NAR6ooM43hLf8MM=;
 b=rWNSzdKovA+en6hTpx+l9WgGrauIN7KNGesYOvQK8rE+xMjXp55aI2WSQss8xKrg+i
 GdtoNXjbeTFOW/y8Mesd2rsxJPR/zQj6hlukQ+oTEjZgVsmjPvS2RVzt6zdrqsV8chwS
 Gkawh18pnQOAxvguXabGwSkNdXmYn0xIOwuyQzb33B8X7PFoKXAnrrRD5uYvd+4fjSu+
 IJJjkCdOjxK+GX0hnPhAWBQN2wmBA6aQk+WVqgxjYJ+q83LimtldtMIB5S4IHfDs5O/u
 MhpqCHkuuF2+5VPcGZipDiAfY7dTUJLFNUaRvYZ0LtBQ/Cpoj1vcTz/OnvY1spISamN7
 xp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=DopGg3wNsRaSszzbGuK0u33wI6o/NAR6ooM43hLf8MM=;
 b=O5tPu1yOr+r4ojk7sQiZqtfysVmyfgcJys3idj+Z5SvlBP02rYqDp4mT+XdmzNmMoa
 Xz615Lo2hjVYMWoxmvfxJeZrwUNlNKUq0/A6i7slrYGTBOntGgIC1Ie7hBHrXZyjQqm9
 OE0CQR/gQi0mgKh4qtQb3N4Y0Pf6dbPlkQqX/rDtrVfsf6Cy93L8Dq21FqNzlnWoA5Ha
 jB6HHqjQnjWC5mD3upwMVyH6OX7iu7Byh1UxDb+kWNiMD9OkF/z0fyNTn8w/Ksd68Vmq
 9FNPVpe8uNHSEdBuHlplHjPqIs5WGpHIeRgoQZoFOdOmWctg0O2M+HGOB5usu0KB8LK4
 OXjg==
X-Gm-Message-State: ALyK8tLP8qFSe6Kn1er06VN8KVSx6YQKR2Dtw+IyS2EhED7mhudP79MON3AK+LF9UkY6SuvK4evrCw0l5zZVRA==
X-Received: by 10.200.39.237 with SMTP id x42mr33574440qtx.75.1466667217520;
 Thu, 23 Jun 2016 00:33:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 00:33:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2016 17:03:18 +0930
X-Google-Sender-Auth: FSPpcxNpPp6uY-BQ7RNamLrUCeE
Message-ID: <CACPK8Xd_Ex+8Ln2tLcrfueOG1nFHH3JTG3iXm5s4jbrHkbMcLw@mail.gmail.com>
Subject: u-boot tree status update
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 23 Jun 2016 07:33:40 -0000

Hello,

Cedric and I have been working on a u-boot tree that would support our
ast2400 and ast2500 boards on a modern upstream base.

We've now reached the milestone where a representative set of systems
I have access to can boot, with networking, and load Linux (palmetto,
ast2500evb, witherspoon). I have pushed this to the openbmc/u-boot
tree as v2016.05-aspeed-openbmc. There are three configurations in
there:

 ast_g4_defconfig: ast2400 platforms with SPI-NOR and NC-SI support
 ast_g5_defconfig: ast2400 platforms with SPI-NOR and dedicated PHY support
 witherspoon_bmc_defconfig: ast2500 platforms with SPI-NOR and NC-SI support

The names aren't the best I agree. Also, most of our configuration is
hard coded in board headers. We want to move the platforms over to
using u-boot's Kconfig system, as well as adding support for
Facebook's ast2400 platforms that use a different network and flash
configuration.

High on the priority list is to bring in Teddy's excellent cleanup
work so we can all work on a common tree, and continue the march
towards upstream.

In the coming weeks Cedric is working on cleaning up the flash driver,
and I will be looking at adding NC-SI support to the ftgmac100 driver
so we can drop the aspeednic driver.

Cheers,

Joel
