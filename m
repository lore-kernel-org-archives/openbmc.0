Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 866251A2A91
 for <openbmc@lists.ozlabs.org>; Sat, 27 Feb 2016 05:55:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145651083593880.02458411880673;
 Fri, 26 Feb 2016 10:20:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Add association interface to each event log
Date: Fri, 26 Feb 2016 12:20:33 -0600
Message-Id: <1456510834-23258-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Fri, 26 Feb 2016 18:55:17 -0000

When a new event log is created we will create a interface with a name of org.openbmc.association.  That will have a single property named "association" which will be an a(s).  That will be enough information for the rest server to present it.

Lets say you want to run the acceptTestMessage method.  It will create an association between the event log and 2 dimms.

So
/org/openbmc/inventory/system/chassis/motherboard/dimm2
/org/openbmc/inventory/system/chassis/motherboard/dimm3

/org/openbmc/records/events/1/assoc
should return
data : {/org/openbmc/inventory/system/chassis/motherboard/dimm2 , /org/openbmc/inventory/system/chassis/motherboard/dimm3}

You should also be able to go to the dimm and get the association in reverse

/org/openbmc/inventory/system/chassis/motherboard/dimm2/assoc
should return
data : {/org/openbmc/records/events/1/}

https://github.com/openbmc/phosphor-event/pull/12

Chris Austen (1):
  Add association interface to each event log

 event_messaged_sdbus.c | 96 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 14 deletions(-)

-- 
2.7.1
