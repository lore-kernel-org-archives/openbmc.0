Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EE2461A007F
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 11:30:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454373029200389.1083423685171;
 Mon, 1 Feb 2016 16:30:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] AddAddress4 not setting the new IP
Date: Mon,  1 Feb 2016 18:30:27 -0600
Message-Id: <1454373028-5280-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 02 Feb 2016 00:30:32 -0000

Just a few changes to make it work...

1) Ensure the .network file is a known name.  It must be
   deleted before the new .network file is added since
   the other file also had the same interface and priority level
2) I got on the systemd channel because restarting the systemd
   service does not change the ip address.  You needed to
   flush the ip instead.

Notes on the networkd subject from the IRC channel...
From the systemd-networkd manpage... "Network configurations applied
 before networkd is started are not removed"

I also learned from the IRC to use the 'ip addr flush <device>' to
force the network cleanup.  ...

<causten__> danderson, so if I setup a server on one subnet, rebooted, then wanted to change the ip I couldn't do it without rebooting?
<causten__> is there a workaround?  I mean switching ips in a lab to a different subnet is common
<danderson> either that, or manually clean up the interface configuration before restarting networkd
<danderson> i.e. `ip addr del 1.2.3.4 dev eno1` or whatever
<danderson> alternatively, you may want to just use a different network configuration manager (e.g. arch's netctl, or network-manager), if your use case is more complex
<danderson> networkd is by design aimed at one-time configuration on startup, and minor maintenance like keeping DHCP going

https://github.com/openbmc/phosphor-networkd/pull/2

Chris Austen (1):
  AddAddress4 not setting the new IP

 netman.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.6.4
