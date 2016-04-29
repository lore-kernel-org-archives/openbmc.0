Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxLZl5cw1zDqB4
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 03:40:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461951643499644.3702704847934;
 Fri, 29 Apr 2016 10:40:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20phosphor-networkd=5D=20Added=20DBus=20method=20GetAddressType=20to=20identify=20if=20the=20interface=20is=20conf=E2=80=A6?=
Date: Fri, 29 Apr 2016 12:40:41 -0500
Message-Id: <1461951642-23562-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 29 Apr 2016 17:40:48 -0000

…igured

with static IP address or configured by DHCP.

"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
<node name="/org/openbmc/NetworkManager/Interface">
  ...  
  <interface name="**org.openbmc.NetworkManager**">
    <method name="**GetAddressType**">
      <arg direction="in"  type="s" name="device" />
      <arg direction="out" type="s" />
    </method>
...
   </interface>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-networkd/15)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-networkd/pull/15

Hariharasubramanian R (1):
  Added DBus method GetAddressType to identify if the interface is
    configured with static IP address or configured by DHCP.

 netman.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.8.1
