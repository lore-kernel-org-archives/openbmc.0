Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qnyTd6kcYzDq5k
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 03:10:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460913041154738.0941712234021;
 Sun, 17 Apr 2016 10:10:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Adjust ipmi device id to accept dbus
 versioning
Date: Sun, 17 Apr 2016 12:10:39 -0500
Message-Id: <1460913040-6713-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Apr 2016 17:10:46 -0000

Before this the ipmi device id would return
ipmitool -Idbus  mc info

...
Firmware Revision         : 1.0

Now it will track the version that you get from the version property of
/org/openbmc/inventory/system/chassis/motherboard/bmc
i.e.
```
version = v0.6-19-gf363f61-dirty
           ^ ^ ^^          ^
           | |  |----------|-- additional details
           | |---------------- Minor
           |------------------ Major

```
Now... ipmitool -Idbus  mc info
...
Firmware Revision         : 0.06
...
Aux Firmware Rev Info     :
    0x00
    0x19
    0x00
    0x01

If there is no -dirty (or anything really after the last '-') will force
the aux details byte 4 to 0.  A 0 means the FW image was created without
any changes in the yocto build.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-host-ipmid/84)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-host-ipmid/pull/84

Chris Austen (1):
  Adjust ipmi device id to accept dbus versioning

 apphandler.C | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 4 deletions(-)

-- 
2.7.1
