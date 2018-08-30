Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ICbpxQpq"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421Zyb3yJQzF37C
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 07:15:18 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d12-v6so4396989pls.4
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9CD+UXo/PIm8r0HsnqbzeeDFOUcIIUREd4hJjXQwot8=;
 b=ICbpxQpqdmVO/6yKG2GpaXrb2vIsuHPJVIkWtnOuhc8deXUsw1LczGncsgFQ32Fwqk
 IdbKELQyyKYmO1g+iWt2tRmjyhrU4UF50Tb/umbAo+2JGP/jnIARPRGDyuYqVIEay7xN
 kCFE502hOnIyqGuazCNXbmgd5UCN1FXXqboDIZ2XY3y5TJYnlO+rbvV9GfNjK2Ah7YVd
 9fmKkan2OjSseqx1pKddnzyHN1gqEXvUhc/v+2y/CgX5xGEC7+DtxFMmBoCJLLOVwGfi
 x2f48hwraW1BVoP0eNOsf2c9aGKMdusoOxmrbDC2ipurja7iQvOhGCcgM9CJ4RMzs5d1
 80AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9CD+UXo/PIm8r0HsnqbzeeDFOUcIIUREd4hJjXQwot8=;
 b=rPMiNd2+nT+pQPkEuWTFqNHj0nyD0fR/e9MK/VM7P6WKOcFijxjDXmYXoYh613bUqp
 dERKGY0wVO+ZVgdhH0VgPzavndyR59Tqicp0qeMQbLbw1BIVT9prJPX8rurF0jc7uIy3
 ZT5DQvlqOEleDtL9B3R+FviK9ivXK01j3pmOtszZ3G7s6lOI8khPJLjRi5+OBAMjZ7Jm
 excv16337MDmjUVJiR07JcQ6onpUv8VgRAM2NGESR6FWr4KSZevmh1pupEYIi7QkdCiQ
 wtp1/HyBsVldAaC/RhwgvQQYwEYJ2NUgWh0Y3AHa1CTnFmo+vzF6J1EwEZr4QFmFbvgQ
 FGaA==
X-Gm-Message-State: APzg51AZt0qHzYWTl2fYX6kGoVb51FP1Ih+0Ro5g3LLVchB8qwAokDUE
 7UlvN+RBU7Njugz2J772ndCjHA0ZvtXdTVNqDRkD3Dcklv0=
X-Google-Smtp-Source: ANB0VdYyalX2/+fpvMzy/Yiv3R00ACHpgAzCQW0/dG/5rIvTIfrz9iGB1dsQLI2ZAy8lLkduhXq6G4AIvg+YiYj9I+c=
X-Received: by 2002:a17:902:6681:: with SMTP id
 e1-v6mr12046493plk.109.1535663715833; 
 Thu, 30 Aug 2018 14:15:15 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 30 Aug 2018 14:15:04 -0700
Message-ID: <CAO=notzR73b_oZjAiH1x+KjL-i_WKpHUp=xEdRfq5H76u0FmSQ@mail.gmail.com>
Subject: OEM IPMI EthStats
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 21:15:20 -0000

Out of a desire to export link health information, we implemented an
OEM IPMI command that lets one grab ethernet statistics from a named
ethernet device on the BMC.  (The NCSI statistics IPMI commands were a
bit clunky and didn't do what we needed).

The OEM IPMI commands spec is pretty short on this one:

### Ethernet Statistics Command (0x30) {#ethernet-statistics-command-0x30}

There is the need to read a specific ethernet-level statistic value
from the BMC.  This is driven primarily to detect link errors that
require hardware swaps during manufacturing.

This command will be well structured such that there is a request and
response which mirror to some extent.

The request will specify the ethernet interface by name, as a
length-prepended string, and the field they're requesting by
identifier (an unsigned byte).

If the command is not supported, the IPMI OEM handler will respond
accordingly, however, if the field is not supported or not recognized,
the command will return 0xcc (invalid field).

The current ethernet statistics available (all future additions must append):

|Identifier |Human Readable Name
|-----------|--------------------
|0          |rx_bytes
|1          |rx_compressed
|2          |rx_crc_errors
|3          |rx_dropped
|4          |rx_errors
|5          |rx_fifo_errors
|6          |rx_frame_errors
|7          |rx_length_errors
|8          |rx_missed_errors
|9          |rx_nohandler
|10         |rx_over_errors
|11         |rx_packets
|12         |tx_aborted_errors
|13         |tx_bytes
|14         |tx_carrier_errors
|15         |tx_compressed
|16         |tx_dropped
|17         |tx_errors
|18         |tx_fifo_errors
|19         |tx_heartbeat_errors
|20         |tx_packets
|21         |tx_window_errors

Request

|Byte(s) |Value |Data
|--------|------|----
|0x00    |Statistic ID |The identifier of the desired statistic
|0x01    |Length       |Where you expect the cable, eth0 or eth1, etc
|0x02..  |The name     |The string, not null-terminated

Response

|Byte(s) |Value  |Data
|--------|-------|----
|0x00    |Stat ID|The identifier of the desired statistic
|0x01....|Uint64 |The value.  Because these are counters we don't
anticipate negative values, and we don't expect overflow.
