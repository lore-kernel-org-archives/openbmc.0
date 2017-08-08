Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRL8j2pw2zDqkp
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 13:53:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XFT9qOdr"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id v189so9508305pgd.2
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 20:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9XVHQZcd2BcRZeGqZRIzjqz3OQi+ta+s+VKKEf8sFmY=;
 b=XFT9qOdrnKsLTPvADzxWk9rI9TInYBYNXrcWfWSyHhVOEfXQyYcboTTMQYEIOL6GIj
 GREOmS1FXhrnUrPDsGjBjRGEJ3fRC8TQIQOht/LogaUn4IgeA3CmWu4IB6WppYU+F0ez
 1IxJWGyDuugattj/WvXbrZqMBTZJxtXhKQHS1LVL8YVhHMqX90agHEwpo5M/Y908jqdk
 TZqdfu7gFFH11xuUdRolVuSG3qDmizYyw44kZSU+JpM60CbW4s7wP9YwakDkK10lOI5B
 aNbK+QXh0wmBKP3C9RfuJOb9mo3aNfL81QxHFZqaPkORXE3/TbRnNCFuLw6aYVX9OhCX
 zqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9XVHQZcd2BcRZeGqZRIzjqz3OQi+ta+s+VKKEf8sFmY=;
 b=KtFlu3266oFpxopnE1XNWP91O6G1v1HcIkBw/JhFDbSINwsffPHUEaKhDhhGsXb9eW
 eOeQfVd7uQEqAmdQy61h9Yy7rT18bKpKmU/oDtMdaER7sMjrtNrWN4jw3b9hPBf1KVSW
 1xFcnv4JlUbpjWty4EqgBFXGgN+iYvgHRsuNf/aDjI00FCh4yliNlEq+B6zxLAi/Gcy1
 mT45O7Z+u+R2AJ7Bu2Q3f6OT1tEHclTRZCNjOlN2nUSjRXqp3O6EwD5/2yV6yy1BvgcM
 fICyHZjF+66r4N+5SrhVtShojUJ6Gasgtp2wKrehDWV54xWdTV1TYwfjzM6HcivbGPCr
 2+Jw==
X-Gm-Message-State: AHYfb5hHa3KRFhxDGvG3BHUrR1EOa3dkRFtIbQs5c9K5+Gd+gNo7/XSe
 KjoKoy21QZTn0QHp
X-Received: by 10.84.129.103 with SMTP id 94mr2994051plb.63.1502164386574;
 Mon, 07 Aug 2017 20:53:06 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f2sm375767pgc.17.2017.08.07.20.53.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Aug 2017 20:53:05 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: minyard@acm.org, benjaminfair@google.com, clg@kaod.org, joel@jms.id.au,
 andrew@aj.id.au
Cc: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [RFC v1 0/4] ipmi_bmc: framework for IPMI on BMCs
Date: Mon,  7 Aug 2017 20:52:57 -0700
Message-Id: <20170808035301.1980-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
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
X-List-Received-Date: Tue, 08 Aug 2017 03:53:10 -0000
X-List-Received-Date: Tue, 08 Aug 2017 03:53:10 -0000
X-List-Received-Date: Tue, 08 Aug 2017 03:53:10 -0000

This introduces a framework for implementing the BMC side of the IPMI protocol,
roughly mirroring the host side OpenIPMI framework; it attempts to abstract away
hardware interfaces, such as Block Transfer interface hardware implementations
from IPMI command handlers.

It does this by implementing the traditional driver model of a bus with devices;
however, in this case a struct ipmi_bmc_bus represents a hardware interface,
where a struct ipmi_bmc_device represents a handler. A handler filters messages
by registering a function which returns whether a given message matches the
handler; it also has the concept of a default handler which is forwarded all
messages which are not matched by some other interface.

In this patchset, we introduce an example of a default handler: a misc device
file interface which implements the same interface as the the device file
interface used by the Aspeed BT driver.

Currently, OpenBMC handles all IPMI message routing and handling in userland;
the existing drivers simply provide a file interface for the hardware on the
device. In this patchset, we propose a common file interface to be shared by all
IPMI hardware interfaces, but also a framework for implementing handlers at the
kernel level, similar to how the existing OpenIPMI framework supports both
kernel users, as well as misc device file interface.

This patchset depends on the "ipmi: bt-i2c: added IPMI Block Transfer over I2C"
patchset, which can be found here:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1461960.html
However, I can fix this if desired.

Tested on the AST2500 EVB.
