Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6Fh26cHJzDqHj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 13:32:01 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: RFC: Inventory functional state tracking
Message-Id: <94DF8B09-DBBB-4388-8070-57B933450886@fuzziesquirrel.com>
Date: Sun, 22 Jan 2017 21:31:54 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 23 Jan 2017 02:32:03 -0000

Looking for ideas on tracking inventory item functional state.  If this =
interests you, please read on.

One approach would be to add a functional state DBus interface to =
inventory objects.  I was hoping to
keep dynamic/state information out of the inventory namespace as much as =
possible, but the inventory manager
could probably be made to set properties on an interface when specific =
conditions are met.

Another approach would be a new class of sensor applications that do =
whatever is required to monitor the functional
state of one or more inventory items.  For functional status of =
inventory coming from the host this would
probably be host-ipmid.  These applications would provide sensor objects =
in a sensors/fault
namespace, possibly with a xyz.openbmc_project.Sensors.Fault interface.  =
The fault sensor objects would be associated
back to their inventory item via an association object.

Please poke holes..ask questions.

thx - brad
