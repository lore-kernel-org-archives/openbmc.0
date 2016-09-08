Return-Path: <brendanhiggins@google.com>
Received: from mail-pa0-x229.google.com (mail-pa0-x229.google.com
 [IPv6:2607:f8b0:400e:c03::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVYPL502FzDrp3
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 07:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=nht9ZC+M; 
 dkim-atps=neutral
Received: by mail-pa0-x229.google.com with SMTP id id6so20977957pad.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=+9V5vhhvfX9lfHeSVxPSjidN7N/pY7XgfSXKe/WAcaQ=;
 b=nht9ZC+MfJP+brVRap5uxOBweK9VOHgbqfa5MqyqbvokmbgTklNCDOGhJyWXiJkCcF
 5fZfPLSFfslsHfcd5wX3fcB6DL1Q8kpJ/6gehsor8kxPlBH2hv0Jy0NIrH0Nldo9a8g+
 PhVZgR+ABgVHIG9DnnbwyqoZz5EvfigcHQMGv2aeTeIAhZgLWbMRSNPBrZ5WWnIlQDLf
 3CddO/sItrYwIZT9eM9su61vfY8JeuQ6Kz4v4deiDrqTugvD/B/dC1e68nbw6WOzqoXz
 4qkPPktdW7hOZYd43d8I4o7PcHL8JzDqacojfljxFoD8aoILyAkHZwnyqCjam3QiYljP
 15Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=+9V5vhhvfX9lfHeSVxPSjidN7N/pY7XgfSXKe/WAcaQ=;
 b=akqSMuUL3EUK6YMJyfzYtyacRHunbsPV92PdBU5DhSswACvbdaxB0BjNOGiZSxJirl
 LOTPQ4Ig9gWGtaUnHMKJAuXUF3ZUAPiIi8ByehLgQRuR7xpiZnYzeW4EN4ovLZaPpzGO
 tZiXRSimDgPCDTZBbi7obiF+wxjHeHhu2AtRteswhLQ2bkXweA3g0d8iiU6yPbftX/Ba
 +GpBea9qxJVsq8yLLz2BZlTNRFBSWziarKPi/JQu5raix8okjnyu7nJDD0DCaOOXdDEC
 lyLjtSBf6hR0FGBi0pIotEeCEIZ0hX3gIK2CXwJKdEAYyWxdZIS2ImRDaqzoNb8LIPMN
 030g==
X-Gm-Message-State: AE9vXwOvWsKSW0XxCe0u+Spe4ir9v1tMsUdj/nWTAKt3pbtkKw10RoukOeGMsLJLwCvDOZBH
X-Received: by 10.66.17.227 with SMTP id r3mr228827pad.48.1473370147368;
 Thu, 08 Sep 2016 14:29:07 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id o80sm50037pfi.32.2016.09.08.14.29.06
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 08 Sep 2016 14:29:06 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: openbmc@lists.ozlabs.org
Subject: [RFC 0/2] misc: bt: added Block Transfer over I2C
Date: Thu,  8 Sep 2016 14:28:48 -0700
Message-Id: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Thu, 08 Sep 2016 21:29:11 -0000

Looking for feedback on my new bt-i2c (Block Transfer over I2C) interface.

This is not a standard IPMI hardware interface. The IPMI specified hardware
interface for I2C/SMBus is SSIF (SMBus System Interface); however, SSIF is not a
very good solution for what we are trying to do:

First off, SSIF does not support sequence numbers, which makes multiple
in-flight messages difficult to implement (the IPMI spec explicitly leaves out
"multithreaded support" for SSIF, but does say it can be supported by an
implementor); this is a major issue for us as we would like to support multiple
in-flight messages. It also looks like OpenBMC makes use of the sequence number
in several places; on OpenBMC, it may be possible to address this by adding in a
sequence field to incoming SSIF messages that is always zero, but this would
not address the problem of multiple in-flight messages.

The second main limitation to SSIF is that it requires the slave side (BMC) to
NACK until it is ready to either send or receive data (technically this is not a
hard requirement, but the spec does say the BMC must NACK until ready to provide
a response unless SMBus Alert is available/enabled; this is effectively a
requirement because SSIF allows SMBus Alert to be turned off and is to be turned
off by default). However, the Aspeed 24XX and Aspeed 25XX I2C controllers do not
support arbitrary NACKing in slave mode; the only way to NACK is to disable
slave mode, which would also prevent the slave from responding to incoming
messages when it is unable to provide an outgoing message.

Although we could modify SSIF to suit our needs, some of the desired
modifications would be substantial (such as adding in a sequence field; it would
completely change the framing of the message); so I decided that SSIF was
probably not the best route to go for IPMI over I2C.

Here I introduce the bt-i2c (Block Transfer over I2C) interface; it is designed
such that it can be supported by any I2C slave device (using the standard Linux
I2C core slave mode framework), but I designed it such that it can make use of
SMBus Alert to notify the master (CPU) of available responses (not in this patch
set because it requires a change to I2C core; I was planning on using this
driver as the initial user). I wrote a precise specification of bt-i2c in the
second patch.

I based the slave side (BMC) driver on the bt-host driver; the file system
interface is fully compatible and has been tested with btbridged and ipmid
running on an ast2500 evb.

Work still to do:
 - Add support for SMBus Alert (currently in progrees).
 - Support O_NONBLOCK on the master side; I was planning on having this depend
   on SMBus Alert support since polling is required if it is not available.
 - Because bt-host and bt-i2c-slave share an identical file system interface; I
   was thinking that we could pull the file system interface out so that they
   share a single one.

Cheers!
