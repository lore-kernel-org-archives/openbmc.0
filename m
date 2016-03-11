Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AA4471A004B
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2016 09:40:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457736031182502.6624262927651;
 Fri, 11 Mar 2016 14:40:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v4 0/2] Add association interface to each event
 log
Date: Fri, 11 Mar 2016 16:40:28 -0600
Message-Id: <1457736030-6801-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 11 Mar 2016 22:40:35 -0000

When a new event log is created we will create an interface
with a name of org.openbmc.association.  That will have a
single property named "association" which will be an a(sss).
That will be enough information for the rest server to present
it.

Lets say you want to run the acceptTestMessage method.  It
will create an association between the event log and 2 dimms.

So
/org/openbmc/inventory/system/chassis/motherboard/dimm2
/org/openbmc/inventory/system/chassis/motherboard/dimm3

/org/openbmc/records/events/1/fru
should return
data : {/org/openbmc/inventory/system/chassis/motherboard/dimm2 , /org/openbmc/inventory/system/chassis/motherboard/dimm3}

You should also be able to go to the dimm and get the association in reverse

/org/openbmc/inventory/system/chassis/motherboard/dimm2/event
should return
data : {/org/openbmc/records/events/1/}

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-event/14)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-event/pull/14

Chris Austen (2):
  Add association interface to each event log
  Fixed Multiple associations occasionally geting truncated

 event_messaged_sdbus.c | 110 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 91 insertions(+), 19 deletions(-)

-- 
2.7.1
